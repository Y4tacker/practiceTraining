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
            if (obj.event === 'renewal') {
                layer.prompt({
                    title: "续租",
                    shadeClose: true,
                    shade: 0.8,
                    btnAlign: 'l',
                    btn: ['确认', '取消'],
                    offset: '120px',
                    yes: function (index, obj) {
                        var endTime = obj.find('#endTime').val();
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
                                'action': 'release',
                                'id':house.id,
                                'endTime':endTime,
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
                                layer.msg("续租失败", {icon: 5});
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
<div class="layui-form" id="form_houseinfo" style="width:500px;display:none">
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-phoneNumber:nowrap; ">续租日期 <span style="color: #ff0000">*</span></label>
        <div class="layui-input-block">
            <input class="layui-input" lay-verify="required" type="text" name="endTime" placeholder="输入格式：xxxx-xx-xx"style="width:300px"
                   id="endTime"/>
        </div>
    </div>
</div>
</html>
