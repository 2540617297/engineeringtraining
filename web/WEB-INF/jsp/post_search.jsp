<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.List" %>
<%@ page import="po.nav.NavF" %>
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

        #loginimg {
            position: absolute;
            top: 20px;
            left: 80px;
            color: #ffffff;
            font-weight: 600;
            line-height: 1;
        }

        #content-header {
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

        .headline {
            text-align: center;
        }

        .headline p {
            font-size: xx-large;
            margin-top: 32px;
            margin-bottom: 32px;
        }

        .nav-tabs a, a:hover {
            color: black;
            text-decoration: none;
        }

        .tab-pane {
            padding: 10px;
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
            height: 420px !important; /*!important是重点，因为原div是行内样式设置的高度300px*/
        }

        #content {
            padding: 15px 70px 15px 70px;
            margin-bottom: 50px;

        }

        .search {
            background-color: white;
            padding: 20px;
            margin-bottom: 5px;
        }

        .searchcontent {
            height: 40px;
            text-overflow: ellipsis;
            overflow: hidden;
        }

        .searchfoot {
            margin-top: 15px;
        }

        .media-body a {
            color: black !important;
        }

        .media-heading {
            color: #9acfea;

        }


    </style>
</head>
<body>
<%
    String username = (String) request.getAttribute("username");
    String question = request.getParameter("question");
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
        <div class="col-lg-2 " style="padding:0px; ">
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

                    <div class="panel mypanel" id="firstpanel" style="border:none;">
                        <a class="panel-heading active" id="firstpanelimpl" data-toggle="collapse"
                           data-parent="#panelgroup" data-target="#panel<%=lists.get(0).getNavss().getNavsid()%>">
                            <span class="glyphicon glyphicon-book"></span><%=lists.get(0).getNavfname() %>
                            <span class="glyphicon <%if(lists.get(0).getNavfname().equals("")){%>glyphicon-chevron-down<%}else{%>glyphicon-chevron-left<%}%> pull-right"></span>

                        </a>
                        <div class=" panel-collapse collapse <%if(lists.get(0).getNavfname().equals("")){%>in<%}%>"
                             id="panel<%=lists.get(0).getNavss().getNavsid()%>">
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

        </div>

        <%--右侧主要内容--%>
        <div class="col-lg-10" id="content-right" style="height: auto ;position: relative">
            <div id="content-header">
                <h3 style="margin:0px;" class="page-header">
                    Post查找
                    <small>search</small>
                    <a href="#" class="pull-right" style="font-size: xx-small"><span
                            class="glyphicon glyphicon-tag"></span>search</a>
                </h3>
            </div>

            <div id="content">
                <%
                    List<PostInformation> postInformations = (List<PostInformation>) request.getAttribute("postInformations");
                    int nowpage = (int) request.getAttribute("nowpage");
                    int allpagenum = (int) request.getAttribute("allpagenum");
                    int pages = (int) request.getAttribute("page");
                    for (PostInformation postInformation : postInformations) {
                %>
                <div class="search">
                    <div class="media page-header">
                        <div class="media-body">
                            <a href="../postController/postshow?postid=<%=postInformation.getPostid()%>&recordpage=../postController/postsearch?question=<%=question%>">
                                <h3 class="media-heading"><%=postInformation.getPosttitle()%>
                                </h3>
                            </a>
                        </div>
                    </div>

                    <div class="searchcontent">
                        <%=postInformation.getPostcontenttext().replaceAll("&nbsp", "")%>
                    </div>

                    <div class="searchfoot">作者：<%=postInformation.getUser().getUsername()%>
                        发布时间：<%=postInformation.getPosttime()%> 浏览量：<%=postInformation.getPostview()%>
                    </div>
                </div>
                <%}%>


                <div class="text-center">
                    <ul class="pagination">
                        <li><a class="btn btn-default"
                               href="../postController/postsearch?getnowpage=0&question=<%=question%>">首页</a></li>
                        <li><a class="btn btn-default"
                               href="../postController/postsearch?getnowpage=<%=nowpage-1%>&question=<%=question%>">上一页</a>
                        </li>
                        <li><a class="btn btn-default"
                               href="../postController/postsearch?getnowpage=<%=nowpage+1%>&question=<%=question%>">下一页</a>
                        </li>
                        <li><a class="btn btn-default"
                               href="../postController/postsearch?getnowpage=<%=allpagenum%>&question=<%=question%>">页尾</a>
                        </li>
                    </ul>
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


<script src="//unpkg.com/wangeditor/release/wangEditor.min.js"></script>
<script type="text/javascript">
    var E = window.wangEditor
    var $postcontent = $("#postcontent")
    var editor = new E('#editor')  // 两个参数也可以传入 elem 对象，class 选择器
    // editor.customConfig.uploadImgServer = 'uploadImg'
    // editor.customConfig.uploadFileName = 'myFileName'
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
    }
    editor.create();
    $postcontent.val(editor.txt.html());

</script>
</body>
<script>
    $(document).ready(function () {
        var bodayheight = $(document.body).height();
        var contentheight = $("#content").height();
        if (contentheight < bodayheight) {
            $("#content").height(bodayheight - 200)
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
