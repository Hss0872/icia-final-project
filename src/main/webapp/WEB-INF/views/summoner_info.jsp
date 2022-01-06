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
    <%--<link rel="stylesheet" href="/resources/css/summoner_info.css">--%>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <script src="/resources/js/summoner_info.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">

    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <style>
        .container {
            background-color: rgba(255, 0, 0, 0.53);


        }
        .summoner_info{
            border-radius: 20px;
        }

        .icon {
            width: 30%;
            height: 30%;
        }

        .img {
            width: 100px;
            height: 100px;
        }

        .info {
            width: 40%;
            height: 40%;
            display: inline-block;
        }

        .background{
            width: 100%; height: 100%;

            /* 배경이미지는 최소 1920*960으로 제작해야 문제가 안생김 */
            background-image: url('https://user-images.githubusercontent.com/26748614/96337246-f14d4580-1085-11eb-8793-a86d929e034d.jpg');
            background-repeat: no-repeat; /* 배경이미지X */
            background-size: cover; /* 요소를 비율에 맞게 커버 */
            background-position: center; /* 이미지를 요소의 정가운데로 처리 */
            background-attachment: fixed; /* 스크롤바 움직일때 이미지가 따라다님 */
            overflow: auto;
        }
    </style>
</head>

<body>


    <script>
        function summoner_name(e) {
            let userName = document.querySelector('#userName');
            e.preventDefault();

            if (userName.value.length < 2) {
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

    <div class="background">
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark" aria-label="Third navbar example">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Expand at sm</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false"
                    aria-label="Toggle navigation">
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
                        <input name="userName" class="form-control" type="text" placeholder="Search" aria-label="Search"
                            onkeyup="if(window.event.keyCode==13){summoner_name()}">
                    </form>
                </div>
            </div>
        </nav>












        <div class="container a summoner_info">
            <div class="row summoner">
                <div class="col-md-2">
                    <div class="icon" id="icon"></div>

                </div>
                <div class="col-md-4">
                    <div class="info" id="info">
                        <div class="name" id="name"></div>
                        <div class="level" id="level"></div>
                        <div class="rank" id="rank"></div>
                    </div>
                </div>
                <div class="col-md-6">

                </div>
            </div>







        </div>

        <div class="container b" id="recodeInfo">


        </div>

    </div>
    <script>
        let recodeInfo = $('#recodeInfo');

        let championNameInfo = ${championInfo};
        let skillInfo = ${skillInfo};
        let itemInfo = ${itemInfo};
        let runeInfo = ${runeInfo};




        let riot_api_key = "RGAPI-e2c3b20e-ae8c-462e-868a-8e7185c9b12f";
        let name = "${summonerName}";
        $.ajax({
            method: "GET",
            url: "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + name +
                "?api_key=" +
                riot_api_key,
            contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
            dataType: "json",
            success: function (data) {

                console.log(data);
                $('<img>').attr('src', "//opgg-static.akamaized.net/images/profile_icons/profileIcon" + data
                        .profileIconId + ".jpg?image=q_auto:best&v=1518361200")
                    .attr('class', 'img').appendTo($('#icon'))
                $('#name').html(
                    "<h5 ><a id='nameA' href='http://localhost:8090/summoner/summoner_info?userName=" +
                    data
                    .name + "'>" + data.name + "</a></h5>")
                $('#level').html('<h5> level : ' + data.summonerLevel + '</h5>')


                getRank(data.id, data.name);
                getMatchId(data.puuid, data.name)

            },
            error: function (err) {
                console.log(err);
            }

        })

        function getRank(id, name) {
            $.ajax({
                method: "get",
                url: "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/" + id + "?api_key=" +
                    riot_api_key,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType: "json",
                success: function (rank) {
                    console.log(rank);
                    for (let i of rank) {
                        if (i.queueType == "RANKED_SOLO_5x5") {
                            $('#rank').html('<h5>' + i.tier + '<br>' + i.rank + '</h5>')
                        }
                    }

                },
                error: function (err) {

                }
            })
        }





        function getMatchId(puuid, name) {
            $.ajax({
                method: "get",
                url: "https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/" + puuid + "/ids?api_key=" +
                    riot_api_key + "&start=0&count=20",
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType: "json",
                success: function (matchid) {

                    for (let x of matchid) {

                        getMatchData(x, name)
                        getTimelineData(x, name)

                    }
                },
                error: function (err) {

                }
            })
        }
        let riot_api_key_list = ["RGAPI-e2c3b20e-ae8c-462e-868a-8e7185c9b12f",
            "RGAPI-c3e0d6de-963c-4068-a9ed-d38a11a63d7c",
            "RGAPI-8713e443-0ba8-4f91-a543-3ef8c87d3fa3",
            "RGAPI-5ad73e8f-a1c8-44ef-b479-bd6beab2610e",
            "RGAPI-73b0d597-e605-41d1-8ad8-175ba2a6ab02"
        ]

        function random(a) {
            return a[Math.floor(Math.random() * a.length)]
        }


        function getMatchData(matchid, userName) {
            $.ajax({
                method: "get",
                url: "https://asia.api.riotgames.com/lol/match/v5/matches/" + matchid + "?api_key=" + random(
                    riot_api_key_list),
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType: "json",
                success: function (matchdata) {
                    console.log(matchdata);
                    let row = $('<div>').attr("class", "row");
                    //let test1 = document.getElementById('nameA').getAttribute('')

                    for (let y of matchdata.info.participants) {

                        if (y.summonerName == userName) {

                            for (let z of championNameInfo) {
                                //console.log(y.championId);
                                //console.log(z);
                                if (y.championId == z.championid) {
                                    //console.log(userName);
                                    let champ=$('<div>').attr('id', 'champ');
                                    champ.attr("class", "col-md-3").appendTo(row);
                                    $('<div>').attr("class","img").html(
                                    " <img src='/resources/images/LOL_CHAMPION_ICON/lol_champion_" +
                                    z.champion_name_eng + ".png'>").appendTo(champ);
                                    for(let w of spellInfo) {
                                        $('<div>').attr("class", "spell1").html("<img src='/resources/images/spell/" + dfd + ".png'>").appendTo(champ)
                                        $('<div>').attr("class", "spell2").html("<img src='/resources/images/spell/" + dfd + ".png'>").appendTo(champ)

                                    }

                                }
                            }
                            $('<div>').attr("class", "col-md-9").appendTo(row);
                            row.appendTo(recodeInfo);



                        }
                    }

                },
                error: function (err) {

                }
            })
        }

        function getTimelineData(matchid, name) {
            $.ajax({
                method: "get",
                url: "https://asia.api.riotgames.com/lol/match/v5/matches/" + matchid + "/timeline?api_key=" +
                    random(riot_api_key_list),
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType: "json",
                success: function (timelinedata) {
                    console.log(timelinedata);

                },
                error: function (err) {

                }
            })

        }
    </script>
</body>

</html>