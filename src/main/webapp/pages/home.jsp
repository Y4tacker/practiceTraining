<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html style="font-size: 30.7292px; min-width: 1440px;">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%@ include file="/pages/common/head.jsp"%>
    <title>成都市房屋租赁管理系统</title>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">l房屋租赁管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">用户信息</a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href=""><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">修改信息</a></dd>
                    <dd><a href="javascript:;">安全管理</a></dd>
                    <dd><a href="javascript:;">退了</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item" id="logout" ><a href="userServlet?action=logout">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;">房产管理</a>
             <!--       <dl class="layui-nav-child">
                        <dd><a href="javascript:;">添加信息</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="javascript:;">列表三</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl> -->
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">租客管理</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">列表一</a></dd>
                        <dd><a href="javascript:;">列表二</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">统计报表</a></li>
                <li class="layui-nav-item"><a href="">我的账单</a></li>
                <li class="layui-nav-item"><a href="">系统公告</a></li>
                <li class="layui-nav-item"><a href="">快捷操作</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">内容主体区域</div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<script>
    //JavaScript代码区域
    layui.use(['element','jquery'], function(){
        var element = layui.element;
        var $ = layui.jquery;}
</script>
</body>
