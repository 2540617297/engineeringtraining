<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.List" %>
<%@ page import="po.nav.NavF" %>
<%@ page import="po.user.User" %>
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
    String mark= (String) request.getAttribute("mark");
    User userinformation=(User)request.getAttribute("userinformation");
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
                            <li class="leave"><a href="login">切换账户</a></li>
                            <li class="leave"><a href="login">退出登录</a></li>
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
                    <div id="autoheight" style="background-color: #222D32;">
                    <div style="position: relative; height: 75px;width: 281.25px;background-color:#222D32">
                        <img src="${pageContext.request.contextPath}/images/loginimg.jpg" style="position: absolute;top:15px;left: 20px; border-radius: 25px;">
                        <div id="loginimg">
                            <p><%=username%></p>
                            <p>在线..</p>
                        </div>
                    </div>

                    <div id="mya">
                        <a style=" color:#B8C7CE; background-color: #1A2226; padding: 12px 5px 12px 15px;">菜单</a>
                        <a style="background-color: #1A2226;color: #ffffff;" href="../navController/all_admin_index"><span class="glyphicon glyphicon-book"></span>首页</a>
                    </div>

                    <div class="panel-group " id="panelgroup" >
                        <%
                            List<List<NavF>> list= (List<List<NavF>>) request.getAttribute("lists");
                            for (List<NavF> lists :
                                    list) {
                        %>

                        <%--导航栏--%>
                        <div class="panel mypanel" id="firstpanel" style="border:none;">
                            <a class="panel-heading active" id="firstpanelimpl"  data-toggle="collapse" data-parent="#panelgroup" data-target="#panel<%=lists.get(0).getNavss().getNavsid()%>">
                                <span class="glyphicon glyphicon-book"></span><%=lists.get(0).getNavfname() %>
                                <span class="glyphicon <%if(lists.get(0).getNavss().getNavsname().equals("个人资料")){%>glyphicon-chevron-down<%}else{%>glyphicon-chevron-left<%}%> pull-right"></span>

                            </a>
                            <div class=" panel-collapse collapse <%if(lists.get(0).getNavss().getNavsname().equals("个人资料")){%>in<%}%>"  id="panel<%=lists.get(0).getNavss().getNavsid()%>">
                                <div class="panel-body" style=" border: none; padding:0px 15px 0px 5px;">
                                    <ul class="nav">
                                        <%
                                            int index=lists.size();
                                            for(int i=0;i<index;i++){
                                        %>
                                        <li><a <%if(lists.get(i).getNavss().getNavsname().equals("个人资料")){%>style="background-color: #1A2226;color: #ffffff;" <%}%> href="<%=lists.get(i).getNavss().getNavsherf()%>?username=<%=userinformation.getUsername()%>&postnavs=<%=lists.get(i).getNavss().getNavsid()%>">
                                            <span class="glyphicon glyphicon-record"></span><%=lists.get(i).getNavss().getNavsname()%></a></li>

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
                            个人资料
                            <small>首页</small>
                            <a href="#" class="pull-right" style="font-size: xx-small"><span class="glyphicon glyphicon-tag"></span>首页</a>
                        </h3>
                    </div>

                    <div id="content" style="margin-bottom: 50px;height: calc(100vh - 170px);">
                        <%--添加表单--%>
                        <div style="background-color: #ffffff; padding:10px;height: 715px">
                            <form action="editInformation" name="addform" enctype="multipart/form-data" method="post">
                                <div style="padding: 10px;">
                                    <div class="headline" >
                                        <p >个人资料</p>
                                    </div>

                                    <input name="userid" type="hidden" value="<%=userinformation.getId()%>">
                                    <%--用户名--%>
                                    <div class="row">
                                        <div class="col-md-2 title" >用户名</div>
                                        <div class="col-md-10 data">
                                            <input  class="form-control" type="text" name="username" value="<%=userinformation.getUsername()%>">
                                        </div>
                                    </div>

                                    <%--密码--%>
                                    <div class="row">
                                            <div class="col-md-2 title" >密码</div>
                                            <div class="col-md-10 data">
                                                <input  class="form-control" type="text" name="password" value="<%=userinformation.getPassword()%>">
                                            </div>

                                    </div>

                                    <%--姓名--%>
                                    <div class="row">
                                        <div class="col-md-2 title" >姓名</div>
                                        <div class="col-md-10 data">
                                            <input  class="form-control" type="text" name="name" value="<%=userinformation.getName()%>">
                                        </div>
                                    </div>

                                    <%--性别--%>
                                    <div class="row">
                                        <div class="col-md-2 title" >性别</div>
                                        <div class="col-md-10 data">
                                            <label><input  type="radio" name="gender" value="男" <% if(userinformation.getGender()!=null){if(userinformation.getGender().equals("男")){%> checked<%}}%>>男</label>
                                            <label><input  type="radio" name="gender" value="女"<%if(userinformation.getGender()!=null){if(userinformation.getGender().equals("女")){%>checked<%}}%>>女</label>
                                        </div>
                                    </div>

                                    <%--出生日期--%>
                                    <div class="row">
                                        <div class="col-md-2 title" >出生日期</div>
                                        <div class="col-md-10 data">
                                            <%--<input type="text" class="form-control" onclick="WdatePicker({el:this,isShowOthers:true,dateFmt:'yyyy-MM-dd'});"/>--%>
                                            <input  class="form-control" type="date" name="birthday" value="<%=userinformation.getBirthday()%>">
                                        </div>
                                    </div>

                                    <%--电话号码--%>
                                    <div class="row">
                                        <div class="col-md-2 title" >电话号码</div>
                                        <div class="col-md-10 data">
                                            <input  class="form-control" type="text" name="phonenum" value="<%=userinformation.getPhonenum()%>">
                                        </div>
                                    </div>

                                    <%--个人积分--%>
                                    <div class="row">
                                        <div class="col-md-2 title" >个人积分</div>
                                        <div class="col-md-10 data">
                                            <%if(!mark.equals("1")){%>
                                            <label><%=userinformation.getIntegral()%></label>
                                            <%}else{%>
                                            <input  class="form-control" type="text" name="integral" value="<%=userinformation.getIntegral()%>">
                                            <%}%>
                                        </div>
                                    </div>

                                    <%--特长--%>
                                    <div class="row">
                                        <div class="col-md-2 title" style="height: 82px;" ><p style="margin-top: 20px;">特长</p></div>
                                        <div class="col-md-10 data" >
                                            <textarea class="form-control" name="speciality" rows="3"><%=userinformation.getSpeciality()%></textarea>
                                        </div>
                                    </div>


                                    <%--图片--%>
                                    <div class="row">
                                        <div class="col-md-2 title" >个人图片</div>
                                        <div class="col-md-10 data" >
                                            <input style="height: 34px;" type="file" name="photo">
                                        </div>
                                    </div>

                                    <%if(mark.equals("1")){%>
                                    <div class="row">
                                        <div class="col-md-2 title" >身份</div>
                                        <div class="col-md-10 data">
                                            <label><input  type="radio" name="mark" value="0" <% if(userinformation.getMark()==0){%>checked<%}%>>用户</label>
                                            <label><input  type="radio" name="mark" value="1" <% if(userinformation.getMark()==1){%>checked<%}%>>管理员</label>
                                        </div>
                                    </div>
                                    <%}%>


                                    <div class="row" style="margin-top:30px;">
                                        <div class="col-md-12" style="text-align: center">
                                            <button type="submit" class="btn btn-danger">保存</button>
                                            <a href="person-information.jsp" class="btn btn-default">编辑</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>


                    <%--底部标签--%>
                    <footer class="main-footer" >
                        <p style="margin-bottom: 0px; padding-left: 20px;"><big>欢迎登陆IT社区！</big><small>Welcome to the IT system.</small></p>
                    </footer>

                    </div>
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
