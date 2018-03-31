<?php
namespace Manage\Controller;
use Think\Controller;
class AdminController extends CheckController{
	//管理员列表
	public function AdminList(){
		$administrator = M("administrator");
		$count = $administrator->alias("a")->join("yk_administrator_rank r ON a.rid = r.id")->count();
		$page  = new \Think\Page($count,50);
		$show  = $page->show();
		$AdminList = $administrator->alias("a")->join("yk_administrator_rank r ON a.rid = r.id")->limit($page->firstRow,$page->listRows)->field("a.*,r.adname rolename")->order("a.id asc")->select();
		$this->assign("AdminList",$AdminList);
		$this->display();
	}
	//添加管理员
	public function AddAdmin(){
		if($_POST){
			$data['administrator'] = remove_xss($_POST['lastname']);
			$data['cher'] = create_randomstr(6);
			$data['password'] = is_password($_POST['password'])?md5($_POST['password'].$data['cher']):"";
			$data['rid'] = intval($_POST['bankid'])?M("administrator_rank")->where(array("id"=>intval($_POST['bankid'])))->getfield("id"):"";
			foreach($data as $k=>$v){
				if(empty($v))ajax_info("1","error:".$k." IS NOT NULL");
			}
			if(M("administrator")->where(array("administrator"=>$data['administrator']))->getfield("id"))ajax_info("1","该登陆账号已存在");
			$data['edit_time'] = $_SERVER['REQUEST_TIME'];
			$staff = M("administrator")->add($data);
			if($staff){
				ajax_info("0","Success",U('Admin/AdminList'));
			}else{
				ajax_info("1","添加失败");
			}
		}else{
			$role = M("administrator_rank")->field("id,adname")->select();
			$this->assign("title",'添加商家');
			$this->assign("role",$role);
			$this->display();
		}
	}
	//修改管理员
	public function EditAdmin(){
		if($_POST){
			$id = intval($_POST['id']);
			if($id == 1 && $_SESSION['manage']['id'] != 1)ajax_info("1","无法修改");
			$data['name'] = remove_xss($_POST['lastname']);
			if($_POST['password']){
				$data['cher'] = create_randomstr(6);
				$data['password'] = is_password($_POST['password'])?md5($_POST['password'].$data['cher']):"";
			}
			if($id != 1)$data['rid'] = intval($_POST['bankid'])?M("administrator_rank")->where(array("id"=>intval($_POST['bankid'])))->getfield("id"):"";
			foreach($data as $k=>$v){
				if(empty($v))ajax_info("1","error:".$k." IS NOT NULL");
			}
			$data['edittime'] = $_SERVER['REQUEST_TIME'];
			if(M("administrator")->where(array("id"=>array("neq",$id),"name"=>$data['name']))->getfield("id"))ajax_info("1","该登陆账号已存在");
			$staff = M("administrator")->where(array("id"=>$id))->save($data);
			if($staff){
				//adminlog("修改管理员");
				ajax_info("0","Success",U('Admin/AdminList'));
			}else{
				ajax_info("1","修改失败");
			}
		}else{
			$id = intval($_GET['id']);
			$staff = M("administrator")->where(array("id"=>$id))->find();
			if(!$staff)$this->error("操作有误");
			$role = M("administrator_rank")->field("id,adname")->select();
			//adminlog("查看管理员");
			$this->assign("role",$role);
			$this->assign("staff",$staff);
			$this->display();
		}
	}
	//删除管理员
	public function DelAdmin(){
		$id = intval($_REQUEST['id']);
		if(!$id)$this->error("请选择需要删除的管理员");
		M("administrator")->where(array("id"=>$id,"is_del"=>0))->delete();
		//adminlog("删除管理员");
		$this->success("删除成功");
	}
	//权限列表
	public function RoleList(){
		$count = M("administrator_rank")->count();
		$page  = new \Think\Page($count,50);
		$show  = $page->show();
		$RoleList = M("administrator_rank")->limit($page->firstRow,$page->listRows)->select();
		//adminlog("查看权限列表");
		$this->assign("RoleList",$RoleList);
		$this->display();
	}
	//权限删除
	public function DelRole(){
		$id = intval($_REQUEST['id']);
		if(!$id)$this->error("请选择需要删除的权限");
		M("administrator_rank")->where(array("id"=>$id,"is_del"=>0))->delete();
		M("administrator")->where(array("rid"=>$id,"is_del"=>0))->delete();
		//adminlog("删除权限");
		$this->success("删除成功");
	}
	//权限修改
	public function EditRole(){
		if($_POST){
			$id = intval($_POST['id']);
			$data['adname'] = remove_xss($_POST['lastname']);
			if(!$data['adname'])ajax_info("1","权限名不能为空");
			$data['rank'] = implode(",",$_POST['role']);
			$data['edittime'] = $_SERVER['REQUEST_TIME'];
			$Success = M("administrator_rank")->where(array("id"=>$id))->save($data);
			if($Success){
				//adminlog("修改权限");
				ajax_info("0","Success",U('Admin/RoleList'));
			}else{
				ajax_info("1","修改失败",U('Admin/RoleList'));
			}
		}else{
			$id = intval($_GET['id']);
			$RoleInfo = M("administrator_rank")->where(array("id"=>$id))->find();
			if(!$RoleInfo)$this->error("操作有误");
			$module=M('module');
			$memu = $module->order('sort DESC,mid ASC')->select();
			$memu_list = array();
			$RoleInfo['rank'] = explode(",",$RoleInfo['rank']);
			foreach ($memu as $k=>$v){
				if($v['type'] == 0){
					$memu_list[$v['mid']]=$memu[$k];
				}else{
					if(in_array($v['mid'],$RoleInfo['rank']))$memu[$k]['check']=1;
					$memu_list[$v['type']]['two'][]=$memu[$k];
				}
			}
			//adminlog("查看权限");
			$this->assign("RoleInfo",$RoleInfo);
			$this->assign("memu_list",$memu_list);
			$this->display();
		}
	}
	//权限添加
	public function AddRole(){
		if($_POST){
			$data['adname'] = remove_xss($_POST['lastname']);
			if(!$data['adname'])ajax_info("1","权限名不能为空");
			$data['rank'] = implode(",",$_POST['role']);
			$data['edit_time'] = $data['addtime'] = $_SERVER['REQUEST_TIME'];
			$Success = M("administrator_rank")->add($data);
			if($Success){
				//adminlog("添加权限");
				ajax_info("0","Success",U('Admin/RoleList'));
			}else{
				ajax_info("1","添加失败");
			}
		}else{
			$module=M('module');
			$memu = $module->order('sort DESC,mid ASC')->select();
			$memu_list = array();
			$RoleInfo['rolelist'] = explode(",",$RoleInfo['rolelist']);
			foreach ($memu as $k=>$v){
				if($v['type'] == 0){
					$memu_list[$v['mid']]=$memu[$k];
				}else{
					if(in_array($v['mid'],$RoleInfo['rolelist']))$memu[$k]['check']=1;
					$memu_list[$v['type']]['two'][]=$memu[$k];
				}
			}
			$this->assign("memu_list",$memu_list);
			$this->display();
		}
	}
}