<?php
namespace System;
class Db{
	static private $_instance = null;//实例化
	static private $db=null;//连接数据库资源
	static private $config=array();//数据库配置
	static private $tableName='';//表名
	private $field='*';//查询字段
	private $where='';//sql条件
	private $bindParam=array();//绑定字段
	private $order='';//排序
	private $limit='';//分页
	private $join='';//关联表 join
	private $group='';//分组
	public function __construct($dbType='Mysql'){
		$config=include_once PROJECT_PATH.'/Common/Config.php';
		self::$config=$config[$dbType];
		unset($config);
		self::$db = new \PDO('mysql:host='.self::$config['host'].';port='.self::$config['dbPort'].';dbname='.self::$config['dbName'], self::$config['dbUser'], self::$config['dbPwd'], array(\PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES '.self::$config['dbCharSet'].';', \PDO::ATTR_PERSISTENT=>self::$config['dbPersistent'],\PDO::ATTR_ERRMODE =>  \PDO::ERRMODE_EXCEPTION, \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC));
	}
	/**
	 * 连接数据库
	 * @param string $dbType 配置列表
	 * @return \System\Db
	 */
	static function connect($dbType='Mysql'){
		if(self::$_instance==null)self::$_instance=new self($dbType);
		return self::$_instance;
	}
	/**
	 * 清除条件
	 */
	private function clean(){
		//清除废旧记录
		self::$tableName='';
		$this->field='*';
		$this->where='';
		$this->bindParam=array();
		$this->order='';
		$this->limit='';
		$this->join='';
		$this->group='';
	}
	/**
	 * 设置表名
	 * @param string $tableName 表名
	 * @throws \Exception
	 * @return \System\Db
	 */
	static function name($tableName=''){
		if(empty($tableName))throw new \Exception("tableName not null");
		self::$tableName=self::$config['dbPrefix']?self::$config['dbPrefix'].$tableName:$tableName;
		return self::$_instance;
	}
	/**
	 * 设置查询字段
	 * @param string $field 查询字段
	 * @throws \Exception
	 * @return \System\Db
	 */
	public function field($field=''){
		if(empty($field))throw new \Exception("field not null");
		$this->field=$field;
		return self::$_instance;
	}
	/**
	 * sql条件
	 * @param string $where where条件
	 * @return \System\Db
	 */
	public function where($where=''){
		if(!empty($where)){
			$this->where=$where;
		}
		return self::$_instance;
	}
	/**
	 * 绑定字段
	 * @param array $bindParam 绑定字段
	 * @return \System\Db
	 */
	public function bindParam($bindParam=array()){
		if(!empty($bindParam)){
			$this->bindParam=$bindParam;
		}
		return self::$_instance;
	}
	/**
	 * 排序
	 * @param string $order 排序
	 * @throws \Exception
	 * @return \System\Db
	 */
	public function order($order=''){
		if(empty($order))throw new \Exception("order not null");
		$this->order=$order;
		return self::$_instance;
	}
	/**
	 * 分页
	 * @param string $limit 分页
	 * @throws \Exception
	 * @return \System\Db
	 */
	public function limit($limit=''){
		if(empty($limit))throw new \Exception("limit not null");
		$this->limit=$limit;
		return self::$_instance;
	}
	/**
	 * join
	 * @param string $join join
	 * @param string $tyle 关联类型 默认INNER JOIN
	 * @throws \Exception
	 * @return \System\Db
	 */
	public function join($join='',$tyle='INNER JOIN'){
		if(empty($join))throw new \Exception("join not null");
		$this->join=$tyle.' '.$join;
		return self::$_instance;
	}
	/**
	 * group
	 * @param string $group group
	 * @throws \Exception
	 * @return \System\Db
	 */
	public function group($group=''){
		if(empty($group))throw new \Exception("group not null");
		$this->group=$group;
		return self::$_instance;
	}
	/**
	 * 查询
	 * @param string $type fetchAll 全部 fetch 单条记录
	 */
	public function select($type='fetchAll'){
		$sql='SELECT '.$this->field.' FROM '.self::$tableName;
		if($this->join)$sql.=' '.$this->join;
		if($this->where)$sql.=' WHERE '.$this->where;
		if($this->group)$sql.=' GROUP BY '.$this->group;
		if($this->order)$sql.=' ORDER BY '.$this->order;
		if($this->limit)$sql.=' LIMIT '.$this->limit;
// 		echo $sql;exit;
		$request=self::$db->prepare($sql);
		$this->bindParam?$request->execute($this->bindParam):$request->execute();
		$data=$request->$type();
		$this->clean();
		return $data;
	}
	/**
	 * 更新数据
	 * @param string $updete
	 * @throws \Exception
	 * @return boolean
	 */
	public function update($updete=''){
		if(empty($updete))throw new \Exception("updete not null");
		$sql='UPDATE '.self::$tableName.' SET '.$updete;
		if($this->join)$sql.=' '.$this->join;
		if($this->where)$sql.=' WHERE '.$this->where;
		$request=self::$db->prepare($sql);
		$data=$this->bindParam?$request->execute($this->bindParam):$request->execute();
		$this->clean();
		return $request->rowCount();
	}
	/**
	 * 插入记录
	 * @param array $data 更新数据
	 * @throws \Exception
	 * @return boolean
	 */
	public function insert($data=array()){
		if(empty($data))throw new \Exception("data not null");
		if(!is_array($data))throw new \Exception("type error");
		$key=$val='';$value=array();
		foreach($data as $k=>$v){
			$key.='`'.$k.'`,';
			$val.=':'.$k.',';
			$this->bindParam[':'.$k]=$v;
		}
		$key=rtrim($key,',');
		$val=rtrim($val,',');
		unset($data);
		$sql='INSERT INTO '.self::$tableName.'('.$key.') values('.$val.')';
		$request=self::$db->prepare($sql);
		$data=$this->bindParam?$request->execute($this->bindParam):$request->execute();
		$this->clean();
		return self::$db->lastInsertId();
	}
	/**
	 * 删除记录
	 * @return boolean
	 */
	public function delete(){
		$sql='DELETE FROM '.self::$tableName;
		if($this->join)$sql.=' '.$this->join;
		if($this->where)$sql.=' WHERE '.$this->where;
		$request=self::$db->prepare($sql);
		$data=$this->bindParam?$request->execute($this->bindParam):$request->execute();
		$this->clean();
		return $request->rowCount();
	}
	/**
	 * 事务操作
	 * @param number $status 状态（1开启事务 2提交事务 3回滚）
	 */
	public function setAffair($status=1){
		if($status==1){
			self::$db->beginTransaction();
		}else if($status==2){
			self::$db->commit();
		}else if($status==3){
			self::$db->rollBack();
		}
		return true;
	}
}