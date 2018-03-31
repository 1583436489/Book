<?php
return array(
	'URL_HTML_SUFFIX'       =>    'shtml',
	'TOKEN_ON'              =>    false,  // 是否开启令牌验证 默认关闭
	'TOKEN_NAME'			=>    '__hash__',    // 令牌验证的表单隐藏字段名称，默认为__hash__
	'URL_MODEL'             =>    0,
	'TOKEN_TYPE'			=>    'md5',  //令牌哈希验证规则 默认为MD5
	'TOKEN_RESET'			=>    false,  //令牌验证出错后是否重置令牌 默认为true
	'TMPL_ACTION_ERROR'     =>  THINK_PATH.'Tpl/html_jump.tpl', // 默认错误跳转对应的模板文件
    'TMPL_ACTION_SUCCESS'   =>  THINK_PATH.'Tpl/html_jump.tpl', // 默认成功跳转对应的模板文件
	'CODE_KEY'              => 'sdasoiu28ysjcghjgasdasajlkjasdkl',
	'DEFAULT_CONTROLLER'    => 'Index',
);