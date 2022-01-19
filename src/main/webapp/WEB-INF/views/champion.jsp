<%--
  Created by IntelliJ IDEA.
  User: MinwooKim
  Date: 2021-12-29
  Time: 오후 1:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
        <link rel="stylesheet" href="/resources/css/champion.css?ver=2">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js?ver=1"></script>
        <script type="text/javascript" src="/resources/js/champion.js?ver=2"></script>
    </head>

    <body>
        <%-- 애니메이션 배경 적용 video Tag -->
        <%--<video controls width="250">--%>

        <%--    <source src="/media/cc0-videos/flower.webm"--%>
        <%--            type="video/webm">--%>

        <%--    <source src="/media/cc0-videos/flower.mp4"--%>
        <%--            type="video/mp4">--%>

        <%--    Sorry, your browser doesn't support embedded videos.--%>
        <%--</video>--%>

        <!-- 상단 메뉴바 -->
        <div class="page">
            <header>
                <a href="/" style="color: white ">
                    <img class="home_img" src="/resources/images/ICON/Home_Icon.png" alt="home">
                </a>
            </header>
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
        <div class="champion_lst">
            <div id="champ_img"></div>
        </div>

    </body>
</html>
