<%@ page import="com.movie.review.entity.MovieInform" %>
<%@ page import="com.movie.review.entity.UserInform" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>电影详情页</title>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="css/menu.css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <script src="https://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>


    <style type="text/css">
        #pop-ups { /*弹框的页面*/
            width: 300px; /*宽度*/
            height: 200px; /*高度*/
            background: #e2e2e2; /*背景色*/
            display: none; /*隐藏*/
            position: absolute;
            top: 0;
            left: 0; /*定位*/
            right: 0;
            bottom: 0;
            margin: auto;
        }

        input {
            margin-bottom: 10px;
        }
        .head:link{
            font-size: 15px;
        }
        .head:visited{
            font-size: 15px;
        }
        .head:hover { /*顶部a标签*/
            font-size: 18px;
            text-decoration: none;
            color: grey;
        }

        .head{
            margin-right: 15px;
        }

        #reportB{
            margin: 0;
            padding: 0;
            outline: none;
            border: none;
            border-radius: 0;
            background-color: transparent;
            line-height: inherit;
            width: max-content;
        }

        #reportB:after{
            border: none;
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
                <div>
                    <%
                        MovieInform movie = (MovieInform) session.getAttribute("movieById");
                        UserInform userInform = (UserInform) session.getAttribute("user");
                    %>
                    <ul class="tab_img">
                        <li style="list-style-type: none;width: 100%">
                            <div class="slide-title" style="height:30px; margin-bottom: 20px; font-weight: bold">
                                <h2><%=movie.getMovieName()%>
                                </h2>
                            </div>
                            <div>
                                <div style="float: left;padding-right:20px">
                                    <img src="<%=movie.getMovieImg()%>" width="200px" height="300px" alt=""/>
                                </div>
                                <div>
                                    <h4 style="padding-bottom:10px">导演：<%=movie.getMovieDirector()%>
                                    </h4>
                                    <h4 style="padding-bottom:10px">主演：<%=movie.getMovieStarring()%>
                                    </h4>
                                    <h4 style="padding-bottom:10px">类型：<%=movie.getMovieType()%>
                                    </h4>
                                    <h4 style="padding-bottom:10px">制片国家：<%=movie.getMovieCountry()%>
                                    </h4>
                                    <h4 style="padding-bottom:10px">上映年代：<%=movie.getMovieYear()%>
                                    </h4>
                                    <h4 style="padding-bottom:10px">评分：<%=movie.getMovieScore()%>
                                    </h4>
                                    <h4 style="padding-bottom:10px">评分人数：<%=movie.getMovieEvaluateNumber()%>
                                    </h4>
                                </div>
                            </div>
                        </li>
                        <div class="clearfix"></div>
                    </ul>
                </div>

                <div style="margin-top: 20px">
                    <div style="padding-bottom: 15px;margin-bottom: 15px">
                        <h4 style="float: left;"><span style="color: #2F9615"><%=movie.getMovieName()%>的评价......</h4>
                        <button style="float: right" onclick="add()">我要写评价</button>
                    </div>
                    <div>
                        <c:choose>
                            <c:when test="${requestScope.reviewByMovieId != null && ! requestScope.reviewByMovieId.isEmpty()}">
                                <c:forEach items="${requestScope.reviewByMovieId}" var="review">
                                    <hr style="height:1px;border:none;border-top:1px dashed  #D1D1D1;"/>
                                    <div style="padding-bottom:5px">
                                        <h4 style="color: #0D67BB">${review.reviewUser} </h4>
                                    </div>
                                    <div>
                                        <h4>${review.reviewContent}</h4>
                                    </div>
                                    <div>
                                        <h5 style="float: right;" >
                                            <form  action="${pageContext.request.contextPath}/add_report" method="post">
                                                <input type="hidden" name="reviewContent" value="${review.reviewContent}">
                                                <input type="hidden" name="reviewId" value="${review.reviewIndex}">
                                                <button id="reportB" type="submit">举报</button>
                                            </form>
                                        </h5>
                                    </div>

<%--                                    <!-- 弹窗 举报成功-->--%>
<%--                                    <div id="pop-ups" sty1e="">--%>
<%--                                        <ul style="margin: 15px">--%>
<%--                                            <li style="list-style-type: none">--%>
<%--                                                举报成功--%>
<%--                                            </li>--%>
<%--                                            <li style="list-style-type: none">--%>
<%--                                                <button style="float: right" >确定</button>--%>
<%--                                            </li>--%>
<%--                                        </ul>--%>
<%--                                    </div>--%>

                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <div style="text-align: center;color: grey">
                                    <h3>暂无评价</h3>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- 弹窗表单 添加评论 -->
                <div id="pop-ups" sty1e="">
                    <form action="${pageContext.request.contextPath}/addReview" method="post" onsubmit="return check(this)">
                        <ul style="margin: 15px">
                            <li style="list-style-type: none">
                                <span style="float: right">350</span>
                                填写评论：
                            </li>
                            <li style="list-style-type: none">
                                <input type="hidden" name="movieIndex" value="<%=movie.getMovieIndex()%>">
                                <input type="hidden" name="userName" value="<%=userInform.getUserName()%>">
                                <textarea name="reviewContent" maxlength="350" style="width: 100%; height: 50%"></textarea>
                            </li>
                            <li style="list-style-type: none">
                                <button onclick="cancel()">取消</button>
                                <button style="float: right" type="submit">提交</button>
                            </li>
                        </ul>
                    </form>
                </div>

            </div>
        </div>
    </div>


</body>
<script>

    function add() {
        document.getElementById('pop-ups').style.display = 'block';
    }

    function cancel() {
        document.getElementById("pop-ups").style.display = 'none';

    }

    function check(form) {
        if (form.comment.value === '') {
            alert("请填写内容后再提交！");
            return false;
        }
        return true;
    }

</script>
</html>
