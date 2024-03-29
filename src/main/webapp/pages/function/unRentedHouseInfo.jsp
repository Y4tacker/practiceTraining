<%--
  Created by IntelliJ IDEA.
  User: Yangwenhao
  Date: 2020/7/17
  Time: 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <%@include file="../common/head.jsp"%>
    <title>闲置房屋</title>
    <style type="text/css">
        div.layui-unselect{width:300px;pxvertical-align: middle;float:left;} div.layui-form-select{width:300px;pxvertical-align: middle;float:left;} div.layui-form-selected{width:300px;pxvertical-align: middle;float:left;}
    </style>
</head>
<body bgcolor="white">
<table class="layui-hide" id="houseinfo-table" lay-filter="houseinfo-table"></table>
<script type="text/html" id="operation">
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
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
            url: 'houseServlet?action=pageForUnRented',
            height: 'auto',
            title: '房源信息',
            toolbar: '#toolbaradd',
            page: true,
            limit:10,
            defaultToolbar: ['filter', 'print', 'exports'],
            cols: [
                [
                    {field: 'id', title: "ID", sort: true,},
                    {field: 'landlord', title: '所属房东'},
                    {field: 'monthRent', title: '月租金'},
                    {field: 'space', title: '面积'},
                    {field: 'address', title: '地址'},
                    {field: 'layout', title: '户型'},
                    {field: 'houseName',title:'房屋名'},
                    {field: 'operation', fixed:'right',title: '操作', toolbar: '#operation', width: 70}
                ]
            ]
        });

        table.on('tool(houseinfo-table)', function (obj) {
            var house = obj.data;
            console.log(house);
            if (obj.event === 'edit') {
                $('#form_houseinfo').find('#id_edit').val(house.id);
                $('#form_houseinfo').find('#landlord_edit').val(house.landlord);
                $('#form_houseinfo').find('#monthRent_edit').val(house.monthRent);
                $('#form_houseinfo').find('#space_edit').val(house.space);
                $('#form_houseinfo').find('#address_edit').val(house.address);
                $('#form_houseinfo').find('#layout_edit').val(house.layout);
                $('#form_houseinfo').find('#houseName_edit').val(house.houseName);
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
                        var landlord = obj.find('#landlord_edit').val();
                        var monthRent = obj.find('#monthRent_edit').val();
                        var space = obj.find('#space_edit').val();
                        var address = obj.find('#address_edit').val();
                        var layout = obj.find('#layout_edit').val();
                        var houseName = obj.find('#houseName_edit').val();
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
                                'action': 'editUnRentedHose',
                                'id': id,
                                'landlord': landlord,
                                'monthRent': monthRent,
                                'space': space,
                                'address': address,
                                'layout': layout,
                                'houseName': houseName,
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
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">所属房东 <span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="landlord_edit" placeholder="所属房东"style="width:300px"
                   id="landlord_edit"
                   placeholder="所属房东"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">月租金<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="realName_edit" lay-verify="required" placeholder="月租金"style="width:300px"
                   class="layui-input" id="monthRent_edit">
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
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">面积<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="space_edit" required lay-verify="required" placeholder="面积"style="width:300px"
                   autocomplete="off" class="layui-input" id="space_edit">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">户型 <span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="layout_edit" placeholder="户型"style="width:300px"
                   id="layout_edit"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">房屋名<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="houseName_edit" required lay-verify="required" placeholder="房屋名"style="width:300px"
                   autocomplete="off" class="layui-input" id="houseName_edit">
        </div>
    </div>
</div>
</html>
