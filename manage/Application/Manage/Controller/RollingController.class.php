<?php
namespace Manage\Controller;

use Think\Controller;

class RollingController extends CheckController
{
    /**
     * 轮播图列表
     */
	public function rollingList(){
		$data=M('rolling')->field('id,img,type,url,time,position,source,equipment')->select();
		foreach($data as &$v){
			$v['time']=date('Y-m-d H:i:s',$v['time']);
			if($v['type']==1){
				$v['type']='书籍';
			}elseif ($v['type']==2){
				$v['type']='外链';
			}elseif ($v['type']==3){
				$v['type']='webView';
			}
			if($v['source']==1){
				$v['source']='本站';
			}else{
				$v['source']='采集';
			}
			if($v['equipment']==1){
				$v['equipment']='通用';
			}else if($v['equipment']==2){
				$v['equipment']='安卓';
			}else{
				$v['equipment']='IOS';
			}
		}
		$this->assign('data',$data);
		$this->display();
	}
	/**
	 * 删除轮播图
	 */
	public function delRolling(){
		if(!isset($_POST["num"]) || empty($_POST["num"]))ajax_info(-1,'未知轮播');
		$del=M('rolling')->where(array('id'=>$_POST['num']))->delete();
		$del?ajax_info(1,'删除成功'):ajax_info(-1,'删除失败');
	}
	/**
	 * 编辑
	 */
	public function editRolling(){
		if(isset($_POST) && !empty($_POST)){
			if($_POST['id']){
				//更新
				$up=M('rolling')->where(array('id'=>$_POST['id']))->save($_POST);
			}else{
				//新增
				unset($_POST['id']);
				$_POST['time']=time();
				$_POST['score']=0;
				$up=M('rolling')->add($_POST);
			}
			$up?ajax_info(1,'成功'):ajax_info(-1,'失败');
		}
		$data=array();
		if(isset($_GET['num']) && !empty($_GET['num'])){
			$data=M('rolling')->field('id,img,type,position,source,url,equipment')->where(array('id'=>$_GET['num']))->find();
		}
		$this->assign('data',$data);
		$this->display();
	}
}