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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">

    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
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
<%--<div class="home_btn">
  <a href="/">home</a>
</div>
<form class="search-bar" onsubmit="return false">  <!--자동으로 submit방지-->
  <i class="fas fa-search"></i>
  <input id="userName" class="search-bar__input" type="search" placeholder="전적검색" onKeypress="javascript:if(event.keyCode==13) {summoner_name(event);}"/>
  <!-- 아스키코드 13번은 엔터, 엔터했을때 함수실행 코드 -->
</form>--%>

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


<nav class="navbar navbar-expand-sm navbar-dark bg-dark" aria-label="Third navbar example">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Expand at sm</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample03"
                aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample03">
            <ul class="navbar-nav me-auto mb-2 mb-sm-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled">Disabled</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-bs-toggle="dropdown"
                       aria-expanded="false">Dropdown</a>
                    <ul class="dropdown-menu" aria-labelledby="dropdown03">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
            </ul>
            <form>
                <input name="userName" class="form-control" type="text" placeholder="Search" aria-label="Search" onkeyup="if(window.event.keyCode==13){summoner_name()}">
            </form>
        </div>
    </div>
</nav>













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
</body>
</html>
