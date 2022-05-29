<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>搜索结果页</title>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="css/menu.css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <%--    从网页获取图片--%>
    <meta name="referrer" content="no-referrer">

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

<div class="container">
    <div class="main-content">
        <div style="padding: 20px 10px">

            <div style="margin-bottom: 15px">
                <h3>搜索结果</h3>
            </div>

            <ul class="tab_img">
                <c:if test="${requestScope.selectList!=null}">
                    <c:forEach items="${requestScope.selectList}" var="movie">
                        <a href="${pageContext.request.contextPath}/movie_details?index=${movie.movieIndex}">
                            <li style="width: 200px ;list-style-type: none" >
                                <img src="${movie.movieImg}" width="200px" height="300px" alt=""/>
                                <div class="slide-title" style="height:30px">
                                    <h4>${movie.movieName}</h4>
                                </div>
                                <div class="date-city">
                                    <h6>${movie.movieYear}</h6>
                                    <h6>${movie.movieScore}分</h6>
                                </div>
                            </li>
                        </a>
                    </c:forEach>
                </c:if>
                <div class="clearfix"></div>
            </ul>
        </div>
    </div>
</div>
</body>
</html>
