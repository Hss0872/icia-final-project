<%--
  Created by IntelliJ IDEA.
  User: MinwooKim
  Date: 2021-12-29
  Time: 오후 12:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/resources/css/summoner_info.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <script src="/resources/js/summoner_info.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .swal2-container{
            margin: 0 auto;
            position: relative;
            width: 300px;
            height: 420px;
        }
        .swal2-title{
            height: 40px;
            font-size: 20px;
        }
    </style>
</head>
<body>
<div class="home_btn">
  <a href="/">home</a>
</div>
<form class="search-bar" onsubmit="return false">  <!--자동으로 submit방지-->
  <i class="fas fa-search"></i>
  <input id="userName" class="search-bar__input" type="search" placeholder="전적검색" onKeypress="javascript:if(event.keyCode==13) {summoner_name(event);}"/>
  <!-- 아스키코드 13번은 엔터, 엔터했을때 함수실행 코드 -->
</form>

<script>
  function summoner_name(e){
    let userName = document.querySelector('#userName');
    e.preventDefault();

    if(userName.value.length< 2 ){
      Swal.fire({
        title: '최소2글자 이상입니다.',
        imageUrl: 'images/pngwing.com (5).png',
        imageWidth: 260,
        imageHeight: 110,
      })
      userName.value = null;
    }

  }
</script>

<div class="summonerInfo">
    <div class="summonerName">
        ${si.summonerName}
    </div>
    <div class="summonerLevel">
        ${si.level}
    </div>
    <div class="summonerRank">
        ${si.tier}<br>${si.rank}
    </div>
</div>


<div id="gameInfo">


</div>


<script>
    let puuid;

    $.ajax({
        type: "POST",
        url: '/summoner/summoner_info/getjson',
        data: { puuid :"${si.puuid}"},
        dataType: 'json',
        success: function (data) {
            console.log(data)

        },
        error: function (err) {
            console.log(err)
        }

    })

</script>

<%--  url 직접접근 막는 로직    <%--%>
<%--        String summoner_info = request.getHeader("summoner_info");   //이전 url가져오기--%>
<%--                if(summoner_info == null){--%>
<%--                    %>--%>
<%--    <script language="javascript">--%>
<%--        alert("URL을 직접 입력해서 접근하셨습니다.\n정상적인 경로를 통해 다시 접근해 주세요.");--%>
<%--        document.location.href="/";--%>
<%--    </script>--%>
<%--    <%--%>
<%--        return;--%>
<%--                }--%>
<%--    %>--%>

</body>
</html>
