<?php
use System\Db;
use OSS\OssClient;
use OSS\Core\OssException;
class Check{
	protected $userInfo=array();//用户信息
	private $key='Rgw3ktdUAdZP19olWcdtbNsOpFJztz1j';
	public function __construct(){
		//判断签名
		if(!isset($_POST['sign']) || empty($_POST['sign']))jsonOut(-1,'sign not null');
		//验证token
		if(isset($_POST['uToken']) && $_POST['uToken']){
			$this->key.=$_POST['uToken'];
			$data=Db::connect()->name('member')->where('token=?')->bindParam(array($_POST['uToken']))->select('fetch');
			if(!$data)jsonOut(0,'登录已失效,请重新登录');
			foreach ($data as &$v){
				if($v===null)$v='';
			}
			$data['portrait']=getFileUrl($data['portrait'],'User');
			unset($data['salt'],$data['password'],$data['token']);
			$this->userInfo=$data;
			unset($data);
		}
		if(isset($_POST['requestApiTime']) && !empty($_POST['requestApiTime']))$this->key.=$_POST['requestApiTime'];
		//验证sign
		//if(md5($this->key) != $_POST['sign'])jsonOut(-1,'sign error');
	}
	/**
	 * 验证验证码
	 * @param string $phone 手机号
	 * @param string $code 验证码
	 */
	public function verifyCode($phone='',$code=''){
		if(!$phone || !$code)jsonOut(-1,'手机号或验证码不能为空');
		$data=Db::connect()->name('verify')->field('id,code')->where('phone=? and state=1')->bindParam(array($phone))->select('fetch');
		if(!$data)jsonOut(-1,'验证码错误');
		if($data['code'] != $code)jsonOut(-1,'验证码错误');
		Db::connect()->name('verify')->where('id=?')->bindParam(array($data['id']))->update('state=2');
		return true;
	}
	/**
	 * 上传文件到阿里云oss
	 */
	 public function upFileOss($content='',$url=''){
		if(!$content || !$url)return false;
		$config=include PROJECT_PATH.'/Common/Config.php';
		$ossConfig=$config['aliyunOss'];
		//阿里云oss
		include_once PROJECT_PATH.'/vendor/aliyun_oss/autoload.php';
		try {
			$ossClient = new OssClient($ossConfig['accessKeyId'], $ossConfig['accessKeySecret'], $ossConfig['endpoint'], true /* use cname */);
		} catch (OssException $e) {
			return false;
		}
		try{
			$ossClient->putObject($ossConfig['bucket'],$url,$content);
		} catch(OssException $e) {
			return false;
		}
		return true;
	 }
	 /**
	  * 获取阿里云oss文件内容
	  */
	 public function getOssFileContent($ossFileName=''){
		 if(!$ossFileName)return '';
		 $config=include PROJECT_PATH.'/Common/Config.php';
		$ossConfig=$config['aliyunOss'];
		//阿里云oss
		include_once PROJECT_PATH.'/vendor/aliyun_oss/autoload.php';
		try {
			$ossClient = new OssClient($ossConfig['accessKeyId'], $ossConfig['accessKeySecret'], $ossConfig['endpoint'], true /* use cname */);
		} catch (OssException $e) {
			return '';
		}
		try{
			$content=$ossClient->getObject($ossConfig['bucket'],$ossFileName);
		} catch(OssException $e) {
			return '';
		}
		return $content;
	 }
}