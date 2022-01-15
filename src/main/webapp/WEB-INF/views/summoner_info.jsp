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

    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js">

    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/summoner_info.css?ver=1">
    <script src="/resources/js/summoner_info.js?ver=1"></script>
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="/resources/js/test.js?ver=1"></script>

    <script>

        


        
    </script>

    
       
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
                <div class="col-md-6 inbest">

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
        let spellInfo = ${spellInfo};
        let riot_api_key_list = ["RGAPI-e2c3b20e-ae8c-462e-868a-8e7185c9b12f",
            "RGAPI-c3e0d6de-963c-4068-a9ed-d38a11a63d7c",
            "RGAPI-8713e443-0ba8-4f91-a543-3ef8c87d3fa3",
            "RGAPI-5ad73e8f-a1c8-44ef-b479-bd6beab2610e",
            "RGAPI-73b0d597-e605-41d1-8ad8-175ba2a6ab02"
        ]




        let riot_api_key = "RGAPI-e2c3b20e-ae8c-462e-868a-8e7185c9b12f";
        let name = "${summonerName}";



        



        var summonerdata = getsummoner(name);
        console.log(summonerdata);
        $('<img>').attr('src', "//opgg-static.akamaized.net/images/profile_icons/profileIcon" + summonerdata
                .profileIconId + ".jpg?image=q_auto:best&v=1518361200")
            .attr('class', 'img').appendTo($('#icon'));
        $('#name').html(
            "<h5 ><a id='nameA' href='http://localhost:8090/summoner/summoner_info?userName=" +
            summonerdata
            .name + "'>" + summonerdata.name + "</a></h5>");
        $('#level').html('<h5> level : ' + summonerdata.summonerLevel + '</h5>');
        var rank = getRank(summonerdata.id, summonerdata.name);
        console.log(rank);
        for (let i of rank) {
            if (i.queueType == "RANKED_SOLO_5x5") {
                $('#rank').html('<h5>' + i.tier + '<br>' + i.rank + '</h5>')
            }
        }

        var matchids = getMatchId(summonerdata.puuid);
        console.log(matchids);

        let matchinfo = new Array();
        for (let i of matchids) {



            
            let matchdata;
            let timelinedata;
            matchdata = getMatchData(i, summonerdata.puuid);
            matchinfo[i]=matchdata;

            timelinedata = getTimeLineData(i, summonerdata.puuid);
            console.log(matchdata);
            console.log(timelinedata);
            let container1 = $('<div>').attr("class", "container total").attr('id', 'total');
            let container2=$('<div>').attr('class','container itembuild');

            let row1 = $('<div>').attr("class", "row").attr('id', 'recode');
            let row2 = $('<div>').attr("class", "row select").attr('id', 'select');
            let row4 = $('<div>').attr("class", "row team").attr('id', 'blue');
            let row5 = $('<div>').attr("class", "row team").attr('id', 'red');
            let row7 = $('<div>').attr("class", "row team").attr('id', 'item');
           
            //let test1 = document.getElementById('nameA').getAttribute('')
            let colmd1 = $('<div>').attr("class", "col-md-2");
            let colmd2 = $('<div>').attr("class", "col-md-2");
            let colmd3 = $('<div>').attr("class", "col-md-1");


            let gameInfo = $('<div>').attr('class', 'col-md-1 gameInfo')
            let mode = $('<div>').attr('class', 'mode')
            let win = $('<div>').attr('class', 'win')
            let start = $('<div>').attr('class', 'start')
            let time = $('<div>').attr('class', 'time')
            //자랭 440
            //솔랭 420
            //일겜 430



            if (matchdata.info.gameMode == 'CLASSIC') {
                if (matchdata.info.queueId == 440) {
                    mode.html("<p>자유</p>").appendTo(gameInfo);
                } else if (matchdata.info.queueId == 420) {
                    mode.html("<p>솔로</p>").appendTo(gameInfo);
                } else if (matchdata.info.queueId == 430) {
                    mode.html("<p>일반</p>").appendTo(gameInfo);
                }
            } else if (matchdata.info.gameMode == 'ARAM') {
                mode.html("<p>칼바람</p>").appendTo(gameInfo);
            }

            let startGame = matchdata.info.gameStartTimestamp;
            let startDate = displayedAt(startGame);


            start.html("<p>" + startDate + " </p>").appendTo(gameInfo);
            let playTime = new Date(matchdata.info.gameEndTimestamp - matchdata.info
                .gameStartTimestamp);




            time.html("<p>" + playTime.getMinutes() + "분" + playTime.getSeconds() + "초</p>")
                .appendTo(gameInfo);




        
            let row6 = $('<div>').attr('class','row total');
            let teamside1=$('<div>').attr('class','row teamside');
            let teamside2=$('<div>').attr('class','row teamside');
            for(let v of matchdata.info.teams){
                let teaminfo=$('<div>').attr('class','col-md-3')
                let summoner=$('<div>').attr('class','col-md-2')
                
                let kadd=$('<div>').attr('class','col-md-3')
                let delt=$('<div>').attr('class','col-md-2')
                let ward=$('<div>').attr('class','col-md-1')
                let cs=$('<div>').attr('class','col-md-1')
                
                let blueinfo = $('<div>').attr('class','col-md-4 blueinfo');
                let redinfo = $('<div>').attr('class','col-md-4 redinfo');
                if(v.teamId==100){
                    if(v.win==true){
                        teaminfo.html("<h5>승리</h5><p>블루</p>").appendTo(teamside1);
                    }else if(v.win!=true){
                        teaminfo.html("<h5>패배</h5><p>블루</p>").appendTo(teamside1);
                    }
                    summoner.html("<p>소환사이름</p>").appendTo(teamside1);
                    
                    kadd.html("<p>kda</p>").appendTo(teamside1);
                    delt.html("<p>피해량</p>").appendTo(teamside1);
                    ward.html("<p>와드</p>").appendTo(teamside1);
                    cs.html("<p>cs</p>").appendTo(teamside1);
                    teamside1.prependTo(row4);
                    $('<img>').attr('src','//opgg-static.akamaized.net/images/site/summoner/icon-baron-r.png').appendTo(blueinfo);
                    $('<p>').text(v.objectives.baron.kills).appendTo(blueinfo);
                    $('<img>').attr('src','//opgg-static.akamaized.net/images/site/summoner/icon-dragon-r.png').appendTo(blueinfo);
                    $('<p>').text(v.objectives.dragon.kills).appendTo(blueinfo);
                    $('<img>').attr('src','//opgg-static.akamaized.net/images/site/summoner/icon-tower-r.png').appendTo(blueinfo);
                    $('<p>').text(v.objectives.tower.kills).appendTo(blueinfo);
                    blueinfo.appendTo(row6);






                }else if(v.teamId==200){
                    if(v.win==true){
                        teaminfo.html("<h5>승리</h5><p>레드</p>").appendTo(teamside2);
                    }else if(v.win!=true){
                        teaminfo.html("<h5>패배</h5><p>레드</p>").appendTo(teamside2);
                    }
                
                    summoner.html("<p>소환사이름</p>").appendTo(teamside2);
                    
                    kadd.html("<p>kda</p>").appendTo(teamside2);
                    delt.html("<p>피해량</p>").appendTo(teamside2);
                    ward.html("<p>와드</p>").appendTo(teamside2);
                    cs.html("<p>cs</p>").appendTo(teamside2);
                    teamside2.prependTo(row5);    
                    teamside1.prependTo(row4);
                    $('<img>').attr('src','//opgg-static.akamaized.net/images/site/summoner/icon-baron-r.png').appendTo(blueinfo);
                    $('<p>').text(v.objectives.baron.kills).appendTo(blueinfo);
                    $('<img>').attr('src','//opgg-static.akamaized.net/images/site/summoner/icon-dragon-r.png').appendTo(blueinfo);
                    $('<p>').text(v.objectives.dragon.kills).appendTo(blueinfo);
                    $('<img>').attr('src','//opgg-static.akamaized.net/images/site/summoner/icon-tower-r.png').appendTo(blueinfo);
                    $('<p>').text(v.objectives.tower.kills).appendTo(blueinfo);
                    blueinfo.appendTo(row6);
                }
            }
            for (let y of matchdata.info.participants) {


                //console.log(y.perks.styles[0].style)
                if (y.summonerName == summonerdata.name) {
                    if (y.win == true) {
                        win.html('<p>승리</p>').appendTo(gameInfo);
                    } else if (y.win != true) {
                        win.html('<p>패배</p>').appendTo(gameInfo);
                    }
                    gameInfo.appendTo(row1);
                    let champ = getsummonerinfo(y)
                    champ.attr("class", "col-md-2 champ").appendTo(row1)

                    let kda = getKda(y)
                    kda.attr("class", "col-md-4").appendTo(row1);

                    

                    
                }
                
                if (y.teamId == 100) {
                    let div1 = getpartner(y)
                    div1.appendTo(colmd1);
                    //let teamImg = 
                    let row3 = $('<div>').attr('class', 'row person');
                    let personInfo = getsummonerinfo(y);
                    personInfo.attr('class', 'col-md-2 champ').appendTo(row3);
                    
                    let personname=$('<div>').attr('class','col-md-2');
                    personname.html("<h4>"+y.summonerName +"</h4><h5>"+y.teamPosition+"</h5>").appendTo(row3);
                    
                    
                    
                    let personkda = getKda(y);

                    personkda.attr('class', 'col-md-4 kda').appendTo(row3);

                    let ward = $('<div>').attr('class','col-md-1 ward');
                    ward.html("<p>"+y.wardsPlaced+"<br> score : "+y.visionScore+"</p>").appendTo(row3);
                    
                    let cs = $('<div>').attr('class','col-md-1 cs');
                    cs.html("<p>"+y.totalMinionsKilled+"<br> 분당 cs : "+((y.totalMinionsKilled)/(playTime.getMinutes())).toFixed(2)+"</p>").appendTo(row3);
                                
                    
                    

            





                    row3.appendTo(row4);
                    
                } else if (y.teamId == 200) {
                    let div2 = getpartner(y)
                    div2.appendTo(colmd2);
                    let row3 = $('<div>').attr('class', 'row person');
                    let personInfo = getsummonerinfo(y);
                    personInfo.attr('class', 'col-md-2 champ').appendTo(row3);

                    let personname=$('<div>').attr('class','col-md-2');
                        personname.html("<h4>"+y.summonerName +"</h4><h5>"+y.teamPosition+"</h5>").appendTo(row3);

                    
                    

                    let personkda = getKda(y);
                    personkda.attr('class', 'col-md-4 kda').appendTo(row3);
                    let ward = $('<div>').attr('class','col-md-1 ward');
                    ward.html("<p>"+y.wardsPlaced+"<br> score : "+y.visionScore+"</p>").appendTo(row3);

                    let cs = $('<div>').attr('class','col-md-1 cs');
                    cs.html("<p>"+y.totalMinionsKilled+"<br> 분당 cs : "+((y.totalMinionsKilled)/(playTime.getMinutes())).toFixed(2)+"</p>").appendTo(row3);


                    row3.appendTo(row5);

                    
                    

                    




                }
                let rowa=$('<div>').attr('class', 'row item');
                let sumnail = $('<div>').attr('class','col-md-4 persondd');
                let buyitem = $('<div>').attr('class','col-md-8 personitem').attr('id',"g"+matchdata.info.gameId+"p"+y.participantId);
                for (let z of championNameInfo) {
                    //console.log(y.championId);
                    //console.log(z);
                    if (y.championId == z.championid) {
                        $('<div>').attr("class", "col-md-6 champinfo").html(
                            " <img class='champimg' src='/resources/images/LOL_CHAMPION_ICON/lol_champion_" +
                            z.champion_name_eng + ".png'>").appendTo(sumnail);
                    }sumnail.appendTo(rowa)
                }
                $('<div>').attr("class", "col-md-6 champinfo").html("<h4>"+y.summonerName +"</h4><h5>"+y.teamPosition+"</h5>").appendTo(sumnail);
                for(let b of timelinedata.info.frames){
                    //console.log(b)
                    for(let q of b.events){
                        //console.log("y="+y.participantId);
                        //console.log("b="+b.participantId);
                        //console.log(q)
                        
                        if(q.type=="ITEM_PURCHASED"){
                            
                        //if(y.participantId==b.participantId){
                            //console.log('p='+ y.participantId);

                            if(y.participantId==q.participantId){
                            //if(b.type=="ITEM_PURCHASED"){
                                
                                for(let t of itemInfo){
                                    if(q.itemId==t.item_code){
                                        if(q.itemId != 3340 && q.itemId != 3363 && q.itemId != 3364 && q.itemId != 2055&& q.itemId != 2003&& q.itemId != 2031&& q.itemId != 2033&& q.itemId != 2138&& q.itemId != 2139&& q.itemId != 2140&& q.itemId != 2010){    
                                            let img=$('<img>').attr('class','itemddd');
                                            img.attr('src',"/resources/images/LOL_ITEM_ICON/" + t.item_name_eng + ".png").appendTo(buyitem);
                                        }
                                    }
                                
                                }
                                buyitem.appendTo(rowa);
                               
                            }
                        } else if (q.type=="ITEM_UNDO"){
                            if(y.participantId==q.participantId){
                                if(q.beforeId != 3340 && q.beforeId != 3363 && q.beforeId != 3364 && q.beforeId != 2055&& q.beforeId != 2003&& q.itembeforeIdId != 2031&& q.beforeId != 2033&& q.beforeId != 2138&& q.beforeId != 2139&& q.beforeId != 2140&& q.beforeId != 2010)   {
                                    console.log($("#g"+matchdata.info.gameId+"p"+y.participantId).last());
                                    $("#g"+matchdata.info.gameId+"p"+y.participantId).last().remove();
                                } 
                                        
                                
                            }
                        }
                        
                        
                    }
                }
                
                rowa.appendTo(row7);



                
        
                //drawBasic(y.totalDamageDealtToChampions,document.getElementById('chart'));
            }

            //let test23 = document.getElementById("chart"+matchdata.info.gameId+"p"+x.participantId).getAttribute('id');
            //for(let x of matchdata.info.participants){
            //    let chartid=document.getElementById("chart"+matchdata.info.gameId+"p"+x.participantId)
            //        google.charts.load('current', {packages: ['corechart', 'bar']});
            //        google.charts.setOnLoadCallback(drawBasic);
    
            //        function drawBasic() {
            //        
            //            var data = google.visualization.arrayToDataTable([
            //                ['City', '2010 Population',],
            //                ['New York City, NY', 8175000]
            //            ]);
            //        
            //            var options = {
            //                title: 'Population of Largest U.S. Cities',
            //                chartArea: {width: '50%'},
            //                hAxis: {
            //                    title: 'Total Population',
            //                    minValue: 0
            //                },
            //                vAxis: {
            //                    title: 'City'
            //                }
            //            };
            //        
            //            var chart = new google.visualization.BarChart(chartid);
            //        
            //            chart.draw(data, options);
            //        }
            //  
            //    //drawBasic(x.totalDamageDealtToChampions, test23);
            //    //document.getElementById("chart"+matchdata.info.gameId+"p"+y.participantId));
            //}

















            colmd1.appendTo(row1)
            colmd2.appendTo(row1)
            $('<img>').attr('class', 'btn').attr('id', 'btn').attr("src",
                    "/resources/images/down_arrow_sign.png")
                .attr("onclick", "doDisplay").appendTo(colmd3)
            colmd3.appendTo(row1)
            $('<div>').attr('class', 'col-md-3').html("<a href='#'>종합</a>").appendTo(row2);
            $('<div>').attr('class', 'col-md-3').html("<a href='#'>개인별 아이템 빌드</a>").appendTo(row2);
            $('<div>').attr('class', 'col-md-3').html("<a href='#'>개인별 룬빌드</a>").appendTo(row2);
            $('<div>').attr('class', 'col-md-3').html("<a href='#'>개인별 스킬빌드</a>").appendTo(row2);
            row1.appendTo(recodeInfo);
            row2.appendTo(recodeInfo);

            row4.appendTo(container1);
            row6.appendTo(container1);

            row5.appendTo(container1);
            row7.appendTo(container2)
            
            
            container1.appendTo(recodeInfo);
            container2.appendTo(recodeInfo);
            
        }
        
        
        
        
        



        





        




        function getsummoner(name) {
            let summonerdata;
            $.ajax({
                method: "GET",
                url: "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + name +
                    "?api_key=" +
                    riot_api_key,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType: "json",
                async: false,
                success: function (data) {
                    summonerdata = data;
                    console.log(summonerdata);

                },
                error: function (err) {
                    console.log(err);
                }


            });
            return summonerdata;
        }


        function getRank(id) {
            let rerank;
            $.ajax({
                method: "get",
                url: "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/" + id + "?api_key=" +
                    riot_api_key,
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType: "json",
                async: false,
                success: function (rank) {


                    rerank = rank;

                },
                error: function (err) {

                }
            });
            return rerank;
        }





        function getMatchId(puuid) {
            let matchIdList;
            $.ajax({
                method: "get",
                url: "https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/" + puuid + "/ids?api_key=" +
                    riot_api_key + "&start=0&count=20",
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType: "json",
                async: false,
                success: function (matchid) {

                    /*for (let x of matchid) {

                        getMatchData(x, name)


                    }*/
                    matchIdList = matchid;
                },
                error: function (err) {
                    console.log(err)
                }
            });
            return matchIdList;
        }




        function random(a) {
            return a[Math.floor(Math.random() * a.length)];
        }


        function getMatchData(matchid, userName) {
            let match;
            $.ajax({
                method: "get",
                url: "https://asia.api.riotgames.com/lol/match/v5/matches/" + matchid + "?api_key=" + random(
                    riot_api_key_list),
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType: "json",
                async: false,
                success: function (matchdata) {
                    //console.log(matchdata);
                    match = matchdata;

               


                },
                error: function (err) {

                }
            });
            return match;
        }

        function getTimeLineData(matchid, name) {
            let retimedata;
            $.ajax({
                method: "get",
                url: "https://asia.api.riotgames.com/lol/match/v5/matches/" + matchid + "/timeline?api_key=" +
                    random(riot_api_key_list),
                contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType: "json",
                async: false,
                success: function (timelinedata) {

                    retimedata = timelinedata;
                },
                error: function (err) {

                }
            });
            return retimedata;

        }

        function doDisplay() {
            var con = document.getElementById("btn"); //나타날 id
            if (con.style.display == 'none') {
                con.style.display = 'block';
            } else {
                con.style.display = 'none';
            }
        }

        function getsummonerinfo(y) {
            let row = $('<div>').attr("class", "row");
            let champ = $('<div>').attr('id', 'champ');
            let spell = $('<div>').attr('id', 'spell');
            let rune = $('<div>').attr('id', 'rune');
            for (let z of championNameInfo) {
                //console.log(y.championId);
                //console.log(z);
                if (y.championId == z.championid) {
                    //console.log(userName);


                    $('<div>').attr("class", "champinfo").html(
                        " <img class='champimg' src='/resources/images/LOL_CHAMPION_ICON/lol_champion_" +
                        z.champion_name_eng + ".png'>").appendTo(champ);
                    for (let w of spellInfo) {
                        if (w.key == y.summoner1Id) {
                            $('<div>').attr("class", "spell1").html(
                                    "<img class='spellimg' src='/resources/images/spellimg/" + w.id + ".png'>")
                                .appendTo(spell)
                        } else if (w.key == y.summoner2Id) {
                            $('<div>').attr("class", "spell2").html(
                                    "<img class='spellimg' src='/resources/images/spellimg/" + w.id + ".png'>")
                                .appendTo(spell)
                        }
                    }
                    spell.appendTo(champ)
                    for (let d of runeInfo) {

                        if (d.id == y.perks.styles[0].selections[0].perk) {
                            $('<div>').attr("class", "rune1").html(
                                "<img class='runeimg' src='/resources/images/perk_images/Styles/" + d
                                .rune_category + "/Keystone/" +
                                d.name_eng + ".png'>").appendTo(rune)
                        }

                    }
                    let substyle = y.perks.styles[1].style;
                    if (substyle == 8100) {
                        $('<div>').attr("class", "rune2").html(
                            "<img class='runeimg' src='/resources/images/perk_images/Styles/Domination/Domination.png'>"
                        ).appendTo(rune)
                    } else if (substyle == 8200) {
                        $('<div>').attr("class", "rune2").html(
                                "<img class='runeimg' src='/resources/images/perk_images/Styles/Sorcery/Sorcery.png'>")
                            .appendTo(rune)

                    } else if (substyle == 8000) {
                        $('<div>').attr("class", "rune2").html(
                            "<img class='runeimg' src='/resources/images/perk_images/Styles/Precision/Precision.png'>"
                        ).appendTo(rune)

                    } else if (substyle == 8300) {
                        $('<div>').attr("class", "rune2").html(
                            "<img class='runeimg' src='/resources/images/perk_images/Styles/Inspiration/Inspiration.png'>"
                        ).appendTo(rune)

                    } else if (substyle == 8400) {
                        $('<div>').attr("class", "rune2").html(
                                "<img class='runeimg' src='/resources/images/perk_images/Styles/Resolve/Resolve.png'>")
                            .appendTo(rune)
                    }

                    rune.appendTo(champ)
                    return champ;

                }
            }

        }

        function getKda(y) {
            let kda = $('<div>')
            if (y.deaths != 0) {
                kda.attr('id', 'kda').html("<p>" + y.kills + "/" + y.deaths + "/" + y.assists + "<br>" +
                    ((y.kills + y.assists) / y.deaths).toFixed(2) + "</p>");
            } else if (y.deaths == 0) {
                kda.attr('id', 'kda').html("<p>" + y.kills + "/" + y.deaths + "/" + y.assists + "<br>perfact</p>");
            }
            for (let m of itemInfo) {
                if (m.item_code == y.item0) {
                    $('<img>').attr('class', 'itemimg').attr("src", "/resources/images/LOL_ITEM_ICON/" + m
                        .item_name_eng + ".png").appendTo(kda)
                } else if (m.item_code == y.item1) {
                    $('<img>').attr('class', 'itemimg').attr("src", "/resources/images/LOL_ITEM_ICON/" + m
                        .item_name_eng + ".png").appendTo(kda)
                } else if (m.item_code == y.item2) {
                    $('<img>').attr('class', 'itemimg').attr("src", "/resources/images/LOL_ITEM_ICON/" + m
                        .item_name_eng + ".png").appendTo(kda)
                } else if (m.item_code == y.item3) {
                    $('<img>').attr('class', 'itemimg').attr("src", "/resources/images/LOL_ITEM_ICON/" + m
                        .item_name_eng + ".png").appendTo(kda)
                } else if (m.item_code == y.item4) {
                    $('<img>').attr('class', 'itemimg').attr("src", "/resources/images/LOL_ITEM_ICON/" + m
                        .item_name_eng + ".png").appendTo(kda)
                } else if (m.item_code == y.item5) {
                    $('<img>').attr('class', 'itemimg').attr("src", "/resources/images/LOL_ITEM_ICON/" + m
                        .item_name_eng + ".png").appendTo(kda)
                } else if (m.item_code == y.item6) {
                    $('<img>').attr('class', 'itemimg').attr("src", "/resources/images/LOL_ITEM_ICON/" + m
                        .item_name_eng + ".png").appendTo(kda)
                }
            }
            return kda;
        }

        function getpartner(y) {
            let div = $('<div>').attr('class', 'sum');
            for (let t of championNameInfo) {
                if (y.championId == t.championid) {
                    $('<img>').attr('class', 'c').attr("src", "/resources/images/LOL_CHAMPION_ICON/lol_champion_" +
                        t.champion_name_eng + ".png").appendTo(div);
                    $('<p>').html(y.summonerName + "<br>").appendTo(div)

                }
            }
            return div;
        }

        function displayedAt(createdAt) {
            let date = new Date();
            let mille = (date - createdAt);

            let seconds = mille / 1000

            if (seconds < 60) return "방금 전"
            let minutes = seconds / 60
            if (minutes < 60) return Math.floor(minutes) + '분 전'
            let hours = minutes / 60
            if (hours < 24) return Math.floor(hours) + '시간 전'
            let days = hours / 24
            if (days < 7) return Math.floor(days) + '일 전'
            let weeks = days / 7
            if (weeks < 5) return Math.floor(weeks) + '주 전'
            let months = days / 30
            if (months < 12) return Math.floor(months) + '개월 전'
            let years = days / 365
            return Math.floor(years) + '년 전'
        }
    


    </script>
</body>

</html>