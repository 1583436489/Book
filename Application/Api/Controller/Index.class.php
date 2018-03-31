<?php
use System\Db;
class Index extends Check{
	public function home(){
		$where='';$bind=array();
		$msgPosition='';
		$equipment=isset($_POST['equipment']) && !empty($_POST['equipment'])?$_POST['equipment']:'1';
		//初始化结果
		$data=array('read'=>array(),'hot'=>array(),'main'=>array(),'allLook'=>array(),'new'=>array());
		if(!isset($_POST['position']) || !$_POST['position']){
			$where=' AND is_home=-1';
			$msgPosition=2;
			//最近阅读
			if($this->userInfo)$data['read']=Db::connect()->name('book_read as r')->field('c.title,b.name')->join('yk_book_chapter as c on r.chapter_id=c.id inner join yk_book as b on c.book_id=b.id')->where('r.uid='.$this->userInfo['id'])->order('r.id desc')->group('b.id')->limit('0,2')->select();
		}else if(isset($_POST['position']) && $_POST['position']){
			$menu=Db::connect()->name('menu')->field('id')->where('pid=?')->bindParam(array($_POST['position']))->select();
			if($menu){
				$where=' and b.menu in (';
				foreach($menu as $v){
					$where.=$v['id'].',';
				}
				$where=rtrim($where,',');
				$where.=')';
			}else{
				$where=' and b.menu=:menu';
				$bind[':menu']=$_POST['position'];
			}
			if($_POST['position']==1){
				$where.=' AND is_home=1';
				$msgPosition=3;
			}elseif ($_POST['position']==10){
				$where.=' AND is_home=2';
				$msgPosition=4;
			}elseif ($_POST['position']==17){
				$where.=' AND is_home=3';
				$msgPosition=5;
			}
			//最新上架
			$data['new']=Db::connect()->name('book AS b')->field('b.id,b.name,b.img')->where('b.state=1'.$where)->bindParam($bind)->order('b.id desc')->limit('0,6')->select();
			foreach ($data['new'] as &$v){
				$v['img']=getFileUrl($v['img'],'Book');
			}
			/**
			 * 类型
			 */
			$data['typeList']=Db::connect()->name('menu')->field('id,name,menu_color')->where('type=2 AND pid=0')->order('score desc')->select();
		}
		//热门推荐
		$data['hot']=Db::connect()->name('book AS b')->field('b.id,b.name,b.img')->where('b.state=1 and b.is_hot=2'.$where)->bindParam($bind)->order('b.id desc')->limit('0,6')->select();
		foreach ($data['hot'] as &$v){
			$v['img']=getFileUrl($v['img'],'Book');
		}
		//主打
		$data['main']=Db::connect()->name('book AS b')->field('b.id,b.name,b.img,b.menu,b.remarks,b.type,b.group,b.word_number,b.fans')->where('b.state=1 and is_main=2'.$where)->bindParam($bind)->order('b.id desc')->limit('0,3')->select();
		foreach ($data['main'] as &$v){
			$v['img']=getFileUrl($v['img'],'Book');
			$menu=Db::connect()->name('menu')->field('name')->where('id in (?)')->bindParam(array($v['menu']))->select();
			$v['menu']=array();
			foreach ($menu as $mv){
				$v['menu'][]=$mv['name'];
			}
			$type=Db::connect()->name('menu')->field('name')->where('id in (?)')->bindParam(array($v['type']))->select();
			$v['type']=array();
			if($type){
				foreach ($type as $tv){
					$v['type'][]=$tv['name'];
				}
			}else{
				$v['type'][]='未分类';
			}
			unset($menu,$type);
			$group=Db::connect()->name('menu')->field('name')->where('id=?')->bindParam(array($v['group']))->select('fetch');
			$v['group']=$group['name'];
			unset($group);
			$v['fans']=$v['fans']>10000?round($v['fans']/10000,2).'W 人/周':$v['fans'].' 人/周';
		}
		//大家都在看
		$data['allLook']=Db::connect()->name('book AS b')->field('b.id,b.name,b.img')->where('b.state=1'.$where)->bindParam($bind)->order('b.fans desc')->limit('0,6')->select();
		foreach ($data['allLook'] as $allv){
			$v['img']=getFileUrl($allv['img'],'Book');
		}
		/**
		 * 轮播图
		 */
		if(!isset($_POST['position']) || !$_POST['position'])$_POST['position']=0;
		$data['rolling']=Db::connect()->name('rolling')->field('img,type,url')->where('(position=-1 OR position=?) AND (equipment=1 OR equipment='.$equipment.')')->bindParam(array($_POST['position']))->order('score desc')->select();
		foreach ($data['rolling'] as &$rv){
			$rv['img']=getFileUrl($rv['img'],'Rolling');
		}
		/**
		 * 公告
		 */
		$data['systemMsg']=Db::connect()->name('system_msg')->field('id,msg,url')->where('(equipment=1 OR equipment='.$equipment.') AND (position=1 OR position='.$msgPosition.') AND status=1')->order('sort desc')->limit('0,10')->select();
		/**
		 * 分组
		 */
		$data['group']=Db::connect()->name('menu')->field('id,name,menu_img,menu_color,remarks')->where('type=3 AND pid=0')->order('score desc')->select();
		foreach ($data['group'] as &$v){
			$v['menu_img']=getFileUrl($v['menu_img'],'Menu');
		}
		jsonOut(1,'成功',$data);
	}
	/**
	 * 书籍列表/更多
	 */
	public function bookList(){
		if(!isset($_POST['type']) || empty($_POST['type']))jsonOut(-1,'参数错误');
		$position=isset($_POST['position']) && !empty($_POST['position'])?$_POST['position']:'';
		$data=array();
		$page=isset($_POST['page']) && $_POST['page']?$_POST['page']:1;
		$page=($page-1)*20;
		$where='';$bind=array();
		$type=explode(',', $_POST['type']);
		//位置
		if($position){
			$menu=Db::connect()->name('menu')->field('id')->where('pid=?')->bindParam(array($position))->select();
			if($menu){
				$where.=' and b.menu in (';
				foreach($menu as $v){
					$where.=$v['id'].',';
				}
				$where=rtrim($where,',');
				$where.=')';
			}else{
				$where.=' and b.menu='.$position;
			}
		}
		if($type[0]=='allLook'){
			//大家都在看
			$data=Db::connect()->name('book AS b')->field('b.id,b.name,b.img,b.type,b.remarks,b.menu,b.group,b.word_number,b.fans')->where('b.state=1'.$where)->order('b.fans desc')->limit($page.',20')->select();
		}elseif ($type[0]=='source'){
			//全网
			$data=Db::connect()->name('book AS b')->field('b.id,b.name,b.img,b.type,b.remarks,b.menu,b.group,b.word_number,b.fans')->join('yk_network AS n ON b.id=n.book_id')->where('b.state=1 AND n.menu=:menu')->bindParam(array(':menu'=>$type[1]))->order('b.id desc')->limit($page.',20')->select();
		}else{
			if($type[0]!='new'){
				$where.=' and Find_IN_SET (?,b.'.$type[0].')';
				if(empty($type[1])){
					$bind[]='2';
				}else{
					$bind[]=$type[1];
				}
			}
			$data=Db::connect()->name('book AS b')->field('b.id,b.name,b.img,b.type,b.remarks,b.menu,b.group,b.word_number,b.fans')->where('b.state=1'.$where)->bindParam($bind)->order('b.id desc')->limit($page.',20')->select();
		}
		foreach ($data as &$v){
			$v['img']=getFileUrl($v['img'],'Book');
			$menu=Db::connect()->name('menu')->field('name')->where('id in (?)')->bindParam(array($v['menu']))->select();
			$v['menu']=array();
			foreach ($menu as $mv){
				$v['menu'][]=$mv['name'];
			}
			$type=Db::connect()->name('menu')->field('name')->where('id in (?)')->bindParam(array($v['type']))->select();
			$v['type']=array();
			if($type){
				foreach ($type as $tv){
					$v['type'][]=$tv['name'];
				}
			}else{
				$v['type'][]='未分类';
			}
			unset($menu,$type);
			$group=Db::connect()->name('menu')->field('name')->where('id=?')->bindParam(array($v['group']))->select('fetch');
			$v['group']=$group['name'];
			unset($group);
			$v['fans']=$v['fans']>10000?round($v['fans']/10000,2).'W 人':$v['fans'].' 人';
		}
		if(empty($data))jsonOut(-1,'没有更多数据了');
		jsonOut(1,'成功',$data);
	}
	/**
	 * 大家都在搜
	 */
	public function allSearch(){
		$data=array();
		$count=Db::connect()->name('book')->field('count(id) AS count')->select('fetch');
		$data=Db::connect()->name('book')->field('id,name')->limit(mt_rand(0,$count['count']-10).',50')->select();
		$data?jsonOut(1,'成功',$data):jsonOut(-1,'暂无数据');
	}
	/**
	 * 关键字搜索
	 */
	public function keySearch(){
		if(!isset($_POST['keyWord']) || empty($_POST['keyWord']))jsonOut(-1,'关键字不能为空');
		if(!isset($_POST['type']) || empty($_POST['type']))jsonOut(-1,'类型不能为空');//1 即时搜索 2 搜索列表
		$page=isset($_POST['page']) && $_POST['page']?$_POST['page']:1;
		$page=($page-1)*20;
		$data=array();
		if($_POST['type']==1){
			$author=Db::connect()->name('author')->field('name')->where('name like "%'.$_POST['keyWord'].'%"')->limit('0,10')->select();
			$book=Db::connect()->name('book')->field('name')->where('name like "%'.$_POST['keyWord'].'%"')->limit('0,10')->select();
			foreach ($author as $v){
				$data[]=$v['name'];
			}
			foreach ($book as $v){
				$data[]=$v['name'];
			}
			unset($author,$book);
		}else{
			$data=Db::connect()->name('book AS b')
				->field('b.id,b.name,b.img,b.type,b.remarks,b.menu,b.group,b.word_number,b.fans,b.author')
				->where('b.name like "%'.$_POST['keyWord'].'%" OR b.author in (select id from yk_author AS a where a.name like "%'.$_POST['keyWord'].'%")')
				->limit($page.',20')
				->select();
			foreach ($data as &$v){
				$v['img']=getFileUrl($v['img'],'Book');
				$menu=Db::connect()->name('menu')->field('name')->where('id in (?)')->bindParam(array($v['menu']))->select();
				$v['menu']=array();
				foreach ($menu as $mv){
					$v['menu'][]=$mv['name'];
				}
				$type=Db::connect()->name('menu')->field('name')->where('id in (?)')->bindParam(array($v['type']))->select();
				$v['type']=array();
				foreach ($type as $tv){
					$v['type'][]=$tv['name'];
				}
				unset($menu,$type);
				$group=Db::connect()->name('menu')->field('name')->where('id=?')->bindParam(array($v['group']))->select('fetch');
				$v['group']=$group['name'];
				unset($group);
				$v['fans']=$v['fans']>10000?round($v['fans']/10000,2).'W 人':$v['fans'].' 人';
				//查询作者
				if($v['author']){
					$author=Db::connect()->name('author')->field('name')->where('id='.$v['author'])->limit('0,1')->select('fetch');
					$v['author']=$author?$author['name']:'';
				}else{
					$v['author']='';
				}
			}
		}
		$data?jsonOut(1,'成功',$data):jsonOut(-1,'暂无数据');
	}
}