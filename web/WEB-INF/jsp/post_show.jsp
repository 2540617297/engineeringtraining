<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.List" %>
<%@ page import="po.nav.NavF" %>
<%@ page import="po.user.User" %>
<%@ page import="po.post.UpdateView" %>
<%@ page import="org.springframework.context.ApplicationContext" %>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext" %>
<%@ page import="service.post.PostService" %>
<%@ page import="po.reply.Reply" %>
<%@ page import="po.reply.Tree" %>
<%@ page import="po.reply.Find" %>
<%@ page import="po.reply.Last_User" %>
<%--
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
        .panel-group {
            border: none;
        }

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
            height: 40px;
            width: 100%;
            padding: 10px 15px;
        }

        .mypanel a:hover, a:focus, .nav li a:hover, a:focus, #mya a:hover, a:focus, a:active {
            background-color: #1A2226;
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

        .title {
            background-color: #ECECEC;
            line-height: 34px;
            padding: 3px 12px;
            border: #B8C7CE 1px solid;
            text-align: center;
        }

        .col-lg-10 {
            background-color: #DEE1E6;
            padding: 0px;
            position: relative;
        }

        .data {
            padding: 3px 12px;
            border: #B8C7CE 1px solid;
        }

        label {
            height: 29px;
        }

        .col-md-1 {
            height: 42px;
        }

        .headline {
            text-align: center;
        }

        .headline p {
            font-size: xx-large;
            margin-top: 32px;
            margin-bottom: 32px;
        }

        .media {
            border-bottom: 1px solid #eee;
        }

        textarea {
            height: 100px !important;
        }


    </style>
    <script>
        function getlastid(username, lastid) {
            document.getElementById('lastid').value = lastid;
            document.getElementById("replycontent").value = "回复 " + username + ":";
            // alert("nihao");
        }

        function collect(userid, postid) {
            $.ajax({
                type: "post",
                url: "../postController/collectAdd",
                // data:{user:userid,post:postid},
                data: {"userid": userid, "postid": postid},
                dataType: "text",
                async: false,
                success: function (data) {
                    if (data == "0") {
                        $("#log").removeClass("glyphicon-star-empty");
                        $("#log").addClass("glyphicon-star");
                        $("#log").html("已收藏");
                        alert("已收藏")
                    } else {
                        $("#log").removeClass("glyphicon-star");
                        $("#log").addClass("glyphicon-star-empty");
                        $("#log").html("收藏");
                        alert("已取消收藏")
                    }
                },
                error: function () {
                    alert("错误");
                }
            });

        }
    </script>
</head>
<body>

<%
    String recordpage = (String) request.getAttribute("recordpage");
    List<Last_User> lastUsers = (List<Last_User>) request.getAttribute("lastUsers");
    List<User> postinformation = (List<User>) request.getAttribute("postinformation");
    int userid = (int) request.getAttribute("userid");
    int postid = (int) request.getAttribute("postid");
    List<Reply> replies = (List<Reply>) request.getAttribute("replies");
    String username = (String) request.getAttribute("username");
    String postnavs = request.getParameter("postnavs");
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
    </div>
</nav>
<%--主界面--%>
<div style=" padding-left:0px;margin-left: 0px;margin-right: 0px;">
    <div class="row" id="row" style="width: 100%; margin:0px; background-color: #222D32">
        <%--左侧导航条--%>
        <div class="col-lg-2" style="padding:0px; ">
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

                    <%--导航栏--%>
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
                    <%}%>
                </div>


            </div>

        </div>

        <%--右侧主要内容--%>
        <div class="col-lg-10" id="content-right" style="height: auto ;position: relative">
            <div id="content-header">
                <h3 style="margin:0px;" class="page-header">
                    POST展示
                    <small>展示</small>
                    <a href="<%=recordpage%><%if(postnavs!=null){%>?postnavs=<%=postnavs%><%}%>" class="pull-right"
                       style="font-size: x-small;color: black"><span
                            class=" glyphicon glyphicon-log-out"></span>返回上级</a>
                </h3>
            </div>

            <div id="content" style="margin-bottom: 40px">
                <%--添加表单--%>
                <div style="background-color: #ffffff; padding:10px;height:auto" class="container">
                    <h1 style="text-align: center;margin-top: 50px">
                        <span style="font-weight: bold;"><%=postinformation.get(0).getPostInformation().get(0).getPosttitle()%></span>
                    </h1>
                    <h5 style="text-align: center" class="page-header">
                                <span>
                                发布时间：<%=postinformation.get(0).getPostInformation().get(0).getPosttime()%>&nbsp;&nbsp;&nbsp;&nbsp;
                                浏览数：<%=postinformation.get(0).getPostInformation().get(0).getPostview()%>&nbsp;&nbsp;&nbsp;&nbsp;
                                <a style="color: burlywood;font-size: 20px" href="#"
                                   onclick="collect(<%=userid%>,<%=postinformation.get(0).getPostInformation().get(0).getPostid()%>)">
                                    <%
                                        String collect = (String) request.getAttribute("collect");
                                        if (collect.equals("1")) {
                                    %>
                                    <span id="log" class="glyphicon glyphicon-star-empty">收藏</span>
                                    <%} else {%>
                                    <span id="log" class="glyphicon glyphicon-star">已收藏</span>
                                    <%}%>
                                </a>
                                    </span>
                    </h5>
                    <h5 style="margin:0px">&nbsp;</h5>

                    <%=postinformation.get(0).getPostInformation().get(0).getPostcontent()%>
                </div>

                <div style="background-color: #ffffff; padding:10px;height:auto;margin-top: 10px" class="container">
                    <%--评论框--%>
                    <form action="../replyController/addreply" method="post">
                        <input type="hidden" name="userid" value="<%=userid%>">
                        <input type="hidden" name="postid" value="<%=postid%>">
                        <input type="hidden" name="recordpage" value="<%=recordpage%>">
                        <input type="hidden" id="lastid" name="lastid">
                        <div class="page-header" style="padding-bottom: 50px;margin: 0;">
                            <div class="media ">
                                <a class="pull-left" href="#">
                                    <img src="${pageContext.request.contextPath}/images/loginimg.jpg">
                                </a>
                                <div class="media-body">
                                    <textarea id="replycontent" name="replycontent" class="form-control"
                                              cols="15"></textarea>
                                </div>
                            </div>
                            <button class="pull-right btn btn-danger btn-sm" type="submit" style="margin-top: 10px">
                                发表评论/回复
                            </button>
                        </div>
                    </form>
                    <%--评论--%>

                    <%
                        for (Reply reply :
                                replies) {
                    %>
                    <div class="media" <%if(reply.getLastid()!=null){%>style="margin-left: 30px"<%}%> >

                        <a class="pull-left" href="#">
                            <img src="${pageContext.request.contextPath}/images/loginimg.jpg">
                        </a>
                        <div class="media-body">
                            <h4 class="media-heading"><%=reply.getUser().getUsername()%>
                                <%
                                    if (reply.getLastid() != null) {
                                        for (Last_User lastuser : lastUsers) {
                                            if (lastuser.getReqlyid() == reply.getLastid()) {
                                                if (lastuser.getUserid() == reply.getUserid()) {
                                %>
                                @<%=lastuser.getUsername()%>
                                <%
                                                }
                                            }
                                        }
                                    }
                                %>
                                <button style="margin-right: 50px;font-size: 10px;"
                                        class="btn btn-default pull-right reply"
                                        onclick="getlastid('<%=reply.getUser().getUsername()%>',<%=reply.getReplyid()%>);">
                                    回复
                                </button>
                            </h4>
                            <%--<input type="hidden" id="replyid" value="<%=reply.getReplyid()%>">--%>
                            <%=reply.getReplycontent()%>
                            <h5>时间：<%=reply.getReplytime()%>
                            </h5>
                        </div>
                    </div>
                    <%}%>
                </div>

            </div>
            <%--底部标签--%>
            <footer class="main-footer">
                <p style="margin-bottom: 0px; padding-left: 20px;"><big>欢迎登陆IT社区系统！</big>
                    <small>Welcome to the IT system.</small>
                </p>
            </footer>
        </div>


    </div>
</div>
</div>


</body>
<script>
    $(document).ready(function () {
        var bodayheight = $(document.body).height();
        var contentheight = $("#content").height();
        if (contentheight < bodayheight) {
            $("#content").height(bodayheight - 190)
        }
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
        $.removeCookie("username", {path: "/"});
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
