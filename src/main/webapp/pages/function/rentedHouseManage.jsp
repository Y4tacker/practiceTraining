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
<body>
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
<div class="layui-form" id="form_houseinfo" style="width:500px;display:none">
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">客户账户 <span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="tenantName" placeholder="客户账户名"style="width:300px"
                   id="tenantName"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">真实姓名<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="realName" required lay-verify="required" placeholder="真实姓名"style="width:300px"
                   autocomplete="off" class="layui-input" id="realName">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">租房地址<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="address" required lay-verify="required" placeholder="地址"style="width:300px"
                   autocomplete="off" class="layui-input" id="address">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">租赁房屋<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="houseName" required lay-verify="required" placeholder="租赁房屋"style="width:300px"
                   autocomplete="off" class="layui-input" id="houseName">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">联系电话<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="phoneNumber" required lay-verify="required" placeholder="联系电话"style="width:300px"
                   autocomplete="off" class="layui-input" id="phoneNumber">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">邮箱地址<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="email" required lay-verify="required"style="width:300px"
                   placeholder="邮箱" autocomplete="off"
                   class="layui-input" id="email">
        </div>
    </div>
</div>
</html>
