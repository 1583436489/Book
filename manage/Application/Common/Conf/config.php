<?php
return array(
	//'配置项'=>'配置值'
	/* 数据库设置 */
	'DB_TYPE'               =>  'mysql',     // 数据库类型
	'DB_HOST'				=> '127.0.0.1',
	'DB_NAME'               =>  'ykg',          // 数据库名
	'DB_USER'               =>  'root',      // 用户名 
	'DB_PWD' 				=> 'root',
	'DB_PORT'               =>  '3306',      // 端口
	'DB_PREFIX'             =>  'yk_',    // 数据库表前缀
	'DB_DEBUG'  			=>  false, // 数据库调试模式 开启后可以记录SQL日志
	'DB_CHARSET'            =>  'utf8',      // 数据库编码默认采用utf8
	'DB_RW_SEPARATE'        =>  false,       // 数据库读写是否分离 主从式有效
	'SHOW_PAGE_TRACE'       =>  false,
	'URL_MODEL'             =>    0,
);