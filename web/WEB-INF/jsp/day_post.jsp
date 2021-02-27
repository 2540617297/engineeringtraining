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

        #daypost:hover, #daypost:focus, #daypost:active {
            background-color: #1A2226 !important;
            color: #ffffff;
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
            padding: 15px 15px 15px 15px;
            margin-bottom: 50px;

        }

        #daypost {
            height: auto !important;
        }

        #daypostwrite {
            background-color: #ffffff;
            height: calc(100vh - 208px);
        }

        #postdisplay {
            margin: 0px 150px;
            height: auto;
        }

        #displaymore {
            background-color: white;
            height: 40px;
            line-height: 40px;
            text-align: center;
            color: #000 !important;
        }

        #displaymore a {
            color: black;
        }

        #displaymore a:hover {
            color: #B8C7CE;
        }

        .media {
            margin-top: 30px;
            margin-bottom: 25px;
            padding-bottom: 18px;
        }

        .daypost {
            padding: 20px;
            background-color: white;
            height: auto;
            margin-bottom: 20px
        }

        .daycontent {
            color: black !important;
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

                    <%--实验室信息管理--%>
                    <div class="panel mypanel" id="firstpanel" style="border:none;">
                        <a class="panel-heading active" id="firstpanelimpl" data-toggle="collapse"
                           data-parent="#panelgroup" data-target="#panel<%=lists.get(0).getNavss().getNavsid()%>">
                            <span class="glyphicon glyphicon-book"></span><%=lists.get(0).getNavfname() %>
                            <span class="glyphicon <%if(lists.get(0).getNavfname().equals("每日一贴")){%>glyphicon-chevron-down<%}else{%>glyphicon-chevron-left<%}%> pull-right"></span>

                        </a>
                        <div class=" panel-collapse collapse <%if(lists.get(0).getNavfname().equals("每日一贴")){%>in<%}%>"
                             id="panel<%=lists.get(0).getNavss().getNavsid()%>">
                            <div class="panel-body" style=" border: none; padding:0px 15px 0px 5px;">
                                <ul class="nav">
                                    <%
                                        int index = lists.size();
                                        for (int i = 0; i < index; i++) {
                                    %>
                                    <li>
                                        <a <%if(lists.get(i).getNavss().getNavsname().equals("每日一贴")){%>style="background-color: #1A2226;color: #ffffff;" <%}%>
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
                    <%
                        }
                    %>
                </div>


            </div>

        </div>

        <%--右侧主要内容--%>
        <div class="col-lg-10" id="content-right" style="height: auto ;position: relative">
            <div id="content-header">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#postdisplay" data-toggle="tab">每日POST</a></li>
                    <li><a href="#daypostwrite" data-toggle="tab">POST编写</a></li>
                </ul>
            </div>

            <div id="content" class="tab-content">
                <div id="postdisplay" class="tab-pane fade in active">
                    <%
                        List<PostInformation> postInformations = (List<PostInformation>) request.getAttribute("postInformations");
                        for (PostInformation postInformation : postInformations) {

                    %>
                    <div class="daypost">
                        <div class="media page-header">
                            <a class="pull-left" href="#">
                                <img src="${pageContext.request.contextPath}/images/loginimg.jpg">
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading"><%=postInformation.getUser().getUsername()%>
                                </h4>
                                <h6>时间：<%=postInformation.getPosttime()%>
                                </h6>

                            </div>

                        </div>
                        <a class="daycontent"
                           href="../postController/postshow?postid=<%=postInformation.getPostid()%>&recordpage=../postController/daypost">
                            <%=postInformation.getPostcontent()%>
                        </a>
                    </div>
                    <%}%>

                    <div id="displaymore"><a id="displaymorea">加载更多</a></div>
                    <input type="hidden" id="startpage" value="0">
                    <input type="hidden" id="endpage" value="5">
                </div>

                <div id="daypostwrite" class="tab-pane fade">
                    <form action="daypostadd" class="form-group-lg" method="post">
                        <div class="headline">
                            <p>每日一贴</p>
                        </div>

                        <%--标题--%>
                        <div class="row posttitle">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon">主题</span>
                                <input class="form-control" type="text" name="posttitle" placeholder="（只作为查询依据）">
                                <span class="input-group-btn">
						                    <button class="btn btn-danger" type="submit">帖子发布</button>
					                    </span>
                            </div>
                        </div>

                        <%--富文本框--%>
                        <div id="editor">
                            <p>欢迎使用IT社区！</p>
                        </div>

                        <textarea id="postcontent" name="postcontent" style="display: none"></textarea>
                    </form>
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
    $("#displaymorea").click(function () {
        var postdisplay = $("#postdisplay");
        var startpage = $("#startpage").val();
        var endpage = $("#endpage").val();
        $("#startpage").val(parseInt(startpage) + 5);

        function setDivtc(item) {
            // alert("竟来了");
            var div = '<div class="daypost">\n' +
                '<div class="media page-header">\n' +
                '<a class="pull-left" href="#">\n' +
                '<img src="${pageContext.request.contextPath}/images/loginimg.jpg">\n' +
                '</a>\n' +
                '<div class="media-body">\n' +
                '<h4 class="media-heading">' + item.user.username + '</h4>\n' +
                '<h6>时间：' + item.posttime + '</h6>\n' +
                '</div>\n' +
                '</div>\n<a class="daycontent" href="../postController/postshow?postid=' + item.postid + '&recordpage=../postController/daypost">\n' + item.postcontent +
                '</a>' +
                '</div>';

            return div;
        }

        $.ajax({
            type: "post",
            url: "../postController/displaymore",
            data: {"startpage": parseInt(startpage) + 5, "endpage": 5},
            dataType: "json",
            async: false,
            success: function (postInformations) {
                // alert("laile");
                var html = '';
                // alert(JSON.stringify(postInformations));
                for (var list in postInformations) {
                    html += setDivtc(postInformations[list]);
                }
                // alert(html);
                $("#displaymore").before(html);

            },
            error: function () {
                alert("错误");
            }
        });
    });


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
