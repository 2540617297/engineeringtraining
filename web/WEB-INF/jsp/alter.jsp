<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.List" %>
<%@ page import="po.nav.NavF" %>
<%@ page import="po.user.User" %>
<%@ page import="po.nav.NavS" %>
<%@ page import="po.reply.Reply" %>
<%@ page import="po.post.PostInformation" %>
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

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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

        .w-e-toolbar {
            height: 50px;
            padding: 10px !important;
            font-size: 18px;

        }

        .posttitle {
            padding: 0px 13px;
        }

        .w-e-text-container {
            height: 480px !important; /*!important是重点，因为原div是行内样式设置的高度300px*/
        }


    </style>
</head>
<body>
<%
    //   int userid= (int) request.getAttribute("userid");
    List<User> userList = (List<User>) request.getAttribute("userList");
    List<PostInformation> postInformations = (List<PostInformation>) request.getAttribute("postInformations");


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
                   style="padding-top: 5px; font-size: 18px;">您好!&nbsp;</a>
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
    <div class="row" id="row" style="width: 100%; margin:0px; ">
        <%--左侧导航条--%>
        <div class="col-lg-2" style="padding:0px; ">
            <div id="autoheight" style="background-color: #222D32;height:915px;">
                <div style="position: relative; height: 75px;width: 281.25px;background-color:#222D32">
                    <img src="${pageContext.request.contextPath}/images/loginimg.jpg"
                         style="position: absolute;top:15px;left: 20px; border-radius: 25px;">
                    <div id="loginimg">
                        <p></p>
                        <p>在线..</p>
                    </div>
                </div>

                <div id="mya">
                    <a style=" color:#B8C7CE; background-color: #1A2226; padding: 12px 5px 12px 15px;">菜单</a>
                    <a style="background-color: #1A2226;color: #ffffff;" href="../navController/query"><span
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
                                    <li><a href="<%=lists.get(i).getNavss().getNavsherf()%>">
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
                    Service编写
                    <small>bianxie</small>
                    <a href="all_admin_index.jsp" class="pull-right" style="font-size: xx-small"><span
                            class="glyphicon glyphicon-tag"></span>Service</a>
                </h3>
            </div>

            <div id="content" style="margin-bottom: 50px">
                <div style="background-color: #ffffff; padding:10px;height: auto">
                    <div class="headline">
                        <p>帖子/服务更改</p>
                    </div>

                    <form action="edit" class="form-group-lg" method="post">
                        <div class="row posttitle">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon">标题</span>
                                <input class="form-control" type="text" name="servicetitle"
                                       value="<%if(userList!=null){out.println(userList.get(0).getPostInformation().get(0).getPosttitle());}else{out.println(postInformations.get(0).getPosttitle());}%>">
                                <span class="input-group-btn">
						                    <button class="btn btn-danger" type="submit">公告发布</button>
					                    </span>
                            </div>
                        </div>

                        <div class="row posttitle">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon">服务类型</span>
                                <select class="form-control" name="servicenavs">
                                    <option value=null>---请选则---</option>
                                    <%
                                        List<NavS> kinds = (List<NavS>) request.getAttribute("kinds");
                                        for (NavS kind : kinds) {
                                    %>
                                    <option value="<%=kind.getNavsid()%>"
                                            <%if(userList!=null){if(kind.getNavsid()==userList.get(0).getPostInformation().get(0).getNavS().getNavsid()){%>selected<%}}else{if(kind.getNavsid()==postInformations.get(0).getNavS().getNavsid()){%>selected<%
                                            }
                                        }
                                    %>>
                                        <%=kind.getNavsname()%>
                                    </option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                        </div>

                        <div id="editor">
                            <%if (userList != null) {%>
                            <%=userList.get(0).getPostInformation().get(0).getPostcontent()%>
                            <%} else {%>
                            <%=postInformations.get(0).getPostcontent()%>
                            <%}%>
                        </div>

                        <%if (userList != null) {%>
                        <input type="hidden" name="postid"
                               value="<%=userList.get(0).getPostInformation().get(0).getPostid()%>">
                        <%}%>
                        <%if (postInformations != null) {%>
                        <input type="hidden" name="serviceid" value="<%=postInformations.get(0).getPostid()%>">
                        <%}%>

                        <textarea id="postcontent" name="servicecontent" style="display: none"></textarea>
                        <textarea id="postcontenttext" name="postcontenttext" style="display: none"></textarea>
                    </form>


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


<script src="//unpkg.com/wangeditor/release/wangEditor.min.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var $postcontent = $("#postcontent")
    var $postcontenttext = $("#postcontenttext")
    var editor = new E('#editor')  // 两个参数也可以传入 elem 对象，class 选择器
    editor.customConfig.uploadImgShowBase64 = true
    editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024
    // editor.customConfig.uploadImgTimeout = 30000   //默认10秒
    // 关闭粘贴样式的过滤
    editor.customConfig.pasteFilterStyle = false
    // 忽略粘贴内容中的图片
    editor.customConfig.pasteIgnoreImg = true
    // 自定义处理粘贴的文本内容
    editor.customConfig.pasteTextHandle = function (content) {
        // content 即粘贴过来的内容（html 或 纯文本），可进行自定义处理然后返回
        return content
    }

    editor.customConfig.onchange = function (html) {
        // 监控变化，同步更新到 textarea
        $postcontent.val(html)
        $postcontenttext.val(editor.txt.text());
    }
    editor.create()
    $postcontent.val(editor.txt.html())
    $postcontenttext.val(editor.txt.text());

</script>
</body>


<script type="text/javascript">

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

    $(".leave a").click(function () {
       $.removeCookie("username",{path:"/classdesign/pages"});
    });*/

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
