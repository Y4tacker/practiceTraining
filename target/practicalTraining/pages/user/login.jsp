<%@ page import="org.apache.xpath.operations.String" %><%--
  Created by IntelliJ IDEA.
  User: steve95
  Date: 2020/7/13
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>


<html>
<head>
    <title>房屋租赁平台 - 登录</title>
    <%@ include file="/pages/common/head.jsp"%>
    <style>
        body {
            background-image: url("static/images/bg.jpg");
            background-size:100% 100% ;
            background-attachment: fixed;
        }

        #container {
            height: 100%;
            width: 100%;
        }

        input:-webkit-autofill {
            -webkit-box-shadow: inset 0 0 0 1000px #fff;
            background-color: transparent;
        }

        .admin-login-background {
            width: 300px;
            height: 300px;
            position: absolute;
            left: 70%;
            top: 40%;
            margin-left: -150px;
            margin-top: -100px;
        }

        .admin-header {
            text-align: center;
            margin-bottom: 20px;
            color: #ffffff;
            font-weight: bold;
            font-size: 40px
        }

        .admin-input {
            border-top-style: none;
            border-right-style: solid;
            border-bottom-style: solid;
            border-left-style: solid;
            height: 50px;
            width: 300px;
            padding-bottom: 0px;
        }

        .admin-input-captcha {
            border-top-style: none;
            border-right-style: solid;
            border-bottom-style: solid;
            border-left-style: solid;
            height: 50px;
            width: 170px;
            padding-bottom: 0px;
            vertical-align:center;
            display:block;
            float:left;
        }

        .admin-input::-webkit-input-placeholder {
            color: #a78369
        }

        .layui-icon-username {
            color: #a78369 !important;
        }

        .layui-icon-username:hover {
            color: #9dadce !important;
        }

        .layui-icon-password {
            color: #a78369 !important;
        }

        .layui-icon-password:hover {
            color: #9dadce !important;
        }

        .layui-icon-vercode {
            color: #a78369 !important;
        }

        .layui-icon-vercode:hover {
            color: #9dadce !important;
        }

        .admin-input-username {
            border-top-style: solid;
            border-radius: 10px 10px 0 0;
        }

        .admin-input-verify {
            border-radius: 0 0 10px 10px;
        }

        .admin-button {
            margin-top: 20px;
            font-weight: bold;
            font-size: 18px;
            width: 150px;
            height: 50px;
            border-radius: 5px;
            background-color: #009688;
            border: 1px solid #5FB878
        }
        .admin-button1 {
            margin-top: 20px;
            font-weight: bold;
            font-size: 18px;
            width: 150px;
            height: 50px;
            border-radius: 5px;
            background-color: #009688;
            border: 1px solid #5FB878
        }

        .admin-icon {
            margin-left: 260px;
            margin-top: 10px;
            font-size: 30px;
        }

        .admin-captcha-icon {
            margin-left: 130px;
            margin-top: 10px;
            font-size: 30px;
        }

        i {
            position: absolute;
        }

        .vercode-img{
            vertical-align: middle;
            float:left;
        }
    </style>
</head>
<body>
<div class="admin-login-background">
    <div class="admin-header">
        <span>房屋租赁平台</span>
    </div>
    <form class="layui-form" action="userServlet" method="post">
        <div>
            <i class="layui-icon layui-icon-username admin-icon"></i>
            <input type="hidden" name="action" value="login">
            <input type="hidden" name="msg" id="msg" value="${requestScope.msg}">
            <input type="text" name="username" id="username" placeholder="用户名" autocomplete="off"
               value="${requestScope.username}" class="layui-input admin-input admin-input-username"/>
        </div>
        <div>
            <i class="layui-icon layui-icon-password admin-icon"></i>
            <input type="password" name="password" id="password" placeholder="密码"
                   value="${requestScope.password}" class="layui-input admin-input"/>
        </div>
        <div>
            <i class="layui-icon layui-icon-vercode admin-captcha-icon"></i>
            <input type="text" name="captcha" id="captcha" placeholder="验证码"
                   value="${requestScope.code}"class="layui-input admin-input-captcha"/>
            <img id="codeImg" alt="" src="captcha.jpg" style="float: right; margin-right: 0px; width:120px;height:50px;" class="vercode-img">
        </div>
        <div class="layui-btn-group">
            <input type="submit" value="登 录" class="layui-btn admin-button submit-btn" lay-submit lay-filter="login"/>
            <input type="button" value="注 册" class="layui-btn admin-button1 submit-btn1" lay-submit lay-filter="login"/>
        </div>
    </form>
</div>
<script>
    layui.use(["layer", "jquery"], function () {
        var layer = layui.layer;
        var $ = layui.jquery;
        $(".submit-btn").click(function () {
            var username = $('#username').val();
            var password = $("#password").val();
            var code = $("#codeImg").val();
            if (username.length <= 0 || password.length <= 0){
                layer.msg("用户名或密码不能为空",{
                    time: 600,
                });
                return false;
            }else if(code.length <= 0){
                layer.msg("验证码不能为空",{
                    time: 600,
                });
                return false;
            }

        })
        $(".submit-btn1").click(function () {
            window.location="pages/user/register.jsp"
        })
        $(function () {
            $("#codeImg").click(function () {
                this.src = "captcha.jpg?time=" + +new Date();
            });
        })
        //返回错误信息
        window.onload = function(){
            var message = $('#msg').val();
            if (message.length > 0){
                layer.msg(message,{
                    time: 800,
                });
                return false;
            }
        };
    })
</script>
</body>
</html>
