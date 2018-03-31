<?php
use System\Db;
class Ranking extends Check{
	/**
	 * 排行推荐榜单
	 */
	public function recommend(){
		$data=array();
		$data['book']=Db::connect()->name('book')->field('id,name,img')->where('is_hot=2')->order('id desc')->limit('0,3')->select();
		foreach ($data['book'] as &$v){
			$v['img']=getFileUrl($v['img'],'Book');
		}
		//排行分类
		$data['menu']=array(
				array('name'=>'男生追书榜','img'=>getFileUrl('rankb1.png','Menu'),'msg'=>'大神名作活了连载,此时不追更待何时'),
				array('name'=>'女生人气榜','img'=>getFileUrl('rankb2.png','Menu'),'msg'=>'最受女性用户追捧的人气好书'),
				array('name'=>'男生完结榜','img'=>getFileUrl('rankb3.png','Menu'),'msg'=>'完结佳作,房型入坑'),
				array('name'=>'女生完结榜','img'=>getFileUrl('rankb4.png','Menu'),'msg'=>'百本完结女生精品,再也不用追跟啦'),
				array('name'=>'出版好评榜','img'=>getFileUrl('rankb5.png','Menu'),'msg'=>'权威出版著作,再多的文字也说不清楚'),
		);
		jsonOut(1,'成功',$data);
	}
	/**
	 * 各榜单
	 */
	public function rankingList(){
		$data=array();
		$position=isset($_POST['position']) && !empty($_POST['position'])?$_POST['position']:1;
		$page=isset($_POST['page']) && $_POST['page']?$_POST['page']:1;
		$page=($page-1)*20;
		if($position==1){
			$data=Db::connect()->name('book AS b')->field('b.id,b.name,b.remarks,b.img,b.menu,b.type,(SELECT COUNT(distinct br.uid) from yk_book_read AS br INNER JOIN yk_book_chapter AS bc ON br.chapter_id=bc.id INNER JOIN yk_member AS m ON br.uid=m.id WHERE bc.book_id=b.id AND m.sex=1 GROUP BY bc.book_id) AS num')->where('b.state=1')->order('num desc')->limit($page.',20')->select();
		}else if($position==2){
			$data=Db::connect()->name('book AS b')->field('b.id,b.name,b.remarks,b.img,b.menu,b.type,(SELECT COUNT(distinct br.uid) from yk_book_read AS br INNER JOIN yk_book_chapter AS bc ON br.chapter_id=bc.id INNER JOIN yk_member AS m ON br.uid=m.id WHERE bc.book_id=b.id AND m.sex=2 GROUP BY bc.book_id) AS num')->where('b.state=1')->order('num desc')->limit($page.',20')->select();
		}elseif ($position==3){
			$data=Db::connect()->name('book AS b')->field('b.id,b.name,b.remarks,b.img,b.menu,b.type,(SELECT COUNT(distinct br.uid) from yk_book_read AS br INNER JOIN yk_book_chapter AS bc ON br.chapter_id=bc.id INNER JOIN yk_member AS m ON br.uid=m.id WHERE bc.book_id=b.id AND m.sex=1 GROUP BY bc.book_id) AS num')->where('b.state=1 AND b.is_end=2')->order('num desc')->limit($page.',20')->select();
		}elseif ($position==4){
			$data=Db::connect()->name('book AS b')->field('b.id,b.name,b.remarks,b.img,b.menu,b.type,(SELECT COUNT(distinct br.uid) from yk_book_read AS br INNER JOIN yk_book_chapter AS bc ON br.chapter_id=bc.id INNER JOIN yk_member AS m ON br.uid=m.id WHERE bc.book_id=b.id AND m.sex=2 GROUP BY bc.book_id) AS num')->where('b.state=1 AND b.is_end=2')->order('num desc')->limit($page.',20')->select();
		}else{
			$menu=Db::connect()->name('menu')->field('id')->where('pid=?')->bindParam(array('17'))->select();
			$mid=' AND b.menu IN (';
			foreach ($menu as $v){
				$mid.=$v['id'].',';
			}
			$mid=rtrim($mid,',');
			$mid.=')';
			$data=Db::connect()->name('book AS b')->field('b.id,b.name,b.remarks,b.img,b.menu,b.type')->where('b.state=1'.$mid)->order('b.fans desc')->limit($page.',20')->select();
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
				$v['type'][]='未使用';
			}
			unset($menu,$type);
		}
		$data?jsonOut(1,'成功',$data):jsonOut(-1,'没有更多数据');
	}
}