<?php
namespace Manage\Controller;

use Think\Controller;

class BookController extends CheckController
{
    /**
     * 书籍列表
     */
	public function bookList(){
		if($_POST){
			if(!is_file(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/bookList.txt')){
				fopen(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/bookList.txt','a+');
			}
			$_POST=array_filter($_POST);
			file_put_contents(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/bookList.txt', serialize($_POST));
		}
		
		$where='1=1';
		$whereFile=unserialize(file_get_contents(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/bookList.txt'));
		/*
		 *
		 */
		if(isset($whereFile['name']) && $whereFile['name'])$where.=' AND b.name like "%'.$whereFile['name'].'%"';
		if(isset($whereFile['is_end']) && $whereFile['is_end'])$where.=' AND b.is_end='.$whereFile['is_end'];
		if(isset($whereFile['state']) && $whereFile['state'])$where.=' AND b.state >= '.$whereFile['state'];
		if(isset($whereFile['is_hot']) && $whereFile['is_hot'])$where.=' AND b.is_hot = '.$whereFile['is_hot'];
		if(isset($whereFile['is_main']) && $whereFile['is_main'])$where.=' AND b.is_main = '.$whereFile['is_main'];
		if(isset($whereFile['group']) && $whereFile['group'])$where.=' AND b.group = '.$whereFile['group'];
		if(isset($whereFile['type']) && !empty($whereFile['type'])){
			$where.=' AND (';
			foreach($whereFile['type'] as $v){
				$where.='Find_IN_SET('.$v.',b.type) OR ';
			}
			$where=rtrim($where,' OR ');
			$where.=')';
		}
		if(isset($whereFile['menu']) && !empty($whereFile['menu'])){
			$where.=' AND (';
			foreach($whereFile['menu'] as $v){
				$where.='Find_IN_SET('.$v.',b.menu) OR ';
			}
			$where=rtrim($where,' OR ');
			$where.=')';
		}
		if(isset($whereFile['netWork']) && !empty($whereFile['netWork'])){
			$where.=' AND b.id IN (select book_id from yk_network where menu IN ('.implode(',',$whereFile['netWork']).'))';
		}
		/*
		 *
		 */
		$db = M("book as b");
		$count = $db->where($where)->count();
		$page  = new \Think\Page($count,50);
		$data = $db->field('b.id,b.name,b.img,b.is_end,b.time,b.state,b.is_hot,b.is_main,b.fans,(select name from yk_menu AS m where b.type=m.id) AS type,(select name from yk_menu AS m where b.menu=m.id) AS menu,(select name from yk_menu AS m where b.group=m.id) AS gp')->where($where)->limit($page->firstRow,$page->listRows)->order("id desc")->select();
		foreach ($data as $k=>$v){
			$data[$k]['img']=getFileUrl($v['img'],'Book');
			$data[$k]['time']=date('Y-m-d H:i:s',$v['time']);
		}
		//类型
		$search['type']=M('menu')->field('id,name')->where(array('type'=>2))->select();
		//分类
		$search['menu']=M('menu')->field('id,name')->where(array('type'=>1,'pid'=>array('neq',0)))->select();
		//分组
		$search['group']=M('menu')->field('id,name')->where(array('type'=>3))->select();
		//平台
		$search['platform']=M('menu')->field('id,name')->where(array('type'=>4))->select();
		$this->assign("search",$search);
		$this->assign("where",$whereFile);
		$this->assign("data",$data);
		$this->assign("pages",$page->show());
		$this->display();
	}
	public function editBook(){
		if($_POST){
			$_POST['type']=implode(',', $_POST['type']);
			$_POST['menu']=implode(',', $_POST['menu']);
			if(I('post.id')){
				$time=time();
				foreach($_POST['netWork'] as $v){
					$isIn=M('network')->field('id')->where(array('book_id'=>I('post.id'),'menu'=>$v))->limit('0,1')->find();
					if($isIn['id'])continue;
					M('network')->add(array('book_id'=>I('post.id'),'menu'=>$v,'time'=>$time));
				}
				unset($_POST['netWork']);
				$up=M('book')->where(array('id'=>I('post.id')))->save($_POST);
			}else{
				unset($_POST['id']);
				$_POST['time']=time();
				$network=$_POST['netWork'];
				unset($_POST['netWork']);
				$up=M('book')->add($_POST);
				foreach($network as $v){
					M('network')->add(array('book_id'=>$up,'menu'=>$v,'time'=>$_POST['time']));
				}
			}
			ajax_info(1, '编辑成功');
		}
		$data=M('book as b')->field('b.id,b.name,b.img,b.is_end,b.state,b.is_hot,b.is_main,b.type,b.menu,b.group')->where(array('id'=>I('get.num')))->find();
		$data['allImg']=getFileUrl($data['img'],'Book');
		$data['all']=M('menu')->field('id,name')->where(array('type'=>4))->select();
		foreach($data['all'] as $k=>$v){
			$in=M('network')->field('id')->where(array('book_id'=>$data['id'],'menu'=>$v['id']))->limit('0,1')->find();
			$data['all'][$k]['isIn']=$in['id']?$in['id']:0;
		}
		$this->assign('data',$data);
		$this->display();
	}
	/**
	 * 章节列表
	 */
	public function chapterList(){
		$db=M('book_chapter');
		$count = $db->where(array('book_id'=>I('get.num')))->count();
		$page  = new \Think\Page($count,365);
		$data=$db->field('id,title,name,time,type')->where(array('book_id'=>I('get.num')))->limit($page->firstRow,$page->listRows)->order("id asc")->select();
		foreach($data as &$v){
			$v['time']=date('Y-m-d H:i:s',$v['time']);
			if($v['type']==1){
				$v['type']='免费';
			}else{
				$v['type']='VIP';
			}
		}
		$book_id=I('get.num');
		$this->assign("data",$data);
		$this->assign("book_id",$book_id);
		$this->assign("pages",$page->show());
		$this->display();
	}
	/**
	 * 编辑章节
	 */
	public function editChapter(){
		if($_POST){
			if(I('post.id')){
				unset($_POST['book_id']);
				$up=M('book_chapter')->where(array('id'=>I('post.id')))->save($_POST);
			}else{
				$up=M('book_chapter')->add($_POST);
			}
			$up?ajax_info(1, '编辑成功'):ajax_info(-1, '编辑失败');
		}
		$data=M('book_chapter')->field('id,title,name,content,type')->where(array('id'=>I('get.num')))->find();
		$book_id=I('get.bookId');
		$this->assign("data",$data);
		$this->assign("book_id",$book_id);
		$this->display();
	}
	/**
	 * 删除
	 */
	public function delete(){
		$isBook=I('post.isBook')?I('post.isBook'):0;//是否书籍
		$id=I('post.id')?I('post.id'):ajax_info(-1, '未知书籍');
		if($isBook==1){
			$b=M('book')->where(array('id'=>$id))->delete();
			$chapter=M('book_chapter')->field('id')->where(array('book_id'=>$id))->select();
			foreach($chapter as $k=>$v){
				$chapter[$k]=$v['id'];
			}
			$r=M('book_read')->where(array('chapter_id'=>array('in',$chapter)))->delete();
			$s=M('bookshelf')->where(array('book_id'=>$id,'type'=>'1'))->delete();
			$s1=M('bookshelf')->where(array('book_id'=>array('in',$chapter),'type'=>'2'))->delete();
			$c=M('book_chapter')->where(array('book_id'=>$id))->delete();
		}else{
			$b=$s=true;
			$r=M('book_read')->where(array('chapter_id'=>$id))->delete();
			$s1=M('bookshelf')->where(array('book_id'=>$id,'type'=>'2'))->delete();
			$c=M('book_chapter')->where(array('id'=>$id))->delete();
		}
		ajax_info(1, '删除成功');
	}
	/**
	 * 获取菜单
	 */
	public function getMenu(){
		$where='1=1';
		if($_POST){
			//类型
			if(isset($_POST['type']) && $_POST['type']){
				$where='type='.I('post.type');
			}
			if($_POST['type']==1){
				$where.=' and pid != 0';
			}
		}
		$data=array();
		$data=M('menu')->field('id,name')->where($where)->order('score desc')->select();
		if(empty($data))ajax_info(-1,'暂无该菜单');
		ajax_info(1,'成功',$data);
	}
	/**
	 * 删除全网
	 */
	public function delNetWork(){
		if((!isset($_POST['id']) || empty($_POST['id'])) || (!isset($_POST['book_id']) || empty($_POST['book_id'])))exit(false);
		M('network')->where(array('book_id'=>$_POST['book_id'],'menu'=>$_POST['id']))->delete();
	}
	/**
	 * 书籍错误信息上报列表
	 */
	 public function bookErrorList(){
		 if($_POST){
			if(!is_file(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/bookErrorList.txt')){
				fopen(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/bookErrorList.txt','a+');
			}
			$_POST=array_filter($_POST);
			file_put_contents(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/bookErrorList.txt', serialize($_POST));
		}
		
		$where='1=1';
		$whereFile=unserialize(file_get_contents(dirname($_SERVER['SCRIPT_FILENAME']).'/MPublic/where/bookErrorList.txt'));
		/*
		 *
		 */
		if(isset($whereFile['book_id']) && $whereFile['book_id'])$where.=' AND book_id ='.$whereFile['book_id'];
		if(isset($whereFile['strtime']) && $whereFile['strtime'])$where.=' AND time >= '.strtotime($whereFile['strtime']);
		if(isset($whereFile['endtime']) && $whereFile['endtime'])$where.=' AND time <= '.strtotime($whereFile['endtime']);
		/*
		 *
		 */
		 $db = M("book_error");
		$count = $db->where($where)->count();
		$page  = new \Think\Page($count,50);
		 $data=$db->field('id,book_id,book_name,book_chapter_num,book_chapter_title,time,error_type,content,uid')->where($where)->order('id desc')->limit($page->firstRow,$page->listRows)->select();
		 foreach($data as &$v){
			 $v['time']=date('Y-m-d H:i:s',$v['time']);
			 switch($v['error_type']){
				 case 1:
					$v['error_type']='章节标题与内容不符';
					break;
				case 2:
					$v['error_type']='内容缺失';
					break;
				case 3:
					$v['error_type']='章节重复';
					break;
				case 4:
					$v['error_type']='章节顺序错乱';
					break;
				case 5:
					$v['error_type']='存在大量乱码';
					break;
				case 6:
					$v['error_type']='包含色情内容';
					break;
			 }
		 }
		 $this->assign('where',$whereFile);
		 $this->assign('data',$data);
		 $this->display();
	 }
}