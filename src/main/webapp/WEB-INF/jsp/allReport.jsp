<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>用户举报</title>

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

    <style type="text/css">
        button{
            margin: 0;
            padding: 0;
            outline: none;
            border: none;
            border-radius: 0;
            background-color: transparent;
            line-height: inherit;
            width: max-content;
        }

        button:after{
            border: none;
        }
    </style>


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
                        <c:when test="${requestScope.reportList != null && !requestScope.reportList.isEmpty()}">
                            <thead>
                                <tr>
                                    <th scope="col">举报内容</th>
                                    <th scope="col">处理</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.reportList}" var="report">
                                    <tr>
                                        <th scope="row">${report.reportContent}</th>
                                        <td>
                                            <form  action="${pageContext.request.contextPath}/deal_with_report" method="post">
                                                <input type="hidden" name="reviewId" value="${report.reviewId}">
                                                <input type="hidden" name="reportId" value="${report.reportIndex}">
                                                <input type="hidden" id="isCompliance" value="" name="isCompliance">
                                                <button  style="margin-right: 20px" onclick="isCompliance()">合规</button>
                                                <button  onclick="isCompliance2()">不合规</button>
                                            </form>
                                        </td>
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

<script>
    function isCompliance() {
        document.getElementById("isCompliance").value = "合规";
    }

    function isCompliance2() {
        document.getElementById("isCompliance").value = "不合规";
    }

</script>
</html>
