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
    <%@include file="common/head.jsp"%>
    <title>房屋管理</title>
</head>
<body>
<div class="layui-fluid">
    <div class="layui-row layui-col-space12">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header">

                </div>
                <div class="layui-card-body">
                    <table class="layui-hide" id="houseinfo-table" lay-filter="houseinfo-table"></table>
                    <script type="text/html" id="operation">
                        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="delete">删除</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    layui.use(['form', 'element', 'jquery', 'table', 'layer'], function () {
        var element = layui.element
            , form = layui.form
            , table = layui.table
            , $ = layui.jquery
            , layer = layui.layer
        form.on('submit(setting)', function (data) {
            var finish = false;
            var loading = layer.msg("正在添加", {
                icon: 16,
                shade: 0.3,
                time: 0
            });
            $.ajax({
                url: '/account_add',
                method: 'POST',
                data: data.field,
                async: false,
                dataType: 'json',
                success: function (res) {
                    layer.close(loading);
                    if (res.code === 0) {
                        layer.msg(res.msg, {
                            title: '成功'
                        });
                        account_table.reload({
                            elem: "#account-table"
                        });
                        finish = true;
                    } else {
                        layer.msg(res.msg, {
                            title: '失败'
                        });
                    }
                },
                error: function (err) {
                    layer.close(loading);
                    layer.msg('出错了！！', {
                        title: '错误'
                    });
                }
            });
            return finish;
        });

        var account_table = table.render({
            elem: '#account-table',
            url: '/account_get',
            height: 400,
            title: '房源信息',
            toolbar: 'true',
            page: true,
            cols: [
                [
                    {field: 'id', title: "ID", sort: true, width: 80},
                    {field: 'houseName', title: '房屋名', sort: true, width: 170},
                    {field: 'layout', title: '户型', width: 170},
                    {field: 'address', title: '地址', width: 200},
                    {field: 'space', title: '面积', width: 200},
                    {field: 'monthRent', title: '月租金', width: 200},
                    {field: 'rentalStatus', title: '租赁状态', width: 200}
                ]
            ]
        });
        table.on('tool(account-table)', function (obj) {
            var account = obj.data;
            if (obj.event === 'delete') {
                layer.confirm('确定要删除吗', function (index) {
                    $.ajax({
                        url: '/account_edit',
                        method: 'POST',
                        async: false,
                        dataType: 'json',
                        data: {
                            'action': 'delete',
                            'aid': account.aid,
                            "csrfmiddlewaretoken": token
                        },
                        success: function (data) {
                            if (data.code === 0) {
                                obj.del();
                                layer.msg("删除成功", {icon: 6});
                                layer.close(index);
                            } else {
                                console.log(1111);
                                layer.msg("删除失败", {icon: 5});
                            }
                        },
                        error: function () {
                            layer.msg("删除失败", {icon: 5});
                        }
                    });
                });
            } else if (obj.event === 'edit') {
                $('#editAccount').find('#new_account').val(account.username);
                $('#editAccount').find('#new_password').val(account.password);
                $('#editAccount').find('#new_gid').val(account._gid);
                $('#editAccount').find('#new_ga').val(account._ga);
                $('#editAccount').find('#new_fril_user_session_id').val(account._fril_user_session_id);
                $('#editAccount').find('#new__gads').val(account.__gads);
                $('#editAccount').find('#new_ra').val(account._ra);
                layer.prompt({
                    title: "编辑账户：ID" + account.aid,
                    shadeClose: true,
                    shade: 0.8,
                    btnAlign: 'l',
                    btn: ['确认', '取消'],
                    area: '700px',
                    offset: '120px',
                    yes: function (index, obj) {
                        var new_account = obj.find('#new_account').val();
                        var new_password = obj.find('#new_password').val();
                        var new_ra = obj.find('#new_ra').val();
                        var new_gid = obj.find('#new_gid').val();
                        var new_ga = obj.find('#new_ga').val();
                        var new_fril_user_session_id = obj.find('#new_fril_user_session_id').val();
                        var new__gads = obj.find('#new__gads').val();
                        var token = $('[name="csrfmiddlewaretoken"]').val();
                        var loading = layer.msg("正在添加", {
                            icon: 16,
                            shade: 0.3,
                            time: 0
                        });
                        var finish = false;
                        $.ajax({
                            url: '/account_edit',
                            method: 'POST',
                            async: false,
                            dataType: 'json',
                            data: {
                                'action': 'edit',
                                'username': new_account,
                                'password': new_password,
                                '_ra': new_ra,
                                '_gid': new_gid,
                                '_ga': new_ga,
                                '_fril_user_session_id': new_fril_user_session_id,
                                '__gads': new__gads,
                                'aid': account.aid,
                                "csrfmiddlewaretoken": token
                            },
                            success: function (res) {
                                layer.close(loading);
                                if (res.code == 0) {
                                    finish = true;
                                    layer.msg(res.msg, {
                                        title: '成功'
                                    });
                                    account_table.reload({
                                        elem: "#account-table"
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
                                layer.msg("修改失败123", {icon: 5});
                                layer.close(index);
                            }
                        });
                        layer.close(index);
                        return finish;
                    },
                    content: $('#editAccount')
                });
            }
        });
    });
</script>
</body>
</html>
