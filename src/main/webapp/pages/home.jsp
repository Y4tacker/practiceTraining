<%@ page import="com.renhouse.lisentner.OnlineNumberListener" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html style="font-size: 30.7292px; min-width: 1440px;">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <%@ include file="/pages/common/head.jsp"%>
    <title>成都市房屋租赁管理系统</title>
    <script src="static/script/sweetalert.min.js"></script>
    <script src="static/script/md5.js"></script>
    <script src="static/script/notice.js"></script>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <input type="hidden" id="username" name="username" value="${sessionScope.user.username}">
    <input type="hidden" id="status" name="status" value="${sessionScope.noticeStatus}">
    <div class="layui-header">
        <div class="layui-logo">房屋租赁管理系统</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a href="javascript:;" onclick="showNotice();" >系统公告</a></li>
            <li clas
            <li class="layui-nav-item lockcms" pc>
                <a href="javascript:;"><i class="seraph icon-lock"></i><cite>锁屏</cite></a>
            </li>
            <li class="layui-nav-item" pc>
                <a href="javascript:;" class="clearCache"><i class="layui-icon" data-icon="&#xe640;">&#xe640;</i><cite>清除缓存</cite><span class="layui-badge-dot"></span></a>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;"><img src="//t.cn/RCzsdCq" class="layui-nav-img">${sessionScope.user.username}</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" id="changepass">修改密码</a></dd>
                    <dd><a href="javascript:;">头像更改</a></dd>
                    <dd><a href="userServlet?action=logout">安全退出</a></dd>
                </dl>
            </li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item leftdaohang" mytitle="主页" data-url="pages/function/main.jsp" id="mainpage"><a data-type="tabAdd" data-id="2">主页</a></li>
                <li class="layui-nav-item leftdaohang" mytitle="房产管理" data-url="pages/function/housemanage.jsp"><a data-type="tabAdd" data-id="0">房产管理</a></li>
                <li class="layui-nav-item leftdaohang" mytitle="预定订单" data-url="pages/function/ordermanage.jsp"><a data-type="tabAdd" data-id="1">预定订单</a></li>
                <li class="layui-nav-item leftdaohang" mytitle="我的账单" data-url="pages/function/myBill.jsp"><a data-type="tabAdd" data-id="3">我的账单</a></li>
                <li class="layui-nav-item" mytitle="快捷操作" >
                    <a href="javascript:;">快捷操作</a>
                    <dl class="layui-nav-child">
                        <dd><a data-url="pages/function/rentedHouseManage.jsp" data-type="tabAdd" data-id="5" class="leftdaohangson" mytitle="租赁房屋客户信息">租赁房屋客户信息</a></dd>
                        <dd><a data-url="pages/function/feeManange.jsp" data-type="tabAdd" data-id="6" class="leftdaohangson" mytitle="维护费记录">维护费记录</a></dd>
                        <dd><a data-url="pages/function/unRentedHouseInfo.jsp" data-type="tabAdd" data-id="6" class="leftdaohangson" mytitle="闲置房屋">闲置房屋</a></dd>
                        <dd><a data-url="pages/function/leaseExpiryInfo.jsp" data-type="tabAdd" data-id="7" class="leftdaohangson" mytitle="租约到期">租约到期</a></dd>
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

    <div class="layui-footer" style="text-align:center;background:white" >
        © layui.com - 底部固定区域
        在线人数为：${sessionScope.online}
    </div>
    <input type="hidden" name="ps" id="ipt_password"  value="${sessionScope.user.password}">
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
        document.querySelector('body > div.layui-layout.layui-layout-admin > div.layui-side.layui-bg-black > div > ul > li:nth-child(1) > a').click();
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
        $('#changepass').click(function () {
            layer.prompt({
                title: "修改密码",
                shadeClose: true,
                shade: 0.8,
                btnAlign: 'l',
                btn: ['确认', '取消'],
                offset: '120px',
                yes: function (index, obj) {
                    var firstpass = obj.find('#firstpass').val();
                    var secondpass = obj.find('#secondpass').val();
                    var loading = layer.msg("正在修改", {
                        icon: 16,
                        shade: 0.3,
                        time: 0
                    });
                    var finish = false;
                    $.ajax({
                        url: 'userServlet',
                        method: 'POST',
                        async: false,
                        dataType: 'json',
                        data: {
                            'action': 'modifyPassword',
                            'password':firstpass,
                            'repassword': secondpass,
                        },
                        success: function (res) {
                            layer.close(loading);
                            if (res.code == 0) {
                                finish = true;
                                layer.msg(res.msg, {
                                    title: '成功'
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
                content: $('#changepassform')
            });
        })
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
        //清理缓存
        $(".clearCache").click(function(){
            window.sessionStorage.clear();
            window.localStorage.clear();
            var index = layer.msg('清除缓存中，请稍候',{icon: 16,time:false,shade:0.8});
            setTimeout(function(){
                layer.close(index);
                layer.msg("缓存清除成功！");
            },1000);
        })
        function lockPage(){
            layer.open({
                title : false,
                type : 1,
                content : '<div class="admin-header-lock" id="lock-box" >'+
                    '<p></p>'+
                    '<button class="layui-btn"  style="background: black;color:white;width:190px;disabled:true;display:block;margin:0 auto">请输入用户密码解锁</button>'+
                    '<div class="input_btn">'+
                    '<input type="password" class="admin-header-lock-input layui-input" autocomplete="off" placeholder="请输入密码解锁.." name="lockPwd" id="lockPwd" />'+
                    '<button class="layui-btn" id="unlock" style="background: black;color:white;display:block;margin:0 auto">解锁</button>'+
                    '</div>'+
                    '<p> </p>'+
                    '</div>',
                closeBtn : 0,
                shade : 0.9,
                success : function(){
                    //判断是否设置过头像，如果设置过则修改顶部、左侧和个人资料中的头像，否则使用默认头像
                    if(window.sessionStorage.getItem('userFace') &&  $(".userAvatar").length > 0){
                        $(".userAvatar").attr("src",$(".userAvatar").attr("src").split("images/")[0] + "images/" + window.sessionStorage.getItem('userFace').split("images/")[1]);
                    }
                }
            })
            $(".admin-header-lock-input").focus();
        }
        $(".lockcms").on("click",function(){
            window.sessionStorage.setItem("lockcms",true);
            lockPage();
        })
        // 判断是否显示锁屏
        if(window.sessionStorage.getItem("lockcms") == "true"){
            lockPage();
        }
        // 解锁
        $("body").on("click","#unlock",function(){
            if($(this).siblings(".admin-header-lock-input").val() == ''){
                layer.msg("请输入解锁密码！");
                $(this).siblings(".admin-header-lock-input").focus();
            }else{
                if(hex_md5($(this).siblings(".admin-header-lock-input").val()) == $("#ipt_password").val()){
                    window.sessionStorage.setItem("lockcms",false);
                    $(this).siblings(".admin-header-lock-input").val('');
                    layer.closeAll("page");
                }else{
                    layer.msg("密码错误，请重新输入！");
                    $(this).siblings(".admin-header-lock-input").val('').focus();
                }
            }
        });
        $(document).on('keydown', function(event) {
            var event = event || window.event;
            if(event.keyCode == 13) {
                $("#unlock").click();
            }
        });



    });
</script>
</body>
<div class="layui-form" id="changepassform" style="width:500px;display:none">
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">新密码<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="password" name="firstpass" required lay-verify="required" style="width:300px"
                   autocomplete="off" class="layui-input" id="firstpass">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"style="width:125px;display:block;overflow:hidden;white-space:nowrap; ">确认密码<span style="color: red">*</span></label>
        <div class="layui-input-block">
            <input type="password" name="secondpass" required lay-verify="required" style="width:300px"
                   autocomplete="off" class="layui-input" id="secondpass">
        </div>
    </div>
</div>
</html>
