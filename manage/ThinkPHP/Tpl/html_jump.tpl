<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=7" />
<title>提示信息</title>

<style type="text/css">
*{ padding:0; margin:0; font-size:12px}
.showMsg .guery {white-space: pre-wrap; /* css-3 */white-space: -moz-pre-wrap; /* Mozilla, since 1999 */white-space: -pre-wrap; /* Opera 4-6 */white-space: -o-pre-wrap; /* Opera 7 */	word-wrap: break-word; /* Internet Explorer 5.5+ */}
a:link,a:visited{text-decoration:none;color:#0068a6}
a:hover,a:active{color:#ff6600;text-decoration: underline}
.showMsg{border: 1px solid #ddd; zoom:1; width:450px; height:174px;position:absolute;top:30%;left:50%;margin:-87px 0 0 -225px  ;  background-color: white;}
.showMsg h5{ color:#000;  height:30px; line-height:30px;*line-height:30px;font-size:14px; text-align:center;border-bottom:1px solid #ddd}
.showMsg .content{ font-size:14px; height:66px;line-height: 66px;}
.showMsg .bottom{ background:#EFEFEF; margin: 0 1px 1px 1px;line-height:26px; *line-height:30px; height:26px; text-align:center}
</style>
</head>
<body>
<div class="showMsg" style="text-align:center">
	<h5>提示信息</h5>
	<?php if(isset($message)) {?>
	<p class="success" style="height: 60px;line-height: 60px;font-size: 14px;">:) <?php echo($message); ?></p>
	<?php }else{?>
	<p class="error" style="height: 60px;line-height: 60px;font-size: 14px;color: red;">:( <?php echo($error); ?></p>
	<?php }?>
    <div class="bottom" style="color: #6D6D6D;">
   		<a id="wait"><?php echo($waitSecond); ?></a>秒后自动跳转 <a  href="<?php echo($jumpUrl); ?>" id="href">[点这里跳转]</a>
	</div>
</div>
<script type="text/javascript">
(function(){
var wait = document.getElementById('wait'),href = document.getElementById('href').href;
var interval = setInterval(function(){
	var time = --wait.innerHTML;
	if(time <= 0) {
		location.href = href;
		clearInterval(interval);
	};
}, 1000);
})();
</script>
</body>
</html>