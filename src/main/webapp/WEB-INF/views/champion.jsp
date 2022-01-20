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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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
                    <img class="home_img" src="/resources/images/ICON/Home_Icon(2).png" alt="home">
                </a>
                <input id="searchInput" class="form-control searchInput" type="text" onkeyup="filter()" placeholder="챔피언을 검색하세요." style="width: 300px">
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

    <script type="text/javascript">
        function filter() {
            let search = document.getElementById("searchInput").value.toLowerCase();
            let listInner = document.getElementsByClassName("cl");

            for (let i = 0; i < listInner.length; i++) {
                let champName = listInner[i].getElementsByClassName("champName");
                //country = listInner[i].getElementsByClassName("country");
                if (champName[0].innerHTML.toLowerCase().indexOf(search) != -1) {
                    listInner[i].style.display="inline-block";
                } else {
                    listInner[i].style.display="none";
                }
            }
        }
    </script>
</html>
