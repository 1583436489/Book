<?php
namespace Manage\Controller;

use Think\Controller;

class MemberController extends CheckController
{
    /**
     * 用户列表
     */
	public function memberList(){
		if($_POST){
			if(!is_file(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/Member.txt')){
				fopen(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/Member.txt','a+');
			}
			$_POST=array_filter($_POST);
			file_put_contents(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/Member.txt', serialize($_POST));
		}
		$where='1=1';
		$whereFile=unserialize(file_get_contents(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/Member.txt'));
		/*
		 * 
		 */
		if(isset($whereFile['id']) && $whereFile['id'])$where.=' AND id='.$whereFile['id'];
		if(isset($whereFile['phone']) && $whereFile['phone'])$where.=' AND phone like "%'.$whereFile['phone'].'%"';
		if(isset($whereFile['stradd_time']) && $whereFile['stradd_time'])$where.=' AND add_time >= '.strtotime($whereFile['stradd_time']);
		if(isset($whereFile['endadd_time']) && $whereFile['endadd_time'])$where.=' AND add_time <= '.strtotime($whereFile['endadd_time']);
		if(isset($whereFile['strend_vip']) && $whereFile['strend_vip'])$where.=' AND end_vip >= '.strtotime($whereFile['strend_vip']);
		if(isset($whereFile['endend_vip']) && $whereFile['endend_vip'])$where.=' AND end_vip <= '.strtotime($whereFile['endend_vip']);
		/*
		 * 
		 */
		$db = M("member");
		$count = $db->where($where)->count();
		$page  = new \Think\Page($count,50);
		$data = $db->field('id,nick,phone,add_time,last_time,end_vip,gold,pid')->where($where)->limit($page->firstRow,$page->listRows)->order("id desc")->select();
		foreach ($data as $k=>$v){
			$data[$k]['add_time']=date('Y-m-d H:i:s',$v['add_time']);
			$data[$k]['last_time']=date('Y-m-d H:i:s',$v['last_time']);
			$data[$k]['end_vip']=$data[$k]['end_vip']?date('Y-m-d H:i:s',$data[$k]['end_vip']):'不是VIP';
		}
		$this->assign("whereFile",$whereFile);
		$this->assign("data",$data);
		$this->assign("pages",$page->show());
		$this->display();
	}
	public function editMember(){
		if($_POST){
			if($_POST['end_vip'])$_POST['end_vip']=strtotime($_POST['end_vip']);
			if($_POST['password']){
				$member=M('member')->field('salt')->where(array('id'=>I('post.id')))->limit('0,1')->find();
				$_POST['password']=md5($member['salt'].md5($_POST['password']));
			}
			$up=M('member')->where(array('id'=>I('post.id')))->save($_POST);
			$up?ajax_info(1, '编辑成功'):ajax_info(-1, '编辑失败');
		}
		$data=M('member')->field('id,nick,portrait,phone,sex,end_vip')->where(array('id'=>I('get.num')))->find();
		$data['portrait']=getFileUrl($data['portrait'],'User');
		$data['end_vip']=date('Y-m-d H:i:s',$data['end_vip']);
		$this->assign('data',$data);
		$this->display();
	}
}