<%--
  Created by IntelliJ IDEA.
  User: Qing_YoO
  Date: 2020/7/15
  Time: 16:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>请先登录！</title>
</head>
<body>
<span id="remainSeconds">3</span>
<script type="text/javascript">
    setInterval(jump, 1000);
    let sec = 3;

    function jump() {
        sec--;
        if (sec > 0) {
            document.getElementById('remainSeconds').innerHTML = sec;

        } else {
            window.location.href = '/test/pages/user/login.jsp';
        }

    }
</script>
</body>
</html>
