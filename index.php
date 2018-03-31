<?php
date_default_timezone_set('PRC');
ini_set("display_errors", "On");

error_reporting(E_ALL | E_STRICT);
define('PROJECT_PATH', dirname(__FILE__));
define('HTTP_PATH', 'http://'.$_SERVER['HTTP_HOST'].'/book');
include_once PROJECT_PATH.'/System/Db.php';
include_once PROJECT_PATH.'/Common/Function.php';
if(!isset($_GET['m']) || !$_GET['m'])$_GET['m']='Index';//模型
/**
 * 自动包含文件
 */
function __autoload($className){
	$classarr=explode('\\',$className);
	if(count($classarr)==2){
		include_once PROJECT_PATH.'/Application/'.$classarr[0].'/Controller/'.$classarr[1].'.class.php';
	}else{
		include_once PROJECT_PATH.'/Application/'.$_GET['m'].'/Controller/'.$className.'.class.php';
	}
}
if(!isset($_GET['c']) || !$_GET['c'])$_GET['c']='Index';//控制器
include_once PROJECT_PATH.'/Application/'.$_GET['m'].'/Controller/'.$_GET['c'].'.class.php';
$model=new $_GET['c']();
if(!isset($_GET['f']) || !$_GET['f'])$_GET['f']='index';//方法
$model->$_GET['f']();