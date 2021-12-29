<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/summoner.css">
    <script src="/resources/js/summoner.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div id="canvas_container">
    <a href="/">
        <img src="/resources/images/pngwing.com (2).png" alt="aaaa">
    </a>
</div>
<form class="summoner_search" method="get" onsubmit="return summoner_name()" action="/summoner/summoner_info">
    <div class="search">
        <input name=userName id="userName" type="text" placeholder="Search User">
        <button class="btn">Search</button>
    </div>
</form>

</body>
</html>
