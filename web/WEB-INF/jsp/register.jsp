<%--
  Created by IntelliJ IDEA.
  User: 25406
  Date: 2019/8/11
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>register.html</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/jQuery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/other/holder.min.js"></script>


    <style>
        .carousel-indicators{
            display: none;
        }
        #font{
            color: #ffffff;
        }

        .main{
            padding:0;
            margin:0px;
            width:100%;
            height: 100%;

        }
        .main1{
            background: #000000;
            padding:0;
            height: 130px;
            text-align: center;
            width: 100%;
            color: #c0c0c0;
        }
        .tab{
            position: absolute;
            top:150px;
            right:400px;
            background: none;
            text-align: center;
            background: #ffffff;
            border: 1px solid #cccccc;
            border-radius:40px;
            width: 500px;
            height: 500px;
            font-family: 华文宋体;

        }
        .glyphicon{
            font-size: large;
        }

        .form-group{
            margin: 40px;
        }

        #label{
            font-weight:bolder;
            font-size: 30px;
        }
        p{
            font-size: medium;
        }
        img{
            width: 100%!important;
            height: calc(100vh - 188px)!important;
        }
        .item{
            width: 100%!important;
        }
        .navbar{
            margin:0px;
        }


    </style>
    <script>
        function check(){
            var username=$("#username").val();
            var password=$("#password").val();
            var phone=$("#phonenum").val();
            if (phone == "" || phone==null) {
                alert("请输入手机号");
                return false;
            }
            if(isNaN(phone)){
                alert("请输入正确手机号");
                return false;
            }else{
                if(phone.length!=11) {
                    alert("请输入正确手机号");
                    return false;
                }
            }
            if(username=="" || username==null){
                alert("请输入用户名");
                return false;
            }
            if (password == "" || password==null) {
                alert("请输入密码");
                return false;
            }
        }
    </script>
</head>
<body>
<div class="container main">
    <nav class="navbar navbar-inverse">
        <div class="container">
            <div class="navbar-header">
                <a href="" class="navbar-brand">
                    <p style="font-size: 20px">IT社区</p>
                </a>
                <button class="navbar-toggle collapsed" data-toggle="collapsed" data-target="#mynavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>

            <div id="mynavbar" class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li id="font"><p class="navbar-text" style="font-size:18px; ">欢迎！</p></li>
                </ul>

            </div>
        </div>
    </nav>

    <div  class="mian" >
        <div id="mycarousel" data-ride="carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="item active">
                    <img src="${pageContext.request.contextPath}/images/1.jpg" >
                </div>
                <div class="item">
                    <img src="${pageContext.request.contextPath}/images/2.jpg">
                </div>
            </div>

        </div>

    </div>
    <ol class="carousel-indicators">
        <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
        <li data-target="#mycarousel" data-slide-to="1"></li>
    </ol>

    <div class="tab">
        <form name="form" role="form" class="form-group-lg" action="add" method="post" onsubmit="return check();">
            <label id="label" style="padding-top:30px; letter-spacing: 10px;">用户注册</label>
            <br>
            <div class="form-group form-inline text3 "style="margin-top: 30px;">
                <label for="phonenum"><span class="glyphicon glyphicon-earphone"></span></label>
                <input type="text" name="phonenum" class="form-control" id="phonenum" placeholder="请输入手机号" style="width: 300px; height: 40px;">
            </div>

            <div class="form-group  form-inline text1" style="margin-top: 30px;">
                <label for="username"><span class="glyphicon glyphicon-user"></span></label>
                <input type="text" name="username" class="form-control" id="username" placeholder="请输入用户名" style="width: 300px; height: 40px;">
            </div>

            <div class="form-group form-inline text2 "style="margin-top: 30px;">
                <label for="password"><span class="glyphicon glyphicon-lock"></span></label>
                <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码" style="width: 300px; height: 40px;">
            </div>

            <button class="btn btn-default btn-lg" type="submit" style="width: 150px; font-weight: bolder;">注册</button>

            <div class="form-group" style="margin-top: 20px;">
                <p><a href="" >用户注册</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="login"> 用户登录</a></p>
            </div>

        </form>
    </div>

    <div class="container main1">
        <div class="contaimer" style="margin-top: 20px;">
            <p>
                合肥学院(Hefei University)简称合院，是国家首批61所"卓越工程师教育培养计划"和首批52所"服务国家特殊需求人才培养项目"培养硕士专业学位研究生试点工作单位之一、<br/>
                中德合作共建应用型人才培养示范高校、安徽省示范应用型本科高校、硕士学位授权单位、 全国应用型本科高校联盟副主任单位和安徽省应用型本科高校联盟常任主席单位，同时也是安徽省8所可接纳港澳台学生的高校之一<br/>2014年学校成为安徽省高等教育振兴计划"地方应用型高水平大学建设"高校。<br>
                地址：合肥 合肥市蜀山区锦绣大道99号<br>
            </p>
        </div>

    </div>
</div>


</body>
<script>

    $("document").ready(function () {
        $("#phonenumber").blur(function () {
            if($("#phonenumber").val()=="") {
                $(".text3").addClass("has-error");
            }
        });
        $("#username").blur(function () {
            if($("#username").val()=="") {
                $(".text1").addClass("has-error");
            }
        });
        $("#password").blur(function () {
            if($("#password").val()=="") {
                $(".text2").addClass("has-error");
            }
        });
    });

</script>
</html>
