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
<body bgcolor="white">
<div class="layui-card">
    <div class="layui-card-header">
        <div style="text-align: left;float:top" id='searchgr'>
            <div class="layui-inline">
                <div class="layui-row">
                    <div class="layui-col-md6">
                        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">起始时间</label>
                        <input class="layui-input" name="searchtxtst" id="searchtxtst" autocomplete="off" style="width: 200px" placeholder="输入格式：xxxx-xx">
                    </div>
                    <div class="layui-col-md6">
                        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; float: left;">结束时间</label>
                        <input class="layui-input" name="searchtxten" id="searchtxten" autocomplete="off" style="width: 200px" placeholder="输入格式：xxxx-xx">
                    </div>
                </div>
            </div>
            <button class="layui-btn" data-type="reload" id="do_search"><i class="layui-icon layui-icon-search"></i></button>
        </div>
    </div>
    <div class="layui-card-body">
        <table class="layui-table" id="houseinfo-table" lay-filter="houseinfo-table"></table>
    </div>
</div>
<script type="text/javascript">
    layui.use(['form', 'element', 'jquery', 'table', 'layer'], function () {
        var element = layui.element
            , form = layui.form
            , table = layui.table
            , $ = layui.jquery
            , layer = layui.layer

        var houseinfo_table = table.render({
            elem: '#houseinfo-table',
            url: 'billServlet?action=getBill&startDate=2019-01&endDate=2019-01',
            height: 'auto',
            title: '账单信息',
            toolbar: '#toolbaradd',
            page: true,
            limit:10,
            defaultToolbar: ['filter', 'print', 'exports'],
            cols: [
                [
                    {field: 'date', title: '月份'},
                    {field: 'monthRent', title: '月租金'},
                    {field: 'maintenanceFee', title: '维护费'},
                    {field: 'total', title: '总共'},
                ]
            ]
        });
        $('body').on('click', '#do_search', function(){
            var startDate = $('#searchtxtst').val();
            var endDate = $('#searchtxten').val();
            table.reload('houseinfo-table', {
                method: 'post',
                url: 'billServlet',
                where: {
                    'startDate': startDate,
                    'endDate': endDate,
                    'action': 'getBill',
                },
                page: {
                    curr: 1
                }
            });
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
