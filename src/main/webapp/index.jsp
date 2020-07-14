<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh">
	<head>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
        <title>成都市房屋租赁管理系统</title>
        <meta name="keywords" content="成都市房屋租赁管理系统" />
        <meta name="description" content="成都市房屋租赁管理系统" />
        <link rel="apple-touch-icon" href="https://cdn.mom1.cn/1/favicon.ico">
        <link rel="stylesheet" type="text/css" href="static/css/iconfont.css">
        <link rel="stylesheet" href="static/css/chat.css">
        <script src="static/script/jquery-3.4.1.min.js"></script>
    </head>
     <body style="padding:12% 5% 5% 5%;background-image:url(static/images/home-banner.jpg);">
        <div class="chatContainer" style="z-index: 100;">
         <!-- <div class="qqcss">
         <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1078433422&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:1341483593:53" alt="点击这里给我发消息" title="点击这里给我发消息"/></a>        <i class="iconfont icon-xiaoxi1"></i>
         </div> -->
         <div class="chatBtn">
             <i class="iconfont icon-xiaoxi1"></i>
         </div>
         <div class="chat-message-num"></div>
         <div class="chatBox" ref="chatBox" style="display: none">
             <div class="chatBox-head">
                 <div class="chatBox-head-one">
                     在线客服
                     <div class="chat-close" style="margin: 10px 10px 0 0;font-size: 14px">关闭</div>
                 </div>
                 <div class="chatBox-head-two">
                     <div class="chat-return">返回</div>
                     <div class="chat-people">
                         <div class="ChatInfoHead">
                             <img src="" alt="头像"/>
                         </div>
                         <div class="ChatInfoName">游客007</div>
                     </div>
                     <div class="chat-close">关闭</div>
                 </div>
             </div>
             <div class="chatBox-info">
                 <div class="chatBox-list" ref="chatBoxlist">
                     <div class="chat-list-people">
                         <div><img src="static/images/icon01.png" alt="头像"/></div>
                         <div class="chat-name">
                             <p>客服</p>
                         </div>
                         <div class="message-num">咨询</div>
                     </div>
                     <!--                <div class="chat-list-people">-->
                     <!--                <div><img src="img/icon02.png" alt="头像"/></div>-->
                     <!--                <div class="chat-name">-->
                     <!--                <p>客服2</p>-->
                     <!--                </div>-->
                     <!--                <div class="message-num">1</div>-->
                     <!--                </div>-->
                     <!--                <div class="chat-list-people">-->
                     <!--                <div><img src="img/icon03.png" alt="头像"/></div>-->
                     <!--                <div class="chat-name">-->
                     <!--                <p>客服3</p>-->
                     <!--                </div>-->
                     <!--                <div class="message-num">2</div>-->
                     <!--                </div>-->


                 </div>
                 <div class="chatBox-kuang" ref="chatBoxkuang">
                     <div class="chatBox-content">
                         <div class="chatBox-content-demo" id="chatBox-content-demo">

                             <div class="clearfloat">
                                 <div class="author-name">
                                     <small class="chat-date" id="systime">2019-5-24 19:24:35</small>
                                 </div>
                                 <div class="left">
                                     <div class="chat-avatars"><img src="static/images/icon01.png" alt="头像"/></div>
                                     <div class="chat-message">
                                         你好！请问有什么可以帮到您的吗？
                                     </div>
                                 </div>
                             </div>

                             <!--<div class="clearfloat">-->
                             <!--<div class="author-name">-->
                             <!--<small class="chat-date">2017-12-02 14:26:58</small>-->
                             <!--</div>-->
                             <!--<div class="left">-->
                             <!--<div class="chat-avatars"><img src="img/icon01.png" alt="头像"/></div>-->
                             <!--<div class="chat-message">-->
                             <!--<img src="img/1.png" alt="">-->
                             <!--</div>-->
                             <!--</div>-->
                             <!--</div>-->

                             <!--<div class="clearfloat">-->
                             <!--<div class="author-name">-->
                             <!--<small class="chat-date">2017-12-02 14:26:58</small>-->
                             <!--</div>-->
                             <!--<div class="right">-->
                             <!--<div class="chat-message">嗯，适合做壁纸</div>-->
                             <!--<div class="chat-avatars"><img src="img/icon02.png" alt="头像"/></div>-->
                             <!--</div>-->
                             <!--</div>-->

                         </div>
                     </div>
                     <div class="chatBox-send">
                         <div class="div-textarea"></div>
                         <div>
                             <button id="chat-biaoqing" class="btn-default-styles">
                                 <i class="iconfont icon-biaoqing"></i>
                             </button>
                             <label id="chat-tuxiang" title="发送图片" for="inputImage" class="btn-default-styles">
                                 <input type="file" onchange="selectImg(this)" accept="image/jpg,image/jpeg,image/png"
                                        name="file" id="inputImage" class="hidden">
                                 <i class="iconfont icon-tuxiang"></i>
                             </label>
                             <button id="chat-fasong" class="btn-default-styles"><i class="iconfont icon-fasong"></i>
                             </button>
                         </div>
                         <div class="biaoqing-photo">
                             <ul>
                                 <li><span class="emoji-picker-image" style="background-position: -9px -18px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -40px -18px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -71px -18px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -102px -18px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -133px -18px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -164px -18px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -9px -52px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -40px -52px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -71px -52px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -102px -52px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -133px -52px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -164px -52px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -9px -86px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -40px -86px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -71px -86px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -102px -86px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -133px -86px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -164px -86px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -9px -120px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -40px -120px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -71px -120px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -102px -120px;"></span>
                                 </li>
                                 <li><span class="emoji-picker-image" style="background-position: -133px -120px;"></span>
                                 </li>
                                 <li><span class="emoji-picker-image" style="background-position: -164px -120px;"></span>
                                 </li>
                                 <li><span class="emoji-picker-image" style="background-position: -9px -154px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -40px -154px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -71px -154px;"></span></li>
                                 <li><span class="emoji-picker-image" style="background-position: -102px -154px;"></span>
                                 </li>
                                 <li><span class="emoji-picker-image" style="background-position: -133px -154px;"></span>
                                 </li>
                                 <li><span class="emoji-picker-image" style="background-position: -164px -154px;"></span>
                                 </li>
                             </ul>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
        <div style="text-align:center;border-width:1px;border-style:solid;border-color:rgb(2, 204, 245);background-color:#79918e6b;border-radius:20px;">
          <p>
             <h1 style="color:#fff;font-size:55px;font-family:'幼圆';font-weight:900;"><strong>成都市房屋租赁管理系统</strong>
             </h1>
           <p style="font-size:3vh;color:#fff;">买房子请找我谢谢</p>
            <p style="font-size:3vh;color:#fff;">不买就不爱我</p>

           <p style="line-height:3;">
           <a style="border-radius:10px;padding:7px 30px;color:#fff;border-style:solid;text-decoration:none;" href="${pageContext.request.contextPath}/pages/user/login.jsp">登录</a>
           <a style="border-radius:10px;padding:7px 30px;color:#fff;border-style:solid;text-decoration:none;" href="${pageContext.request.contextPath}/pages/user/register.jsp">注册</a>
         </p><p><script src="https://pv.sohu.com/cityjson?ie=utf-8"></script>
            <span style="color:#bd8787;">你的IP:<script>
                    document.write(returnCitySN["cip"])
                   </script></span>
         </p>
         <p style="color:#fff;">你的地址:<script>
                    document.write(returnCitySN["cname"])
                   </script>© <a style="text-decoration:none;color:#fff;" href="https://www.x6d.com/">OD</a>.版权所有</p>
                   <script type="text/javascript" color="255,255,255" opacity='0.7' zIndex="-2" count="200" src="static/script/canvas-nest.min.js"></script>
        </div>
     
</body>
<script>
        function timenow() {
            var myDate = new Date();
            var times = myDate.toLocaleString( );
            return times
        }

        document.getElementById('systime').innerHTML = timenow();
        screenFuc();
        function screenFuc() {
            var topHeight = $(".chatBox-head").innerHeight();//聊天头部高度
            //屏幕小于768px时候,布局change
            var winWidth = $(window).innerWidth();
            if (winWidth <= 768) {
                var totalHeight = $(window).height(); //页面整体高度
                $(".chatBox-info").css("height", totalHeight - topHeight);
                var infoHeight = $(".chatBox-info").innerHeight();//聊天头部以下高度
                //中间内容高度
                $(".chatBox-content").css("height", infoHeight - 46);
                $(".chatBox-content-demo").css("height", infoHeight - 46);

                $(".chatBox-list").css("height", totalHeight - topHeight);
                $(".chatBox-kuang").css("height", totalHeight - topHeight);
                $(".div-textarea").css("width", winWidth - 106);
            } else {
                $(".chatBox-info").css("height", 495);
                $(".chatBox-content").css("height", 448);
                $(".chatBox-content-demo").css("height", 448);
                $(".chatBox-list").css("height", 495);
                $(".chatBox-kuang").css("height", 495);
                $(".div-textarea").css("width", 260);
            }
        }
        (window.onresize = function () {
            screenFuc();
        })();
        //未读信息数量为空时
        var totalNum = $(".chat-message-num").html();
        if (totalNum == "") {
            $(".chat-message-num").css("padding", 0);
        }
        $(".message-num").each(function () {
            var wdNum = $(this).html();
            if (wdNum == "") {
                $(this).css("padding", 0);
            }
        });


        //打开/关闭聊天框
        $(".chatBtn").click(function () {
            $(".chatBox").toggle(10);
        })
        $(".chat-close").click(function () {
            $(".chatBox").toggle(10);
        })
        //进聊天页面
        $(".chat-list-people").each(function () {
            $(this).click(function () {
                var n = $(this).index();
                $(".chatBox-head-one").toggle();
                $(".chatBox-head-two").toggle();
                $(".chatBox-list").fadeToggle();
                $(".chatBox-kuang").fadeToggle();

                //传名字
                $(".ChatInfoName").text($(this).children(".chat-name").children("p").eq(0).html());

                //传头像
                $(".ChatInfoHead>img").attr("src", $(this).children().eq(0).children("img").attr("src"));

                //聊天框默认最底部
                $(document).ready(function () {
                    $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                });
            })
        });

        //返回列表
        $(".chat-return").click(function () {
            $(".chatBox-head-one").toggle(1);
            $(".chatBox-head-two").toggle(1);
            $(".chatBox-list").fadeToggle(1);
            $(".chatBox-kuang").fadeToggle(1);
        });

        //      发送信息
        $("#chat-fasong").click(function () {
            var textContent = $(".div-textarea").html().replace(/[\n\r]/g, '<br>')
            if (textContent != "") {
                $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                    "<div class=\"author-name\"><small class=\"chat-date\" id=\"timenow\"></small> </div> " +
                    "<div class=\"right\"> <div class=\"chat-message\"> " + textContent + " </div> " +
                    "<div class=\"chat-avatars\"><img src=\"static/images/icon01.png\" alt=\"头像\" /></div> </div> </div>");
                //发送后清空输入框
                $(".div-textarea").html("");
                //聊天框默认最底部
                $(document).ready(function () {
                    $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                });
                document.getElementById('timenow').innerHTML = timenow();

                if(textContent.indexOf("在线客服联系方式是多少") != "-1"){
                    var re = "QQ：1078xxxxxx <br/> Wechat: WAOWAOWAO";
                    reply(re);
                }
                else if(textContent.indexOf("跪求豪哥哥联系方式") != "-1"){
                    var re = "打钱就给";
                    reply(re);
                }
                else if(textContent.indexOf("豪哥哥可爱么") != "-1"){
                    var re = "菊花送上";
                    reply(re);
                }
                else if(textContent.indexOf("豪哥哥可爱4") != "-1"){
                    var re = "还用问！豪哥哥可爱";
                    reply(re);
                }
                else{
                    var re = "请输入正确的关键字：<br> 1.在线客服联系方式是多少<br> 2.跪求豪哥哥联系方式 <br>3.豪哥哥可爱3<br> 4.豪哥哥可爱4";
                    reply(re);
                }

            }
        });

        //      发送表情
        $("#chat-biaoqing").click(function () {
            $(".biaoqing-photo").toggle();
        });
        $(document).click(function () {
            $(".biaoqing-photo").css("display", "none");
        });
        $("#chat-biaoqing").click(function (event) {
            event.stopPropagation();//阻止事件
        });

        $(".emoji-picker-image").each(function () {
            $(this).click(function () {
                var bq = $(this).parent().html();
                console.log(bq)
                $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                    "<div class=\"author-name\"><small class=\"chat-date\" id=\"timenow\"></small> </div> " +
                    "<div class=\"right\"> <div class=\"chat-message\"> " + bq + " </div> " +
                    "<div class=\"chat-avatars\"><img src=\"static/images/icon01.png\" alt=\"头像\" /></div> </div> </div>");
                //发送后关闭表情框
                $(".biaoqing-photo").toggle();
                //聊天框默认最底部
                $(document).ready(function () {
                    $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                });
                document.getElementById('timenow').innerHTML = timenow();
            })
        });
        //自动回复
        function reply(textContent) {
            if (textContent != "") {
                $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                    "<div class=\"author-name\"><small class=\"chat-date\" id=\"timenow\"></small> </div> " +
                    "<div class=\"left\"><div class=\"chat-avatars\"><img src=\"static/images/icon01.png\" alt=\"头像\" /></div>  " +
                    "<div class=\"chat-message\"> " + textContent + " </div> </div> </div>");
                //发送后清空输入框
                //  $(".div-textarea").html("");
                //聊天框默认最底部
                $(document).ready(function () {
                    $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                });
                document.getElementById('timenow').innerHTML = timenow();
            }
        }
        //      发送图片
        function selectImg(pic) {
            if (!pic.files || !pic.files[0]) {
                return;
            }
            var reader = new FileReader();
            reader.onload = function (evt) {
                var images = evt.target.result;
                $(".chatBox-content-demo").append("<div class=\"clearfloat\">" +
                    "<div class=\"author-name\"><small class=\"chat-date\" id=\"timenow\"></small> </div> " +
                    "<div class=\"right\"> <div class=\"chat-message\"><img src=" + images + "></div> " +
                    "<div class=\"chat-avatars\"><img src=\"static/images/icon01.png\" alt=\"头像\" /></div> </div> </div>");
                //聊天框默认最底部
                $(document).ready(function () {
                    $("#chatBox-content-demo").scrollTop($("#chatBox-content-demo")[0].scrollHeight);
                });
                document.getElementById('timenow').innerHTML = timenow();
            };

            reader.readAsDataURL(pic.files[0]);

        }


    </script>
</html>