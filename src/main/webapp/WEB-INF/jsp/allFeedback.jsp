<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用户反馈</title>

    <link rel="icon" href="backstage/img/fevicon.png">
    <link rel="stylesheet" href="backstage/css/animate.min.css">
    <link rel="stylesheet" href="backstage/css/bootstrap.min.css">
    <link rel="stylesheet" href="backstage/css/magnific.min.css">
    <link rel="stylesheet" href="backstage/css/nice-select.min.css">
    <link rel="stylesheet" href="backstage/css/owl.min.css">
    <link rel="stylesheet" href="backstage/css/slick-slide.min.css">
    <link rel="stylesheet" href="backstage/css/fontawesome.min.css">
    <link rel="stylesheet" href="backstage/css/style.css">
    <link rel="stylesheet" href="backstage/css/responsive.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">


</head>
<body class='sc5'>

<div class="preloader" id="preloader">
    <div class="preloader-inner">
        <div id="wave1">
        </div>
        <div class="spinner">
            <div class="dot1"></div>
            <div class="dot2"></div>
        </div>
    </div>
</div>

<div class="body-overlay" id="body-overlay"></div>


<div class="search-popup" id="search-popup">
    <form action="home.html" class="search-form">
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Search.....">
        </div>
        <button type="submit" class="submit-btn"><i class="fa fa-search"></i></button>
    </form>
</div>


<section class="admin-dashboard-section">
    <div class="admin-dashboard-right-side">

        <div class="main-header">
            <div class="header-wraper">
                <div class="row">
                    <div class="col-xl-6">
                            <span class="header-user">
                                <img style="width:70px;height:70px" src="backstage/img/author/1.png" alt="img">
                                <span>你好,
                                    <h5>管理员</h5>
                                </span>
                            </span>
                    </div>
                </div>
            </div>
        </div>


        <div class="dashboard-course">
            <div class="table-responsive">
                <table class="table">
                    <c:choose>
                        <c:when test="${requestScope.feedbackList != null && !requestScope.feedbackList.isEmpty()}">
                            <thead>
                                <tr>
                                    <th scope="col">反馈内容</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.feedbackList}" var="feedbackList">
                                    <tr>
                                        <th scope="row">${feedbackList.feedbackContent}</th>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </c:when>
                        <c:otherwise>
                            <div style="text-align: center;color: grey;margin: 15px 0px">
                                <h3>暂无内容</h3>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </table>
            </div>
        </div>
    </div>

    <div class="dashboard-left-menu">
        <a href="" class="logo"><img  src="images/logo.jpg" alt="img"></a>
        <ul>
            <li class="nav-item">
                <a class="dashboard-item-menu"  href="${pageContext.request.contextPath}/pre_allReport"><i class="fas fa-tachometer-alt"></i>评论区违规举报</a>
            </li>
            <li class="nav-item">
                <a class="dashboard-item-menu"  href="${pageContext.request.contextPath}/pre_allFeedback"><i class="fa fa-user"></i>用户意见反馈</a>
            </li>

        </ul>
    </div>
</section>

<div class="back-to-top">
    <span class="back-top"><i class="fas fa-angle-double-up"></i></span>
</div>

<script src="backstage/js/jquery.3.6.min.js"></script>
<script src="backstage/js/bootstrap.min.js"></script>
<script src="backstage/js/imageloded.min.js"></script>
<script src="backstage/js/counterup.js"></script>
<script src="backstage/js/waypoint.js"></script>
<script src="backstage/js/magnific.min.js"></script>
<script src="backstage/js/isotope.pkgd.min.js"></script>
<script src="backstage/js/nice-select.min.js"></script>
<script src="backstage/js/fontawesome.min.js"></script>
<script src="backstage/js/ripple.js"></script>
<script src="backstage/js/owl.min.js"></script>
<script src="backstage/js/slick-slider.min.js"></script>
<script src="backstage/js/wow.min.js"></script>
<script src="backstage/js/main.js"></script>
</body>
</html>
