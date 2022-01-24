<%--
  Created by IntelliJ IDEA.
  User: tjdnf
  Date: 2022-01-13
  Time: 오후 2:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/js/summoner_info.js?ver=8"></script>
    <link rel="stylesheet" href="/resources/css/summoner_info.css?ver=8">



</head>

<body>

    <div class="background">
        <nav class="navbar navbar-expand-sm navbar-dark bg-dark" aria-label="Third navbar example">
            <div class="container-fluid">
                <a class="navbar-brand" href="/"><img class="simbol" src="/resources/images/Full.png"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsExample03">
                    <ul class="navbar-nav me-auto mb-2 mb-sm-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/champion">챔피언 정보</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/summoner">전적 검색</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/community/board/free">커뮤니티</a>
                        </li>
                        <!-- <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-bs-toggle="dropdown"
                                aria-expanded="false">Dropdown</a>
                            <ul class="dropdown-menu" aria-labelledby="dropdown03">
                                <li><a class="dropdown-item" href="">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li> -->
                    </ul>
                    <form>
                        <input name="userName" class="form-control" type="text" placeholder="Search" aria-label="Search"
                            onkeyup="if(window.event.keyCode==13){summoner_name()}">
                    </form>
                </div>
            </div>
        </nav>












        <div class="container-fluid a summoner_info">
            <div class="row summoner">
                <div class="col-1 icon">
                    

                </div>
                <div class="col-2 bro">
                    <div class="info" id="info">
                        <div class="name" id="name">

                        </div>
                        <div class="level" id="level">

                        </div>
                        <div class="rank" id="rank">

                        </div>
                    </div>
                </div>
                <div class="col-3 likeChamp">
                    
                </div>
                <div class="col-3 winRate">
                    
                </div>
                <div class="col-3 likeLane">
                    
                </div>
            </div>







        </div>

        <div class="container-fluid b" id="recodeInfo">


            <div class="row recode" id="recode">
                <div class="col-1 gameInfo">
                    <div class="mode"></div>
                    <div class="end"></div>
                    <div class="time"></div>
                    <div class="win"></div>
                </div>
                <div class="col-2 champ">
                    <div class="champinfo"></div>
                    <div class="spell">
                        <div class="spell1">
                        </div>
                        <div class="spell2">
                        </div>
                    </div>
                    <div class="rune">
                        <div class="rune1"></div>
                        <div class="rune2"></div>
                    </div>
                </div>
                <div class="col-4 kda">

                </div>
                <div class="col-2 partner1">

                </div>
                <div class="col-2 partner2">

                </div>
                <div class="col-1 detail"></div>
            </div>


            <div class="row selectBar">
                <div class="col-3 opentotal"><a href="#">종합</a></div>
                <div class="col-3 openitem"><a href="#">개인별 아이템 빌드</a></div>
                <div class="col-3 openrune"><a href="#">개인별 룬빌드</a></div>
                <div class="col-3 openskill" ><a href="#">개인별 스킬빌드</a></div>
            </div>
            <div class="container total" id="total">
                <div class="row teamblue" id="blue">
                    <div class="row teamside">
                        <div class="col-2 win">

                        </div>
                        <div class="col-2 summonerName">
                            <h4>소환사이름</h4>
                        </div>
                        <div class="col-4 summonerKda">
                            <h4>kda</h4>
                        </div>
                        <div class="col-2 dealt">
                            <h4>피해량</h4>
                        </div>
                        <div class="col-1 ward">
                            <h4>와드</h4>
                        </div>
                        <div class="col-1 cs">
                            <h4>cs</h4>
                        </div>
                    </div>
                    <div class="row person">
                        <div id="champ" class="col-2 champ">
                            <div class="champinfo"></div>
                            <div class="spell">
                                <div class="spell1"></div>
                                <div class="spell2"></div>
                            </div>
                            <div class="rune">
                                <div class="rune1"></div>
                                <div class="rune2"></div>
                            </div>
                        </div>
                        <div class="col-2 partnerName">

                        </div>
                        <div id="kda" class="col-4 kda">

                        </div>
                        <div class="col-2 dealt"></div>
                        <div class="col-1 ward">

                        </div>
                        <div class="col-1 cs">

                        </div>
                    </div>

                </div>
                <div class="row totalInfo">
                    <div class="col-4 blueinfo">
                        
                    </div>
                    
                    <div class="col-2 kill"></div>
                    <div class="col-2 gold"></div>

                    
                    <div class="col-4 redinfo">
                        
                    </div>
                </div>
                <div class="row teamred" id="red">
                    <div class="row teamside">
                        <div class="col-2 win">

                        </div>
                        <div class="col-2 summonerName">
                            <h4>소환사이름</h4>
                        </div>
                        <div class="col-4 summonerKda">
                            <h4>kda</h4>
                        </div>
                        <div class="col-2 dealt">
                            <h4>피해량</h4>
                        </div>
                        <div class="col-1 ward">
                            <h4>와드</h4>
                        </div>
                        <div class="col-1 cs">
                            <h4>cs</h4>
                        </div>
                    </div>

                </div>
            </div>
            <div class="container itembuild">
                <div class="row teamblue" id="item">                    
                    <div class="row personitem">
                        <div class="col-4 champd"></div>
                        <div class="col-8 peritembuild"></div>
                    </div>
                </div>
                <div class="row teamred" id="item">
                    

                </div>
            </div>
            <div class="container runebuild">
                <div class="row runeblue">
                    
                    <div class="row runePage">
                        <div class="col-2 champdd">

                        </div>
                        <div class="col-1 propertydiv">
                            <div class="property">

                            </div>
                        </div>
                        <div class="col-3 rune1">
                            <div class="bigrune"></div>
                            <div class="arune"></div>
                            <div class="brune"></div>
                            <div class="crune"></div>
                        </div>
                        <div class="col-3 rune2">
                            <div class="subproperty"></div>
                            <div class="sunrune1"> </div>
                            <div class="sunrune2"> </div>
                            <div class="sunrune3"> </div>
                        </div>
                        <div class="col-3 flex">
                            <div class="offense"></div>
                            <div class="flex"></div>
                            <div class="defense"></div>
                        </div>
                    </div>
                </div>
                <div class="row runered">
                    
                </div>

            </div>
            <div class="container tskillbuild">
                <div class="row buildblue">
                    <div class="row personskill">
                        <div class="col-4 champs"></div>
                        <div class="col-7 build">
                            <table class="skillbuild">
                                <colgroup>
                                    <col>
                                </colgroup>
                                <tbody class="content">
                                    <tr class="Q"></tr>
                                    <tr class="W"></tr>
                                    <tr class="E"></tr>
                                    <tr class="R"></tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row buildred">
                    
                </div>
            </div>

            </div>
        </div>

    </div>
    <script>
        let championNameInfo = ${championInfo};
        let skillInfo = ${skillInfo};
        let itemInfo = ${itemInfo};
        let runeInfo = ${runeInfo};
        let spellInfo = ${spellInfo};

        let name = "${summonerName}";
        summonerData = getsummoner(name);
        rank = getRank(summonerData.id);
        darwInfo(summonerData, rank);
        gameIdList = getMatchId(summonerData.puuid);
        DataList = getMatchDataList(gameIdList);
        console.log(DataList);
        let winCount = 0;
        let champList= new Array();
        let laneList= new Array();
        let kill=0;
        let assist=0;
        let death=0;

        for (let i in DataList) {
            let $recodeSummonerInfo = $('.recode').clone(true).attr('class', "row recode" + i);
            let $selectBar = $('.selectBar').clone(true).attr('class', "row selectBar" + i);
            let $total = $('.total').clone(true).attr('class', "container total" + i);
            let $rune = $('.runebuild').clone(true).attr('class', "container runebuild" + i);
            let $item = $('.itembuild').clone(true).attr('class', "container itembuild" + i);
            let $skill = $('.tskillbuild').clone(true).attr('class',"container tskillbuild" + i)
            let playTime = new Date(DataList[i][0].info.gameEndTimestamp - DataList[i][0].info.gameStartTimestamp)
            let bluegold = 0;
            let redgold = 0;
            
            

            context(DataList[i][0].info.teams, $total);
            for (let y of DataList[i][0].info.participants) {
                let $person1 = $total.find('.person').clone(true).attr('class', "row person" + DataList[i][0].info
                    .gameId + y.participantId);
                
                
                //검색한 소환사와 매치데이터내의 정보 일치시
                if (y.summonerName == summonerData.name) {
                    //let champNameInfo=new Object();
                    
                    
                    for(let t of championNameInfo){
                        if(t.championid==y.championId){
                            champList.push(t.champion_name_eng);
                        }
                    }
                    laneList.push(y.teamPosition);
                    //소환사의 플래이한 챔피언과 룬,스킬 정보
                    getChampInfo(y, $recodeSummonerInfo);
                    getkdaInfo(y, $recodeSummonerInfo);
                    getItemInfo(y, $recodeSummonerInfo);
                    //승리정보
                    getWin(y, $recodeSummonerInfo);
                    getGameInfo(DataList[i][0], $recodeSummonerInfo);
                    let btn=$('<div>').html("<svg xmlns='http://www.w3.org/2000/svg' width='30' height='50' fill='currentColor' class='bi bi-arrow-down-short' viewBox='0 0 16 16'><path fill-rule='evenodd' d='M8 4a.5.5 0 0 1 .5.5v5.793l2.146-2.147a.5.5 0 0 1 .708.708l-3 3a.5.5 0 0 1-.708 0l-3-3a.5.5 0 1 1 .708-.708L7.5 10.293V4.5A.5.5 0 0 1 8 4z'/></svg>");
                    if(y.win==true){
                        winCount+=1;
                    }
                    kill+=y.kills;
                    assist+=y.assists;
                    death+=y.deaths;
                    $recodeSummonerInfo.children('.detail').append(btn);
                }
                getPartner(y, $recodeSummonerInfo);
                //설명 메뉴바

                //게임참여한 소환사별 정보
                getChampInfo(y, $person1);
                //룬빌드
                getRuneBuild(y,$rune);
                if (y.teamId == 100) {
                    $person1.appendTo($total.children('#blue'));
                    bluegold+=y.goldEarned;
                } else if (y.teamId == 200) {
                    $person1.appendTo($total.children('#red'));
                    redgold+=y.goldEarned;
                }
                $person1.children('.partnerName').html("<p>" + y.summonerName + "<br>" + y.teamPosition + "</p>")
                getkdaInfo(y, $person1);
                getItemInfo(y, $person1);
                getDealtWardCs(y,$person1,playTime);

              
                
                
                getItemBuild(y, DataList[i][1].info, $item);
                getSkillBuild(y, DataList[i][1].info, $skill);

                
            

            }

            
            getTotalData(DataList[i][0].info.teams,bluegold,redgold,$total);





        
            
            $recodeSummonerInfo.find('.detail').click(function(){
                if($selectBar.css('display') =='none'){
                    $selectBar.show();
                    $total.show();

                }else {
                    $selectBar.hide();
                    $total.hide();
                    $item.hide();
                    $rune.hide();
                    $skill.hide();


                }
            });
            $selectBar.find('.opentotal').click(function(){
                if($total.css('display') =='none'){
                    $total.show();
                    $item.hide();
                    $rune.hide();
                    $skill.hide();
                }else {
                    $total.hide();
                }
            });
            $selectBar.find('.openitem').click(function(){
                if($item.css('display') =='none'){
                    $total.hide();
                    $item.show();
                    $rune.hide();
                    $skill.hide();
                }else {
                    $item.hide();
                }
            });$selectBar.find('.openrune').click(function(){
                if($rune.css('display') =='none'){
                    $total.hide();
                    $item.hide();
                    $rune.show();
                    $skill.hide();
                }else {
                    $rune.hide();
                }
            });$selectBar.find('.openskill').click(function(){
                if($skill.css('display') =='none'){
                    $total.hide();
                    $item.hide();
                    $rune.hide();
                    $skill.show();
                }else {
                    $skill.hide();
                }
            });



            $recodeSummonerInfo.appendTo($('.b'));
            $selectBar.hide().appendTo($('.b'));
            $total.appendTo($('.b'));
            $item.hide().appendTo($('.b'));
            $rune.hide().appendTo($('.b'));
            $skill.hide().appendTo($('.b'))
            
        }
        

        $('<p>').attr('class','rate').text( "승률 : " + winCount/20*100 + "%").appendTo($('.winRate'));
        $('<p>').attr('class','killrate').text( "K / D / A : " + (kill/20).toFixed(2) + " / "+(death/20).toFixed(2)+" / "+(assist/20).toFixed(2)).appendTo($('.winRate'));
        $('<p>').attr('class','kdarate').text( "KDA : " + ((kill+assist)/death).toFixed(2)).appendTo($('.winRate'));






        laneRate= new Object();
        laneRate.TOP = 0;
        laneRate.JUNGLE = 0;
        laneRate.MIDDLE = 0;
        laneRate.BOTTOM = 0;
        laneRate.UTILITY = 0;
        for(let i of laneList){
            if(i=="TOP"){
                laneRate.TOP += 1;
            }else if(i=="JUNGLE"){
                laneRate.JUNGLE += 1;
            }else if(i=="MIDDLE"){
                laneRate.MIDDLE += 1;
            }else if(i=="BOTTOM"){
                laneRate.BOTTOM += 1;
            }else if(i=="UTILITY"){
                laneRate.UTILITY +=1;
            }
        }
        let laneInfo=JSON.stringify(laneRate);
        
        //const arr = ['a', 'b', 'a', 'b', 'c'];
        drawlikland(laneRate,$('.a'));

        const result =champList.reduce((accu, curr) => { 
            accu[curr] = (accu[curr] || 0)+1; 
            return accu;
          },{});
        

        
        let champNameInfoList=new Array();
        for(let o of Object.keys(result)){
            //console.log(o);
            //console.log(valueOf(o));
            let champNameInfo=new Object();
            champNameInfo.name=o;
            champNameInfo.count=result[o];
            for(let m of championNameInfo){
                if(m.champion_name_eng==o){
                    champNameInfo.name_kr=m.champion_name_kr;
                }
            }
            champNameInfoList.push(champNameInfo);
        }
        console.log(champNameInfoList);
        
        function custonSort(a, b) {
            if(a.total == b.total){
                return 0
            }
            return a.total > b.total ? 1 : -1; 
        }
        champNameInfoList.sort(custonSort);
        
        for(let n in champNameInfoList){
            if(n==3){
                break;
            }
            let div = $('<div>').attr('class','row like');
            $('<img>').attr('class','likeimg').attr('src',"/resources/images/LOL_CHAMPION_ICON/lol_champion_" +
            champNameInfoList[n].name + ".png").appendTo(div);
            $('<p>').attr('class','likename').text((Number(n)+1)+" 위: "+champNameInfoList[n].name_kr).appendTo(div)
            div.appendTo($('.likeChamp'));
            
        }
        


   

        //구글차트가 안그려져서 dom 생성이후 3초 타이머 실행 함수
        setTimeout(()=>{
            $('.total0').css('display','none')
            $('.total1').css('display','none')
            $('.total2').css('display','none')
            $('.total3').css('display','none')
            $('.total4').css('display','none')
            $('.total5').css('display','none')
            $('.total6').css('display','none')
            $('.total7').css('display','none')
            $('.total8').css('display','none')
            $('.total9').css('display','none')
            $('.total10').css('display','none')
            $('.total11').css('display','none')
            $('.total12').css('display','none')
            $('.total13').css('display','none')
            $('.total14').css('display','none')
            $('.total15').css('display','none')
            $('.total16').css('display','none')
            $('.total17').css('display','none')
            $('.total18').css('display','none')
            $('.total19').css('display','none')
        }, 4000)
        
            
        
        
        
        $('.recode').remove();
        $('.selectBar').remove();
        $('.total').remove();
        $('.itembuild').remove();
        $('.runebuild').remove();
        $('.tskillbuild').remove();
    </script>

</body>

</html>