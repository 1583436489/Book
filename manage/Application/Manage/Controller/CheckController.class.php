<?php
namespace Manage\Controller;
use Think\Controller;
class CheckController extends Controller {
	protected $user;
    function _initialize(){
		self::check_login();
		self::check_rand();
	}
	final public function check_login() {
		if($_SESSION['manage']['id']){
			$this->user = $_SESSION['manage'];
		}else{
			$this->redirect('Index/index');
		}
	}
	final public function check_rand() {
		if($_SESSION['manage']['id'] == 1 || $_SESSION['manage']['rid'] == 1){
			return true;
		}
		if($_SESSION['manage']){
			if(ACTION_NAME == "index" && CONTROLLER_NAME == "Login")return true;
			$rolelist = M("administrator_rank")->where(array("id"=>$_SESSION['manage']['rid']))->getfield("rank");
			if(!$rolelist){
				$this->display("Check/rand");exit;
			}
			$role = M("module")->where(array("mid"=>array("in",$rolelist)))->field("module")->select();
			$string = "";
			foreach($role as $k=>$v){
				$string.= $v['module'].",";
			}
			$string = trim($string,",");
			$stringArray = explode(",",$string);
			unset($string);
			unset($role);
			unset($rolelist);
			if(!in_array(CONTROLLER_NAME."/".ACTION_NAME,$stringArray,true)){
				$this->display("Check/rand");exit;
			}
		}
		return true;
	}
}