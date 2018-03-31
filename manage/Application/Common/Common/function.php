<?php 
/**
 * 拼接文件地址
 * @param string $url 文件地址
 * @param string $folder 文件夹
 */
function getFileUrl($url='',$folder=''){
	if(empty($url))return '';
	if(strpos($url,'http')===false && strpos($url,'https')===false){
		return FILE_HTTP.'/Public/Upfile/'.$folder.'/'.$url;
	}else{
		return $url;
	}
}
?>