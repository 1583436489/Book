<?php
use System\Db;
class News extends Check{
	/**
	 * 发现地址
	 */
	public function index(){
		$equipment=isset($_POST['equipment']) && !empty($_POST['equipment'])?$_POST['equipment']:1;
		$data=Db::connect()->name('news')->field('id,name,url,js_1,js_2,user_agent')->where('(equipment=1 OR equipment='.$equipment.') AND status=1')->order('sort desc')->select();
		foreach($data as $k=>$v){
			foreach($v as $kk=>$vv){
				if($vv===null)$data[$k][$kk]='';
			}
		}
		$data?jsonOut(1,'成功',$data):jsonOut(-1,'暂无数据');
	}
}