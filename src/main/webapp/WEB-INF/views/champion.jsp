<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/champion.css?ver=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js?ver=1"></script>
    <script type="text/javascript" src="/resources/js/champion.js?ver=1"></script>
</head>
<body>
<div class="outer">
    <div class="inner">
        <a href="/">Home</a>
    </div>
</div>


<!-- <div class="firstOne" id="test">
    <div class="firstOne2">
        <div class="tier" > <a href="javascript:tierAjax('bronze');">Bronze</a> </div>
        <div class="tier"> <a href="javascript:tierAjax('silver');">Silver</a> </div>
        <div class="tier"> <a href="javascript:tierAjax('gold');">Gold</a> </div>
        <div class="tier"> <a href="javascript:tierAjax('platinum');">Platinum</a></div>
        <div class="tier"> <a href="javascript:tierAjax('diamond');">Diamond</a></div>
    </div>
</div> -->
<!-- 챔피언 이미지 -->
<div>
    <div id="champ_img">
    </div>
</div>
<!-- 라인선택 승률 -->
<div class="lanewin">
    <div class="lanewinbox">
        <a href="javascript:champAjax('TOP','WIN')">Top</a>
        <a href="javascript:champAjax('JUNGLE','WIN')">Jungle</a>
        <a href="javascript:champAjax('MIDDLE','WIN')">Mid</a>
        <a href="javascript:champAjax('BOT','WIN')">Bottom</a>
        <a href="javascript:champAjax('UTILITY','WIN')">Support</a>
    </div>

    <div class="lanewinheader">
        <span>챔피언</span>
        <span>승률</span>
    </div>
    <div id="lanevalue1"></div>
</div>

<!-- 라인선택 밴률  -->
<div class="laneban">
    <div class="lanebanbox">
        <a href="javascript:champAjax('TOP','BAN')">Top</a>
        <a href="javascript:champAjax('JUNGLE','BAN')">Jungle</a>
        <a href="javascript:champAjax('MIDDLE','BAN')">Mid</a>
        <a href="javascript:champAjax('BOT','BAN')">Bottom</a>
        <a href="javascript:champAjax('UTILITY','BAN')">Support</a>
    </div>
    <div class="lanebanheader">
        <span>챔피언</span>
        <span>승률</span>
    </div>
    <div id="lanevalue2"></div>
</div>

<!-- 미정 -->

</body>
</html>
