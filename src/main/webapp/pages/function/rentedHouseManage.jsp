<%--
  Created by IntelliJ IDEA.
  User: steve95
  Date: 2020/7/15
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <%@include file="../common/head.jsp"%>
    <title>预定订单管理</title>
</head>
<body bgcolor="white">
<table class="layui-hide" id="houseinfo-table" lay-filter="houseinfo-table"></table>
<script type="text/html" id="operation">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">已查看</a>
</script>
<script type="text/javascript">
    layui.use(['form', 'element', 'jquery', 'table', 'layer'], function () {
        var element = layui.element
            , form = layui.form
            , table = layui.table
            , $ = layui.jquery
            , layer = layui.layer
        var account_table = table.render({
            elem: '#houseinfo-table',
            url: 'houseServlet?action=pageForRented',
            height: 'auto',
            title: '订单信息',
            toolbar: 'true',
            page: true,
            limit:15,
            cols: [
                [
                    {field: 'tenantName', title: '客户账户', sort: true,},
                    {field: 'realName', title: '真实姓名'},
                    {field: 'address', title: '租房地址'},
                    {field: 'houseName', title: '租赁房屋'},
                    {field: 'phoneNumber', title: '联系电话'},
                    {field: 'email', title: '邮箱'}
                ],
            ]
        });
    });
</script>
</body>
</html>
