<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/login/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="css/login/font-awesome.min.css" type="text/javascript" rel="stylesheet">
    <link href="css/login/bootsnav.css" type="text/css" rel="stylesheet">
    <link href="css/login/normalize.css" type="text/css" rel="stylesheet">
    <link href="css/login/css.css" rel="stylesheet" type="text/css">
    <script src="js/login/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="js/login/jquery.step.js"></script>
    <script src="js/login/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/login/bootsnav.js" type="text/javascript"></script>
    <script src="js/login/jquery.js" type="text/javascript"></script>

    <title>注册</title>
</head>

<body class="logobg_style">
<div id="large-header" class="large-header login-page">
    <canvas id="demo-canvas" width="1590" height="711"></canvas>
	<div class="login-form">
		<div class="login-content">
			<h1 class="title_name">账户注册</h1>
			<form action="${pageContext.request.contextPath}/register" method="post" role="form" id="form_register" class="login_padding" onsubmit="return checked(this)">
				<div class="form-group clearfix">

					<div class="input-group">
						<div class="input-group-addon">
							<i class="icon_user"></i>
						</div>

						<input type="text" class="form-control" name="userName" id="userName" placeholder="用户名"
							   autocomplete="off">
					</div>

				</div>

				<div class="form-group clearfix">
					<div class="input-group">
						<div class="input-group-addon">
							<i class="icon_password"></i>
						</div>
						<input type="password" class="form-control" name="userPwd" id="userPwd" placeholder="密码"
							   autocomplete="off">
					</div>
				</div>

				<div class="form-group clearfix">
					<div class="input-group">
						<div class="input-group-addon">
							<i class="icon_password"></i>
						</div>
						<input type="password" class="form-control" name="reUserPwd" id="reUserPwd" placeholder="确认密码"
							   autocomplete="off">
					</div>
				</div>

				<div class="tishi"></div>
				<div class="form-group">
					<button class="btn btn-danger btn-block btn-login">注册</button>
				</div>
				<div style="float:left;">
					<a href="${pageContext.request.contextPath}/pre_update" class="forget">修改密码</a>
				</div>

				<div class=" textright">
					<a href="${pageContext.request.contextPath}/pre_login" class="forget">立即登录</a>
				</div>

				<div class="form-group">

				</div>

			</form>
		</div>
		<div id="pop-ups" sty1e="">
			<ul style="margin: 15px">
				<li style="list-style-type: none">
					注册失败
				</li>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript">
	function checked(form){
		if(form.userName.value==='') {
			alert('用户名不能为空! ');
			form.userName.focus();
			return false;
		}
		if(form.userPwd.value===''){
			alert('密码不能为空! ');
			form. userPwd. focus( );
			return false;
		}
		if(form.reUserPwd.value.length<8 ||form.reUserPwd.value.length>16) {
			alert('密码应为8~16位，请重新输入! ');
			form.userPwd.focus();
			return false;
		}
		if(form.userPwd.value!==form.reUserPwd.value) {
			alert('密码不一致，请重新输入! ');
			form.reUserPwd.focus() ;
			return false;
		}
		return true ;
	}

	if(${requestScope.error!=null}){
		window.setTimeout(document.getElementById("pop-ups").style.display = "block",1000);
	}
	$(function () {

			}

	);
</script>
<script src="js/login/TweenLite/TweenLite.min.js"></script>
<script src="js/login/TweenLite/EasePack.min.js"></script>
<script src="js/login/TweenLite/rAF.js"></script>
<script src="js/login/TweenLite/demo-1.js"></script>
</body>
</html>
<script type="text/javascript">

</script>
