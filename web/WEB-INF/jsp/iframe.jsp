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

        .panel {
            margin: 0px !important;
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
<body style="background-color: #222D32">
<%
    String username = (String) request.getAttribute("username");
%>


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
        <a style="background-color: #1A2226;color: #ffffff;" href=""
           onclick="javascript:top.location.href='../navController/all_admin_index'"><span
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
            <a class="panel-heading active" id="firstpanelimpl" data-toggle="collapse" data-parent="#panelgroup"
               data-target="#panel<%=lists.get(0).getNavss().getNavsid()%>">
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
                        <li><a href=""
                               onclick="javascript:top.location.href='<%=lists.get(i).getNavss().getNavsherf()%>?postnavs=<%=lists.get(i).getNavss().getNavsid()%>'">
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


</body>

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
