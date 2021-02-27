<%@ page import="java.sql.*" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="po.nav.NavF" %>
<%@ page import="java.util.List" %>
<%@ page import="po.user.User" %>
<%@ page import="po.post.PostInformation" %><%--
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
    <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
    <script src="../bootstrap/jQuery/jquery.min.js"></script>
    <script src="../bootstrap/js/bootstrap.js"></script>
    <script src="../bootstrap/other/holder.min.js"></script>
    <script src="../bootstrap/jQuery/jquery.cookie.min.js"></script>

    <style>
        .panel-group {
            border: none;
        }

        a, a:hover {
            color: #B8C7CE;
            text-decoration: none;
        }

        tbody a {
            color: rebeccapurple;
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

        h1, h2, h3, h4, p {
            margin: 0;
        }


    </style>
    <script>
        function alter(number, allline) {
            if (allline == 1) {
                alert("此记录为最后一条，不可删除");
                return false;
            } else {
                if (confirm("确认删除该条记录吗?"))
                    location.href = "equipment-delete.jsp?number=" + number;
            }
        }
    </script>
</head>
<body>

<%
    String navsname = (String) request.getAttribute("navsname");
    String username = (String) request.getAttribute("username");
    String postnavs = request.getParameter("postnavs");

%>
<%--导航条--%>
<nav class="navbar navbar-inverse " style="background-color: #1A2226; margin: 0px; padding:0px;">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="">IT社区</a>
        </div>
        <div class="navbar-right">

            <div class="dropdown " style="padding-top: 12px;">
                <a class="dropdown-toggle navbar-link" data-toggle="dropdown"
                   style="padding-top: 5px; font-size: 18px;"><%=username%>您好!&nbsp;</a>
                <ul class="dropdown-menu">
                    <li><a href="../userController/user_information">个人资料</a></li>
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
            <div id="autoheight" style="background-color: #222D32;height:auto">
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
                            <span class="glyphicon <%if(lists.get(0).getNavfname().equals("分类导航")){%>glyphicon-chevron-down<%}else{%>glyphicon-chevron-left<%}%> pull-right"></span>

                        </a>
                        <div class=" panel-collapse collapse <%if(lists.get(0).getNavfname().equals("分类导航")){%>in<%}%>"
                             id="panel<%=lists.get(0).getNavss().getNavsid()%>">
                            <div class="panel-body" style=" border: none; padding:0px 15px 0px 5px;">
                                <ul class="nav">
                                    <%
                                        int index = lists.size();
                                        for (int i = 0; i < index; i++) {
                                    %>
                                    <li>
                                        <a <%if(lists.get(i).getNavss().getNavsname().equals(navsname)){%>style="background-color: #1A2226;color: #ffffff;" <%}%>
                                           href="<%=lists.get(i).getNavss().getNavsherf()%>?postnavs=<%=lists.get(i).getNavss().getNavsid()%>">
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
                    分类导航
                    <small>导航</small>
                    <a href="equipment-information.jsp" class="pull-right" style="font-size: xx-small"><span
                            class="glyphicon glyphicon-tag"></span>分类导航</a>
                </h3>
            </div>

            <div id="content" style="margin-bottom: 50px;height: 900px;">
                <%--列表头--%>
                <div style="background-color: #ffffff;border-bottom: #F4F4F4 solid 1px; padding: 10px;">
                    <h4>列表</h4>
                </div>

                <%--表格--%>
                <div style="background-color: #ffffff;">
                    <form action="../postController/classifyPost" role="form" class="form-horizontal">

                        <%--传入postnavs--%>
                        <input type="hidden" name="postnavs" value="<%=postnavs%>">

                        <div style="padding: 10px;">
                            <a href="../postController/post_write" class="btn btn-default alimit">
                                <span class="glyphicon glyphicon-folder-open"></span>&nbsp;&nbsp;新建
                            </a>

                            <button type="submit" class="pull-right btn btn-default"><span
                                    class="glyphicon glyphicon-zoom-in"></span>&nbsp;搜索
                            </button>
                            <input style="width:200px;" class="pull-right form-control" type="text" name="question"/>
                        </div>
                    </form>

                    <div style="padding: 10px 10px 0px 10px;" class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th>标题</th>
                                <th>作者</th>
                                <th>发布时间</th>
                                <th>标签</th>
                                <th>访问数</th>
                            </tr>
                            </thead>
                            <%
                                List<PostInformation> classifyposts = (List<PostInformation>) request.getAttribute("classifyposts");
                                int nowpage = (int) request.getAttribute("nowpage");
                                int allpagenum = (int) request.getAttribute("allpagenum");
                                int pages = (int) request.getAttribute("page");
                                for (PostInformation postinformation : classifyposts) {
                            %>
                            <tbody>
                            <tr>
                                <td>
                                    <a href="../postController/postshow?postid=<%=postinformation.getPostid()%>&postnavs=<%=postnavs%>&recordpage=../postController/classifyPost"><%=postinformation.getPosttitle()%>
                                    </a></td>
                                <td><%=postinformation.getUser().getUsername()%>
                                </td>
                                <td><%=postinformation.getPosttime()%>
                                </td>
                                <td><%=postinformation.getNavS().getNavsname()%>
                                </td>
                                <td><%=postinformation.getPostview()%>
                                </td>
                            </tr>
                            </tbody>
                            <%}%>

                        </table>
                    </div>

                    <div style="padding:0px 10px; ">
                        <p>每页<%=pages%>条数据，共<%=allpagenum%>页</p>
                    </div>

                    <div class="text-center">
                        <ul class="pagination">
                            <li><a class="btn btn-default"
                                   href="../postController/classifyPost?getnowpage=0&postnavs=<%=request.getParameter("postnavs")%>">首页</a>
                            </li>
                            <li><a class="btn btn-default"
                                   href="../postController/classifyPost?getnowpage=<%=nowpage-1%>&postnavs=<%=request.getParameter("postnavs")%>">上一页</a>
                            </li>
                            <li><a class="btn btn-default"
                                   href="../postController/classifyPost?getnowpage=<%=nowpage+1%>&postnavs=<%=request.getParameter("postnavs")%>">下一页</a>
                            </li>
                            <li><a class="btn btn-default"
                                   href="../postController/classifyPost?getnowpage=<%=allpagenum%>&postnavs=<%=request.getParameter("postnavs")%>">页尾</a>
                            </li>
                        </ul>
                    </div>

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


</body>
<script>
    /*获取用户权限，限制页面访问*/
    $(document).ready(function () {
        var mark = $.cookie("mark");
        if (mark == 1) {
            $(".limit").addClass("disabled");
            $(".limit a").click(function (event) {
                event.preventDefault();   // 如果<a>定义了 target="_blank“ 需要这句来阻止打开新页面
            });
            $(".alimit").addClass("disabled");
        }
    });

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
