<%--
  Created by IntelliJ IDEA.
  User: steve95
  Date: 2020/7/13
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>房屋租赁平台 - 注册</title>
    <%@ include file="/pages/common/head.jsp"%>
    <style>
        body {
            background-image: url("static/images/bg.jpg");
            background-size:100% 100% ;
            background-attachment: fixed;
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

        .layui-icon-email {
            color: #a78369 !important;
        }

        .layui-icon-email:hover {
            color: #9dadce !important;
        }

        .admin-input-username {
            border-top-style: solid;
            border-radius: 10px 10px 0 0;
        }

        .admin-input-verify {
            border-radius: 0 0 10px 10px;
        }

        .layui-icon-note {
            color: #a78369 !important;
        }

        .layui-icon-note:hover {
            color: #9dadce !important;
        }

        .admin-button {
            margin-top: 20px;
            font-weight: bold;
            font-size: 18px;
            width: 300px;
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

        i {
            position: absolute;
        }

    </style>
</head>
<body>
<div class="admin-login-background">
    <div class="admin-header">
        <span>房屋租赁平台</span>
    </div>
    <form class="layui-form" action="/register" method="post">
        <div>
            <i class="layui-icon layui-icon-username admin-icon"></i>
            <input type="text" name="username" id="username" placeholder="用户名" autocomplete="off"
                   class="layui-input admin-input admin-input-username"/>
        </div>
        <div>
            <i class="layui-icon layui-icon-password admin-icon"></i>
            <input type="password" name="password" id="password" placeholder="密码" class="layui-input admin-input"/>
        </div>
        <div>
            <i class="layui-icon layui-icon-password admin-icon"></i>
            <input type="password_verify" name="password_verify" id="password_verify" placeholder="确认密码"
                   class="layui-input admin-input"/>
        </div>
        <div>
            <i class="layui-icon layui-icon-note admin-icon"></i>
            <input type="text" name="invite_code" id="invite_code" placeholder="邀请码" autocomplete="off"
                   class="layui-input admin-input admin-input-verify"/>
        </div>
        <input type="button" value="注 册" class="layui-btn admin-button submit-btn" lay-submit lay-filter="login"/>
    </form>
</div>
<script>
layui.use(["layer", "jquery"], function () {
    var layer = layui.layer;
    var $ = layui.jquery;
    $(".submit-btn").click(function () {
        var username = $('#username').val();
        var password = $("#password").val();
        var password_verify = $("#password_verify").val();
        var invite_code = $("#invite_code").val();
        if (username.length <= 0 || password.length <= 0) {
            layer.msg("用户名或密码不能为空",{
                time: 600,
            });
            return false;
        }
        $.ajax({
            url: "/register",
            type: 'POST',
            dataType: 'json',
            data: {
                "username": username,
                "password": password,
                "password_verify": password_verify,
                "invite_code": invite_code
            },
            success: function (res) {
                if(res.code == 0){
                    window.location="/home"
                }
                else {
                    layer.msg(res.msg, {
                        time: 600,
                    });
                }
            }
        });
    })
})
</script>
</body>
</html>
