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
    <div class="layui-btn-container" style="float: left">
        <div class="layui-inline" lay-event="add"><i class="layui-icon layui-icon-add-1"></i></div>
    </div>
    <div style="text-align: center;float:top" id='searchgr'>
        <div class="layui-inline">
            <input class="layui-input" name="searchtxt" id="searchtxt" autocomplete="off" style="width: 200px">
        </div>
        <button class="layui-btn" data-type="reload" id="do_search"><i class="layui-icon layui-icon-search"></i></button>
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
                    {field: 'tenantName', title: '用户名', sort: true,},
                    {field: 'realName', title: '姓名'},
                    {field: 'address', title: '地址'},
                    {field: 'houseName', title: '房屋名', sort: true,},
                    {field: 'phoneNumber', title: '手机号'},
                    {field: 'maintenanceFee', title: '维护费用'},
                    {field: 'operation', fixed:'right',title: '操作', toolbar: '#operation', width: 120}
                ]
            ]
        });
        $('#do_search').on('click', function () {
            // 搜索条件
            var cont = $('#searchgr').val();
            table.reload('houseinfo-table', {
                method: 'post',
                url: 'billServlet',
                , where: {
                    'cont': cont,
                    'action': ,
                }
                , page: {
                    curr: 1
                }
            });
        });
        table.on('toolbar(houseinfo-table)',function (obj) {
            if(obj.event === 'add'){
                var house = obj.data;
                console.log(house);
                layer.prompt({
                    title: "维护费记录",
                    shadeClose: true,
                    shade: 0.8,
                    btnAlign: 'l',
                    btn: ['确认', '取消'],
                    offset: '120px',
                    yes: function (index, obj) {
                        var id = obj.find('#id').val();
                        var tenantName = obj.find('#tenantName').val();
                        var houseName = obj.find('#houseName').val();
                        var realName = obj.find('#realName').val();
                        var address = obj.find('#address').val();
                        var phoneNumber = obj.find('#phoneNumber').val();
                        var maintenanceFee = obj.find('#maintenanceFee').val();
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
                                'tenantName':tenantName,
                                'houseName': houseName,
                                'realName': realName,
                                'address': address,
                                'phoneNumber': phoneNumber,
                                'maintenanceFee': maintenanceFee,
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
                $('#form_houseinfo').find('#tenantName_edit').val(house.tenantName);
                $('#form_houseinfo').find('#houseName_edit').val(house.houseName);
                $('#form_houseinfo').find('#realName_edit').val(house.realName);
                $('#form_houseinfo').find('#address_edit').val(house.address);
                $('#form_houseinfo').find('#phoneNumber_edit').val(house.phoneNumber);
                $('#form_houseinfo').find('#maintenanceFee_edit').val(house.maintenanceFee);
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
                        var tenantName = obj.find('#tenantName_edit').val();
                        var houseName = obj.find('#houseName_edit').val();
                        var realName = obj.find('#realName_edit').val();
                        var address = obj.find('#address_edit').val();
                        var phoneNumber = obj.find('#phoneNumber_edit').val();
                        var maintenanceFee = obj.find('#maintenanceFee_edit').val();
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
                                'tenantName':tenantName,
                                'houseName': houseName,
                                'realName': realName,
                                'address': address,
                                'phoneNumber': phoneNumber,
                                'maintenanceFee': maintenanceFee,
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
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">ID <span style="color: #ff0000">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="id" placeholder="id"style="width:300px"
                   id="id_edit" disabled="disabled"
                   placeholder="账号"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">用户名 <span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="tenantName_edit" placeholder="用户名"style="width:300px"
                   id="tenantName_edit"
                   placeholder="用户名"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">房屋名 <span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="houseName_edit" placeholder="房屋名"style="width:300px"
                   id="houseName_edit"
                   placeholder="密码"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">姓名<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="realName_edit" lay-verify="required" placeholder="姓名"style="width:300px"
                    class="layui-input" id="realName_edit">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">地址<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="address_edit" required lay-verify="required" placeholder="地址"style="width:300px"
                   autocomplete="off" class="layui-input" id="address_edit">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">手机号<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="phoneNumber_edit" required lay-verify="required" placeholder="手机号"style="width:300px"
                   autocomplete="off" class="layui-input" id="phoneNumber_edit">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">维护费用<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="maintenanceFee_edit" required lay-verify="required"style="width:300px"
                   placeholder="维护费用" autocomplete="off"
                   class="layui-input" id="maintenanceFee_edit">
        </div>
    </div>
</div>
<div class="layui-form" id="form_houseinfo_add" style="width:500px;height:350px;display:none">
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">房屋名 <span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="houseName" placeholder="房屋名"style="width:300px"
                   id="houseName"
                   placeholder="密码"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">姓名<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="realName" required lay-verify="required" placeholder="姓名"style="width:300px"
                   autocomplete="off" class="layui-input" id="realName">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">地址<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="address" required lay-verify="required" placeholder="地址"style="width:300px"
                   autocomplete="off" class="layui-input" id="address">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">手机号<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="phoneNumber" required lay-verify="required" placeholder="手机号"style="width:300px"
                   autocomplete="off" class="layui-input" id="phoneNumber">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">维护费用<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="maintenanceFee" required lay-verify="required"style="width:300px"
                   placeholder="维护费用" autocomplete="off"
                   class="layui-input" id="maintenanceFee">
        </div>
    </div>
</div>
</html>
