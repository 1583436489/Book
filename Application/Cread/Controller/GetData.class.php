<?php
set_time_limit(0);
header("Content-Type: text/html; charset=UTF-8");
include_once PROJECT_PATH.'/vendor/autoload.php';
use QL\QueryList;
use System\Db;
class GetData {
	static private $domain='http://m.cread.com/';
	function index(){
		/* $rules = array(
				'name' => array('#uiUL a .ui_bookv_intro h3','text'),
				'resource_url' => array('#uiUL a','href'),
				'img' => array('#uiUL a div img','src'),
				'author' => array('#uiUL a .ui_bookv_intro .authorname','html'),
		);
		
		$data=$this->getData('http://m.cread.com/bookstore/0/0/0',$rules); */
		$url=array(
				/*
				 * 书城-精选
				 */
				//书城-精选：热门推荐
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=0&cid=0&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>2),
						'msg'=>'书城-精选：热门推荐',
				),
				//书城-精选：本周主打
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=0&cid=0&type=3',
						'data'=>array('is_main'=>2,'is_hot'=>1),
						'msg'=>'书城-精选：本周主打',
				),
				//书城-精选：完本畅读
				array(
						'url'=>'http://m.cread.com/json/zhuanti_json.aspx?zid=23',
						'data'=>array('is_main'=>1,'is_hot'=>1,'group'=>35),
						'msg'=>'书城-精选：完本畅读',
				),
				//书城-精选：名家经典
				array(
						'url'=>'http://m.cread.com/json/zhuanti_json.aspx?zid=24',
						'data'=>array('is_main'=>1,'is_hot'=>1,'group'=>36),
						'msg'=>'书城-精选：名家经典',
				),
				//书城-精选：新书入库
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=0&cid=0&type=2',
						'data'=>array('is_main'=>1,'is_hot'=>1,'group'=>37),
						'msg'=>'书城-精选：新书入库',
				),
				//书城-精选：发现好书
				array(
						'url'=>'http://m.cread.com/json/zhuanti_json.aspx?zid=25',
						'data'=>array('is_main'=>1,'is_hot'=>1,'group'=>38),
						'msg'=>'书城-精选：发现好书',
				),
				/*
				 * 书城-男生：
				 */
				//热门推荐
				array(
					 'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=1&cid=0&type=0',
					 'data'=>array('is_main'=>1,'is_hot'=>2),
					 'msg'=>'书城-男生：热门推荐',
				 ),
				//本周主打
				array(
					 'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=1&cid=0&type=3',
					 'data'=>array('is_main'=>2,'is_hot'=>1),
					 'msg'=>'书城-男生：本周主打',
				 ),
				//东方玄幻
				array(
					 'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=1&cid=1100&type=0',
					 'data'=>array('is_main'=>1,'is_hot'=>1),
					 'msg'=>'书城-男生：东方玄幻',
				 ),
				//都市小说
				array(
					 'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=1&cid=1200&type=0',
					 'data'=>array('is_main'=>1,'is_hot'=>1),
					 'msg'=>'书城-男生：都市小说',
				),
				//西方奇幻
				array(
					 'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=1&cid=1300&type=0',
					 'data'=>array('is_main'=>1,'is_hot'=>1),
					 'msg'=>'书城-男生：西方奇幻',
				),
				//武侠仙侠
				array(
					 'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=1&cid=1400&type=0',
					 'data'=>array('is_main'=>1,'is_hot'=>1),
					 'msg'=>'书城-男生：武侠仙侠',
				 ),
				//架空历史
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=1&cid=1500&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-男生：架空历史',
				),
				//科幻未来
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=1&cid=1600&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-男生：科幻未来',
				),
				//网游竞技
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=1&cid=1700&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-男生：网游竞技',
				),
				//悬疑惊悚
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=1&cid=1800&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-男生：悬疑惊悚',
				),
				/*
				 * 书城-女生：
				 */
				//热门推荐
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=2&cid=0&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>2),
						'msg'=>'书城-女生：热门推荐',
				),
				//本周主打
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=2&cid=0&type=3',
						'data'=>array('is_main'=>2,'is_hot'=>1),
						'msg'=>'书城-女生：本周主打',
				),
				//古代言情
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=2&cid=2100&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-女生：古代言情',
				),
				//幻想言情
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=2&cid=2200&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-女生：幻想言情',
				),
				//都市言情
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=2&cid=2300&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-女生：都市言情',
				),
				//总裁豪门
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=2&cid=2400&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-女生：总裁豪门',
				),
				//青青校园
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=2&cid=2500&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-女生：青青校园',
				),
				//唯美同人
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=2&cid=2600&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-女生：唯美同人',
				),
				/*
				 * 书城-出版：
				 */
				//热门推荐
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=3&cid=0&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>2),
						'msg'=>'书城-出版：热门推荐',
				),
				//本周主打
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=3&cid=0&type=3',
						'data'=>array('is_main'=>2,'is_hot'=>1),
						'msg'=>'书城-出版：本周主打',
				),
				//文学小说
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=3&cid=3100&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-出版：文学小说',
				),
				//经典名著
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=3&cid=3200&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-出版：经典名著',
				),
				//经管励志
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=3&cid=3300&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-出版：经管励志',
				),
				//生活休闲
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=3&cid=3400&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-出版：生活休闲',
				),
				//婚姻家庭
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=3&cid=3500&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-出版：婚姻家庭',
				),
				//科普教育
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=3&cid=3600&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-出版：科普教育',
				),
				//经实传记
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=3&cid=3700&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-出版：经实传记',
				),
				//亲子育儿
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=3&cid=3800&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-出版：亲子育儿',
				),
				//工具/百科
				array(
						'url'=>'http://m.cread.com/json/bookstore_json.aspx?pid=3&cid=3900&type=0',
						'data'=>array('is_main'=>1,'is_hot'=>1),
						'msg'=>'书城-出版：工具/百科',
				),
		);
		if(isset($_POST['num']) && $_POST['num']!==null && $_POST['num']!==false){
			$num=explode(',', $_POST['num']);
			if(in_array(-1, $num))$this->getRolling();//轮播
			if(in_array(-2, $num))$this->homeData();//首页数据
			if($num){
				$urls=array();
				foreach($num as $nv){
					if($nv!=-1 && $nv!=-2)$urls[]=$url[$nv];
				}unset($url);
				if($urls)$this->dataUrl($urls);
			}
		}else{
			$this->dataUrl($url);
		}
	}
	/**
	 * 获取数据
	 * @param 地址 $url
	 */
	public function dataUrl($url=array()){
		//页数
		foreach ($url as $val){
			$data=$this->jsonGet($val['url']);
			foreach($data['bookcoll'] as $v){
				//判断数据库是否已经存在
				$book=Db::connect()->name('book')->field('id')->where('name="'.$v['bookname'].'"')->select('fetch');
				if(!$book){
					$arr=$val['data'];
					/*
					 * 查询作者
					 */
					$author=Db::connect()->name('author')->field('id')->where('name="'.$v['authorname'].'"')->limit('0,1')->select('fetch');
					if($author){
						$arr['author']=$author['id'];
					}else{
						$arr['author']=Db::connect()->name('author')->insert(array('name'=>$v['authorname']));
					}
					$arr['name']=$v['bookname'];
					$arr['img']=$v['bookcover'];
					$arr['is_end']=$v['isend']+1;
					//分类
					$menu=Db::connect()->name('menu')->field('id')->where('name="'.$v["categoryname"].'" AND type=1')->select('fetch');
					if($menu)$arr['menu']=$menu['id'];
					//类型
					$type=Db::connect()->name('menu')->field('id')->where('name="'.$v["categoryminname"].'" AND type=2')->select('fetch');
					if($type)$arr['type']=$type['id'];
					$arr['time']=time();
					$arr['book_info_url']=$v['bookid'];
					$info=$this->getInfoData($arr['book_info_url']);
					$info[0]['word_number']=$info[0]['word_number']?explode('：', $info[0]['word_number']):'0字';
					$arr['word_number']=is_array($info[0]['word_number'])?$info[0]['word_number'][1]:$info[0]['word_number'];
					$info[0]['fans']?preg_match('|\d+|',explode('：', $info[0]['fans'])[1],$info[0]['fans']):$info[0]['fans']='0';
					$arr['fans']=is_array($info[0]['fans'])?$info[0]['fans'][0]:$info[0]['fans'];
					$arr['remarks']=$info[0]['remarks']?$info[0]['remarks']:'';
					unset($info);
					Db::connect()->name('book')->insert($arr);
					unset($arr);
				}
			}
			if($data['bookcoll']){
				Db::connect()->name('collection')->insert(array('address'=>'中文书城','url'=>$val['url'],'status'=>'1','msg'=>$val['msg'],'time'=>time()));
			}else{
				Db::connect()->name('collection')->insert(array('address'=>'中文书城','url'=>$val['url'],'status'=>'2','msg'=>$val['msg'],'time'=>time()));
			}
			unset($data);
		}
	}
	/**
	 * 获取轮播图
	 */
	public function getRolling(){
		$data=json_decode(curlData(self::$domain.'json/res/pageproject_json.aspx?id=10'),true);
		if($data['itemcoll']){
			//删除之前轮播数据
			Db::connect()->name('rolling')->where('source=2')->delete();
		}
		foreach($data['itemcoll'] as $v){
			if(strpos($v['url'],'http')!==false || strpos($v['url'],'https')!==false)continue;
			//判断数据库是否已经存在
			$book_info_url=explode('/',$v['url'])[2];
			$book=Db::connect()->name('book')->field('id')->where('book_info_url="'.$book_info_url.'"')->select('fetch');
			if(!$book){
				$arr['name']=$v['title'];
				$arr['book_info_url']=$book_info_url;
				$info=$this->getInfoData($arr['book_info_url']);
				$info[0]['word_number']=$info[0]['word_number']?explode('：', $info[0]['word_number']):'0字';
				$arr['word_number']=is_array($info[0]['word_number'])?$info[0]['word_number'][1]:$info[0]['word_number'];
				$info[0]['fans']?preg_match('|\d+|',explode('：', $info[0]['fans'])[1],$info[0]['fans']):$info[0]['fans']='0';
				$arr['fans']=is_array($info[0]['fans'])?$info[0]['fans'][0]:$info[0]['fans'];
				$arr['remarks']=$info[0]['remarks']?$info[0]['remarks']:'';
				$arr['img']=$info[0]['img'];
				//分类
				$menu=Db::connect()->name('menu')->field('id')->where('name="'.$info[0]['menu'].'" AND type=1')->select('fetch');
				if($menu)$arr['menu']=$menu['id'];
				$arr['time']=time();
				//作者
				$author=Db::connect()->name('author')->field('id')->where('name="'.$info[0]['author'].'"')->limit('0,1')->select('fetch');
				if($author){
					$arr['author']=$author['id'];
				}else{
					$arr['author']=Db::connect()->name('author')->insert(array('name'=>$info[0]['author']));
				}
				unset($info);
				//插入书籍
				$rarr['url']=Db::connect()->name('book')->insert($arr);
				unset($arr);
			}else{
				$rarr['url']=$book['id'];
			}
			$rarr['img']=$v['picurl'];
			$rarr['type']=1;
			$rarr['time']=time();
			$rarr['source']=2;
			$rarr['position']=0;
			//插入轮播
			Db::connect()->name('rolling')->insert($rarr);
			unset($rarr);
		}
		if($data['itemcoll']){
			Db::connect()->name('collection')->insert(array('address'=>'中文书城','url'=>self::$domain.'json/res/pageproject_json.aspx?id=10','status'=>'1','msg'=>'轮播','time'=>time()));
		}else{
			Db::connect()->name('collection')->insert(array('address'=>'中文书城','url'=>self::$domain.'json/res/pageproject_json.aspx?id=10','status'=>'2','msg'=>'轮播','time'=>time()));
		}
	}
	/*
	 * 正则获取数据
	 * name book_info_url img
	 */
	function getData($url='',$rules='',$key=0,$strat=0){
		if(!$url || !$rules)return false;
		/*
		 * 读取页面数据
		 */
		$html=curlData($url);
		$dataAll = QueryList::Query($html,$rules)->data;
		if($key != 0){
			for ($i=$strat;$i<$key+$strat;$i++){
				$data[]=$dataAll[$i];
			}
		}else {
			$data=$dataAll;
		}unset($dataAll);
		$list=array();
		foreach($data as $v){
			//判断数据库是否已经存在
			$book=Db::connect()->name('book')->field('id')->where('name="'.$v['name'].'"')->select('fetch');
			if(!$book){
				$v['book_info_url']=explode('/', explode('.', $v['book_info_url'])[0])[2];
				$getinfo=$this->getInfoData($v['book_info_url']);
				$getinfo[0]['word_number']=$getinfo[0]['word_number']?explode('：', $getinfo[0]['word_number']):'0字';
				$v['word_number']=is_array($getinfo[0]['word_number'])?$getinfo[0]['word_number'][1]:$getinfo[0]['word_number'];
				$getinfo[0]['fans']?preg_match('|\d+|',explode('：', $getinfo[0]['fans'])[1],$getinfo[0]['fans']):$getinfo[0]['fans']='0';
				$v['fans']=is_array($getinfo[0]['fans'])?$getinfo[0]['fans'][0]:$getinfo[0]['fans'];
// 				$v['is_end']=$getinfo[0]['is_end']!='状态：完本'?'1':'2';
				//分类
				$menu=Db::connect()->name('menu')->field('id')->where('name="'.$getinfo[0]['menu'].'" AND type=1')->select('fetch');
				if($menu)$v['menu']=$menu['id'];
				//作者
				$author=Db::connect()->name('author')->field('id')->where('name="'.$getinfo[0]['author'].'"')->limit('0,1')->select('fetch');
				if($author){
					$v['author']=$author['id'];
				}else{
					$v['author']=Db::connect()->name('author')->insert(array('name'=>$getinfo[0]['author']));
				}
				$v['remarks']=$getinfo[0]['remarks'];
				$v['time']=time();
				if(!$v['author'])$v['author']=$getinfo[0]['author'];
				unset($getinfo);
				$list[]=$v;
			}else{
				$list[]['inId']=$book['id'];
			}
			unset($book);
		}unset($rules,$data,$html);
		return $list;
	}
	/**
	 * 获取详情数据
	 * @param string $url
	 */
	function getInfoData($url=''){
		$html=curlData(self::$domain.'/book/'.$url.'.html');
		$rules = array(
				'word_number' => array('.ui_bookinfo_detail p:eq(2)','html'),
				'is_end' => array('.ui_bookinfo_detail p:eq(3)','html'),
				'fans' => array('.ui_bookinfo_detail p:eq(4)','html'),
				'menu' => array('.cur','html'),
				'remarks' => array('#uiMoreIntro','html'),
				'author' => array('.ui_bookinfo_detail p:eq(1) a','html'),
				'img' => array('.ui_bookinfo_cover img','src'),
				'menu' => array('.cur','text'),
		);
		$data=QueryList::Query($html, $rules)->data;
		if(!$data)$data=array(array('word_number'=>'','is_end'=>'','fans'=>'','menu'=>0,'remarks'=>'','author'=>''));
		return $data;
	}
	/**
	 * json获取数据
	 */
	public function jsonGet($url){
		if(!$url)return false;
		$page=json_decode(curlData($url.'&page=1'),true);
		$data=json_decode(curlData($url.'&page='.mt_rand(1,$page['pageinfo']['pagecount'])),true);
		unset($page);
		return $data;
	}
	/**
	 * 书籍章节获取
	 */
	public function getChapterData($url=''){
		if(!$url)return '';
		$html=curlData(self::$domain.'/bookcatalog/'.$url.'.html');
		$rules = array(
				'num' => array('.ul_catalog li a','href'),
				'title' => array('.ul_catalog li a .title','html'),
				'type' => array('.ul_catalog li a .icon','html'),
		);
		$data=QueryList::Query($html, $rules)->data;
		foreach($data as &$v){
			$v['num']=mb_substr($v['num'], strripos($v['num'],'/')+1,strripos($v['num'],'.')-strripos($v['num'],'/')-1);
			$v['type']=$v['type']=='VIP'?'2':'1';
			$name=explode(' ',$v['title']);
			$v['title']=$name[0];
			if(isset($name[1]))$v['name']=$name[1];
			unset($name);
		}
		return $data;
	}
	/**
	 * 书籍内容获取
	 */
	public function getBookContent($bookId=0,$url='',$isVIP=false){
		if(!$url)return '';
		$html=curlData(self::$domain.'/book/'.$bookId.'/'.$url.'.html',$isVIP);
		$rules = array(
				'content' => array('#uiContent','html'),
		);
		$data=QueryList::Query($html, $rules)->data;
		if(!$data)$data[0]['content']='';
		$data[0]['content']=strip_tags(str_replace('<br>','\r\n',$data[0]['content']));
		return $data[0];
	}
	/**
	 * 首页推荐数据
	 */
	public function homeData(){
		//精选-本周主打
		$rules = array(
				'book_info_url' => array('.ui_booklistv .ui_bookv','href'),
				'img'=>array('.ui_booklistv .ui_bookv_cover img','src'),
				'name'=>array('.ui_booklistv .ui_bookv_intro h3','text'),
		);
		$data=$this->getData(self::$domain,$rules,3);
		foreach($data as $v){
			if(isset($v['inId'])){
				Db::connect()->name('book')->where('id='.$v['inId'])->update('is_main=2,is_home=-1');
			}else{
				$v['is_main']=2;
				$v['is_home']=-1;
				Db::connect()->name('book')->insert($v);
			}
		}unset($data,$rules);
		//精选-热门推荐
		$rules = array(
				'book_info_url' => array('.ui_booklisth .ui_bookh','href'),
				'img'=>array('.ui_booklisth .ui_bookh_cover img','src'),
				'name'=>array('.ui_booklisth .lb_bookh_bookname','text'),
		);
		$data=$this->getData(self::$domain,$rules);
		foreach($data as $v){
			if(isset($v['inId'])){
				Db::connect()->name('book')->where('id='.$v['inId'])->update('is_hot=2,is_home=-1');
			}else{
				$v['is_hot']=2;
				$v['is_home']=-1;
				Db::connect()->name('book')->insert($v);
			}
		}unset($data,$rules);
/////////////////////////////////////////////////////////////////////////////////////////////////////
		//男生-本周主打
		$rules = array(
				'book_info_url' => array('.ui_booklistv .ui_bookv','href'),
				'img'=>array('.ui_booklistv .ui_bookv_cover img','src'),
				'name'=>array('.ui_booklistv .ui_bookv_intro h3','text'),
		);
		$data=$this->getData(self::$domain.'/bookchannel.aspx?cid=1',$rules,3);
		foreach($data as $v){
			if(isset($v['inId'])){
				Db::connect()->name('book')->where('id='.$v['inId'])->update('is_main=2,is_home=1');
			}else{
				$v['is_main']=2;
				$v['is_home']=1;
				Db::connect()->name('book')->insert($v);
			}
		}unset($data,$rules);
		//男生-热门推荐
		$rules = array(
				'book_info_url' => array('.ui_booklistv .ui_bookv','href'),
				'img'=>array('.ui_booklistv .ui_bookv_cover img','src'),
				'name'=>array('.ui_booklistv .ui_bookv_intro h3','text'),
		);
		$data=$this->getData(self::$domain.'/bookchannel.aspx?cid=1',$rules,5,3);
		foreach($data as $v){
			if(isset($v['inId'])){
				Db::connect()->name('book')->where('id='.$v['inId'])->update('is_hot=2,is_home=1');
			}else{
				$v['is_hot']=2;
				$v['is_home']=1;
				Db::connect()->name('book')->insert($v);
			}
		}unset($data,$rules);
		//男生-最新上架
		$rules = array(
				'book_info_url' => array('.ui_booklistv .ui_bookv','href'),
				'img'=>array('.ui_booklistv .ui_bookv_cover img','src'),
				'name'=>array('.ui_booklistv .ui_bookv_intro h3','text'),
		);
		$data=$this->getData(self::$domain.'/bookchannel.aspx?cid=1',$rules,6,8);
		foreach($data as $v){
			if(isset($v['inId'])){
				Db::connect()->name('book')->where('id='.$v['inId'])->update('is_home=1');
			}else{
				$v['is_home']=1;
				Db::connect()->name('book')->insert($v);
			}
		}unset($data,$rules);
/////////////////////////////////////////////////////////////////////////////////////////////////////////
		//女生-本周主打
		$rules = array(
				'book_info_url' => array('.ui_booklistv .ui_bookv','href'),
				'img'=>array('.ui_booklistv .ui_bookv_cover img','src'),
				'name'=>array('.ui_booklistv .ui_bookv_intro h3','text'),
		);
		$data=$this->getData(self::$domain.'/bookchannel.aspx?cid=2',$rules,3);
		foreach($data as $v){
			if(isset($v['inId'])){
				Db::connect()->name('book')->where('id='.$v['inId'])->update('is_main=2,is_home=2');
			}else{
				$v['is_main']=2;
				$v['is_home']=2;
				Db::connect()->name('book')->insert($v);
			}
		}unset($data,$rules);
		//女生-热门推荐
		$rules = array(
				'book_info_url' => array('.ui_booklistv .ui_bookv','href'),
				'img'=>array('.ui_booklistv .ui_bookv_cover img','src'),
				'name'=>array('.ui_booklistv .ui_bookv_intro h3','text'),
		);
		$data=$this->getData(self::$domain.'/bookchannel.aspx?cid=2',$rules,5,3);
		foreach($data as $v){
			if(isset($v['inId'])){
				Db::connect()->name('book')->where('id='.$v['inId'])->update('is_hot=2,is_home=2');
			}else{
				$v['is_hot']=2;
				$v['is_home']=2;
				Db::connect()->name('book')->insert($v);
			}
		}unset($data,$rules);
		//女生-最新上架
		$rules = array(
				'book_info_url' => array('.ui_booklistv .ui_bookv','href'),
				'img'=>array('.ui_booklistv .ui_bookv_cover img','src'),
				'name'=>array('.ui_booklistv .ui_bookv_intro h3','text'),
		);
		$data=$this->getData(self::$domain.'/bookchannel.aspx?cid=2',$rules,5,8);
		foreach($data as $v){
			if(isset($v['inId'])){
				Db::connect()->name('book')->where('id='.$v['inId'])->update('is_home=2');
			}else{
				$v['is_home']=2;
				Db::connect()->name('book')->insert($v);
			}
		}unset($data,$rules);
/////////////////////////////////////////////////////////////////////////////////////////////////////////
		//出版-本周主打
		$rules = array(
				'book_info_url' => array('.ui_booklistv .ui_bookv','href'),
				'img'=>array('.ui_booklistv .ui_bookv_cover img','src'),
				'name'=>array('.ui_booklistv .ui_bookv_intro h3','text'),
		);
		$data=$this->getData(self::$domain.'/bookchannel.aspx?cid=3',$rules,2);
		foreach($data as $v){
			if(isset($v['inId'])){
				Db::connect()->name('book')->where('id='.$v['inId'])->update('is_main=2,is_home=3');
			}else{
				$v['is_main']=2;
				$v['is_home']=3;
				Db::connect()->name('book')->insert($v);
			}
		}unset($data,$rules);
		//出版-热门推荐
		$rules = array(
				'book_info_url' => array('.ui_booklistv .ui_bookv','href'),
				'img'=>array('.ui_booklistv .ui_bookv_cover img','src'),
				'name'=>array('.ui_booklistv .ui_bookv_intro h3','text'),
		);
		$data=$this->getData(self::$domain.'/bookchannel.aspx?cid=3',$rules,6,2);
		foreach($data as $v){
			if(isset($v['inId'])){
				Db::connect()->name('book')->where('id='.$v['inId'])->update('is_hot=2,is_home=3');
			}else{
				$v['is_hot']=2;
				$v['is_home']=3;
				Db::connect()->name('book')->insert($v);
			}
		}unset($data,$rules);
		//出版-最新上架
		$rules = array(
				'book_info_url' => array('.ui_booklistv .ui_bookv','href'),
				'img'=>array('.ui_booklistv .ui_bookv_cover img','src'),
				'name'=>array('.ui_booklistv .ui_bookv_intro h3','text'),
		);
		$data=$this->getData(self::$domain.'/bookchannel.aspx?cid=3',$rules,4,8);
		foreach($data as $v){
			if(isset($v['inId'])){
				Db::connect()->name('book')->where('id='.$v['inId'])->update('is_home=3');
			}else{
				$v['is_home']=3;
				Db::connect()->name('book')->insert($v);
			}
		}unset($data,$rules);
	}
}