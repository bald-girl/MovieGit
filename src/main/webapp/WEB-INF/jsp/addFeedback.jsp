<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>意见反馈</title>
    <link rel="stylesheet" href="feedback/css/style.css">
    <link rel="stylesheet" href="feedback/css/font-awesome.css">

    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>

    <style type= "text/css" >
        .head:link{
            font-size: 15px;
        }
        .head:visited{
            font-size: 15px;
        }
        .head:hover{ /*顶部a标签*/
            font-size: 18px;
            text-decoration:none;
            color: grey;
        }

        .head{
            margin-right: 15px;
        }

    </style>
</head>

<body>

<div class="header-top-strip">
    <div style="width: 100%;height: 30px;text-align: center;padding: 0 100px">
        <div style="float: left">
            <a class="head" href="${pageContext.request.contextPath}/pre_movie_list">主页</a>
        </div>
        <div style="float: right">
            <a class="head" href="${pageContext.request.contextPath}/pre_my_life">个人主页</a>
            <a class="head" href="${pageContext.request.contextPath}/pre_life_circle">生活圈广场</a>
            <a class="head" href="${pageContext.request.contextPath}/pre_feedback">意见反馈</a>
            <a class="head" href="${pageContext.request.contextPath}/pre_login">退出登录</a>
        </div>
    </div>
</div>

<section class="w3l-contact-4">
    <div class="contacts-9 section-gap">
        <div class="wrapper">
            <div class="top-map">
                <div class="map-content-9">
                    <form action="${pageContext.request.contextPath}/add_feedback" method="post">
                        <div class="form-top1">
                            <h3 class="text-center">请留下您宝贵的意见</h3>
                            <div class="form-top">
                                <div class="form-top-righ">
                                    <textarea name="w3lMessage" id="w3lMessage" placeholder="内容：" required=""></textarea>
                                </div>
                            </div>
                            <div class="text-center">
                                <button type="submit">立即提交</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="cont-details">
                    <div class="cont-top newyork text-center">
                        <h6>孔晓晔</h6>
                        <p>读电影、看音乐、听书</p>
                        <p>方为至上境界</p>
                    </div>
                    <div class="cont-top paris text-center">
                        <h6>《白日梦想家》</h6>
                        <p>开拓视野，冲破艰险，看见世界</p>
                        <p>身临其境，贴近彼此，感受生活</p>
                        <p>这就是生活的目的</p>
                    </div>
                    <div class="cont-top london text-center">
                        <h6>亦舒</h6>
                        <p>往事如烟，像是看过一场电影</p>
                        <p>听过的一支歌，逛过的名胜</p>
                        <p>过去便是过去，无凭无据</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="map">
        <iframe
                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d387193.3059445135!2d-74.25986613799748!3d40.69714941774136!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!4m3!3e3!4m0!4m0!5e0!3m2!1sen!2sin!4v1570181661801!5m2!1sen!2sin"
                allowfullscreen=""></iframe>
    </div>
</section>
<!-- //contacts -->
</body>

</html>
