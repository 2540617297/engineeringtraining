<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.List" %>
<%@ page import="po.nav.NavF" %><%--
  Created by IntelliJ IDEA.
  User: 25406
  Date: 2019/8/13
  Time: 9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/jQuery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/other/holder.min.js"></script>
    <script src="${pageContext.request.contextPath}/jQuery/jquery.cookie.min.js"></script>

    <style>

        a, a:hover {
            color: #B8C7CE;
            text-decoration: none;
        }

        .panel-heading, .panel-body {
            color: #B8C7CE;
            background-color: #222D32;
        }

        .panel-heading, #mya a {
            text-decoration: none;
            display: block;
            width: 100%;
            padding: 10px 15px;
            height: 40px;
        }

        .mypanel a:hover, a:focus, .nav li a:hover, a:focus, #mya a:hover, a:focus, a:active {
            background-color: #1A2226;
            color: #ffffff;
        }

        #daypost:hover, #daypost:focus, #daypost:active {
            background-color: #1A2226 !important;
            color: #ffffff;
        }

        #loginimg {
            position: absolute;
            top: 20px;
            left: 80px;
            color: #ffffff;
            font-weight: 600;
            line-height: 1;
        }

        #content-header, #content {
            margin: 0px;
            padding: 15px 15px 15px 15px;
        }

        .col-lg-10 {
            background-color: #DEE1E6;
            padding: 0px;
            position: relative;
        }

        footer {
            height: 50px;
            border-top: #B8C7CE solid 1px;
            position: absolute;
            width: 100%;
            padding-right: 15px;
            bottom: 0;
            background-color: #ffffff;
            line-height: 50px;
        }

        .carousel-inner img {
            margin: 0 auto;
        }

        .carousel-inner a {

        }

        h1 {
            margin: 0;
        }

        .caption p {
            height: 80px;
        }

    </style>
</head>
<body>
<%
    String username = (String) request.getAttribute("username");
%>

<%--导航条--%>
<nav class="navbar navbar-inverse " style="background-color: #1A2226; margin: 0px; padding:0px;">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="all_admin_index">IT社区</a>
        </div>

        <div class="navbar-right">
            <div class="dropdown " style="padding-top: 12px;">
                <a class="dropdown-toggle navbar-link" data-toggle="dropdown"
                   style="padding-top: 5px; font-size: 18px;"><%=username%>您好!&nbsp;</a>
                <ul class="dropdown-menu">
                    <li><a href="">个人资料</a></li>
                    <li class="leave"><a href="../userController/login">切换账户</a></li>
                    <li class="leave"><a href="../userController/login">退出登录</a></li>
                </ul>
            </div>
        </div>

        <form action="../postController/postsearch" method="post" class="navbar-form navbar-right visible-lg"
              role="search">
            <div class="form-group">
                <input type="text" class="form-control" name="question" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">提交</button>
        </form>

    </div>
</nav>
<%--主界面--%>
<div style=" padding-left:0px;margin-left: 0px;margin-right: 0px;">
    <div class="row" id="row" style="width: 100%; margin:0px; background-color: #222D32">
        <%--左侧导航条--%>
        <div class="col-lg-2" style="padding:0px;">
            <div id="autoheight" style="background-color: #222D32;">
                <div style="position: relative; height: 75px;width: 281.25px;background-color:#222D32">
                    <img src="${pageContext.request.contextPath}/images/loginimg.jpg"
                         style="position: absolute;top:15px;left: 20px; border-radius: 25px;">
                    <div id="loginimg">
                        <p><%=username%>
                        </p>
                        <p>在线..</p>
                    </div>
                </div>

                <div id="mya">
                    <a style=" color:#B8C7CE; background-color: #1A2226; padding: 12px 5px 12px 15px;">菜单</a>
                    <a style="background-color: #1A2226;color: #ffffff;" href="../navController/all_admin_index"><span
                            class="glyphicon glyphicon-book"></span>首页</a>

                </div>

                <div class="panel-group " id="panelgroup">
                    <%
                        List<List<NavF>> list = (List<List<NavF>>) request.getAttribute("lists");
                        for (List<NavF> lists :
                                list) {

                    %>

                    <%--实验室信息管理--%>
                    <div class="panel mypanel" id="firstpanel" style="border:none;">
                        <a class="panel-heading active" id="firstpanelimpl" data-toggle="collapse"
                           data-parent="#panelgroup" data-target="#panel<%=lists.get(0).getNavss().getNavsid()%>">
                            <span class="glyphicon glyphicon-book"></span><%=lists.get(0).getNavfname() %>
                            <span class="glyphicon glyphicon-chevron-left pull-right"></span>


                        </a>
                        <div class=" panel-collapse collapse" id="panel<%=lists.get(0).getNavss().getNavsid()%>">
                            <div class="panel-body" style=" border: none; padding:0px 15px 0px 5px;">
                                <ul class="nav">
                                    <%
                                        int index = lists.size();
                                        for (int i = 0; i < index; i++) {
                                    %>
                                    <li>
                                        <a href="<%=lists.get(i).getNavss().getNavsherf()%>?postnavs=<%=lists.get(i).getNavss().getNavsid()%>">
                                            <span class="glyphicon glyphicon-record"></span><%=lists.get(i).getNavss().getNavsname()%>
                                        </a></li>

                                    <%
                                        }
                                    %>
                                </ul>
                            </div>
                        </div>

                    </div>
                    <%
                        }
                    %>
                </div>


            </div>
            <%--<iframe src="../userController/iframe" id="iframe" scrolling="no"  style="border: 0px;height:auto;width: 100%"></iframe>--%>

        </div>

        <%--右侧主要内容--%>
        <div class="col-lg-10" id="content-right" style="height: auto ;position: relative">
            <div id="content-header">
                <h3 style="margin:0px;" class="page-header">
                    IT社区
                    <small>首页</small>
                    <a href="#" class="pull-right" style="font-size: xx-small"><span
                            class="glyphicon glyphicon-tag"></span> 首页</a>

                </h3>
            </div>

            <div id="content" style="margin-bottom: 50px">
                <%--轮播图--%>
                <div class="carousel slide" id="mycarousel">

                    <div class="carousel-inner">
                        <div class="item active">
                            <img src="${pageContext.request.contextPath}/images/admincarousel1.jpg">
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/images/admincarousel2.jpg">
                        </div>
                        <div class="item">
                            <img src="${pageContext.request.contextPath}/images/admincarousel3.jpg">
                        </div>
                    </div>

                    <ol class="carousel-indicators">
                        <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#mycarousel" data-slide-to="1"></li>
                        <li data-target="#mycarousel" data-slide-to="2"></li>
                    </ol>

                    <a href="#mycarousel" style="margin-left: 76.250px"
                       class="left carousel-control" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                    </a>
                    <a href="#mycarousel" style="margin-right: 76.250px"
                       class="right carousel-control" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                    </a>

                </div>

                <div class="row" style="padding:20px 75px;">
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/images/admin2.jpg">
                            <div class="caption">
                                <h2> IT社区</h2>
                                <p>为广大软件开发爱好者们提供学习、技术交流以及趣事分享等服务，打造一个更有针对性和时效性的网上大家园.</p>
                                <a href="../navController/all_admin_index" class="btn btn-primary">learn more</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/images/admin1.jpg">
                            <div class="caption">
                                <h2> 我要发帖</h2>
                                <p>用户可以在此模块发布帖子，为了防止发帖刷分，半小时之内最多只能发布一个帖子。</p>
                                <a href="../postController/post_write" class="btn btn-primary">learn more</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/images/admin5.jpg">
                            <div class="caption">
                                <h2> 每日一贴</h2>
                                <p>在每日一贴子模块，所有的用户都可以在此帖子中随意发言.</p>
                                <a href="../postController/daypost" class="btn btn-primary">learn more</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/images/admin3.jpg">
                            <div class="caption">
                                <h2> 个人信息</h2>
                                <p>修改个人信息、用户名、密码等其他信息。</p>
                                <a href="../userController/user_information" class="btn btn-primary">learn more</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/images/admin4.jpg">
                            <div class="caption">
                                <h2> 论坛牛贴</h2>
                                <p>论坛牛帖，是将所有的帖子中排名浏览量排名前十的帖子置顶。</p>
                                <a href="../postController/postranking" class="btn btn-primary">learn more</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="thumbnail">
                            <img src="${pageContext.request.contextPath}/images/admin6.jpg">
                            <div class="caption">
                                <h2> 社区公告</h2>
                                <p>会发布很多关于IT社区的官方通知消息。</p>
                                <a href="../adminController/noticeshow" class="btn btn-primary alimit">learn more</a>
                            </div>
                        </div>
                    </div>

                </div>

            </div>


            <%--底部标签--%>
            <footer class="main-footer">
                <p style="margin-bottom: 0px; padding-left: 20px;"><big>欢迎登陆IT社区系统！</big>
                    <small>Welcome to the It system.</small>
                </p>
            </footer>

        </div>
    </div>
</div>


</body>
<script>
    window.onload = function () {
        /*function refresh(){
            var childPageH = $('#iframe').contents().find('body').height();
            $('#iframe').height(childPageH);
            console.log(childPageH);
        }
        refresh();
        setInterval(refresh,100)*/
    }
    $(document).ready(function () {
        var rowheight = $("#row").height();
        $("#iframe").height(rowheight);
    })
</script>
<script>
    /*$(document).ready(function () {
        var mark=$.cookie("mark");
        if(mark==1){
            $(".limit").addClass("disabled");
            $(".limit a").click(function (event) {
                event.preventDefault();   // 如果<a>定义了 target="_blank“ 需要这句来阻止打开新页面
            });
            $(".alimit").addClass("disabled");
        }
    });
*/
    $(".leave a").click(function () {
        $.removeCookie("username", {path: "/classdesign/pages"});
    });

    /*切换菜单栏上下*/
    $('.collapse').each(function () {
        $(this).on('show.bs.collapse', function () {
            $(this).prev('a').children(".pull-right").toggleClass("glyphicon-chevron-down");
            $(this).prev('a').children(".pull-right").toggleClass("glyphicon-chevron-left");
        });
    });
    $('.collapse').each(function () {
        $(this).on('hidden.bs.collapse', function () {
            $(this).prev('a').children(".pull-right").toggleClass("glyphicon-chevron-left");
            $(this).prev('a').children(".pull-right").toggleClass("glyphicon-chevron-down");
        });
    });

    $('.carousel').carousel({
        interval: 3000
    });
    // var bodyheight=document.documentElement.clientHeight;
    // $("#autoheight").height(bodyheight);

</script>
</html>
