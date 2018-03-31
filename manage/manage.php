<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2014 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用入口文件
// 检测PHP环境
if(version_compare(PHP_VERSION,'5.3.0','<'))  die('require PHP > 5.3.0 !');

// 开启调试模式 建议开发阶段开启 部署阶段注释或者设为false
define('APP_DEBUG',true);
define('BIND_MODULE','Manage');
// 定义应用目录
define('APP_PATH','./Application/');
define('WEB_PATH',dirname(__FILE__));
define('WEB_HTTP',"http://".$_SERVER['HTTP_HOST'].'/book/manage');
define('G_WEB_PUBLIC',WEB_HTTP.'/MPublic');
define('FILE_PATH',dirname(__DIR__));//文件存放地址
define('FILE_HTTP',"http://".$_SERVER['HTTP_HOST'].'/book/');//文件存放地址
// 引入ThinkPHP入口文件


require './ThinkPHP/ThinkPHP.php';

// 亲^_^ 后面不需要任何代码了 就是如此简单