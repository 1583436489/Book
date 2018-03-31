<?php 
/**
* json输出
*
* @param varcher $code 错误编号
* @param varcher $msg 错误内容
* @param varcher $data 数据
* @return json
*/ 
function ajax_info($code,$msg,$data=array()){
   // 返回JSON数据格式到客户端 包含状态信息
   header('Content-Type:application/json; charset=utf-8');
   $info=array();
   $info['result']=$code;
   $info['msg']=$msg;
   $info['data']=$data;
   exit(json_encode($info));
}
/**
 * 获取客户端
 *
 * @return string
 */
function _get_ip(){
	if (isset($_SERVER['HTTP_CLIENT_IP']) && strcasecmp($_SERVER['HTTP_CLIENT_IP'], "unknown"))
		$ip = $_SERVER['HTTP_CLIENT_IP'];
	else if (isset($_SERVER['HTTP_X_FORWARDED_FOR']) && strcasecmp($_SERVER['HTTP_X_FORWARDED_FOR'], "unknown"))
		$ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
	else if (isset($_SERVER['REMOTE_ADDR']) && strcasecmp($_SERVER['REMOTE_ADDR'], "unknown"))
		$ip = $_SERVER['REMOTE_ADDR'];
	else if (isset($_SERVER['REMOTE_ADDR']) && isset($_SERVER['REMOTE_ADDR']) && strcasecmp($_SERVER['REMOTE_ADDR'], "unknown"))
		$ip = $_SERVER['REMOTE_ADDR'];
	else $ip = "";
	return ($ip);
}
/**
 * 多图片上传
 */
function upimg1($luj="site",$keye =""){
	$i = 0;
	$c='';
	if(count($_FILES) > 0){
		foreach($_FILES as $f=>$v){
			$aa[]=strpos($f,$keye);
			if(strpos($f,$keye) === false)continue;
			$year=time();
			$day=rand(100,999);
			if(!is_uploaded_file($_FILES[$f]['tmp_name'])){
				ajax_info('-1','操作异常，请稍后重试。');
			}
			if($_FILES[$f]["size"] > 2948576){
				ajax_info('-1','图片太大。');
			}
			$path=APP_PATH.'Upload/'.$luj."/".date("Ymd",time())."/";
			if(!is_dir($path))@mkdir($path,0777);
			$url=$path. "/".md5($year.$day.time()).'.jpg';
			if(move_uploaded_file($_FILES[$f]['tmp_name'],$url)){
				$url = substr($url, 1);
				$photourl .=$c.$url;
			}else{
				ajax_info("-1","操作异常，请稍后重试1。");
			}
			$i++;
			$c=',';
		}
	}
	return $photourl;
}
/**
 * 单图片上传
 */
function image_up($file='images',$key="image",$postfix="jpg",$size='5726063'){
	if($_FILES[$key]["size"] > $size)ajax_info("1","文件大小超过限制");
	$path= APP_PATH.'Upload/'.$file."/".date("Ymd",time())."/";
	if(!is_dir($path))@mkdir($path,0777);
	$filepath = $path.md5(time().$key.random(6)).".".$postfix;
	if(!move_uploaded_file($_FILES[$key]['tmp_name'],$filepath)) {
		ajax_info("1",$key." error");
	}
	return substr($filepath,1);
}