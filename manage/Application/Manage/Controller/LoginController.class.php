<?php
namespace Manage\Controller;
use Think\Controller;
class LoginController extends CheckController{
	public function index(){
		$module=M('module');
		$memu = $module->where(array("level"=>array("lt",3),"module"=>array("neq","")))->order('type asc,sort DESC,mid ASC')->select();//module表的数据显示
		$memu_list = array();
		foreach ($memu as $k=>$v){
			if($v['type'] == 0){//如果是一级菜单
				$memu_list[$v['mid']]=$memu[$k];//将一级菜单的记录放到数组中
			}else{
				$memu_list[$v['type']]['two'][]=$memu[$k];//将记录放到二级菜单中
			}
		}
		$this->assign("memu_list",$memu_list);//将所有记录传值给模板
        $this->display();
	}	
}