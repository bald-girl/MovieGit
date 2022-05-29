<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>主页</title>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="css/menu.css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="My Show Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
<%--    从网页获取图片--%>
    <meta name="referrer" content="no-referrer">
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    }
    </script>
    <link href='http://fonts.useso.com/css?family=Oxygen:400,700,300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href="css/megamenu.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="js/megamenu.js"></script>
    <script>$(document).ready(function () {
        $(".megamenu").megamenu();
    });</script>
    <script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#horizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion
                width: 'auto', //auto or any width like 600px
                fit: true   // 100% fit in a container
            });
        });
    </script>

    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1200);
            });
        });

        function updatePwd() {
            document.getElementById("pop-ups").style.display = 'block';
            document.getElementById("pop-ups").style.zIndex = '999';
        }

        function cancel() {
            document.getElementById("pop-ups").style.display = 'none';
        }

    </script>

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
        <div class="header">
            <div class="logo">
                <a href="${pageContext.request.contextPath}/pre_movie_list"><img style="width: 50px;height: 50px" src="images/logo.jpg"></a>
            </div>

            <div class="search">
                <div class="search2">
                    <form action="${pageContext.request.contextPath}/selectOne" method="post"  >
                        <input type="text" name="movieName" onfocus="this.value = '';" onsubmit="return checkIfNull(this)" style="color: black"
                               onblur="if (this.value == '') {this.value = '输入电影名称进行检索'; this.style.color = '#E3E3E3'}"/>
                    </form>
                </div>
            </div>

            <div class="clearfix"></div>
        </div>

        <div class="bootstrap_container">
            <nav class="navbar navbar-default w3_megamenu" role="navigation">

                <div id="defaultmenu" class="navbar-collapse collapse">

                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/pre_movie_list">主页</a>
                        </li>

                        <li class="dropdown w3_megamenu-fw">
                            <a href="${pageContext.request.contextPath}/all_movies">全部电影</a>
                        </li>

                    </ul>

                </div>
            </nav>
        </div>

        <div class="main-banner">
            <div class="banner col-md-8">
                <section class="slider">
                    <div class="flexslider">
                        <ul class="slides">
                            <li>
                                <img src="images/pic1.jpg" class="img-responsive" alt=""/>
                            </li>
                            <li>
                                <img src="images/pic2.jpg" class="img-responsive" alt=""/>
                            </li>
                            <li>
                                <img src="images/pic3.jpg" class="img-responsive" alt=""/>
                            </li>
                            <li>
                                <img src="images/pic4.jpg" class="img-responsive" alt=""/>
                            </li>
                        </ul>
                    </div>
                </section>

                <script defer src="js/jquery.flexslider.js"></script>
                <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen"/>
                <script type="text/javascript">
                    $(function () {
                        SyntaxHighlighter.all();
                    });
                    $(window).load(function () {
                        $('.flexslider').flexslider({
                            animation: "slide",
                            start: function (slider) {
                                $('body').removeClass('loading');
                            }
                        });
                    });
                </script>
            </div>
            <div class="col-md-4 banner-right">
                <h4>快速查找电影</h4>
                <div class="grid_3 grid_5">
                    <div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                        <div id="myTabContent" class="tab-content">
                            <div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
                                <form action="${pageContext.request.contextPath}/select" method="post"  onsubmit="return checkNull(this)">
                                    <select class="list_of_movies" name="type">
                                        <option value="">选择类型</option>
                                        <ul>
                                            <c:if test="${requestScope.typeList!=null}">
                                                <c:forEach items="${requestScope.typeList}" var="type">
                                                    <option style="padding-left: 10px;">${type.movieType}</option>
                                                </c:forEach>
                                            </c:if>
                                        </ul>
                                    </select>
                                    <select class="list_of_movies" name="year">
                                        <option value="">选择年代</option>
                                        <ul>
                                            <c:if test="${requestScope.yearList!=null}">
                                                <c:forEach items="${requestScope.yearList}" var="year">
                                                    <option style="padding-left: 10px;">${year.movieYear}</option>
                                                </c:forEach>
                                            </c:if>
                                        </ul>
                                    </select>
                                    <select class="list_of_movies" name="country">
                                        <option value="">选择国家</option>
                                        <ul>
                                            <c:if test="${requestScope.countryList!=null}">
                                                <c:forEach items="${requestScope.countryList}" var="country">
                                                    <option style="padding-left: 10px;">${country.movieCountry}</option>
                                                </c:forEach>
                                            </c:if>
                                        </ul>
                                    </select>
                                    <button style="width:100% ;margin-Top:10px" >查找</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>

        <div class="review-slider">
            <h3 style="padding-left: 15px">最强榜单</h3>
            <ul id="flexiselDemo1">
                <c:if test="${requestScope.top10Movies!=null}">
                    <c:forEach items="${requestScope.top10Movies}" var="movie">
                        <li>
                            <img src="${movie.movieImg}" width="450px" height="300px" alt=""/>
                            <div class="slide-title" style="height:30px">
                                <h4>${movie.movieName}</h4>
                            </div>
                            <div class="date-city">
                                <h6>${movie.movieYear}</h6>
                                <h6>${movie.movieScore}分</h6>
                                <div class="buy-tickets">
                                    <a href="${pageContext.request.contextPath}/movie_details?index=${movie.movieIndex}">查看详情</a>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>

            <script type="text/javascript">
                $(window).load(function () {

                    $("#flexiselDemo1").flexisel({
                        visibleItems: 5,
                        animationSpeed: 1000,
                        autoPlay: true,
                        autoPlaySpeed: 3000,
                        pauseOnHover: false,
                        enableResponsiveBreakpoints: true,
                        responsiveBreakpoints: {
                            portrait: {
                                changePoint: 480,
                                visibleItems: 2
                            },
                            landscape: {
                                changePoint: 640,
                                visibleItems: 3
                            },
                            tablet: {
                                changePoint: 800,
                                visibleItems: 4
                            }
                        }
                    });
                });
            </script>
            <script type="text/javascript" src="js/jquery.flexisel.js"></script>
        </div>

        <div class="footer-top-grid">
            <div class="list-of-movies col-md-8" style=" width: 98%; ">
                <div class="tabs">
                    <div class="sap_tabs">
                        <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                            <ul class="resp-tabs-list">
                                <li class="resp-tab-item" aria-controls="tab_item-2" role="tab">
                                    <span>国内热门</span>
                                </li>
                                <li class="resp-tab-item" aria-controls="tab_item-1" role="tab">
                                    <span>国外热门</span>
                                </li>
                                <div class="clearfix"></div>
                            </ul>

                            <div class="resp-tabs-container">
                                <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                                    <ul class="tab_img">
                                        <c:if test="${requestScope.hot10Movies!=null}">
                                            <c:forEach items="${requestScope.hot10Movies}" var="movie">
                                                <a href="${pageContext.request.contextPath}/movie_details?index=${movie.movieIndex}">
                                                    <li style="width: 200px" >
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
                                <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
                                    <ul class="tab_img">
                                        <c:if test="${requestScope.hot10Movies2!=null}">
                                            <c:forEach items="${requestScope.hot10Movies2}" var="movie">
                                                <a href="${pageContext.request.contextPath}/movie_details?index=${movie.movieIndex}">
                                                    <li style="width: 200px">
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
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>


            <div class="clearfix"></div>
        </div>

    </div>

    <div class="clearfix"></div>
</div>
<div class="copy-rights text-center">
    <p>感谢所有用户的支持！</p>
</div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        /*
        var defaults = {
              containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
         };
        */

        $().UItoTop({easingType: 'easeOutQuart'});

    });
    // 判断搜索条件
    function checkNull(form){
        if (form.type.value === '' && form.year.value === '' && form.country.value === '') {
            alert("请保证至少存在一项搜索条件！");
            return false;
        }
        return true;
    }

    // 判断输入框
    function checkIfNull(form){
        if(form.movieName.value ===''){
            return false;
        }
        return true;
    }

</script>
<a href="#home" class="scroll" id="toTop" style="display: block;">
    <span id="toTopHover" style="opacity: 1;"> </span>
</a>

</body>
</html>

