<?php
use System\Db;
class Book extends Check{
	/**
	 * 书籍详情
	 */
	public function bookInfo(){
		if(!isset($_POST['id']) || empty($_POST['id']))jsonOut(-1,'未知书籍');
		$data=array();
		$data['info']=Db::connect()->name('book AS b')->field('b.id,b.name,b.img,b.menu,b.remarks,b.author,b.word_number,b.fans,b.is_end,b.book_info_url')->where('b.id=?')->bindParam(array($_POST['id']))->select('fetch');
		if(!$data['info'])jsonOut(-1,'书籍不存在');
		$data['info']['img']=getFileUrl($data['info']['img'],'Book');
		//查询作者
		$author=Db::connect()->name('author')->field('name')->where('id='.$data['info']['author'])->limit('0,1')->select('fetch');
		if($author){
			$data['info']['author']=$author['name'];
		}else{
			$data['info']['author']='';
		}
		unset($author);
		$menu=Db::connect()->name('menu')->field('name')->where('id in (?)')->bindParam(array($data['info']['menu']))->select();
		$data['info']['menu']=array();
		foreach ($menu as $mv){
			$data['info']['menu'][]=$mv['name'];
		}unset($menu);
		if(empty($data['info']))jsonOut(-1,'书籍不存在');
		$data['info']['newChapter']=Db::connect()->name('book_chapter')->field('id,title,name,time,num,type')->where('book_id=?')->bindParam(array($data['info']['id']))->order('id desc')->limit('0,1')->select('fetch');
		$data['like']=Db::connect()->name('book')->field('id,img,name')->where('state=1')->order('fans desc')->limit('0,4')->select();
		foreach ($data['like'] as &$v){
			$v['img']=getFileUrl($v['img'],'Book');
		}
		$data['main']=Db::connect()->name('book AS b')->field('b.id,b.name,b.menu,b.img,b.type,b.remarks,b.group,b.word_number')->where('b.state=1 and is_main=2')->order('b.id desc')->limit('0,3')->select();

		foreach ($data['main'] as &$v){
			$v['img']=getFileUrl($v['img'],'Book');
			$type=Db::connect()->name('menu')->field('name')->where('id in (?)')->bindParam(array($v['type']))->select();
			$v['type']=array();
			foreach ($type as $tv){
				$v['type'][]=$tv['name'];
			}unset($type);
			$menu=Db::connect()->name('menu')->field('name')->where('id in (?)')->bindParam(array($v['menu']))->select();
			$v['menu']=array();
			foreach ($menu as $mv){
				$v['menu'][]=$mv['name'];
			}unset($menu);
			$group=Db::connect()->name('menu')->field('name')->where('id=?')->bindParam(array($v['group']))->select('fetch');
			$v['group']=$group['name'];
			unset($group);
		}

		//print_r($data['info']);exit(0);


		/*
		 * 获取章节
		 */
		if(!$data['info']['newChapter'] || ($data['info']['is_end']=='1' && time()-$data['info']['newChapter']['time']>7200)){
			include_once PROJECT_PATH.'/Application/Cread/Controller/GetData.class.php';
			$model=new GetData();
			$chapter=$model->getChapterData($data['info']['book_info_url']);
			$time=time();
			foreach ($chapter as $chapterv){
				$chapterId=Db::connect()->name('book_chapter')->field('id,title,name,time')->where('num=? AND book_id=?')->bindParam(array($chapterv['num'],$data['info']['id']))->limit('0,1')->select('fetch');
				if(!$chapterId){
					$chapterv['time']=$time;
					$chapterv['book_id']=$data['info']['id'];
					$chapterv['name']=isset($chapterv['name'])?$chapterv['name']:'';
					$chapterv['content']='';
					$data['info']['newChapter']['id']=Db::connect()->name('book_chapter')->insert($chapterv);
					$data['info']['newChapter']['title']=$chapterv['title'];
					$data['info']['newChapter']['name']=$chapterv['name'];
					$data['info']['newChapter']['time']=$chapterv['time'];
					$data['info']['newChapter']['num']=$chapterv['num'];
					$data['info']['newChapter']['type']=$chapterv['type'];
				}unset($chapterId);
			}unset($chapter);
			Db::connect()->name('book_chapter')->where('id='.$data['info']['newChapter']['id'])->update('time='.$time);
		}

		//判断书籍是否在书架
		$data['info']['is_bookshelf']=0;
		if(isset($this->userInfo['id']) && $this->userInfo['id']){
			$is_bookshelf=Db::connect()->name('bookshelf')->field('id')->where('uid='.$this->userInfo['id'].' AND book_id='.$data['info']['id'])->select('fetch');
			if($is_bookshelf)$data['info']['is_bookshelf']=$is_bookshelf['id'];
			unset($is_bookshelf);
		}
		//第一章节id
		$data['info']['oneChapter']=Db::connect()->name('book_chapter')->field('id,num')->where('book_id=?')->bindParam(array($data['info']['id']))->order('id asc')->limit('0,1')->select('fetch');
		//阅读记录
		if(!isset($this->userInfo['id']) && empty($this->userInfo['id'])){
			$data['info']['read']=array('chapter_id'=>0,'num'=>0);
		}else{
			$book_read=Db::connect()->name('book_read AS br')->field('br.chapter_id,bc.num')->join('yk_book_chapter AS bc ON br.chapter_id=bc.id')->where('br.uid=:uid AND br.book_id=:book_id')->bindParam(array(':uid'=>$this->userInfo['id'],':book_id'=>$data['info']['id']))->order('br.id desc')->limit('0,1')->select('fetch');
			$data['info']['read']=$book_read?$book_read:array('chapter_id'=>0,'num'=>0);
		}
		//总章节量
		$chapterCount=Db::connect()->name('book_chapter')->field('count(id) AS count')->where('book_id=?')->bindParam(array($data['info']['id']))->limit('0,1')->select('fetch');
		$data['info']['chapterCount']=$chapterCount?$chapterCount['count']:0;
		jsonOut(1,'成功',$data);
	}
	/**
	 * 查看书籍章节
	 */
	public function getChapter(){
		if(!isset($_POST['id']) || empty($_POST['id']))jsonOut(-1,'未知书籍');
		$data=array();
		$type=isset($_POST['type']) && $_POST['type']?$_POST['type']:1;//类型 1章节 2标签
		$pageNum=isset($_POST['page']) && $_POST['page']?$_POST['page']:1;
		$page=($pageNum-1)*2000;
		$data['list']=array();
		if($type=='1'){
			$data['list']=Db::connect()->name('book_chapter')->field('id,title,name,type,num')->where('book_id=?')->bindParam(array($_POST['id']))->order('num asc')->limit($page.',2000')->select();
			//一共页数
			$count=Db::connect()->name('book_chapter')->field('count(id) AS count')->where('book_id=?')->bindParam(array($_POST['id']))->select('fetch');
		}else if($type=='2'){
			if(!empty($this->userInfo))$data['list']=Db::connect()->name('book_chapter AS c')->field('c.id,c.title,c.name,c.type,c.num')->where('c.book_id=? AND uid='.$this->userInfo['id'])->join('yk_bookshelf AS bs on c.id=bs.book_id')->bindParam(array($_POST['id']))->order('c.num asc')->limit($page.',2000')->select();
			//一共页数
			$count=Db::connect()->name('book_chapter AS c')->field('count(c.id) AS count')->where('c.book_id=? AND uid='.$this->userInfo['id'])->join('yk_bookshelf AS bs on c.id=bs.book_id')->bindParam(array($_POST['id']))->select('fetch');
		}
		foreach($data['list'] as $k=>$v){
			$data['list'][$k]['isVip']=$v['type'];
			if($v['type']=='1'){
				$data['list'][$k]['type']='免费';
			}else{
				$data['list'][$k]['type']='VIP';
			}
		}
		$data['countPage']=ceil($count['count']/2000);
		$data['pageData']=2000;
		$data['page']=$pageNum;
		if($type=='1'){
			if(empty($data['list']))jsonOut(-1,'暂无章节');
		}else if($type=='2'){
			if(empty($data['list']))jsonOut(-1,'暂无标签');
		}
		jsonOut(1,'成功',$data);
	}
	/**
	 * 阅读章节
	 */
	public function lookChapter(){
		if(!isset($_POST['book_id']) || empty($_POST['book_id']))jsonOut(-1,'未知书籍');
		if(!isset($_POST['num']) || empty($_POST['num']))jsonOut(-1,'未知章节');
		if(empty($this->userInfo))jsonOut(0,'请先登录');
		$data=array();
		$data=Db::connect()->name('book_chapter AS c')->field('c.id,c.book_id,c.title,c.name,c.content,c.type,c.num,b.book_info_url')->join('yk_book AS b ON c.book_id=b.id')->where('c.book_id=? AND c.num IN ('.$_POST['num'].')')->bindParam(array($_POST['book_id']))->select();
		if(empty($data))jsonOut(-1,'该章节不存在');
		include_once PROJECT_PATH.'/Application/Cread/Controller/GetData.class.php';
		$model=new GetData();
		foreach($data as $k=>$v){
			$data[$k]['currChapter']['id']=$v['id'];
			$data[$k]['currChapter']['num']=$v['num'];
			/*
			 * 获取内容
			 */
			if(!$v['content']){
				$isVIP=$v['type']=='2'?true:false;
				$content=$model->getBookContent($v['book_info_url'],$v['num'],$isVIP);
				//if(!is_dir(PROJECT_PATH.'/Public/Book/'.$v['book_id']))mkdir(PROJECT_PATH.'/Public/Book/'.$v['book_id'],0777);
				//$txt=file_put_contents(PROJECT_PATH.'/Public/Book/'.$v['book_id'].'/'.$v['id'].'.txt', $content['content']);
				$txt=$this->upFileOss($content['content'],'Book_'.$v['book_id'].'/Chapter_'.$v['id'].'.txt');
				if($txt)Db::connect()->name('book_chapter')->where('id='.$v['id'])->update('content="Book_'.$v['book_id'].'/Chapter_'.$v['id'].'.txt"');
				$data[$k]['content']='';
				//判断是否为VIP
				if($v['type']!='2' || $this->userInfo['end_vip']>time())$data[$k]['content']=$content['content'];
			}else{
				$data[$k]['content']='';
				//判断是否为VIP
				//if($v['type']!='2' || $this->userInfo['end_vip']>time())$data[$k]['content']=file_get_contents(PROJECT_PATH.'/Public/Book/'.$v['book_id'].'/'.$v['id'].'.txt');
				if($v['type']!='2' || $this->userInfo['end_vip']>time())$data[$k]['content']=$this->getOssFileContent($v['content']);
			}
			//更新阅读章节
			if(!empty($this->userInfo)){
				// 			$read=Db::connect()->name('book_read')->field('id')->where('uid=:uid and chapter_id=:chapter_id')->bindParam(array(':uid'=>$this->userInfo['id'],':chapter_id'=>$_POST['id']))->select('fetch');
				$read=Db::connect()->name('book_read')->field('id')->where('uid=:uid AND book_id=:book_id')->bindParam(array(':uid'=>$this->userInfo['id'],':book_id'=>$v['book_id']))->select('fetch');
				if($read){
					// 				Db::connect()->name('book_read')->where('id=?')->bindParam(array(time(),$read['id']))->update('time=?');
					Db::connect()->name('book_read')->where('id=:id')->bindParam(array(':id'=>$read['id'],':time'=>time(),':chapter_id'=>$v['id']))->update('time=:time,chapter_id=:chapter_id');
				}else{
					Db::connect()->name('book_read')->insert(array('uid'=>$this->userInfo['id'],'chapter_id'=>$v['id'],'time'=>time(),'book_id'=>$v['book_id']));
					Db::connect()->name('book')->where('id=:id')->bindParam(array(':id'=>$v['book_id']))->update('fans=fans+1');
				}
			}
			//下一章节id
			$nextChapter=Db::connect()->name('book_chapter')->field('id,num')->where('book_id='.$v['book_id'].' AND id>'.$v['id'])->limit('0,1')->select('fetch');
			$data[$k]['nextChapter']=$nextChapter?$nextChapter:array();
			//上一章节id
			$upChapter=Db::connect()->name('book_chapter')->field('id,num')->where('book_id='.$v['book_id'].' AND id<'.$v['id'])->order('id desc')->limit('0,1')->select('fetch');
			$data[$k]['upChapter']=$upChapter?$upChapter:array();
			if($v['type']=='2' && $this->userInfo['end_vip']<time())unset($data[$k]);
		}
		jsonOut(1,'成功',array_values($data));
	}
	/**
	 * 放入/删除书架/标签
	 */
	public function addBookshelf(){
		if(!isset($_POST['id']) || empty($_POST['id']))jsonOut(-1,'未知书籍');
		if(empty($this->userInfo))jsonOut(0,'请先登录');
		$type=isset($_POST['type']) && $_POST['type']?$_POST['type']:1;//类型 1书籍 2标签
		$ids=explode(',',$_POST['id']);
		foreach($ids as $v){
			$bookshelf=Db::connect()->name('bookshelf')->field('id')->where('uid=? and book_id=? and type=?')->bindParam(array($this->userInfo['id'],$v,$type))->select('fetch');
			if(!$bookshelf){
				$add=Db::connect()->name('bookshelf')->insert(array('uid'=>$this->userInfo['id'],'book_id'=>$v,'time'=>time(),'type'=>$type));
				//$add?jsonOut(1,'加入成功'):jsonOut(-1,'加入失败');
			}else{
				$del=Db::connect()->name('bookshelf')->where('uid=:uid AND book_id=:book_id AND type=:type')->bindParam(array(':uid'=>$this->userInfo['id'],':book_id'=>$v,':type'=>$type))->delete();
				//$del?jsonOut(1,'删除成功'):jsonOut(-1,'删除失败');
			}
		}
 		jsonOut(1,'操作成功');
	}
	/**
	 * 书架列表
	 */
	public function bookshelfList(){
		if(empty($this->userInfo))jsonOut(0,'请先登录');
		$page=isset($_POST['page']) && $_POST['page']?$_POST['page']:1;
		$page=($page-1)*20;
		$data=array();
		$data=Db::connect()->name('book AS b')->field('b.id,b.img,b.is_end')->join('yk_bookshelf AS bs on b.id=bs.book_id')->where('b.state=1 and bs.type=1 AND bs.uid='.$this->userInfo['id'])->order('b.id desc')->limit($page.',20')->select();
		$i=0;$list=array();
		foreach ($data as $k=>&$v){		
			$v['img']=getFileUrl($v['img'],'Book');		
			$list[$i][]=$v;
			if(count($list[$i])==3)$i++;
		}unset($data,$i);
		$list?jsonOut(1,'成功',$list):jsonOut(1,'没有更多数据了');
	}
	/**
	 * 打赏
	 */
	public function reward(){
		if(empty($this->userInfo))jsonOut(-1,'请先登录');
		$_POST['getUid']?$data['get_uid']=$_POST['getUid']:jsonOut(-1,'未知用户');
		$_POST['gold']?$data['gold']=$_POST['gold']:jsonOut(-1,'金额必须大于0');
		/*
		 * 用户添加金币
		 */
		Db::connect()->setAffair(1);
		$addM=Db::connect()->name('member')->where('id=:id')->bindParam(array(':id'=>$data['get_uid'],':gold'=>$data['gold']))->update('gold=gold+:gold');
		/*
		 * 添加记录
		 */
		$data['uid']=$this->userInfo['id'];
		$data['time']=time();
		$data['type']=5;
		$addI=Db::connect()->name('gold_source')->insert($data);
		if($addM && $addI){
			Db::connect()->setAffair(2);
			jsonOut(1,'打赏成功');
		}else{
			Db::connect()->setAffair(3);
			jsonOut(-1,'打赏失败');
		}
	}
	/**
	 * 添加章节假数据
	 */
	public function addTestData(){
		$time=time();
		for ($i=1;$i<=2945;$i++){
			Db::connect()->name('book_chapter')->insert(array('book_id'=>'955','title'=>'第'.$i.'章','name'=>'测试测试测试测试测试测试测试'.$i,'time'=>$time,'type'=>'1','num'=>$i));
		}
		exit('OK');
	}
	/**
	 * 添加章节假数据
	 */
	public function upBookError(){
		if(!$this->userInfo)jsonOut(0,'请先登录');
		$data['book_id']=!isset($_POST['book_id']) || empty($_POST['book_id'])?jsonOut(-1,'未知书籍'):$_POST['book_id'];
		$data['book_name']=!isset($_POST['book_name']) || empty($_POST['book_name'])?jsonOut(-1,'未知书籍名称'):$_POST['book_name'];
		$data['book_chapter_num']=!isset($_POST['book_chapter_num']) || empty($_POST['book_chapter_num'])?jsonOut(-1,'未知章节'):$_POST['book_chapter_num'];
		$data['book_chapter_title']=!isset($_POST['book_chapter_title']) || empty($_POST['book_chapter_title'])?jsonOut(-1,'未知章节名称'):$_POST['book_chapter_title'];
		$data['error_type']=!isset($_POST['error_type']) || empty($_POST['error_type'])?jsonOut(-1,'未知错误类型'):$_POST['error_type'];
		$data['content']=!isset($_POST['content']) || empty($_POST['content'])?'':$_POST['content'];
		$data['time']=time();
		$data['uid']=$this->userInfo['id'];
		$add=Db::connect()->name('book_error')->insert($data);
		$add?jsonOut(1,'上报成功'):jsonOut(-1,'上报失败');
	}
}