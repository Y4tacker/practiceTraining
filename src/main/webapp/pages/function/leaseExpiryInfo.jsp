<%--
  Created by IntelliJ IDEA.
  User: Yangwenhao
  Date: 2020/7/17
  Time: 10:52
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
<body>
<table class="layui-hide" id="houseinfo-table" lay-filter="houseinfo-table"></table>
<script type="text/html" id="operation">
    <a class="layui-btn layui-btn-xs" lay-event="renewal">续租</a>
    <a class="layui-btn layui-btn-xs" lay-event="call">提醒</a>
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
            url: 'houseServlet?action=pageForNearDate',
            height: 'auto',
            title: '房源信息',
            toolbar: 'true',
            page: true,
            limit:15,
            cols: [
                [
                    {field: 'realName', title: '真实姓名'},
                    {field: 'email', title: '电子邮箱'},
                    {field: 'address', title: '地址'},
                    {field: 'endTime', title: '截止日期'},
                    {field: 'phoneNumber', title: '电话号码'},
                    {field: 'houseName',title:'房屋名'},
                    {field: 'operation', fixed:'right',title: '操作', toolbar: '#operation', width: 120}
                ]
            ]
        });
        $('body').on('click', '#renewal', function(){
            //续约功能
        });

        $('body').on('click', '#remind', function(){
            //提醒功能
        });

        table.on('tool(houseinfo-table)', function (obj) {
            var house = obj.data;
            if (obj.event === 'call') {
                $.ajax({
                    url:'utilsServlet',
                    method:'POST',
                    async: true,
                    dataType: 'json',
                    data: {
                        'action':'sendEmail',
                        'email': house.email,
                        'realName': house.realName,
                    },
                    success: function (res) {
                    },
                    error: function (err) {
                        layer.msg("发送失败", {icon: 5});
                    }
                });
                layer.msg("发送成功", {
                    title: '成功'
                });
            }
            if (obj.event === 'edit') {
                $('#form_houseinfo').find('#realName_edit').val(house.id);
                $('#form_houseinfo').find('#email_edit').val(house.email);
                $('#form_houseinfo').find('#phoneNumber_edit').val(house.phoneNumber);
                $('#form_houseinfo').find('#address_edit').val(house.address);
                $('#form_houseinfo').find('#endTime_edit').val(house.endTime);
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
                        var realName = obj.find('#realName_edit').val();
                        var email = obj.find('#email_edit').val();
                        var phoneNumber = obj.find('#phoneNumber_edit').val();
                        var address = obj.find('#address_edit').val();
                        var endTime = obj.find('#endTime_edit').val();
                        var houseName = obj.find('#houseName_edit').val();
                        var loading = layer.msg("正在添加", {
                            icon: 16,
                            shade: 0.3,
                            time: 0
                        });
                        var finish = false;
                        $.ajax({
                            url: 'billServlet',
                            method: 'POST',
                            async: false,
                            dataType: 'json',
                            data: {
                                'action': 'editFee',
                                'realName':realName,
                                'email': email,
                                'phoneNumber': phoneNumber,
                                'address': address,
                                'endTime': endTime,
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
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">真实姓名 <span style="color: #ff0000">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="realName" placeholder="realName"style="width:300px"
                   id="irealNameedit" disabled="disabled"/>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">电子邮箱<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="email_edit" lay-verify="required" placeholder="电子邮箱"style="width:300px"
                   class="layui-input" id="email_edit">
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
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">截止日期<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="endTime_edit" required lay-verify="required" placeholder="截止日期"style="width:300px"
                   autocomplete="off" class="layui-input" id="endTime_edit">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">电话号码<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="text" name="phoneNumber_edit" required lay-verify="required" placeholder="电话号码"style="width:300px"
                   autocomplete="off" class="layui-input" id="phoneNumber_edit">
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
