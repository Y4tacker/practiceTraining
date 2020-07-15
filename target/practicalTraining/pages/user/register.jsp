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

        .layui-icon-cellphone {
            color: #a78369 !important;
        }

        .layui-icon-cellphone:hover {
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

        .admin-captcha-icon {
            margin-left: 130px;
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
    <form class="layui-form" action="userServlet" method="post">
        <div>
            <input type="hidden" name="action" value="register">
            <input type="hidden" name="msg" id="msg" value="${requestScope.msg}">
            <i class="layui-icon layui-icon-username admin-icon"></i>
            <input type="text" name="username" id="username" placeholder="用户名" autocomplete="off"
                   value="${requestScope.username}" class="layui-input admin-input admin-input-username" />
        </div>
        <div>
            <i class="layui-icon layui-icon-password admin-icon"></i>
            <input type="password" name="password" id="password" placeholder="密码" class="layui-input admin-input"/>
        </div>
        <div>
            <i class="layui-icon layui-icon-password admin-icon"></i>
            <input type="password" name="password_verify" id="password_verify" placeholder="确认密码"
                   class="layui-input admin-input"/>
        </div>
        <div>
            <i class="layui-icon layui-icon-cellphone admin-icon"></i>
            <input type="phone" name="phone" id="phone" placeholder="手机号"
                   value="${requestScope.phone}" class="layui-input admin-input"/>
        </div>
        <div>
            <i class="layui-icon layui-icon-vercode admin-captcha-icon"></i>
            <input type="text" name="captcha" id="captcha" placeholder="验证码"
                   value="${requestScope.code}"class="layui-input admin-input-captcha"/>
            <img id="codeImg" alt="" src="captcha.jpg" style="float: right; margin-right: 0px; width:130px;height:50px;" class="vercode-img">
        </div>
        <input type="submit" value="注 册" class="layui-btn admin-button submit-btn" lay-submit lay-filter="login"/>
    </form>
</div>
<script>
layui.use(["layer", "jquery"], function () {
    var layer = layui.layer;
    var $ = layui.jquery;
    var change = $(function () {
        $("#codeImg").click(function () {
            this.src = "captcha.jpg?time=" + +new Date();
        });
    })
    //正则匹配验证输入
    $(function () {
        // 给注册绑定单击事件
        $(".submit-btn").click(function () {
            // 验证用户名：必须由字母，数字下划线组成，并且长度为5到12位
            //1 获取用户名输入框里的内容
            var usernameText = $("#username").val();
            //2 创建正则表达式对象
            var usernamePatt = /^\w{5,12}$/;
            //3 使用test方法验证
            if (!usernamePatt.test(usernameText)) {
                //4 提示用户结果
                layer.msg("用户名不合法！",{
                    time: 600,
                });

                return false;
            }

            // 验证密码：必须由字母，数字下划线组成，并且长度为5到12位
            //1 获取用户名输入框里的内容
            var passwordText = $("#password").val();
            //2 创建正则表达式对象
            var passwordPatt = /^\w{5,12}$/;
            //3 使用test方法验证
            if (!passwordPatt.test(passwordText)) {
                //4 提示用户结果
                layer.msg("密码不合法！",{
                    time: 600,
                });

                return false;
            }

            // 验证确认密码：和密码相同
            //1 获取确认密码内容
            var repwdText = $("#password_verify").val();
            //2 和密码相比较
            if (repwdText != passwordText) {
                //3 提示用户
                layer.msg("密码与确认密码不符合请重新输入",{
                    time: 600,
                });
                $("#password_verify").val('')
                $("#password").val('')
                return false;
            }

            // 手机号验证
            var phoneText = $("#phone").val();
            var phonePatt = /^1[345789]\d{9}$/;
            if (!phonePatt.test(phoneText)) {
                //4 提示用户
                layer.msg("手机号格式不正确请检查！",{
                    time: 600,
                });

                return false;
            }

            // 验证码
            var codeText = $("#captcha").val();
            //去掉验证码前后空格
            codeText = $.trim(codeText);
            if (codeText == null || codeText == "") {
                layer.msg("验证码不能为空",{
                    time: 600,
                });

                return false;
            }


        });

    });
    //用户名校验
    $(function(){
        $("#username").blur(
            function () {
                var username= this.value;
                // 返回数据类型JSON{existUser:true/false}
                // url:userServlet
                $.ajax({
                    url: "userServlet",
                    type: 'POST',
                    dataType: 'json',
                    data:{
                        "action":"existUser",
                        "username":username,
                    },
                    success: function(data){
                        if(data.existUsername){
                            $("#username").val('');
                            layer.msg("用户名已存在");

                        }
                    }

                })
            })
    })
    //返回错误信息
    window.onload = function(){
        var message = $('#msg').val();
        if (message.length > 0){
            $("#codeImg").src = "captcha.jpg?time=" + +new Date();
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
