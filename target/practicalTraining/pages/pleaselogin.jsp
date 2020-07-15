<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>您还未登录哦！</title>
	<%@ include file="/pages/common/base.jsp"%>
	<style>
		body {margin:0;}
		h1 {font-family:'Lato',sans-serif;font-weight:300;letter-spacing:2px;font-size:35px;}
		p {color: #fff;font-size: 25px;}
		.header {position:relative;text-align:center;background:linear-gradient(60deg,rgba(84,58,183,1) 0%,rgba(0,172,193,1) 100%);color:white;}
		.inner-header {height:65vh;width:100%;margin:0;padding:0;}
		.flex {display:flex;flex-direction:column;justify-content:center;align-items:center;text-align:center;}
		.waves {position:relative;width:100%;height:15vh;margin-bottom:-7px;min-height:100px;max-height:150px;}
		.content {position:relative;height:20vh;text-align:center;background-color:white;}
		.parallax > use {animation:move-forever 25s cubic-bezier(.55,.5,.45,.5)     infinite;}
		.parallax > use:nth-child(1) {animation-delay:-2s;animation-duration:7s;}
		.parallax > use:nth-child(2) {animation-delay:-3s;animation-duration:10s;}
		.parallax > use:nth-child(3) {animation-delay:-4s;animation-duration:13s;}
		.parallax > use:nth-child(4) {animation-delay:-5s;animation-duration:20s;}
		@keyframes move-forever {0% {transform:translate3d(-90px,0,0);}
		100% {transform:translate3d(85px,0,0);}
		}
		@media (max-width:768px) {.waves {height:40px;min-height:40px;}
		.content {height:30vh;}
		h1 {font-size:24px;}
		}
		#UrlId {color:skyblue;font-size:20px;}

	</style>
</head>
<body>
	<div class="header">

		<div class="inner-header flex">
			<h1>您将在<span id="seconds">3</span>秒后进入登录页面</h1>
			<p>当前登录状态已经丢失，请不要越权访问</p>
			<a id="UrlId" href="pages/user/login.jsp">无需等待，点击进入</a>
		</div>

		<!-- 背景 -->
		<div>
			<svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
				<defs>
					<path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
				</defs>
				<g class="parallax">
					<use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,0.7" />
					<use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)" />
					<use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.3)" />
					<use xlink:href="#gentle-wave" x="48" y="7" fill="#fff" />
				</g>
			</svg>
		</div>

	</div>
</body>
</html>
<script>

	var url = document.getElementById("UrlId").href;
	// 获取秒数显示id
	var seconds = document.getElementById("seconds");
	// 设置秒数
    var num = 3;
    var timer = setInterval(function () {
        num--;
        seconds.innerText = num;
        if(num == 0){
            window.location.href = url;
        }
    },1000)
</script>