<%--
  Created by IntelliJ IDEA.
  User: 王座我不感兴趣，砍碎它才让我兴奋
  Date: 2020/7/18
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <%@include file="../common/head.jsp"%>
    <title>我的账单</title>
    <style type="text/css">
        div.layui-unselect{width:300px;pxvertical-align: middle;float:left;} div.layui-form-select{width:300px;pxvertical-align: middle;float:left;} div.layui-form-selected{width:300px;pxvertical-align: middle;float:left;}
    </style>
</head>
<body>
<table class="layui-hide" id="houseinfo-table" lay-filter="houseinfo-table"></table>
<script type="text/html" id="operation">
    <a class="layui-btn layui-btn-xs" lay-event="search">查询</a>
</script>
<script type="text/javascript">
    layui.use(['form', 'element', 'jquery', 'table', 'layer'], function () {
        var element = layui.element
            , form = layui.form
            , table = layui.table
            , $ = layui.jquery
            , layer = layui.layer

        var houseinfo_table = table.render({
            elem: '#houseinfo-table',
            url: 'BillServlet?action=getBill',
            height: 'auto',
            title: '账单信息',
            toolbar: '#toolbaradd',
            page: true,
            limit:15,
            defaultToolbar: ['filter', 'print', 'exports'],
            cols: [
                [
                    {field: 'date', title: '月份'},
                    {field: 'monthRent', title: '月租金'},
                    {field: 'maintenanceFee', title: '维护费'},
                    {field: 'total', title: '总共'},
                    {field: 'operation', fixed:'right',title: '操作', toolbar: '#operation', width: 70}
                ]
            ]
        });

        table.on('tool(houseinfo-table)', function (obj) {
            var house = obj.data;
            console.log(house);
            /*if (obj.event === 'search') {
                $('#form_houseinfo').find('#id_edit').val(house.id);
                $('#form_houseinfo').find('#landlord_edit').val(house.landlord);
                $('#form_houseinfo').find('#monthRent_edit').val(house.monthRent);
                $('#form_houseinfo').find('#space_edit').val(house.space);
                $('#form_houseinfo').find('#address_edit').val(house.address);
                $('#form_houseinfo').find('#layout_edit').val(house.layout);
                $('#form_houseinfo').find('#houseName_edit').val(house.houseName);
                form.render();
            }*/
        });
    });
</script>
</body>
<div class="layui-form" id="form_houseinfo" style="width:500px;height:400px;display:none">
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">月份<span style="color: red">*</span></label>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">月租金<span style="color: red">*</span></label>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">维护费<span style="color: red">*</span></label>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">总共<span style="color: red">*</span></label>
    </div>

</div>
</html>
