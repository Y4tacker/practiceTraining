<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>主页</title>
    <%@include file="../common/head.jsp"%>
</head>
<body class="layui-layout-body">
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-xs12 layui-col-md3">
            <div class="layui-card top-panel">
                <div class="layui-card-header">
                    已租赁房屋数量
                </div>
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space5">
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-col-xs1 layui-col-md3">
                            <i class="layui-icon layui-icon-component" style="font-size: 70px; color: #1E9FFF; "></i>
                        </div>
                        <div class="layui-col-xs1 layui-col-md9">
                            <p style="font-size: 30px;text-align:center;" id="rentedHouse"></p>
                        </div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-xs12 layui-col-md3">
            <div class="layui-card top-panel">
                <div class="layui-card-header">
                    本月收入
                </div>
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space5">
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-col-xs1 layui-col-md3">
                            <i class="layui-icon layui-icon-rmb" style="font-size: 70px; color: #1E9FFF; "></i>
                        </div>
                        <div class="layui-col-xs1 layui-col-md9">
                            <p style="font-size: 30px;text-align:center;" id="income"></p>
                        </div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-xs12 layui-col-md3">
            <div class="layui-card top-panel">
                <div class="layui-card-header">
                    租约到期房屋数量
                </div>
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space5">
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-col-xs1 layui-col-md3">
                            <i class="layui-icon layui-icon-fonts-del" style="font-size: 70px; color: #1E9FFF; "></i>
                        </div>
                        <div class="layui-col-xs1 layui-col-md9">
                            <p style="font-size: 30px;text-align:center;" id="nearDateHouse"></p>
                        </div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-xs12 layui-col-md3">
            <div class="layui-card top-panel">
                <div class="layui-card-header">
                    房产数量
                </div>
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space5">
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-col-xs1 layui-col-md3">
                            <i class="layui-icon layui-icon-home" style="font-size: 70px; color: #1E9FFF; "></i>
                        </div>
                        <div class="layui-col-xs1 layui-col-md9">
                            <p style="font-size: 30px;text-align:center;" id="houseNumber"></p>
                        </div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-xs12 layui-col-md3">
            <div class="layui-card top-panel">
                <div class="layui-card-header">
                    待处理订单
                </div>
                <div class="layui-card-body">
                    <div class="layui-row layui-col-space5">
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-col-xs1 layui-col-md3">
                            <i class="layui-icon layui-icon-form" style="font-size: 70px; color: #1E9FFF; "></i>
                        </div>
                        <div class="layui-col-xs1 layui-col-md9">
                            <p style="font-size: 30px;text-align:center;" id="order"></p>
                        </div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                        <div class="layui-row"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['jquery','layer'],function () {
        var $=layui.jquery;
        var rentedHouse;
        $.ajax({
            url: 'utilsServlet',
            method: 'POST',
            async: false,
            dataType: 'json',
            data: {
                'action': 'indexInfo',
            },
            success: function (data) {
                let temp = eval(data);
                $('#rentedHouse').text(temp.alreadyCount);
                $('#income').text(temp.curGet);
                $('#nearDateHouse').text(temp.nearDateCount);
                $('#houseNumber').text(temp.houseCount);
                $('#order').text(temp.orderCount);
            },
            error: function () {
                layer.msg("数据异常请刷新", {icon: 5});
            }
        });
    })
</script>
</body>
</html>
