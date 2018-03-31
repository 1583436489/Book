<?php
/**
 * 配置文件
 */
return array(
		/**
		 * 数据库配置
		 */
		'Mysql'=>array(
				'host'=>'localhost',//数据库地址
				'dbName'=>'book',//数据库名称
				'dbUser'=>'root',//用户名
				'dbPwd'=>'root',//密码
				'dbPort'=>'3306',//端口号
				'dbPrefix'=>'yk_',//表前缀
				'dbCharSet'=>'utf8',//编码
				'dbPersistent'=>true,//时候长连接
		),
		'aliyunOss'=>array(
			'accessKeyId'=>'LTAIjbLDnnERfm0o',
			'accessKeySecret'=>'EicNliF26npmM2B7tdl2HDhWjiHmDk',
			'endpoint'=>'ykread.oss-cn-shenzhen-internal.aliyuncs.com',
			'bucket' => "ykread"
		),
);