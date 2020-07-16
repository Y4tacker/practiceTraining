<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html style="font-size: 30.7292px; min-width: 1440px;">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%@ include file="/pages/common/head.jsp"%>
    <title>成都市房屋租赁管理系统</title>
    <script src="static/script/sweetalert.min.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <input type="hidden" id="username" name="username" value="${sessionScope.user.username}">
    <input type="hidden" id="status" name="status" value="${sessionScope.noticeStatus}">
    <div class="layui-header">
        <div class="layui-logo">房屋租赁管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;"><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">修改信息</a></dd>
                    <dd><a href="javascript:;">安全管理</a></dd>
                    <dd><a href="userServlet?action=logout">安全退出</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item leftdaohang" mytitle="房产管理" data-url="pages/function/housemanage.jsp"><a data-type="tabAdd" data-id="0">房产管理</a></li>
                <li class="layui-nav-item leftdaohang" mytitle="预定订单" data-url="pages/function/ordermanage.jsp"><a data-type="tabAdd" data-id="1">预定订单</a></li>
                <li class="layui-nav-item leftdaohang" mytitle="统计报表" data-url="pages/housemanage.jsp"><a data-type="tabAdd" data-id="2">统计报表</a></li>
                <li class="layui-nav-item leftdaohang" mytitle="我的账单" data-url="pages/housemanage.jsp"><a data-type="tabAdd" data-id="3">我的账单</a></li>
                <li class="layui-nav-item leftdaohang" mytitle="系统公告" data-url="pages/housemanage.jsp"><a data-type="tabAdd" data-id="4">系统公告</a></li>
                <li class="layui-nav-item" mytitle="快捷操作" >
                    <a href="javascript:;">快捷操作</a>
                    <dl class="layui-nav-child">
                        <dd><a data-url="pages/function/rentedHouseManage.jsp" data-type="tabAdd" data-id="5" class="leftdaohangson" mytitle="租赁房屋客户信息">租赁房屋客户信息</a></dd>
                        <dd><a data-type="tabAdd" data-id="6">维护费记录</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <div class="layui-body layui-bg-gray">
        <div class="layui-tab layui-tab-card" lay-allowClose="true" lay-filter="tabs">
            <ul class="layui-tab-title">
            </ul>
            <div class="layui-tab-content" style="height: 750px">

            </div>
        </div>
    </div>

    <div class="layui-footer">
        © layui.com - 底部固定区域
    </div>
</div>
<script>
    function notice(status){
        if(status === 'true'){
            var d=new Date();
            var year=d.getFullYear();
            var month=change(d.getMonth()+1);
            var day=change(d.getDate());
            var hour=change(d.getHours());
            var minute=change(d.getMinutes());
            var second=change(d.getSeconds());
            function change(t){
                if(t<10){
                    return "0"+t;
                }else{
                    return t;
                }
            }
            var time=year+'-'+month+'-'+day+' '+hour+':'+minute+':'+second;
            var status = null;
            var user = document.getElementById('username').value;
            if(d.getHours()<12){
                status = "早上好！"+user
            }else if(d.getHours()<18){
                status = "下午好！"+user
            }else if(d.getHours()<24){
                status = "晚上好！"+user
            }

            swal(status,'\n\n当前时间'+time,'success'); function AddFavorite(title, url) {

                try {

                    window.external.addFavorite(url, title);

                }

                catch (e) {

                    try {

                        window.sidebar.addPanel(title, url,);

                    }

                    catch (e) {

                        alert("抱歉，您所使用的浏览器无法完成此操作。");

                    }

                }

            }
        }else{

        }
    }

</script>
<script>
    //JavaScript代码区域
    layui.use(['form', 'element', 'jquery'], function () {
        var $ = layui.jquery, element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块

        //触发事件
        var active = {
            tabAdd: function () {
                //新增一个Tab项
                var htmlurl = $(this).attr('data-url');
                var mytitle = $(this).attr('mytitle');
                var arrayObj = new Array();　//创建一个数组  
                $(".layui-tab-title").find('li').each(function () {
                    var y = $(this).attr("lay-id");
                    arrayObj.push(y);
                });
                var have = $.inArray(mytitle, arrayObj);  //返回 3,
                if (have >= 0) {
                    element.tabChange('tabs', mytitle); //切换到当前点击的页面
                } else {
                    element.tabAdd('tabs', {
                        title: mytitle //用于演示
                        ,
                        content: '<iframe style="width: 100%;height: 100%;" scrolling="auto" src=' + htmlurl + ' ></iframe>'
                        ,
                        id: mytitle //实际使用一般是规定好的id，这里以时间戳模拟下
                    })
                    element.tabChange('tabs', mytitle); //切换到当前点击的页面
                }
            }

        };
        $(".leftdaohang").click(function () {
            var type = "tabAdd";
            var othis = $(this);
            active[type] ? active[type].call(this, othis) : '';
        });
        var activee = {
            tabAdd: function () {
                //新增一个Tab项
                var htmlurl = $(this).attr('data-url');
                var mytitle = $(this).attr('mytitle');
                var arrayObj = new Array();　//创建一个数组  
                $(".layui-tab-title").find('li').each(function () {
                    var y = $(this).attr("lay-id");
                    arrayObj.push(y);
                });
                var have = $.inArray(mytitle, arrayObj);  //返回 3,
                if (have >= 0) {
                    element.tabChange('tabs', mytitle); //切换到当前点击的页面
                } else {
                    element.tabAdd('tabs', {
                        title: mytitle //用于演示
                        ,
                        content: '<iframe style="width: 100%;height: 100%;" scrolling="auto" src=' + htmlurl + ' ></iframe>'
                        ,
                        id: mytitle //实际使用一般是规定好的id，这里以时间戳模拟下
                    })
                    element.tabChange('tabs', mytitle); //切换到当前点击的页面
                }
            }

        };
        $(".leftdaohangson").click(function () {
            var type = "tabAdd";
            var othis = $(this);
            activee[type] ? activee[type].call(this, othis) : '';
        });

        $(function(){
            var status = document.getElementById('status').value;
            if(status === 'true'){
                notice(status);
                $.ajax({
                    url: "userServlet",
                    type: 'POST',
                    dataType: 'json',
                    data:{
                        "action":"notice",
                    },
                })
            }
        })


    });
</script>
</body>
