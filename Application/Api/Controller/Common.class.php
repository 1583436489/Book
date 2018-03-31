<?php
use System\Db;
class Common extends Check{
	/**
	 * 获取菜单
	 */
	public function getMenu(){
		$where='pid=0';$bind=array();
		if($_POST){
			//下级分类
			if(isset($_POST['pid']) && $_POST['pid']){
				$where='pid=:pid';
				$bind[':pid']=$_POST['pid'];
			}
			//类型
			if(isset($_POST['type']) && $_POST['type']){
				$where.=' and type=:type';
				$bind[':type']=$_POST['type'];
			}
		}
		$data=array();
		$data=Db::connect()->name('menu')->field('id,name,menu_img,menu_color,remarks')->where($where)->bindParam($bind)->order('score desc')->select();
		foreach($data as &$v){
			foreach($v as &$val){
				if($val===null)$val='';
			}
			$v['menu_img']=getFileUrl($v['menu_img'],'Menu');
			$v['son']=Db::connect()->name('menu')->field('id,name,pid,menu_img,menu_color,remarks')->where('pid=:id')->bindParam(array(':id'=>$v['id']))->order('score desc')->select();
			foreach($v['son'] as &$value){
				foreach($value as &$value1){
					if($value1===null)$value1='';
				}
				$value['menu_img']=getFileUrl($value['menu_img'],'Menu');
			}
		}
		if(empty($data))jsonOut(-1,'暂无该菜单');
		jsonOut(1,'成功',$data);
	}
	/**
	 * 获取轮播图
	 */
	public function getRolling(){
		$data=array();
		$data=Db::connect()->name('rolling')->field('img,type,url')->order('score desc')->select();
		foreach ($data as &$v){
			$v['img']=getFileUrl($v['img'],'Rolling');
		}
		if(empty($data))jsonOut(-1,'暂无轮播图');
		jsonOut(1,'成功',$data);
	}
	/**
	 * 获取系统参数
	 */
	public function getSystemConfig(){
		if(!isset($_POST['sid']) || !$_POST['sid'])jsonOut(-1,'sid not null');
		$data=array();
		$data=Db::connect()->name('config')->field('val')->where('id=?')->bindParam(array($_POST['sid']))->select('fetch');
		if(empty($data))jsonOut(-1,'该配置不存在');
		jsonOut(1,'成功',$data);
	}
	/**
	 * 获取广告
	 */
	public function getAdv(){
		$data=array();
		$data=Db::connect()->name('adv')->field('img,url')->order('score desc')->select();
		foreach ($data as &$v){
			$v['img']=getFileUrl($v['img'],'Adv');
		}
		if(empty($data))jsonOut(-1,'暂无广告');
		jsonOut(1,'成功',$data);
	}
	/**
	 * 发送验证码
	 */
	public function sendVerify(){
		if(!isset($_POST['phone']) || empty($_POST['phone']))jsonOut(-1,'手机号不能为空');
		$type=isset($_POST['type']) && $_POST['type']?$_POST['type']:1;//1 注册 2 找回
		$member=Db::connect()->name('member')->field('id')->where('phone=?')->bindParam(array($_POST['phone']))->select('fetch');
		if($member && $type==1)jsonOut(-1,'该手机号已经注册');
		if(!$member && $type==2)jsonOut(-1,'该手机号未注册');
		$id=Db::connect()->name('verify')->field('code')->where('phone=? and state=1')->bindParam(array($_POST['phone']))->order('id desc')->select('fetch');
		if($id)jsonOut(1,'验证码发送成功',$id['code']);
// 		$code=mt_rand(100000,999999);
		$code='123456';
		$add=Db::connect()->name('verify')->insert(array('phone'=>$_POST['phone'],'code'=>$code,'time'=>time(),'state'=>'1'));
		$add?jsonOut(1,'验证码发送成功',$code):jsonOut(-1,'验证码发送失败');
	}
	/**
	 * 版本更新
	 */
	public function version(){
		if(!isset($_POST['version_number']) || empty($_POST['version_number']))jsonOut(-1,'未知当前版本号');
		if(!isset($_POST['type']) || empty($_POST['type']))jsonOut(-1,'未知当前更新类型');
		$version=Db::connect()->name('version')->field('version_number,path,msg,status')->where('version_number > ? AND type=?')->bindParam(array($_POST['version_number'],$_POST['type']))->select('fetch');
		$version?jsonOut(1,'成功',$version):jsonOut(1,'暂无新版本');
	}
	/**
	 * APP启动页
	 */
	public function startPage(){
		if(!isset($_POST['type']) || !$_POST['type'])jsonOut(-1,'未知设备类型');
		$data['start']=Db::connect()->name('start_page')->field('id,img,button_msg,href,title,content')->where('(type=1 OR type=?) AND start_time<='.time().' AND end_time>'.time().' AND status=1')->bindParam(array($_POST['type']))->select();
		$data['adv']=Db::connect()->name('adv')->field('id,img,url,type')->where('position=1 AND status=1 AND (equipment=? OR equipment=1)')->bindParam(array($_POST['type']))->order('score desc')->select();
		$data['config']['problem_url']=getConfig(8);
		$data['config']['copy_text']=getConfig(9);
		$data?jsonOut(1,'成功',$data):jsonOut(-1,'暂无启动页');
	}
	/**
	 * 分享
	 */
	public function share(){
		$data['uid']=$this->userInfo?$this->userInfo['id']:jsonOut(0,'请先登录');
		if(!isset($_POST['shareId']) || $_POST['shareId']===null)jsonOut(-1,'参数错误');//0 APP 其他 书籍
		if(!isset($_POST['target']) || !$_POST['target'])jsonOut(-1,'未知分享地址');
		$data['time']=time();
		$data['share_id']=$_POST['shareId'];
		$data['target']=$_POST['target'];
		$sign='';
		foreach ($data as $k=>$v){
			$sign.=$k.'='.$v.'&';
		}
		$data['sign']=md5(rtrim($sign,'&'));
		$data['status']=1;
		unset($sign);
		/*
		 * 如果是书籍查询书籍信息
		 */
		if($_POST['shareId']){
			$book=Db::connect()->name('book')
				->field('name,img,remarks')
				->where('id=?')
				->bindParam(array($_POST['shareId']))
				->select('fetch');
			$share['title']=$book['name'];
			$share['img']=getFileUrl($book['img'],'Book');
			$share['content']=$book['remarks'];
			unset($book);
		}else{
			$share['title']='分享app标题';
			$share['img']=getFileUrl('logo.png','Menu');
			$share['content']='分享app内容';
		}
		$add=Db::connect()->name('share')->insert($data);
		$share['url']='http://ykgwww.uuwx.me/index.php?m=Web&c=Share&f=index&shareId='._encrypt($add,'ENCODE','ykg').'&sign='.$data['sign'];
		unset($data);
		$add?jsonOut(1,'成功',$share):jsonOut(-1,'分享失败');
	}
	/**
	 * 关于我们
	 */
	public function aboutUs(){
		$data['content']=getConfig(6);
		$data['codeImg']=getConfig(7);
		jsonOut(1,'成功',$data);
	}
}