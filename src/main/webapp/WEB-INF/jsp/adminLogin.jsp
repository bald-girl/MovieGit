<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zxx">

<head>
    <title>管理员登录</title>
    <!-- Meta tag Keywords -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8" />
    <meta name="keywords"
          content="Report Login Form Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <link href="//fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@400;500;700;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="backstage/login/css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="backstage/login/css/font-awesome.min.css" type="text/css" media="all">

</head>

<body>

<section class="w3l-hotair-form">
    <h1>开始管理网站</h1>
    <div class="container">
        <div class="workinghny-form-grid">
            <div class="main-hotair">
                <div class="content-wthree">
                    <h2>登录</h2>
                    <form action="${pageContext.request.contextPath}/admin_login" method="post">
                        <input type="text" class="text" name="adminId" placeholder="管理员账号" required="" autofocus>
                        <input type="password" class="password" name="adminPwd" placeholder="管理员密码" required="" autofocus>
                        <button class="btn" type="submit">立即登录</button>
                    </form>

                </div>
                <div class="w3l_form align-self">
                    <div class="left_grid_info">
                        <img src="images/1.png" alt="" class="img-fluid">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright text-center">
        <p class="copy-footer-29">感谢您的支持！</p>
    </div>
</section>
</body>

</html>
