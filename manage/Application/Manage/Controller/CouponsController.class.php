<?php
namespace Manage\Controller;

use Think\Controller;

class CouponsController extends CheckController
{
    /**
	 * vip充值卡列表
	 */
	public function couponsList(){
		if($_POST){
			if(!is_file(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/couponsList.txt')){
				fopen(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/couponsList.txt','a+');
			}
			$_POST=array_filter($_POST);
			file_put_contents(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/couponsList.txt', serialize($_POST));
		}
		$where='1=1';
		$whereFile=unserialize(file_get_contents(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/couponsList.txt'));
		/*
		 * 
		 */
		if(isset($whereFile['id']) && $whereFile['id'])$where.=' AND c.id='.$whereFile['id'];
		if(isset($whereFile['strtime']) && $whereFile['strtime'])$where.=' AND c.time >= '.strtotime($whereFile['strtime']);
		if(isset($whereFile['endtime']) && $whereFile['endtime'])$where.=' AND c.time <= '.strtotime($whereFile['strtime']);
		if(isset($whereFile['status']) && $whereFile['status'])$where.=' AND c.status='.$whereFile['status'];
		/*
		 * 
		 */
		$db=M('vip_card_activity c');
		$count = $db->where($where)->count();
		$page  = new \Think\Page($count,50);
		$data=$db->field('c.id,c.time,c.end_time,c.admin_id,c.msg,c.status,c.title,c.content,c.num as num1,c.get_num,cv.num,cv.type')->join('yk_vip_card_value AS cv On c.value_id=cv.id')->where($where)->order('c.id desc')->limit($page->firstRow,$page->listRows)->select();
		foreach($data as $k=>$v){
			$data[$k]['time']=date('Y-m-d H:i:s',$v['time']);
			$data[$k]['end_time']=date('Y-m-d H:i:s',$v['end_time']);
			$data[$k]['use_time']=$data[$k]['use_time']?date('Y-m-d H:i:s',$v['use_time']):'未使用';
			switch ($v['status']){
				case 1:
					$data[$k]['status']='正常';
					break;
				case 2:
					$data[$k]['status']='已删除';
					break;
			}
			switch ($v['type']){
				case 1:
					$data[$k]['type']='天';
					break;
				case 2:
					$data[$k]['type']='月';
					break;
				case 3:
					$data[$k]['type']='年';
					break;
			}
		}
		$this->assign('where',$whereFile);
		$this->assign('data',$data);
		$this->display();
	}
	/**
	 * 添加充值卡
	 */
	public function addCoupons(){
		if($_POST){
			if(!$_POST['num'] || !$_POST['end_time'])ajax_info(-1, '缺少参数');
			$add=M('vip_card_activity')->add(array('value_id'=>$_POST['value_id'],'time'=>time(),'end_time'=>strtotime($_POST['end_time']),'admin_id'=>$_SESSION['manage']['id'],'msg'=>$_POST['msg'],'status'=>1,'title'=>$_POST['title'],'content'=>$_POST['content'],'num'=>$_POST['num'],'get_num'=>0));
			$add?ajax_info(1, '成功'):ajax_info(-1, '失败');
		}
		$data=M('vip_card_value')->field('id,num,type')->order('id desc')->select();
		foreach($data as $k=>$v){
			switch ($v['type']){
				case 1:
					$data[$k]['type']='天';
					break;
				case 2:
					$data[$k]['type']='月';
					break;
				case 3:
					$data[$k]['type']='年';
					break;
			}
		}
		$this->assign('data',$data);
		$this->display();
	}
	/**
	 * 删除激活码
	 */
	public function delCoupons(){
		$nums=explode(',', $_POST['num']);
		$del=M('vip_card_activity')->where(array('id'=>array('in',$nums)))->save(array('status'=>2));
		$del?ajax_info(1,'删除成功'):ajax_info(-1,'删除失败');
	}
}