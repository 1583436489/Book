<?php
namespace Manage\Controller;
use Think\Controller;
use Think\Page;
class SystemController extends CheckController{
	public function systemList(){
		$data=M('config')->field('id,key,val')->where(array('id'=>array('neq',1)))->select();
		$this->assign('data',$data);
		$this->display();
	}
	/**
	 * 编辑参数
	 */
	public function editSystem(){
		if($_POST){
			$up=M('config')->where(array('id'=>I('post.id')))->save($_POST);
			$up?ajax_info(1, '编辑成功'):ajax_info(-1, '编辑失败');
		}
		$data=M('config')->field('id,key,val')->where(array('id'=>I('get.num')))->find();
		$this->assign('data',$data);
		$this->display();
	}
	/**
	 * 分类设置
	 */
	public function menuList(){
		$this->display();
	}
	/**
	 * 获取分类
	 */
	public function getMenu(){
		$where[]='1=1';
		if(I('post.searchType'))$where['type']=I('post.searchType');
		$page=I('post.page')?I('post.page'):1;
		$page=($page-1)*50;
		$data=M('menu')->field('id,name,pid,menu_img,menu_color,type,remarks')->where($where)->limit($page,'50')->order('score desc')->select();
		foreach ($data as &$v){
			$name=M('menu')->field('name')->where(array('id'=>$v['pid']))->find();
			$v['pid']=$name['name']?$name['name']:'顶级';
			unset($name);
			$v['menu_img']=getFileUrl($v['menu_img'],'Menu');
			switch ($v['type']){
				case 1:
					$v['type']='小说分类';
					break;
				case 2:
					$v['type']='小说类型';
					break;
				case 3:
					$v['type']='书籍分组';
					break;
				case 4:
					$v['type']='全网分类';
					break;
			}
			if(!$v['remarks'])$v['remarks']='';
		}
		$data?ajax_info(1,'成功',$data):ajax_info(-1, '暂无数据');
	}
	/**
	 * 分类设置
	 */
	public function editMenu(){
		if($_POST){
			if(I('post.id')){
				$c=M('menu')->where(array('id'=>$_POST['id']))->save($_POST);
			}else{
				unset($_POST['id']);
				$c=M('menu')->add($_POST);
			}
			$c?ajax_info(1,'操作成功'):ajax_info(-1,'操作失败');
		}
		$data=M('menu')->field('id,name,pid,menu_img,menu_color,type,remarks')->where(array('id'=>I('get.num')))->find();
		$data['allMenu_img']=getFileUrl($data['menu_img'],'Menu');
		//获取上级列表
		$data['menuList']=M('menu')->field('id,name')->where(array('pid'=>'0','type'=>$data['type']))->select();
		$this->assign('data',$data);
		$this->display();
	}
	/**
	 * 广告列表
	 */
	public function advList(){
		$data=M('adv')->field('id,img,url,time,type,position,status,equipment')->order('score desc')->select();
		foreach($data as $k=>$v){
			$data[$k]['time']=date('Y-m-d H:i:s',$v['time']);
			if($v['position']==1){
				$data[$k]['position']='左上角';
			}else{
				$data[$k]['position']='页面';
			}
			if($v['status']==1){
				$data[$k]['status']='正常';
			}else{
				$data[$k]['status']='禁用';
			}
			if($v['equipment']==1){
				$data[$k]['equipment']='所有';
			}else if($v['equipment']==2){
				$data[$k]['equipment']='安卓';
			}else{
				$data[$k]['equipment']='IOS';
			}
			if($v['type']==1){
				$data[$k]['type']='书籍';
			}else if($v['type']==2){
				$data[$k]['type']='外链';
			}else{
				$data[$k]['type']='webview';
			}
		}
		$this->assign('data',$data);
		$this->display();
	}
	/**
	 * 删除广告
	 */
	public function delAdv(){
		if(!I('post.id'))ajax_info(-1,'未知广告');
		$del=M('adv')->where(array('id'=>I('post.id')))->delete();
		$del?ajax_info(1,'删除成功'):ajax_info(-1,'删除失败');
	}
	/**
	 * 编辑、新增广告
	 */
	public function editAdv(){
		if($_POST){
			if(I('post.id')){
				if(!$_POST['score'])$_POST['score']=0;
				$up=M('adv')->where(array('id'=>I('post.id')))->save($_POST);
			}else{
				if(!$_POST['score'])$_POST['score']=0;
				unset($_POST['id']);
				$up=M('adv')->add($_POST);
			}
			$up?ajax_info(1,'操作成功'):ajax_info(-1,'操作失败');
		}
		$data=M('adv')->field('id,img,url,time,score,type,position,status,equipment')->where(array('id'=>I('get.num')))->find();
		$this->assign('data',$data);
		$this->display();
	}
	/**
	 * 采集数据
	 */
	public function getData(){
		$this->display();
	}
	/**
	 * 版本列表
	 */
	public function versionList(){
		$db=M('version');
		$count = $db->count();
		$page  = new \Think\Page($count,50);
		$data=$db->field('id,version_number,path,msg,type,status,time')->order('id desc')->limit($page->firstRow,$page->listRows)->select();
		foreach($data as $k=>$v){
			if($v['type']==1){
				$data[$k]['type']='Android';
			}else{
				$data[$k]['type']='IOS';
			}
			if($v['status']==1){
				$data[$k]['status']='强制更新';
			}else{
				$data[$k]['status']='不强制更新';
			}
			$data[$k]['time']=date('Y-m-d H:i:s',$v['time']);
		}
		$this->assign("data",$data);
		$this->assign("pages",$page->show());
		$this->display();
	}
	/**
	 * 添加新版本
	 */
	public function addNewApp(){
		if($_POST){
			if(!isset($_POST['version_number']) && !$_POST['version_number'])ajax_info(-1,'未知版本号');
			if(!isset($_POST['path']) && !$_POST['path'])ajax_info(-1,'未知下载地址');
			$add=M('version')->add($_POST);
			$add?ajax_info(1,'添加成功'):ajax_info(-1, '添加失败');
		}
		$this->display();
	}
	/**
	 * vip充值卡列表
	 */
	public function vipCardList(){
		if($_POST){
			if(!is_file(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/vipCardList.txt')){
				fopen(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/vipCardList.txt','a+');
			}
			$_POST=array_filter($_POST);
			file_put_contents(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/vipCardList.txt', serialize($_POST));
		}
		$where='1=1';
		$whereFile=unserialize(file_get_contents(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/vipCardList.txt'));
		/*
		 * 
		 */
		if(isset($whereFile['id']) && $whereFile['id'])$where.=' AND c.='.$whereFile['id'];
		if(isset($whereFile['uid']) && $whereFile['uid'])$where.=' AND c.uid='.$whereFile['uid'];
		if(isset($whereFile['strtime']) && $whereFile['strtime'])$where.=' AND c.time >= '.strtotime($whereFile['strtime']);
		if(isset($whereFile['endtime']) && $whereFile['endtime'])$where.=' AND c.time <= '.strtotime($whereFile['strtime']);
		if(isset($whereFile['status']) && $whereFile['status'])$where.=' AND c.status='.$whereFile['status'];
		/*
		 * 
		 */
		$db=M('vip_card c');
		$count = $db->where($where)->count();
		$page  = new \Think\Page($count,50);
		$data=$db->field('c.id,c.uid,c.time,c.end_time,c.use_time,c.code,c.admin_id,c.msg,c.status,cv.num,cv.type')->join('yk_vip_card_value AS cv On c.value_id=cv.id')->where($where)->order('c.id desc')->limit($page->firstRow,$page->listRows)->select();
		foreach($data as $k=>$v){
			$data[$k]['time']=date('Y-m-d H:i:s',$v['time']);
			$data[$k]['end_time']=date('Y-m-d H:i:s',$v['end_time']);
			$data[$k]['use_time']=$data[$k]['use_time']?date('Y-m-d H:i:s',$v['use_time']):'未使用';
			switch ($v['status']){
				case 1:
					$data[$k]['status']='正常';
					break;
				case 2:
					$data[$k]['status']='已使用';
					break;
				case 3:
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
	 * 生成充值卡
	 */
	private function generateCode(){
		$code=mt_rand(10,99).date('Ymd').mt_rand(10,99);
		$in=M('vip_card')->field('id')->where(array('code'=>$code,'status'=>1))->limit('0,1')->find();
		if(!$in){
			return $code;
		}else{
			$this->generateCode();
		}
	}
	/**
	 * 添加充值卡
	 */
	public function addCard(){
		if($_POST){
			if(!$_POST['num'] || !$_POST['end_time'])ajax_info(-1, '缺少参数');
			$codeArr=array();
			$time=time();
			for ($i=0;$i<$_POST['num'];$i++){
				$code=$this->generateCode();
				M('vip_card')->add(array('value_id'=>$_POST['value_id'],'time'=>$time,'end_time'=>strtotime($_POST['end_time']),'code'=>$code,'admin_id'=>$_SESSION['manage']['id'],'msg'=>$_POST['msg'],'status'=>1,'title'=>$_POST['title']));
				$codeArr[]=$code;
			}
			ajax_info(1, '成功',$codeArr);
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
	 * vip面值列表
	 */
	public function vipValueList(){
		$db=M('vip_card_value');
		$count = $db->count();
		$page  = new \Think\Page($count,50);
		$data=$db->field('id,num,type,time')->order('id desc')->limit($page->firstRow,$page->listRows)->select();
		foreach($data as $k=>$v){
			$data[$k]['time']=date('Y-m-d H:i:s',$v['time']);
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
	 * 添加VIP面值
	 */
	public function addValue(){
		if($_POST){
			if(!$_POST['num'])ajax_info(-1,'未知数量');
			$in=M('vip_card_value')->field('id')->where($_POST)->limit('0,1')->find();
			if($in)ajax_info(-1, '该面值已存在');
			$_POST['time']=time();
			$add=M('vip_card_value')->add($_POST);
			$add?ajax_info(1, '添加成功'):ajax_info(-1, '添加失败');
		}
		$this->display();
	}
	/**
	 * 删除激活码
	 */
	public function delVipNum(){
		$nums=explode(',', $_POST['num']);
		$del=M('vip_card')->where(array('code'=>array('in',$nums)))->save(array('status'=>3));
		$del?ajax_info(1,'删除成功'):ajax_info(-1,'删除失败');
	}
	/**
	 * 系统公告
	 */
	 public function systemMsg(){
		 if($_POST){
			if(!is_file(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/systemMsg.txt')){
				fopen(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/systemMsg.txt','a+');
			}
			$_POST=array_filter($_POST);
			file_put_contents(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/systemMsg.txt', serialize($_POST));
		}
		$where='1=1';
		$whereFile=unserialize(file_get_contents(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/systemMsg.txt'));
		/*
		 * 
		 */
		if(isset($whereFile['msg']) && $whereFile['msg'])$where.=' AND msg like "%'.$whereFile['msg'].'%"';
		if(isset($whereFile['position']) && $whereFile['position'])$where.=' AND position = '.$whereFile['position'];
		if(isset($whereFile['equipment']) && $whereFile['equipment'])$where.=' AND equipment='.$whereFile['equipment'];
		/*
		 * 
		 */
		 $db=M('system_msg');
		 $count = $db->where($where)->count();
		$page  = new \Think\Page($count,50);
		 $data=$db->field('id,msg,url,time,position,equipment,status')->where($where)->order('sort desc')->limit($page->firstRow,$page->listRows)->select();
		 foreach($data as $k=>$v){
			 $data[$k]['time']=date('Y-m-d H:i:s',$v['time']);
			 switch ($v['position']){
				 case 1:
					$data[$k]['position']='通用';
					break;
				 case 2:
					$data[$k]['position']='推荐';
					break;
				 case 3:
					$data[$k]['position']='男生';
					break;
				 case 4:
					$data[$k]['position']='女生';
					break;
				 case 5:
					$data[$k]['position']='出版';
					break;
			 }
			 if($v['equipment']==1){
				 $data[$k]['equipment']='通用';
			 }else if($v['equipment']==2){
				 $data[$k]['equipment']='安卓';
			 }else{
				 $data[$k]['equipment']='IOS';
			 }
			 if($v['status']=1){
				 $data[$k]['status']='显示';
			 }else{
				 $data[$k]['status']='隐藏';
			 }
		 }
		 $this->assign('whereFile',$whereFile);
		 $this->assign('data',$data);
		 $this->display();
	 }
	/**
	 * 删除公告
	 */
	public function delSystemMsg(){
		if(!isset($_POST['num']) || empty($_POST['num']))ajax_info(-1,'参数错误');
		$del=M('system_msg')->where(array('id'=>$_POST['num']))->delete();
		$del?ajax_info(1,'成功'):ajax_info(-1,'删除失败');
	}
	/**
	 * 编辑公告
	 */
	public function editSystemMsg(){
		if($_POST){
			if($_POST['id']){
				$up=M('system_msg')->where(array('id'=>$_POST['id']))->save($_POST);
			}else{
				unset($_POST['id']);
				$_POST['time']=time();
				$up=M('system_msg')->add($_POST);
			}
			$up?ajax_info(1,'成功'):ajax_info(-1,'失败');
		}
		$data=M('system_msg')->field('id,msg,url,position,equipment,sort,status')->where(array('id'=>$_GET['num']))->find();
		$this->assign('data',$data);
		$this->display();
	}
	/**
	 * 发现列表
	 */
	public function newsList(){
		$data=M('news')->field('id,name,url,js_1,js_2,user_agent,equipment,status')->order('sort desc')->select();
		foreach($data as &$v){
			if($v['equipment']==1){
				$v['equipment']='通用';
			}else if($v['equipment']==2){
				$v['equipment']='安卓';
			}else{
				$v['equipment']='IOS';
			}
			if($v['status']==1){
				$v['status']='正常';
			}else{
				$v['status']='停用';
			}
		}
		$this->assign('data',$data);
		$this->display();
	}
	/**
	 * 删除发现
	 */
	public function delNews(){
		if(!isset($_POST['num']) || empty($_POST['num']))ajax_info(-1,'参数错误');
		$del=M('news')->where(array('id'=>$_POST['num']))->delete();
		$del?ajax_info(1,'成功'):ajax_info(-1,'失败');
	}
	/**
	 * 编辑发现
	 */
	 public function editNews(){
		if(isset($_POST) && !empty($_POST)){
			if($_POST['id']){
				$up=M('news')->where(array('id'=>$_POST['id']))->save($_POST);
			}else{
				unset($_POST['id']);
				$up=M('news')->add($_POST);
			}
			$up?ajax_info(1,'成功'):ajax_info(-1,'失败');
		}
		$data=M('news')->field('id,name,url,js_1,js_2,user_agent,equipment,status,sort')->where(array('id'=>$_GET['num']))->limit('0,1')->find();
		$this->assign('data',$data);
		$this->display();
	 }
}