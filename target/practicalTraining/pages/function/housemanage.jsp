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
    <title>房屋管理</title>
    <style type="text/css">
        div.layui-unselect{width:300px;pxvertical-align: middle;float:left;} div.layui-form-select{width:300px;pxvertical-align: middle;float:left;} div.layui-form-selected{width:300px;pxvertical-align: middle;float:left;}
    </style>
</head>
<body>
<script type="text/html" id="toolbaradd">
    <div class="layui-btn-container">
        <div class="layui-inline" lay-event="add"><i class="layui-icon layui-icon-add-1"></i></div>
    </div>
</script>
<table class="layui-hide" id="houseinfo-table" lay-filter="houseinfo-table"></table>
<script type="text/html" id="operation">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
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
            url: 'houseServlet?action=page',
            height: 'auto',
            title: '房源信息',
            toolbar: '#toolbaradd',
            page: true,
            limit:15,
            defaultToolbar: ['filter', 'print', 'exports'],
            cols: [
                [
                    {field: 'id', title: "ID", sort: true,},
                    {field: 'tenant', title: '租赁人', sort: true,},
                    {field: 'houseName', title: '房屋名', sort: true,},
                    {field: 'layout', title: '户型'},
                    {field: 'address', title: '地址'},
                    {field: 'space', title: '面积'},
                    {field: 'monthRent', title: '月租金'},
                    {field: 'rentalStatus', title: '租赁状态'},
                    {field: 'operation', fixed:'right',title: '操作', toolbar: '#operation', width: 120}
                ]
            ]
        });
        table.on('toolbar(houseinfo-table)',function (obj) {
            if(obj.event === 'add'){
                var house = obj.data;
                console.log(house);
                layer.prompt({
                    title: "添加房源",
                    shadeClose: true,
                    shade: 0.8,
                    btnAlign: 'l',
                    btn: ['确认', '取消'],
                    offset: '120px',
                    yes: function (index, obj) {
                        var id = obj.find('#id').val();
                        var tenant = obj.find('#tenant').val();
                        var houseName = obj.find('#houseName').val();
                        var layout = obj.find('#layout').val();
                        var address = obj.find('#address').val();
                        var space = obj.find('#space').val();
                        var monthRent = obj.find('#monthRent').val();
                        var rentalStatus = obj.find('#rentalStatus').val()==0?"已租赁":"未租赁";
                        var loading = layer.msg("正在添加", {
                            icon: 16,
                            shade: 0.3,
                            time: 0
                        });
                        var finish = false;
                        $.ajax({
                            url: 'houseServlet',
                            method: 'POST',
                            async: false,
                            dataType: 'json',
                            data: {
                                'action': 'addHouse',
                                'id': id,
                                'tenant':tenant,
                                'houseName': houseName,
                                'layout': layout,
                                'address': address,
                                'space': space,
                                'monthRent': monthRent,
                                'rentalStatus': rentalStatus,
                            },
                            success: function (res) {
                                layer.close(loading);
                                if (res.code == 0) {
                                    finish = true;
                                    layer.msg(res.msg, {
                                        title: '成功'
                                    });
                                    houseinfo_table.reload({
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
                    content: $('#form_houseinfo_add')
                });
            }
        })
        table.on('tool(houseinfo-table)', function (obj) {
            var house = obj.data;
            if (obj.event === 'delete') {
                layer.confirm('确定要删除吗', function (index) {
                    $.ajax({
                        url: 'houseServlet',
                        method: 'POST',
                        async: false,
                        dataType: 'json',
                        data: {
                            'action': 'deleteHouse',
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
                $('#form_houseinfo').find('#id_edit').val(house.id);
                $('#form_houseinfo').find('#tenant_edit').val(house.tenant);
                $('#form_houseinfo').find('#houseName_edit').val(house.houseName);
                $('#form_houseinfo').find('#layout_edit').val(house.layout);
                $('#form_houseinfo').find('#address_edit').val(house.address);
                $('#form_houseinfo').find('#space_edit').val(house.space);
                $('#form_houseinfo').find('#monthRent_edit').val(house.monthRent);
                $('#form_houseinfo').find('#rentalStatus_edit').val(house.rentalStatus=="已租赁"?0:1);
                form.render();
                layer.prompt({
                    title: "编辑房源信息：ID"+house.id ,
                    shadeClose: true,
                    shade: 0.8,
                    btnAlign: 'l',
                    btn: ['确认', '取消'],
                    offset: '120px',
                    yes: function (index, obj) {
                        var id = obj.find('#id_edit').val();
                        var tenant = obj.find('#tenant_edit').val();
                        var houseName = obj.find('#houseName_edit').val();
                        var layout = obj.find('#layout_edit').val();
                        var address = obj.find('#address_edit').val();
                        var space = obj.find('#space_edit').val();
                        var monthRent = obj.find('#monthRent_edit').val();
                        var rentalStatus = obj.find('#rentalStatus_edit').val()==0?"已租赁":"未租赁";
                        var loading = layer.msg("正在添加", {
                            icon: 16,
                            shade: 0.3,
                            time: 0
                        });
                        var finish = false;
                        $.ajax({
                            url: 'houseServlet',
                            method: 'POST',
                            async: false,
                            dataType: 'json',
                            data: {
                                'action': 'editHouse',
                                'id': id,
                                'tenant':tenant,
                                'houseName': houseName,
                                'layout': layout,
                                'address': address,
                                'space': space,
                                'monthRent': monthRent,
                                'rentalStatus': rentalStatus,
                            },
                            success: function (res) {
                                layer.close(loading);
                                if (res.code == 0) {
                                    finish = true;
                                    layer.msg(res.msg, {
                                        title: '成功'
                                    });
                                    houseinfo_table.reload({
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
    });
</script>
</body>
<div class="layui-form" id="form_houseinfo" style="width:500px;height:400px;display:none">
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">ID <span style="color: #ff0000">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="id" placeholder="id"style="width:300px"
                   id="id_edit" disabled="disabled"
                   placeholder="账号"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">租赁人 <span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="tenant_edit" placeholder="租赁人"style="width:300px"
                   id="tenant_edit"
                   placeholder="租赁人"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">房屋名 <span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="houseName_edit" placeholder="房屋名"style="width:300px"
                   id="houseName_edit"
                   placeholder="密码"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">户型<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="layout_edit" lay-verify="required" placeholder="户型"style="width:300px"
                    class="layui-input" id="layout_edit">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">地址<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="address_edit" required lay-verify="required" placeholder="地址"style="width:300px"
                   autocomplete="off" class="layui-input" id="address_edit">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">面积<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="space_edit" required lay-verify="required" placeholder="面积"style="width:300px"
                   autocomplete="off" class="layui-input" id="space_edit">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">月租金<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="monthRent_edit" required lay-verify="required"style="width:300px"
                   placeholder="月租金" autocomplete="off"
                   class="layui-input" id="monthRent_edit">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">租赁状态<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <select name="rentalStatus_edit" lay-verify="required" id="rentalStatus_edit">
                <option value="">租赁状态</option>
                <option value="0">已租赁</option>
                <option value="1">未租赁</option>
            </select>
        </div>
    </div>
</div>
<div class="layui-form" id="form_houseinfo_add" style="width:500px;height:350px;display:none">
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">房屋名 <span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="houseName" placeholder="房屋名"style="width:300px"
                   id="houseName"
                   placeholder="密码"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">户型<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="layout" required lay-verify="required" placeholder="户型"style="width:300px"
                   autocomplete="off" class="layui-input" id="layout">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">地址<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="address" required lay-verify="required" placeholder="地址"style="width:300px"
                   autocomplete="off" class="layui-input" id="address">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">面积<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="space" required lay-verify="required" placeholder="面积"style="width:300px"
                   autocomplete="off" class="layui-input" id="space">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">月租金<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="monthRent" required lay-verify="required"style="width:300px"
                   placeholder="月租金" autocomplete="off"
                   class="layui-input" id="monthRent">
        </div>
    </div>

</div>
</html>
