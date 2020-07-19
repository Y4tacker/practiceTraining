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
<script type="text/html" id="toolbaradd">
    <div class="layui-btn-container">
        <div class="layui-inline" lay-event="add"><i class="layui-icon layui-icon-add-1"></i></div>
    </div>
</script>
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
            url: 'orderServlet?action=page',
            height: 'auto',
            title: '订单信息',
            toolbar: '#toolbaradd',
            page: true,
            limit:10,
            defaultToolbar: ['filter', 'print', 'exports'],
            cols: [
                [

                    {field: 'orderNo', title: '订单编号', sort: true,},
                    {field: 'orderHouse', title: '预定参观房屋'},
                    {field: 'landlord', title: '所属房东'},
                    {field: 'tenantName', title: '预定客户'},
                    {field: 'phoneNumber', title: '联系电话'},
                    {field: 'orderTime', title: '上门查看时间'},
                    {field: 'operation', fixed:'right',title: '操作', toolbar: '#operation', width: 120}
                ],
            ]
        });
        table.on('tool(houseinfo-table)', function (obj) {
            var house = obj.data;
            if (obj.event === 'delete') {
                layer.confirm('确定已处理此订单信息了吗？', function (index) {
                    $.ajax({
                        url: 'orderServlet',
                        method: 'POST',
                        async: false,
                        dataType: 'json',
                        data: {
                            'action': 'deleteOrder',
                            'id': house.id,
                        },
                        success: function (data) {
                            if (data.code === 0) {
                                obj.del();
                                layer.msg("删除成功", {icon: 6});
                                layer.close(index);
                            } else {
                                layer.msg("删除失败", {icon: 5});
                            }
                        },
                        error: function () {
                            layer.msg("删除失败", {icon: 5});
                        }
                    });
                });
            } else if (obj.event === 'edit') {
                $('#form_houseinfo').find('#id').val(house.id);
                $('#form_houseinfo').find('#orderNo').val(house.orderNo);
                $('#form_houseinfo').find('#orderHouse').val(house.orderHouse);
                $('#form_houseinfo').find('#landlord').val(house.landlord);
                $('#form_houseinfo').find('#tenantName').val(house.tenantName);
                $('#form_houseinfo').find('#orderTime').val(house.orderTime);
                layer.prompt({
                    title: "编辑账户：ID" ,
                    shadeClose: true,
                    shade: 0.8,
                    btnAlign: 'l',
                    btn: ['确认', '取消'],
                    area: '700px',
                    offset: '120px',
                    yes: function (index, obj) {
                        var id = obj.find('#id').val();
                        var orderNo = obj.find('#orderNo').val();
                        var orderHouse = obj.find('#orderHouse').val();
                        var landlord = obj.find('#landlord').val();
                        var tenantName = obj.find('#tenantName').val();
                        var orderTime = obj.find('#orderTime').val();
                        var phoneNumber = obj.find('#phoneNumber').val();
                        var loading = layer.msg("正在添加", {
                            icon: 16,
                            shade: 0.3,
                            time: 0
                        });
                        var finish = false;
                        $.ajax({
                            url: 'orderServlet',
                            method: 'POST',
                            async: false,
                            dataType: 'json',
                            data: {
                                'action': 'editOrder',
                                'id': id,
                                'orderNo': orderNo,
                                'orderHouse': orderHouse,
                                'landlord': landlord,
                                'tenantName': tenantName,
                                'orderTime': orderTime,
                                'phoneNumber': phoneNumber
                            },
                            success: function (res) {
                                layer.close(loading);
                                if (res.code == 0) {
                                    finish = true;
                                    layer.msg(res.msg, {
                                        title: '成功'
                                    });
                                    account_table.reload({
                                        elem: "#houseinfo-table"
                                    });
                                } else {
                                    layer.msg(res.msg, {
                                        title: '失败'
                                    });
                                }
                                layer.close(index);
                            },
                            error: function (err) {
                                layer.close(loading);
                                layer.msg("修改失败", {icon: 5});
                                layer.close(index);
                            }
                        });
                        layer.close(index);
                        return finish;
                    },
                    content: $('#form_houseinfo')
                });
            }
        });
        $(function(){
            $("body > div.layui-form.layui-border-box.layui-table-view > div.layui-table-tool > div.layui-table-tool-temp").hide()
        })
    });
</script>
</body>
<div class="layui-form" id="form_houseinfo" style="width:500px;display:none">
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">ID <span style="color: #ff0000">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="id" placeholder="id"style="width:300px"
                   id="id" disabled="disabled"
                   placeholder="账号"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">订单编号 <span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="orderNo" placeholder="订单编号"style="width:300px"
                   id="orderNo"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">预定参观房屋<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="orderHouse" required lay-verify="required" placeholder="预定参观房屋"style="width:300px"
                   autocomplete="off" class="layui-input" id="orderHouse">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">所属房东<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="landlord" required lay-verify="required" placeholder="所属房东"style="width:300px"
                   autocomplete="off" class="layui-input" id="landlord">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">预定客户<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="tenantName" required lay-verify="required" placeholder="预定客户"style="width:300px"
                   autocomplete="off" class="layui-input" id="tenantName">
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
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">上门查看时间<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="orderTime" required lay-verify="required"style="width:300px"
                   placeholder="上门查看时间" autocomplete="off"
                   class="layui-input" id="orderTime">
        </div>
    </div>
</div>
</html>
