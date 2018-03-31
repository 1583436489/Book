<?php
namespace Manage\Controller;

use Think\Controller;

class IndexController extends Controller
{
    //登录首页
    public function index()
    {
        $this->display();
    }

    //登录
    public function login(){
    	$administrator = M("administrator");
    	// 手动进行令牌验证
    	if ($administrator->autoCheckToken($_POST)){
    		$veri=$_POST['verify'];
    		$verify = new \Think\Verify();
    		if(!$verify->check($veri,1)){
    			ajax_info("1","登录失败,验证码错误");
    		}
    		$user = $administrator->where(array("administrator"=>I('post.username')))->find();
    		if(!$user)ajax_info("1","登录失败,请检查用户名是否存在");
    		if($user['password']!=md5(I('post.password').$user['cher']))$this->error("登录失败,请检查密码是否正确",U("Index/index"));
    		$user['login_time']=$save['last_time']=$save['login_time']=time();
    		$save['login_ip']=_get_ip();
    		$save['num']=$user['num'] +=1;
    		unset($user['password']);
    		$update = $administrator->where(array("id"=>$user['id']))->save($save);
    		if($update){
    			$_SESSION['manage']=$user;
    			ajax_info("0","Success",U('Login/index'));
    		}else{
    			ajax_info("1","登录失败,请检查用户名或密码");
    		}
    	}else{
    		// 令牌验证错误
    		ajax_info("1","请勿重复提交表单",U('Index/index'));	
    	}
    }

    //退出
    public function getout()
    {
        unset($_SESSION['manage']);
        $this->redirect('Index/index');
    }

    //验证码
    public function verify()
    {
        $verify = new \Think\Verify();
        $verify->length = 4;
        $verify->imageW = 318;
        $verify->imageH = 69;
        $verify->fontSize = 35;
        $verify->entry(1);
    }

    //图片上传
    public function fileupload()
    {

        $id = abs(intval($_POST['goodsid']));
        $number = I('post.number');
        if (!$id || !$number) ajax_info("1", "参数有误");
        $name = $_FILES['mypic']['name'];
        $aryStr = explode(".", $name);
        $allowtype = array('jpg', 'png');
        $fileType = strtolower($aryStr[count($aryStr) - 1]);
        if (!in_array($fileType, $allowtype)) ajax_info("1", "图片只能传" . implode(",", $allowtype) . "类型");
        $byt = S("upimg") ? S("upimg") * 1024 : 2097152;
        $images = image_up("goods", "mypic", $fileType, $byt);
        $success = M()->query("declare @ErrMsg varchar(255);declare @Sucess bit;exec @Sucess=up_updateGoodsPreImg '$number','$id','$images',@ErrMsg output;select @Sucess 'sucess', @ErrMsg 'errmsg'");
        $success = $success[0];
        if ($success['sucess'] == 0) ajax_info("1", $success['errmsg']);
        ajax_info("0", "Success", $images);
    }

}