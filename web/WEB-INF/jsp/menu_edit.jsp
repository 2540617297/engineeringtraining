<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.List" %>
<%@ page import="po.nav.NavF" %>
<%@ page import="po.user.User" %>
<%@ page import="po.nav.NavS" %>
<%@ page import="org.apache.ibatis.scripting.xmltags.ForEachSqlNode" %>
<%@ page import="po.nav.Nav" %>
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
        .panel-group{
            border: none ;
        }
        a,a:hover{
            color: #B8C7CE;
            text-decoration: none;
        }

        .panel-heading,.panel-body{
            color:#B8C7CE;background-color:#222D32;
        }
        .panel-heading,#mya a{
            text-decoration: none;display: block; height: 40px; width: 100%;padding:10px 15px;
        }
        .mypanel a:hover,a:focus,.nav li a:hover,a:focus,#mya a:hover,a:focus,a:active{
            background-color: #1A2226;
            color: #ffffff;
        }

        #loginimg{
            position: absolute;
            top: 20px;
            left: 80px;
            color: #ffffff;
            font-weight:600;
            line-height: 1;
        }
        #content-header , #content{
            margin:0px;
            padding:15px 15px 15px 15px;
        }
        .col-lg-10{
            background-color:#DEE1E6;
            padding: 0px;
            position: relative;
        }
        footer{
            height: 50px;
            border-top: #B8C7CE solid 1px;
            position: absolute;
            width: 100%;
            padding-right: 15px;
            bottom: 0;
            background-color: #ffffff;
            line-height: 50px;
        }
        .carousel-inner img{
            margin:0 auto;
        }
        .carousel-inner a{

        }
        h1{
            margin: 0;
        }
        .caption p{
            height: 80px;
        }
        .title{
            background-color: #ECECEC;
            line-height: 34px;
            padding: 3px 12px;
            border: #B8C7CE 1px solid;
            text-align: center;
        }
        .col-lg-10{
            background-color:#DEE1E6;
            padding: 0px;
            position: relative;
        }
        .data{
            padding:3px 12px;
            border: #B8C7CE 1px solid;
        }
        label{
            height: 29px;
        }
        .col-md-1{
            height: 42px;
        }
        .headline{
            text-align: center;
        }
        .headline p{
            font-size: xx-large;
            margin-top: 32px;
            margin-bottom: 32px;
        }
        label{
            line-height: 35px!important;
        }



    </style>


</head>
<body>

<%
    String username= (String) request.getAttribute("username");
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
        <div  style=" padding-left:0px;margin-left: 0px;margin-right: 0px;">
            <div class="row" id="row" style="width: 100%; margin:0px;background-color: #222D32 ">
                <%--左侧导航条--%>
                <div class="col-lg-2" style="padding:0px; ">
                    <div id="autoheight" style="background-color: #222D32;height:auto">
                    <div style="position: relative; height: 75px;width: 281.25px;background-color:#222D32">
                        <img src="${pageContext.request.contextPath}/images/loginimg.jpg" style="position: absolute;top:15px;left: 20px; border-radius: 25px;">
                        <div id="loginimg">
                            <p><%=username%></p>
                            <p>在线..</p>
                        </div>
                    </div>

                    <div id="mya">
                        <a style=" color:#B8C7CE; background-color: #1A2226; padding: 12px 5px 12px 15px;">菜单</a>
                    </div>

                    <div class="panel-group " id="panelgroup" >
                        <%
                            List<List<NavF>> list= (List<List<NavF>>) request.getAttribute("lists");
                            for (List<NavF> lists :
                                    list) {
                                if(lists.size()>0){

                        %>

                        <%--导航栏--%>
                        <div class="panel mypanel" id="firstpanel" style="border:none;">
                            <a class="panel-heading active" id="firstpanelimpl"  data-toggle="collapse" data-parent="#panelgroup" data-target="#panel<%=lists.get(0).getNavss().getNavsid()%>">
                                <span class="glyphicon glyphicon-book"></span><%=lists.get(0).getNavfname() %>
                                <span class="glyphicon <%if(lists.get(0).getNavfname().equals("菜单管理专区")){%>glyphicon-chevron-down<%}else{%>glyphicon-chevron-left<%}%> pull-right"></span>

                            </a>
                            <div class=" panel-collapse collapse <%if(lists.get(0).getNavfname().equals("菜单管理专区")){%>in<%}%>"  id="panel<%=lists.get(0).getNavss().getNavsid()%>">
                                <div class="panel-body" style=" border: none; padding:0px 15px 0px 5px;">
                                    <ul class="nav">
                                        <%
                                            int index=lists.size();
                                            if(index>0){
                                            for(int i=0;i<index;i++){
                                        %>
                                        <li><a <%if(lists.get(i).getNavss().getNavsname().equals("菜单添加")){%>style="background-color: #1A2226;color: #ffffff;" <%}%> href="<%=lists.get(i).getNavss().getNavsherf()%>">
                                            <span class="glyphicon glyphicon-record"></span><%=lists.get(i).getNavss().getNavsname()%></a></li>

                                        <%
                                            }}
                                        %>
                                    </ul>
                                </div>
                            </div>

                            </div>
                        <%}}%>
                    </div>


                    </div>

                </div>

                <%--右侧主要内容--%>
                <div class="col-lg-10" id="content-right" style="height: auto ;position: relative">
                    <div id="content-header">
                        <h3 style="margin:0px;" class="page-header">
                            MENU编辑
                            <small>编辑</small>
                            <a href="#" class="pull-right" style="font-size: xx-small"><span class="glyphicon glyphicon-tag"></span>编辑</a>
                        </h3>
                    </div>

                    <footer class="main-footer" >
                        <p style="margin-bottom: 0px; padding-left: 20px;"><big>欢迎登陆IT社区！</big><small>Welcome to the IT system.</small></p>
                    </footer>


                    <%--底部标签--%>
                    <div id="content" style="margin-bottom: 50px">

                        <%--添加菜单--%>
                        <div style="background-color: #ffffff; padding:10px;height:auto">
                            <form action="../adminController/addnav" name="addform" enctype="multipart/form-data" method="post">
                                <div style="padding: 10px;">
                                    <div class="headline" >
                                        <p >添加菜单</p>
                                    </div>

                                    <%--菜单名--%>
                                    <div class="row">
                                        <div class="col-md-2 title">菜单名</div>
                                        <div class="col-md-10 data">
                                            <input  class="form-control" type="text" name="navname" >
                                        </div>
                                    </div>

                                    <%--菜单级别--%>
                                    <div class="row">
                                        <div class="col-md-2 title">菜单级别</div>
                                        <div class="col-md-10 data">
                                            <select class="form-control" id="grand" name="grand">
                                                <option value=null>>======请选择======<</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                            </select>
                                        </div>

                                    </div>

                                    <div id="area" class="row">
                                        <div class="col-md-2 title" >所属区域</div>
                                        <div class="col-md-10 data">
                                            <label><input  type="radio" name="navfmark" value="0" >用户区域</label>
                                            <label><input  type="radio" name="navfmark" value="1">管理员区域</label>
                                        </div>
                                    </div>

                                    <%--所属父级--%>
                                    <div id="belongnavf" class="row">
                                        <div class="col-md-2 title" >所属父级</div>
                                        <div class="col-md-10 data">
                                            <select class="form-control" id="nav" name="navf">

                                            </select>
                                        </div>
                                    </div>

                                    <%--二级标签链接--%>
                                    <div id="link" class="row">
                                        <div class="col-md-2 title" >标签链接</div>
                                        <div class="col-md-10 data">
                                            <input  class="form-control" type="text" name="href" value="">
                                        </div>
                                    </div>


                                    <div class="row" style="margin-top:30px;">
                                        <div class="col-md-12" style="text-align: center">
                                            <button type="submit" class="btn btn-danger">保存</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                        <%
                            String grand= (String) request.getAttribute("grand");
                            NavF navF= (NavF) request.getAttribute("navF");
                            NavS navS= (NavS) request.getAttribute("navS");
                            List<Nav> navFLists= (List<Nav>) request.getAttribute("navFLists");
                        %>
                        <%--编辑菜单--%>
                        <div style="background-color: #ffffff;margin-top: 20px; padding:10px;height:auto">
                            <form action="menuupdate" name="addform" method="post">
                                <div style="padding: 10px;">
                                    <div class="headline" >
                                        <p >编辑菜单</p>
                                    </div>

                                    <input type="hidden" name="navid" value="<%if(grand!=null){if(grand.equals("1")){%><%=navF.getNavfid()%><%}else{%><%=navS.getNavsid()%><%}}%>">
                                    <%--菜单名--%>
                                    <div class="row">
                                        <div class="col-md-2 title">菜单名</div>
                                        <div class="col-md-10 data">
                                            <input  class="form-control" type="text" name="navname" value="<%if(grand!=null){if(grand.equals("1")){%><%=navF.getNavfname()%><%}else {%><%=navS.getNavsname()%><%}}%>">
                                        </div>
                                    </div>

                                    <%--菜单级别--%>
                                    <div class="row">
                                        <div class="col-md-2 title">菜单级别</div>
                                        <div class="col-md-10 data">
                                            <label><input  type="radio" name="grand" class="check disabled" value="1" <%if(grand!=null){if(grand.equals("1")){%>checked<%}}%>>一级标签</label>
                                            <label><input  type="radio" name="grand" class="check disabled" value="2"<%if(grand!=null){if(grand.equals("2")){%>checked<%}}%>>二级标签</label>
                                        </div>

                                    </div>

                                    <%--所属区域--%>
                                    <%if(grand!=null&&grand.equals("1")){%>
                                    <div id="area" class="row">
                                        <div class="col-md-2 title" >所属区域</div>
                                        <div class="col-md-10 data">
                                            <label><input  type="radio" name="navfmark" value="0" <%if(navF.getNavfmark()==0){%>checked<%}%>>用户区域</label>
                                            <label><input  type="radio" name="navfmark" value="1" <%if(navF.getNavfmark()==1){%>checked<%}%>>管理员区域</label>
                                        </div>
                                    </div>
                                    <%}%>

                                    <%if(grand!=null&&grand.equals("2")){%>
                                    <%--所属父级--%>
                                    <div class="row">
                                        <div class="col-md-2 title" >所属父级</div>
                                        <div class="col-md-10 data">
                                            <select class="form-control" name="navf">
                                            <%for(Nav nav : navFLists){%>
                                                <option value="<%=nav.getNavid()%>" <%if(nav.getNavid()==navS.getNavfid()){%>selected<%}%>>
                                                    <%=nav.getNavfname()%>
                                                </option>
                                            <%}%>
                                            </select>
                                        </div>
                                    </div>
                                    <%}%>

                                    <%if(grand!=null&&grand.equals("2")){%>
                                    <%--二级标签链接--%>
                                    <div class="row">
                                        <div class="col-md-2 title" >标签链接</div>
                                        <div class="col-md-10 data">
                                            <input  class="form-control" type="text" name="navshref" value="<%=navS.getNavsherf()%>">
                                        </div>
                                    </div>
                                    <%}%>



                                    <div class="row" style="margin-top:30px;">
                                        <div class="col-md-12" style="text-align: center">
                                            <button type="submit" class="btn btn-danger">保存</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>

                    </div>
                </div>
            </div>



</body>

<script>
    $("#grand").change(function() {
        var nav=document.getElementById("nav");
        function setDivtc(item){
            var option = '<option value="'+item.navid+'">'
                + item.navfname
                + '</option>';
            return option;
        }
        //获取选中的下拉条
        var checkedOfSelect = $("#grand").val();

        if(checkedOfSelect==2){
            $("#belongnavf").show();
            $("#link").show();
            $("#area").hide();
            $.ajax({
                type:"GET",
                url:"../adminController/navfind",
                dataType:"JSON",
                async:false,
                success:function (navList) {
                    var html = '';
                    for(var list in navList){
                        html += setDivtc(navList[list]);
                    }
                    // alert(html);
                    nav.innerHTML = html;
                },
                error:function (msg) {
                    alert(msg);
                    alert("错误");
                }
            });
        }else if(checkedOfSelect==1){
            $("#belongnavf").hide();
            $("#link").hide();
            $("#area").show();
        }else{
            $("#belongnavf").show();
            $("#link").show();
            $("#area").show();
        }
    });
</script>

<script>

    $(document).ready(function () {
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
