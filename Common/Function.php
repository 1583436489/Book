<?php
use System\Db;
/**
 * json返回
 * @param string $code 状态码
 * @param array $data 数据
 * @param string $msg 说明
 */
function jsonOut($code='1',$msg='',$data=array()){
	exit(json_encode(array('code'=>$code,'msg'=>$msg,'data'=>$data)));
}
/**
 * 拼接文件地址
 * @param string $url 文件地址
 * @param string $folder 文件夹
 */
function getFileUrl($url='',$folder=''){
	if(empty($url))return '';
	if(strpos($url,'http')===false && strpos($url,'https')===false){
		return HTTP_PATH.'/Public/Upfile/'.$folder.'/'.$url;
	}else{
		return $url;
	}
}
/**
 * 插入金币流水记录
 * @param number $uid 用户id
 * @param string $get_uid 目标用户id
 * @param number $gold 金币额
 * @param string $type 类型（1充值 2签到 3新用户赠送 4使用激活码赠送）
 * @return boolean
 */
function addGoldSource($uid=0,$get_uid=0,$gold=0,$type=''){
	if(!$get_uid || !$type)return false;
	$data['uid']=$uid;$data['get_uid']=$get_uid;$data['gold']=$gold;
	$data['type']=$type;$data['time']=time();
	$add=Db::connect()->name('gold_source')->insert($data);
	return $add?true:false;
}
/**
 * 获取配置参数
 * @param number $id 参数id
 */
function getConfig($id=0){
	if($id==0)return '';
	$config='';
	$config=Db::connect()->name('config')->field('val')->where('id=?')->bindParam(array($id))->select('fetch');
	return $config?$config['val']:'';
}
/**
 * 正则匹配获取数据
 * @param string $url 地址
 * @param string $regular 正则
 * @return string|array
 */
function regularGetData($url='',$regular=''){
	if(!$url || !$regular)return '';
	$data=file_get_contents($url);
	$arr=array();
	preg_match($regular,$data,$arr);
	return $arr;
}
/**
 * curl
 * @param string $url
 * @return mixed
 */
function curlData($url='',$isVIP=false){
	if(!$url)return '';
	$user_agent = "Mozilla/5.0 (iPhone 92; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 MQQBrowser/7.6.0 Mobile/14F89 Safari/8536.25 MttCustomUA/2 QBWebViewType/1 WKType/1";
	//初始化
	$curl = curl_init();
	if($isVIP){
		curl_setopt($curl, CURLOPT_COOKIEFILE, dirname(__DIR__)."/Public/cookie.txt");
		curl_setopt($curl, CURLOPT_COOKIEJAR,  dirname(__DIR__)."/Public/cookie.txt");
		curl_setopt($curl, CURLOPT_REFERER, $user_agent); //伪造来路
		curl_setopt($curl, CURLOPT_REFERER, "http://m.cread.com/");
	}
	//设置抓取的url
	curl_setopt($curl, CURLOPT_URL, $url);
	//设置头文件的信息作为数据流输出
	curl_setopt($curl, CURLOPT_HEADER, 0);
	//设置获取的信息以文件流的形式返回，而不是直接输出。
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
	//执行命令
	$data = curl_exec($curl);
	//关闭URL请求
	curl_close($curl);
	//显示获得的数据
	return $data;
}
/**
 * 账户操作日志
 * @param number $uid 用户id
 * @param number $type 类型 1 绑定 2 解绑
 * @param string $account 账户
 * @param string $field 操作字段
 */
function accountLog($uid=0,$type=0,$account='',$field=''){
	if(!$uid || !$type || !$account || !$field)return false;
	$data['uid']=$uid;$data['type']=$type;$data['account']=$account;$data['field']=$field;
	$data['time']=time();
	$add=Db::connect()->name('account_log')->insert($data);
	return $add?true:false;
}
/**
 * 加密解密 ENCODE 加密   DECODE 解密...
 *
 * @param string $string 加密字符
 * @param string $operation ENCODE 加密   DECODE 解密...
 * @param string key 加密密钥
 * @param string expiry 有效时间默认永久
 * @return string
 **/

function _encrypt($string, $operation = 'ENCODE', $key = '', $expiry = 0){
	if($operation == 'DECODE') {
		$string =  str_replace('_', '/', $string);
	}
	$key_length = 4;
	$key = md5($key != '' ? $key : 'abcdefghijklmnopqrstuvwxyz');
	$fixedkey = md5($key);
	$egiskeys = md5(substr($fixedkey, 16, 16));
	$runtokey = $key_length ? ($operation == 'ENCODE' ? substr(md5(microtime(true)), -$key_length) : substr($string, 0, $key_length)) : '';
	$keys = md5(substr($runtokey, 0, 16) . substr($fixedkey, 0, 16) . substr($runtokey, 16) . substr($fixedkey, 16));
	$string = $operation == 'ENCODE' ? sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$egiskeys), 0, 16) . $string : base64_decode(substr($string, $key_length));
	
	$i = 0; $result = '';
	$string_length = strlen($string);
	for ($i = 0; $i < $string_length; $i++){
		$result .= chr(ord($string{$i}) ^ ord($keys{$i % 32}));
	}
	if($operation == 'ENCODE') {
		$retstrs =  str_replace('=', '', base64_encode($result));
		$retstrs =  str_replace('/', '_', $retstrs);
		return $runtokey.$retstrs;
	} else {
		if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$egiskeys), 0, 16)) {
			return substr($result, 26);
		} else {
			return '';
		}
	}
}