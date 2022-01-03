<%--
  Created by IntelliJ IDEA.
  User: MinwooKim
  Date: 2021-12-29
  Time: 오전 11:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/home.css">
</head>
<body>
<div class="container">
    <div class="test">First.gg</div>
    <div class="box">
        <a href="/champion"><img src="/resources/images/uhdpaper.com-2750e-pc-2k.jpg"/></a>
        <span>챔피언정보</span>
    </div>
    <div class="box">
        <a href="/summoner"><img src="/resources/images/uhdpaper.com-2891f-pc-2kjayce.jpg"></a>
        <span>전적검색</span>
    </div>
    <div class="box">
        <a href="/community"><img src="/resources/images/Jarvan-League-of-Legends-purple-LoL_jarban.jpg"></a>
        <span>커뮤니티</span>
    </div>
    <div class="box">
        <a href="/manager"><img src="/resources/images/vi.jpg"></a>
        <span></span>
    </div>
</div>

<script>
    console.log("${championInfo}")
    console.log("${itemInfo}")
    console.log("${skillInfo}")
    console.log("${runeInfo}")
</script>
</body>
</html>
