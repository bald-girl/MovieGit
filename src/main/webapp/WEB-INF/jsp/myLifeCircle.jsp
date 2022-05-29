<%@ page import="com.movie.review.entity.UserInform" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<html>
<head>
    <title>我的生活圈</title>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" href="css/menu.css"/>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <script>

        function check(form) {
            if(form.addLifeCircle.value === " "){
                alert("请填写内容后再提交！");
                return false;
            }
            return true;
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
        <div style="padding: 20px 10px;height: 80%">
            <div>
                <%
                    UserInform userInform = (UserInform) session.getAttribute("user");
                %>
                <ul class="tab_img">
                    <li style="list-style-type: none;width: 100%" >
                        <div class="slide-title" style="height:30px; font-weight: bold">
                            <h2><%=userInform.getUserName()%></h2>
                        </div>

                        <div style="margin-top: 15px">
                            <form action="${pageContext.request.contextPath}/add_life_circle" method="post"  onsubmit="return check(this)">
                                <input type="hidden" value="<%=userInform.getUserIndex()%>" name="userIndex"/>
                                <h4 style="color: #2F9615;margin-bottom:10px">发动态</h4>
                                <textarea class="" name="addLifeCircle" style="width:97%;height:50px;margin-bottom:5px"></textarea>
                                <button type="submit">提交</button>
                            </form>
                        </div>

                        <div style="margin-top: 15px">
                            <div>
                                <h4 style="color: #2F9615">我的生活圈......</h4>
                            </div>
                            <c:choose>
                                <c:when test="${requestScope.lifeCircleByUserName != null && ! requestScope.lifeCircleByUserName.isEmpty()}">
                                    <c:forEach items="${requestScope.lifeCircleByUserName}" var="lifeCircle">
                                        <hr style="height:1px;border:none;border-top:1px dashed  #D1D1D1;" />
                                        <div style="padding-bottom:5px">
                                            <h4 style="margin-bottom: 5px"><fmt:formatDate value="${lifeCircle.lifeCircleDate}"
                                                                pattern="yyyy-MM-dd HH:mm:ss"/></h4>
                                            <h4>${lifeCircle.lifeCircleContent} </h4>
                                        </div>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <div style="text-align: center;color: grey;margin: 15px 0px">
                                        <h3>暂无内容</h3>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>

                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

</body>
</html>
