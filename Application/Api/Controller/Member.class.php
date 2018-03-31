<?php
use System\Db;
class Member extends Check{
	/**
	 * 注册
	 */
	public function register(){
		if(!isset($_POST['phone']) || empty($_POST['phone']))jsonOut(-1,'手机号不能为空');
		$member=Db::connect()->name('member')->field('id')->where('phone=?')->bindParam(array($_POST['phone']))->select('fetch');
		if($member)jsonOut(-1,'该手机已经注册');
		if(!isset($_POST['password']) || empty($_POST['password']))jsonOut(-1,'密码不能为空');
// 		if(!isset($_POST['code']) || empty($_POST['code']))jsonOut(-1,'验证码不能为空');
// 		$this->verifyCode($_POST['phone'],$_POST['code']);//验证验证码
		$data['phone']=$_POST['phone'];
		$data['salt']=mt_rand(1000,9999);
		$data['password']=md5($data['salt'].md5($_POST['password']));
		$data['token']=md5($_POST['phone'].$data['password'].time());
		$data['add_time']=$data['last_time']=$data['end_vip']=time();
		if(isset($_POST['model']) && !empty($_POST['model']))$data['model']=$_POST['model'];
		if(isset($_POST['imei']) && !empty($_POST['imei']))$data['imei']=$_POST['imei'];
		if(isset($_POST['devtype']) && !empty($_POST['devtype']))$data['devtype']=$_POST['devtype'];
		$data['is_verify']=0;
		//获取配置参数
		$config=getConfig('2');
		if($config)$data['gold']=$config;
		$add=Db::connect()->name('member')->insert($data);
		if($config && $add)addGoldSource('0',$add,$config,'3');//插入金币流水记录
		$add?jsonOut(1,'注册成功',array('token'=>$data['token'],'end_vip'=>'已过期','uid'=>$add)):jsonOut(-1,'注册失败');
	}
	/**
	 * 登录
	 */
	public function login(){
		if(!isset($_POST['phone']) && !isset($_POST['wx_open_id']) && !isset($_POST['qq_open_id']))jsonOut(-1,'参数错误');
		if(isset($_POST['phone']) && $_POST['phone']){
			$member=Db::connect()->name('member')->field('id,salt,password,phone,end_vip')->where('phone=?')->bindParam(array($_POST['phone']))->select('fetch');
			if(!$member)jsonOut(-1,'该手机未注册');
			$password=isset($_POST['password']) && $_POST['password']?$_POST['password']:'';
			$code=isset($_POST['code']) && $_POST['code']?$_POST['code']:'';
			if((!$password && !$code) || ($password && $code))jsonOut(-1,'参数错误');
			if($password){
				if(md5($member['salt'].md5($password))!=$member['password'])jsonOut(-1,'密码错误');
			}else{
				$this->verifyCode($_POST['phone'],$code);//验证验证码
			}
			$token=md5($member['phone'].$member['password'].time());
			$member['end_vip']=$member['end_vip']==0 || $member['end_vip']<time()?'已过期':date('Y-m-d H:i:s',$member['end_vip']);
			$loginType=1;
		}else{
			if(isset($_POST['wx_open_id']) && $_POST['wx_open_id']){
				$openId=$_POST['wx_open_id'];
				$loginType=2;
			}
			if(isset($_POST['qq_open_id']) && $_POST['qq_open_id']){
				$openId=$_POST['qq_open_id'];
				$loginType=3;
			}
			$member=Db::connect()->name('member')->field('id,wx_open_id,qq_open_id,end_vip')->where('wx_open_id=:open_id OR qq_open_id=:open_id')->bindParam(array(':open_id'=>$openId))->select('fetch');
			if(!$member){
				if(isset($_POST['nick']) && $_POST['nick'])$data['nick']=$_POST['nick'];
				if(isset($_POST['portrait']) && $_POST['portrait'])$data['portrait']=$_POST['portrait'];
				if(isset($_POST['sex']) && $_POST['sex'])$data['sex']=$_POST['sex'];
				if(isset($_POST['wx_open_id']) && $_POST['wx_open_id'])$data['wx_open_id']=$_POST['wx_open_id'];
				if(isset($_POST['qq_open_id']) && $_POST['qq_open_id'])$data['qq_open_id']=$_POST['qq_open_id'];
				if(isset($_POST['province']) && $_POST['province'])$data['province']=$_POST['province'];
				if(isset($_POST['city']) && $_POST['city'])$data['city']=$_POST['city'];
				if(isset($_POST['model']) && $_POST['model'])$data['model']=$_POST['model'];
				if(isset($_POST['imei']) && $_POST['imei'])$data['imei']=$_POST['imei'];
				if(isset($_POST['devtype']) && $_POST['devtype'])$data['devtype']=$_POST['devtype'];
				if(isset($_POST['wx_nick']) && !empty($_POST['wx_nick']))$data['wx_nick']=$_POST['wx_nick'];
				if(isset($_POST['qq_nick']) && !empty($_POST['qq_nick']))$data['qq_nick']=$_POST['qq_nick'];
				$data['token']=$token=md5($openId.time());
				$data['add_time']=$data['end_vip']=time();
				$data['is_verify']=0;
				//获取配置参数
				$config=getConfig('2');
				if($config)$data['gold']=$config;
				$add=Db::connect()->name('member')->insert($data);
				if($config && $add)addGoldSource('0',$add,$config,'3');//插入金币流水记录
				if(!$add)jsonOut(-1,'登录失败');
				$member['id']=$add;
				$member['end_vip']='已过期';
			}else{
				$token=md5($openId.time());
				$member['end_vip']=$member['end_vip']==0 || $member['end_vip']<time()?'已过期':date('Y-m-d H:i:s',$member['end_vip']);
			}
		}
		// 		if(!isset($_POST['phone']) || empty($_POST['phone']))jsonOut(-1,'手机号不能为空');
		$up=Db::connect()->name('member')->where('id=:id')->bindParam(array(':id'=>$member['id'],':token'=>$token,':last_time'=>time()))->update('token=:token,last_time=:last_time');
		$up?jsonOut(1,'登录成功',array('token'=>$token,'uid'=>$member['id'],'end_vip'=>$member['end_vip'],'loginType'=>$loginType)):jsonOut(-1,'登录失败');
	}
	/**
	 * 获取用户信息
	 */
	public function getUserInfo(){
		if(!$this->userInfo)jsonOut(0,'请先登录');
		unset($this->userInfo['id']);
		jsonOut(1,'成功',$this->userInfo);
	}
	/**
	 * 修改资料
	 */
	public function editMember(){
		if(!isset($_POST['phone']) || empty($_POST['phone']))jsonOut(0,'请先登录');
		$member=Db::connect()->name('member')->field('id,salt')->where('phone=?')->bindParam(array($_POST['phone']))->select('fetch');
		if(!$member)jsonOut(-1,'手机号还未注册');
		$upStr='';
		if(isset($_POST['nick']) && !empty($_POST['nick']))$upStr.='nick="'.$_POST['nick'].'"';
		if(isset($_POST['portrait']) && !empty($_POST['portrait']))$upStr.=',portrait="'.$_POST['portrait'].'"';
		if(isset($_POST['sex']) && !empty($_POST['sex']))$upStr.=',sex="'.$_POST['sex'].'"';
		if(isset($_POST['province']) && !empty($_POST['province']))$upStr.=',province="'.$_POST['province'].'"';
		if(isset($_POST['city']) && !empty($_POST['city']))$upStr.=',city="'.$_POST['city'].'"';
		if(isset($_POST['newPwd']) && !empty($_POST['newPwd'])){
			if(isset($_POST['code']) && !empty($_POST['code']))$this->verifyCode($_POST['phone'],$_POST['code']);
			if(empty($member['salt'])){
				$salt=mt_rand(1000,9999);
				$upStr.=',salt="'.$salt.'"';
			}else{
				$salt=$member['salt'];
			}
			$upStr.=',password="'.md5($salt.md5($_POST['newPwd'])).'"';
		}
		$upStr=ltrim($upStr,',');
		if(!$upStr)jsonOut(1,'修改成功');
		$up=Db::connect()->name('member')->where('id='.$member['id'])->update($upStr);
		$up?jsonOut(1,'修改成功'):jsonOut(-1,'修改失败');
	}
	/**
	 * 签到
	 */
	public function signIn(){
		if(empty($this->userInfo))jsonOut(0,'请先登录');
		//获取配置
		$gold=getConfig(4);
		Db::connect()->setAffair(1);
		/*
		 * 插入签到记录
		 */
		$time=time();
		$addSign=Db::connect()->name('sign')->insert(array('uid'=>$this->userInfo['id'],'time'=>$time));
		if($gold){
			/*
			 * 更新用户金币
			 */
			$upGold=Db::connect()->name('member')->where('id='.$this->userInfo['id'])->update('gold=gold+'.$gold);
			/*
			 * 插入金币记录
			 */
			$addGoldSource=addGoldSource('0',$this->userInfo['id'],$gold,'2');
		}else $upGold=$addGoldSource=true;
		if($addSign && $upGold && $addGoldSource){
			Db::connect()->setAffair(2);
			jsonOut(1,'签到成功');
		}else{
			Db::connect()->setAffair(3);
			jsonOut(-1,'签到失败');
		}
	}
	/**
	 * 升级VIP
	 */
	public function upVIP(){
		if(empty($this->userInfo))jsonOut(0,'请先登录');
		if(!isset($_POST['code']) || !$_POST['code'])jsonOut(-1,'激活码不能为空');
		$vip=Db::connect()->name('vip_card AS c')->field('c.id,c.uid,c.end_time,c.status,cv.num,cv.type')->join('yk_vip_card_value AS cv ON c.value_id=cv.id')->where('code=?')->bindParam(array($_POST['code']))->limit('0,1')->select('fetch');
		if(!$vip)jsonOut(-1,'激活码不存在');
		if($vip['end_time']<time())jsonOut(-1,'激活码已过期');
		if($vip['status']==2)jsonOut(-1,'激活码已使用');
		if($vip['status']==3)jsonOut(-1,'因为某种原因激活码已被删除');
		//添加时间
		$time=date('Y-m-d');
		if($this->userInfo['end_vip'])$time=date('Y-m-d H:i:s',$this->userInfo['end_vip']);
		if($vip['type']==1){
			$end_time=strtotime($time." +".$vip['num']." day");
		}elseif ($vip['type']==2){
			$end_time=strtotime($time." +".$vip['num']." month");
		}else{
			$end_time=strtotime($time." +".$vip['num']." year");
		}
		Db::connect()->setAffair(1);
		$upMember=Db::connect()->name('member')->where('id='.$this->userInfo['id'])->bindParam(array($end_time))->update('end_vip=?');
		$upVipCard=Db::connect()->name('vip_card')->where('id='.$vip['id'])->update('use_time='.time().',status=2,uid='.$this->userInfo['id']);
		if($upMember && $upVipCard){
			Db::connect()->setAffair(2);
			jsonOut(1, '激活成功',$end_time);
		}else{
			Db::connect()->setAffair(3);
			jsonOut(-1, '激活失败');
		}
	}
	/**
	 * 账户绑定
	 */
	public function bindAccount(){
		if(!isset($this->userInfo) || empty($this->userInfo['id']))jsonOut(0,'请先登录');
		if(!isset($_POST['phone']) && !isset($_POST['wx_open_id']) && !isset($_POST['qq_open_id']))jsonOut(-1,'未知要绑定的账户');
		//绑定手机
		if(isset($_POST['phone']) && !empty($_POST['phone'])){
			$member=Db::connect()->name('member')->field('id')->where('phone=?')->bindParam(array($_POST['phone']))->limit('0,1')->select('fetch');
			if($member)jsonOut(-1,'该手机已绑定过账户');
			$data[':phone']=$_POST['phone'];
			$upStr='phone=:phone';
			if(empty($this->userInfo['password'])){
				$upStr.=',salt=:salt';
				$data[':salt']=mt_rand(1000,9999);
				$upStr.=',password=:password';
				$data[':password']=md5($data[':salt'].md5(123456));
			}
			$up=Db::connect()->name('member')->where('id='.$this->userInfo['id'])->bindParam($data)->update($upStr);
			accountLog($this->userInfo['id'],1,$_POST['phone'],'phone');
			$up?jsonOut(1,'手机绑定成功'):jsonOut(-1,'手机绑定失败');
		}
		//绑定微信
		if(isset($_POST['wx_open_id']) && !empty($_POST['wx_open_id'])){
			$member=Db::connect()->name('member')->field('id')->where('wx_open_id=?')->bindParam(array($_POST['wx_open_id']))->limit('0,1')->select('fetch');
			if($member)jsonOut(-1,'该微信已绑定过账户');
			$data[':wx_open_id']=$_POST['wx_open_id'];
			$upStr='wx_open_id=:wx_open_id';
			if(isset($_POST['wx_nick']) && !empty($_POST['wx_nick'])){
				$data[':wx_nick']=$_POST['wx_nick'];
				$upStr.=',wx_nick=:wx_nick';
			}
			$up=Db::connect()->name('member')->where('id='.$this->userInfo['id'])->bindParam($data)->update($upStr);
			accountLog($this->userInfo['id'],1,$_POST['wx_open_id'],'wx_open_id');
			$up?jsonOut(1,'微信绑定成功'):jsonOut(-1,'微信绑定失败');
		}
		//绑定qq
		if(isset($_POST['qq_open_id']) && !empty($_POST['qq_open_id'])){
			$member=Db::connect()->name('member')->field('id')->where('qq_open_id=?')->bindParam(array($_POST['qq_open_id']))->limit('0,1')->select('fetch');
			if($member)jsonOut(-1,'该qq已绑定过账户');
			$data[':qq_open_id']=$_POST['qq_open_id'];
			$upStr='qq_open_id=:qq_open_id';
			if(isset($_POST['qq_nick']) && !empty($_POST['qq_nick'])){
				$data[':qq_nick']=$_POST['qq_nick'];
				$upStr.=',qq_nick=:qq_nick';
			}
			$up=Db::connect()->name('member')->where('id='.$this->userInfo['id'])->bindParam($data)->update($upStr);
			accountLog($this->userInfo['id'],1,$_POST['qq_open_id'],'qq_open_id');
			$up?jsonOut(1,'qq绑定成功'):jsonOut(-1,'qq绑定失败');
		}
		jsonOut(-1,'要绑定的账户不能为空');
	}
	/**
	 * 账户解绑
	 */
	public function unsetBind(){
		if(!isset($this->userInfo) || empty($this->userInfo['id']))jsonOut(0,'请先登录');
		if(!isset($_POST['type']) || empty($_POST['type']))jsonOut(-1,'未知要解绑的账户');//1手机 2 微信 3 qq
		$member=Db::connect()->name('member')->field('phone,wx_open_id,qq_open_id')->where('id='.$this->userInfo['id'])->limit('0,1')->select('fetch');
		//解绑手机
		if($_POST['type']==1){
			if(!$member['wx_open_id'] && !$member['qq_open_id'])jsonOut(-1,'不能再解绑了');
			if(!$member['phone'])jsonOut(-1,'还未绑定手机');
			$up=Db::connect()->name('member')->where('id='.$this->userInfo['id'])->update('phone=""');
			accountLog($this->userInfo['id'],2,$member['phone'],'phone');
			$up?jsonOut(1,'手机解绑成功'):jsonOut(-1,'手机解绑失败');
		}
		//解绑微信
		if($_POST['type']==2){
			if(!$member['phone'] && !$member['qq_open_id'])jsonOut(-1,'不能再解绑了');
			if(!$member['wx_open_id'])jsonOut(-1,'还未绑定微信');
			$up=Db::connect()->name('member')->where('id='.$this->userInfo['id'])->update('wx_open_id="",wx_nick=""');
			accountLog($this->userInfo['id'],2,$member['wx_open_id'],'wx_open_id');
			$up?jsonOut(1,'微信解绑成功'):jsonOut(-1,'微信解绑失败');
		}
		//解绑qq
		if($_POST['type']==3){
			if(!$member['phone'] && !$member['wx_open_id'])jsonOut(-1,'不能再解绑了');
			if(!$member['qq_open_id'])jsonOut(-1,'还未绑定qq');
			$up=Db::connect()->name('member')->where('id='.$this->userInfo['id'])->update('qq_open_id="",qq_nick=""');
			accountLog($this->userInfo['id'],2,$member['qq_open_id'],'qq_open_id');
			$up?jsonOut(1,'qq解绑成功'):jsonOut(-1,'qq解绑失败');
		}
	}
	/**
	 * 激活码列表
	 */
	public function codeList(){
		$pageNum=isset($_POST['page']) && $_POST['page']?$_POST['page']:1;
		$page=($pageNum-1)*20;
		$data=array();
		if($this->userInfo){
			$data=Db::connect()->name('vip_card_activity AS c')
					->field('c.id,c.end_time,c.content AS msg,c.title,cv.num,cv.type')
					->join('yk_vip_card_value AS cv ON c.value_id=cv.id')
					->where('c.status=1 AND c.get_num<c.num AND c.end_time>'.time().' AND c.id NOT IN (select activity_id from yk_vip_card where uid='.$this->userInfo['id'].')')
					->order('c.id desc')->limit($page.',20')->select();
		}
		foreach ($data as $k=>$v){
			$data[$k]['end_time']=date('Y-m-d H:i:s',$v['end_time']);
			$data[$k]['code']=$v['id'];
		}
		$data?jsonOut(1,'成功',$data):jsonOut(-1,'没有可用的激活码');
	}
	/**
	 * 领取激活码
	 */
	public function getActivationCode(){
		if(!$this->userInfo)jsonOut(0,'请先登录');
		if(!isset($_POST['code']) || !$_POST['code'])jsonOut(-1,'激活码不能为空');
		$isGet=Db::connect()->name('vip_card')->field('id')->where('uid='.$this->userInfo['id'].' AND activity_id=?')->bindParam(array($_POST['code']))->select('fetch');
		if($isGet)jsonOut(-1,'一个用户只能领取一次');
		$codeId=Db::connect()->name('vip_card_activity')->field('id,num,get_num,value_id,end_time,admin_id,msg,title,content')->where('id=? AND end_time>'.time().' AND status=1')->bindParam(array($_POST['code']))->limit('0,1')->select('fetch');
		if(!$codeId)jsonOut(-1,'该激活码不存在或已失效');
		if($codeId['num']<=$codeId['get_num'])jsonOut(-1,'卡券已领完');
		$data=array();
		$data['uid']=$this->userInfo['id'];
		$data['value_id']=$codeId['value_id'];
		$data['time']=time();
		$data['end_time']=$codeId['end_time'];
		$data['code']=mt_rand(10,99).date('Ymd').mt_rand(10,99);
		$data['admin_id']=$codeId['admin_id'];
		$data['msg']=$codeId['msg'];
		$data['title']=$codeId['title'];
		$data['content']=$codeId['content'];
		$data['status']=1;
		$data['activity_id']=$codeId['id'];
		Db::connect()->setAffair(1);
		$add=Db::connect()->name('vip_card')->insert($data);
		$addNum=Db::connect()->name('vip_card_activity')->where('id='.$codeId['id'])->update('get_num=get_num+1');
		if($add && $addNum){
			Db::connect()->setAffair(2);
			jsonOut(1,'领取成功');
		}else{
			Db::connect()->setAffair(3);
			jsonOut(-1,'领取失败');
		}
	}
	/**
	 * 已领取激活码列表
	 */
	public function myCodeList(){
		$pageNum=isset($_POST['page']) && $_POST['page']?$_POST['page']:1;
		$page=($pageNum-1)*20;
		$data=array();
		if($this->userInfo){
			$data=Db::connect()->name('vip_card AS c')->field('c.id,c.end_time,c.content AS msg,c.title,c.code,c.status,cv.num,cv.type')->join('yk_vip_card_value AS cv ON c.value_id=cv.id')->where('uid='.$this->userInfo['id'].' AND activity_id > 0')->order('c.status asc')->limit($page.',20')->select();
		}
		foreach($data as $k=>$v){
			$data[$k]['end_time']=date('Y-m-d H:i:s',$v['end_time']);
		}
		$data?jsonOut(1,'成功',$data):jsonOut(-1,'没有更多的激活码');
	}
}