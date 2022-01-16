src = "https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"

src = "https://www.gstatic.com/charts/loader.js"



let riot_api_key_list = ["RGAPI-e2c3b20e-ae8c-462e-868a-8e7185c9b12f",
    "RGAPI-c3e0d6de-963c-4068-a9ed-d38a11a63d7c",
    "RGAPI-8713e443-0ba8-4f91-a543-3ef8c87d3fa3",
    "RGAPI-5ad73e8f-a1c8-44ef-b479-bd6beab2610e",
    "RGAPI-73b0d597-e605-41d1-8ad8-175ba2a6ab02"
]
let riot_api_key = "RGAPI-e2c3b20e-ae8c-462e-868a-8e7185c9b12f";
//소환사 정보불러오는 함수
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

//소환사의 랭크정보 불러오는 함수
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
//소환사 정보 그리는 함수
function darwInfo(summonerdata, rank) {
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
}
//mathcid 가져오는 함수
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

//api를 랜덤으로 가져오는 함수
function random(a) {
    return a[Math.floor(Math.random() * a.length)];
}

//매치 데이터 가져오는 함수
function getMatchData(matchid) {
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

//매치데이터 List 생성
function getMatchDataList(gameIdList) {
    let DataList = new Array;
    let matchDataList = new Array;
    let timeLineDataList = new Array;
    for (let i of gameIdList) {
        let sumData = new Array;
        let matchData = getMatchData(i);
        let timeLineData = getTimeLineData(i);
        sumData.push(matchData);
        sumData.push(timeLineData);
        DataList.push(sumData)
    }
    return DataList;
}
//타임라인 데이터 가져오는 함수
function getTimeLineData(matchid) {
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
//날짜 표시(타임스탬프)
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
//플래이한 챔피언 그리고 룬 스펠정보
function getChampInfo(y, $recodeSummonerInfo) {
    let $champ = $recodeSummonerInfo.children('.champ').children('.champinfo');
    let $spell1 = $recodeSummonerInfo.children('.champ').children('.spell').children('.spell1');
    let $spell2 = $recodeSummonerInfo.children('.champ').children('.spell').children('.spell2');
    let $rune1 = $recodeSummonerInfo.children('.champ').children('.rune').children('.rune1');
    let $rune2 = $recodeSummonerInfo.children('.champ').children('.rune').children('.rune2');
    for (let z of championNameInfo) {
        if (y.championId == z.championid) {
            $('<img>').attr('class', 'champimg').attr('src', "/resources/images/LOL_CHAMPION_ICON/lol_champion_" +
                z.champion_name_eng + ".png").appendTo($champ);
        }
    }
    for (let w of spellInfo) {
        if (w.key == y.summoner1Id) {
            $('<img>').attr('class', 'spellimg').attr('src', "/resources/images/spellimg/" + w.id + ".png").appendTo($spell1);
        } else if (w.key == y.summoner2Id) {
            $('<img>').attr('class', 'spellimg').attr('src', "/resources/images/spellimg/" + w.id + ".png").appendTo($spell2);
        }
    }
    for (let d of runeInfo) {

        if (d.id == y.perks.styles[0].selections[0].perk) {
            $('<img>').attr('class', 'runeimg').attr('src', "/resources/images/perk_images/Styles/" + d.rune_category + "/Keystone/" +
                d.name_eng + ".png").appendTo($rune1);
        }

    }
    let substyle = y.perks.styles[1].style;
    if (substyle == 8100) {
        $('<img>').attr('class', 'runeimg').attr('src', "/resources/images/perk_images/Styles/Domination/Domination.png").appendTo($rune2)
    } else if (substyle == 8200) {
        $('<img>').attr('class', 'runeimg').attr('src', "/resources/images/perk_images/Styles/Sorcery/Sorcery.png").appendTo($rune2)
    } else if (substyle == 8000) {
        $('<img>').attr('class', 'runeimg').attr('src', "/resources/images/perk_images/Styles/Precision/Precision.png").appendTo($rune2)
    } else if (substyle == 8300) {
        $('<img>').attr('class', 'runeimg').attr('src', "/resources/images/perk_images/Styles/Inspiration/Inspiration.png").appendTo($rune2)
    } else if (substyle == 8400) {
        $('<img>').attr('class', 'runeimg').attr('src', "/resources/images/perk_images/Styles/Resolve/Resolve.png").appendTo($rune2)
    }
}

//kda 구해서 객체생성
function getkdaInfo(y, $recodeSummonerInfo) {
    let $kda = $recodeSummonerInfo.children('.kda');
    if (y.deaths != 0) {
        $kda.attr('id', 'kda').html("<p>" + y.kills + "/" + y.deaths + "/" + y.assists + "<br>" +
            ((y.kills + y.assists) / y.deaths).toFixed(2) + "</p>");
    } else if (y.deaths == 0) {
        $kda.attr('id', 'kda').html("<p>" + y.kills + "/" + y.deaths + "/" + y.assists + "<br>perfact</p>");
    }
}
//최종 아이템 객체 생성
function getItemInfo(y, $recodeSummonerInfo) {
    let $div = $('<div>').attr('class', 'enditem')
    for (let m of itemInfo) {
        if (m.item_code == y.item0) {
            $('<img>').attr('class', 'itemimg').attr("src", "/resources/images/LOL_ITEM_ICON/" + m
                .item_name_eng + ".png").appendTo($div)
        } else if (m.item_code == y.item1) {
            $('<img>').attr('class', 'itemimg').attr("src", "/resources/images/LOL_ITEM_ICON/" + m
                .item_name_eng + ".png").appendTo($div)
        } else if (m.item_code == y.item2) {
            $('<img>').attr('class', 'itemimg').attr("src", "/resources/images/LOL_ITEM_ICON/" + m
                .item_name_eng + ".png").appendTo($div)
        } else if (m.item_code == y.item3) {
            $('<img>').attr('class', 'itemimg').attr("src", "/resources/images/LOL_ITEM_ICON/" + m
                .item_name_eng + ".png").appendTo($div)
        } else if (m.item_code == y.item4) {
            $('<img>').attr('class', 'itemimg').attr("src", "/resources/images/LOL_ITEM_ICON/" + m
                .item_name_eng + ".png").appendTo($div)
        } else if (m.item_code == y.item5) {
            $('<img>').attr('class', 'itemimg').attr("src", "/resources/images/LOL_ITEM_ICON/" + m
                .item_name_eng + ".png").appendTo($div)
        } else if (m.item_code == y.item6) {
            $('<img>').attr('class', 'itemimg').attr("src", "/resources/images/LOL_ITEM_ICON/" + m
                .item_name_eng + ".png").appendTo($div)
        }
    }
    $recodeSummonerInfo.children('.kda').append($div);
}

//해당 매치에서의 플레이한 소환사들의 간단한 정보 보여주는 데이터 
function getPartner(y, $recodeSummonerInfo) {
    let partner1 = $recodeSummonerInfo.children('.partner1');
    let partner2 = $recodeSummonerInfo.children('.partner2');
    let div = $('<div>').attr('class', 'sum');
    if (y.teamId == 100) {
        for (let t of championNameInfo) {
            if (y.championId == t.championid) {
                $('<img>').attr('class', 'c').attr("src", "/resources/images/LOL_CHAMPION_ICON/lol_champion_" +
                    t.champion_name_eng + ".png").appendTo(div);
                $('<p>').html(y.summonerName + "<br>").appendTo(div)

            }
        }
        div.appendTo(partner1);
    } else if (y.teamId == 200) {
        for (let t of championNameInfo) {
            if (y.championId == t.championid) {
                $('<img>').attr('class', 'c').attr("src", "/resources/images/LOL_CHAMPION_ICON/lol_champion_" +
                    t.champion_name_eng + ".png").appendTo(div);
                $('<p>').html(y.summonerName + "<br>").appendTo(div);

            }
        }
        div.appendTo(partner2);

    }
}

//승리 및 게임시간 모드 정보 불러오기
function getGameInfo(i, $recodeSummonerInfo) {
    //게임모드 
    let gameinfo = $recodeSummonerInfo.children('.gameInfo');
    if (i.info.gameMode == "CLASSIC") {
        if (i.info.queueId == 420) {
            gameinfo.children('.mode').html("<p>솔로</p>");
        } else if (i.info.queueId == 430) {
            gameinfo.children('.mode').html("<p>일반</p>");
        } else if (i.info.queueId == 440) {
            gameinfo.children('.mode').html("<p>자유</p>");
        }
    } else if (i.info.gameMode == "ARAM") {
        gameinfo.children('.mode').html("<p>칼바람</p>");
    }
    //시작시간
    let endTime = displayedAt(i.info.gameEndTimestamp);
    gameinfo.children('.end').html("<p>" + endTime + " </p>");
    //플레이시간
    let playTime = new Date(i.info.gameEndTimestamp - i.info.gameStartTimestamp)
    gameinfo.children('.time').html("<p>" + playTime.getMinutes() + "분" + playTime.getSeconds() + "초</p>");

}

//승리정보
function getWin(y, $recodeSummonerInfo) {
    // console.log(y);
    let gameinfo = $recodeSummonerInfo.children('.gameInfo');


    if (y.win == true) {
        gameinfo.children('.win').html("<p>승리</p>");
        $recodeSummonerInfo.css('background-color', 'blue')

    } else if (y.win != true) {
        gameinfo.children('.win').html("<p>패배</p>");
        $recodeSummonerInfo.css('background-color', 'red')
    }
}

function getDealtWardCs(y, $person1,playTime) {
    $person1.children('.dealt').html("<p>" + y.totalDamageDealtToChampions + "</p>")
    $person1.children('.ward').html("<p>" + y.wardsPlaced + "<br> score : " + y.visionScore + "</p>")
    $person1.children('.cs').html("<p>" + y.totalMinionsKilled + "<br> 분당 cs : " + ((y.totalMinionsKilled) /
        (playTime.getMinutes())).toFixed(2) + "</p>")



    google.charts.load('current', {
        packages: ['corechart', 'bar']
    });
    google.charts.setOnLoadCallback(drawMultSeries);

    function drawMultSeries() {
        var data = google.visualization.arrayToDataTable([
            ['피해량', '적에게 가한피해량'],
            ['피해량', y.totalDamageDealtToChampions]
        ]);

        var options = {
            title: '적에게 가한 피해량',
            chartArea: {
                width: '100%',
                height: '50%'
            },
            hAxis: {
                title: '',
                minValue: 0
            },
            vAxis: {
                title: ''
            }
        };

        var chart = new google.visualization.BarChart($person1.children('.dealt')[0]);
        chart.draw(data, options);
    }
}

function context(x, y) {
    let blueinfo = y.find('.blueinfo');
    let redinfo = y.find('.redinfo');

    for (let i of x) {
        if (i.teamId == 100) {
            if (i.win == true) {
                y.children('.teamblue').children('.teamside').children('.win').html("<h5>승리</h5><p>블루팀</p>");
            } else if (i.win == false) {
                y.children('.teamblue').children('.teamside').children('.win').html("<h5>패배</h5><p>블루팀</p>");
            }
            $('<img>').attr('src', '//opgg-static.akamaized.net/images/site/summoner/icon-baron-r.png').appendTo(blueinfo);
            $('<p>').text(i.objectives.baron.kills).appendTo(blueinfo);
            $('<img>').attr('src', '//opgg-static.akamaized.net/images/site/summoner/icon-dragon-r.png').appendTo(blueinfo);
            $('<p>').text(i.objectives.dragon.kills).appendTo(blueinfo);
            $('<img>').attr('src', '//opgg-static.akamaized.net/images/site/summoner/icon-tower-r.png').appendTo(blueinfo);
            $('<p>').text(i.objectives.tower.kills).appendTo(blueinfo);


        } else if (i.teamId == 200) {
            if (i.win == true) {
                y.children('.teamred').children('.teamside').children('.win').html("<h5>승리</h5><p>레드팀</p>");
            } else if (i.win == false) {
                y.children('.teamblue').children('.teamside').children('.win').html("<h5>패배</h5><p>레드팀</p>");
            }
            $('<img>').attr('src', '//opgg-static.akamaized.net/images/site/summoner/icon-baron-r.png').appendTo(redinfo);
            $('<p>').text(i.objectives.baron.kills).appendTo(redinfo);
            $('<img>').attr('src', '//opgg-static.akamaized.net/images/site/summoner/icon-dragon-r.png').appendTo(redinfo);
            $('<p>').text(i.objectives.dragon.kills).appendTo(redinfo);
            $('<img>').attr('src', '//opgg-static.akamaized.net/images/site/summoner/icon-tower-r.png').appendTo(redinfo);
            $('<p>').text(i.objectives.tower.kills).appendTo(redinfo);
        }
    }

}
//룬빌드
function getRuneBuild(y, $rune) {
    let perk = y.perks;
    let runepage = $rune.find('.runePage').clone(true).attr('class', "row runePage" + y.participantId);
    for (let z of championNameInfo) {
        if (y.championId == z.championid) {
            $('<img>').attr('class', 'champimg').attr('src', "/resources/images/LOL_CHAMPION_ICON/lol_champion_" +
                z.champion_name_eng + ".png").appendTo(runepage.find('.champdd'));
            $('<p>').text(y.summonerName).appendTo(runepage.find('.champdd'));
        }
    }




    if (perk.styles[0].style == 8100) {
        $('<img>').attr('class', 'runeimg Domination').attr('src', "/resources/images/perk_images/Styles/Domination/Domination.png").appendTo(runepage.find('.property'));

        $('<img>').attr('class', 'runeimg DarkHarvest').attr('src', "/resources/images/perk_images/Styles/Domination/Keystone/DarkHarvest.png").appendTo(runepage.find('.bigrune'));
        $('<img>').attr('class', 'runeimg Electrocute').attr('src', "/resources/images/perk_images/Styles/Domination/Keystone/Electrocute.png").appendTo(runepage.find('.bigrune'));
        $('<img>').attr('class', 'runeimg HailOfBlades').attr('src', "/resources/images/perk_images/Styles/Domination/Keystone/HailOfBlades.png").appendTo(runepage.find('.bigrune'));
        $('<img>').attr('class', 'runeimg Predator').attr('src', "/resources/images/perk_images/Styles/Domination/Keystone/Predator.png").appendTo(runepage.find('.bigrune'));

        $('<img>').attr('class', 'runeimg CheapShot').attr('src', "/resources/images/perk_images/Styles/Domination/Malice/CheapShot.png").appendTo(runepage.find('.arune'));
        $('<img>').attr('class', 'runeimg TasteOfBlood').attr('src', "/resources/images/perk_images/Styles/Domination/Malice/TasteOfBlood.png").appendTo(runepage.find('.arune'));
        $('<img>').attr('class', 'runeimg SuddenImpact').attr('src', "/resources/images/perk_images/Styles/Domination/Malice/SuddenImpact.png").appendTo(runepage.find('.arune'));

        $('<img>').attr('class', 'runeimg ZombieWard').attr('src', "/resources/images/perk_images/Styles/Domination/Tracking/ZombieWard.png").appendTo(runepage.find('.brune'));
        $('<img>').attr('class', 'runeimg GhostPoro').attr('src', "/resources/images/perk_images/Styles/Domination/Tracking/GhostPoro.png").appendTo(runepage.find('.brune'));
        $('<img>').attr('class', 'runeimg EyeballCollection').attr('src', "/resources/images/perk_images/Styles/Domination/Tracking/EyeballCollection.png").appendTo(runepage.find('.brune'));

        $('<img>').attr('class', 'runeimg RavenousHunter').attr('src', "/resources/images/perk_images/Styles/Domination/Hunter/RavenousHunter.png").appendTo(runepage.find('.crune'));
        $('<img>').attr('class', 'runeimg IngeniousHunter').attr('src', "/resources/images/perk_images/Styles/Domination/Hunter/IngeniousHunter.png").appendTo(runepage.find('.crune'));
        $('<img>').attr('class', 'runeimg RelentlessHunter').attr('src', "/resources/images/perk_images/Styles/Domination/Hunter/RelentlessHunter.png").appendTo(runepage.find('.crune'));
        $('<img>').attr('class', 'runeimg UltimateHunter').attr('src', "/resources/images/perk_images/Styles/Domination/Hunter/UltimateHunter.png").appendTo(runepage.find('.crune'));

    } else if (perk.styles[0].style == 8200) {
        $('<img>').attr('class', 'runeimg Sorcery').attr('src', "/resources/images/perk_images/Styles/Sorcery/Sorcery.png").appendTo(runepage.find('.property'))

        $('<img>').attr('class', 'runeimg SummonAery').attr('src', "/resources/images/perk_images/Styles/Sorcery/Keystone/SummonAery.png").appendTo(runepage.find('.bigrune'));
        $('<img>').attr('class', 'runeimg ArcaneComet').attr('src', "/resources/images/perk_images/Styles/Sorcery/Keystone/ArcaneComet.png").appendTo(runepage.find('.bigrune'));
        $('<img>').attr('class', 'runeimg PhaseRush').attr('src', "/resources/images/perk_images/Styles/Sorcery/Keystone/PhaseRush.png").appendTo(runepage.find('.bigrune'));

        $('<img>').attr('class', 'runeimg NullifyingOrb').attr('src', "/resources/images/perk_images/Styles/Sorcery/Artefact/NullifyingOrb.png").appendTo(runepage.find('.arune'));
        $('<img>').attr('class', 'runeimg ManaflowBand').attr('src', "/resources/images/perk_images/Styles/Sorcery/Artefact/ManaflowBand.png").appendTo(runepage.find('.arune'));
        $('<img>').attr('class', 'runeimg NimbusCloak').attr('src', "/resources/images/perk_images/Styles/Sorcery/Artefact/NimbusCloak.png").appendTo(runepage.find('.arune'));

        $('<img>').attr('class', 'runeimg Transcendence').attr('src', "/resources/images/perk_images/Styles/Sorcery/Excellence/Transcendence.png").appendTo(runepage.find('.brune'));
        $('<img>').attr('class', 'runeimg Celerity').attr('src', "/resources/images/perk_images/Styles/Sorcery/Excellence/Celerity.png").appendTo(runepage.find('.brune'));
        $('<img>').attr('class', 'runeimg AbsoluteFocus').attr('src', "/resources/images/perk_images/Styles/Sorcery/Excellence/AbsoluteFocus.png").appendTo(runepage.find('.brune'));

        $('<img>').attr('class', 'runeimg Scorch').attr('src', "/resources/images/perk_images/Styles/Sorcery/Power/Scorch.png").appendTo(runepage.find('.crune'));
        $('<img>').attr('class', 'runeimg Waterwalking').attr('src', "/resources/images/perk_images/Styles/Sorcery/Power/Waterwalking.png").appendTo(runepage.find('.crune'));
        $('<img>').attr('class', 'runeimg GatheringStorm').attr('src', "/resources/images/perk_images/Styles/Sorcery/Power/GatheringStorm.png").appendTo(runepage.find('.crune'));
    } else if (perk.styles[0].style == 8000) {
        $('<img>').attr('class', 'runeimg Precision').attr('src', "/resources/images/perk_images/Styles/Precision/Precision.png").appendTo(runepage.find('.property'));

        $('<img>').attr('class', 'runeimg PressTheAttack').attr('src', "/resources/images/perk_images/Styles/Precision/Keystone/PressTheAttack.png").appendTo(runepage.find('.bigrune'));
        $('<img>').attr('class', 'runeimg LethalTempo').attr('src', "/resources/images/perk_images/Styles/Precision/Keystone/LethalTempo.png").appendTo(runepage.find('.bigrune'));
        $('<img>').attr('class', 'runeimg FleetFootwork').attr('src', "/resources/images/perk_images/Styles/Precision/Keystone/FleetFootwork.png").appendTo(runepage.find('.bigrune'));
        $('<img>').attr('class', 'runeimg Conqueror').attr('src', "/resources/images/perk_images/Styles/Precision/Keystone/Conqueror.png").appendTo(runepage.find('.bigrune'));

        $('<img>').attr('class', 'runeimg Overheal').attr('src', "/resources/images/perk_images/Styles/Precision/Heroism/Overheal.png").appendTo(runepage.find('.arune'));
        $('<img>').attr('class', 'runeimg Triumph').attr('src', "/resources/images/perk_images/Styles/Precision/Heroism/Triumph.png").appendTo(runepage.find('.arune'));
        $('<img>').attr('class', 'runeimg PresenceOfMind').attr('src', "/resources/images/perk_images/Styles/Precision/Heroism/PresenceOfMind.png").appendTo(runepage.find('.arune'));

        $('<img>').attr('class', 'runeimg LegendAlacrity').attr('src', "/resources/images/perk_images/Styles/Precision/Legend/LegendAlacrity.png").appendTo(runepage.find('.brune'));
        $('<img>').attr('class', 'runeimg LegendTenacity').attr('src', "/resources/images/perk_images/Styles/Precision/Legend/LegendTenacity.png").appendTo(runepage.find('.brune'));
        $('<img>').attr('class', 'runeimg LegendBloodline').attr('src', "/resources/images/perk_images/Styles/Precision/Legend/LegendBloodline.png").appendTo(runepage.find('.brune'));

        $('<img>').attr('class', 'runeimg CoupDeGrace').attr('src', "/resources/images/perk_images/Styles/Precision/Combat/CoupDeGrace.png").appendTo(runepage.find('.crune'));
        $('<img>').attr('class', 'runeimg CutDown').attr('src', "/resources/images/perk_images/Styles/Precision/Combat/CutDown.png").appendTo(runepage.find('.crune'));
        $('<img>').attr('class', 'runeimg LastStand').attr('src', "/resources/images/perk_images/Styles/Precision/Combat/LastStand.png").appendTo(runepage.find('.crune'));
    } else if (perk.styles[0].style == 8300) {
        $('<img>').attr('class', 'runeimg Inspiration').attr('src', "/resources/images/perk_images/Styles/Inspiration/Inspiration.png").appendTo(runepage.find('.property'));

        $('<img>').attr('class', 'runeimg GlacialAugment').attr('src', "/resources/images/perk_images/Styles/Inspiration/Keystone/GlacialAugment.png").appendTo(runepage.find('.bigrune'));
        $('<img>').attr('class', 'runeimg UnsealedSpellbook').attr('src', "/resources/images/perk_images/Styles/Inspiration/Keystone/UnsealedSpellbook.png").appendTo(runepage.find('.bigrune'));
        $('<img>').attr('class', 'runeimg FirstStrike').attr('src', "/resources/images/perk_images/Styles/Inspiration/Keystone/FirstStrike.png").appendTo(runepage.find('.bigrune'));

        $('<img>').attr('class', 'runeimg HextechFlashtraption').attr('src', "/resources/images/perk_images/Styles/Inspiration/Contraption/HextechFlashtraption.png").appendTo(runepage.find('.arune'));
        $('<img>').attr('class', 'runeimg MagicalFootwear').attr('src', "/resources/images/perk_images/Styles/Inspiration/Contraption/MagicalFootwear.png").appendTo(runepage.find('.arune'));
        $('<img>').attr('class', 'runeimg PerfectTiming').attr('src', "/resources/images/perk_images/Styles/Inspiration/Contraption/PerfectTiming.png").appendTo(runepage.find('.arune'));

        $('<img>').attr('class', 'runeimg FuturesMarket').attr('src', "/resources/images/perk_images/Styles/Inspiration/Tomorrow/FuturesMarket.png").appendTo(runepage.find('.brune'));
        $('<img>').attr('class', 'runeimg MinionDematerializer').attr('src', "/resources/images/perk_images/Styles/Inspiration/Tomorrow/MinionDematerializer.png").appendTo(runepage.find('.brune'));
        $('<img>').attr('class', 'runeimg BiscuitDelivery').attr('src', "/resources/images/perk_images/Styles/Inspiration/Tomorrow/BiscuitDelivery.png").appendTo(runepage.find('.brune'));

        $('<img>').attr('class', 'runeimg CosmicInsight').attr('src', "/resources/images/perk_images/Styles/Inspiration/Beyond/CosmicInsight.png").appendTo(runepage.find('.crune'));
        $('<img>').attr('class', 'runeimg ApproachVelocity').attr('src', "/resources/images/perk_images/Styles/Inspiration/Beyond/ApproachVelocity.png").appendTo(runepage.find('.crune'));
        $('<img>').attr('class', 'runeimg TimeWarpTonic').attr('src', "/resources/images/perk_images/Styles/Inspiration/Beyond/TimeWarpTonic.png").appendTo(runepage.find('.crune'));
    } else if (perk.styles[0].style == 8400) {
        $('<img>').attr('class', 'runeimg Resolve').attr('src', "/resources/images/perk_images/Styles/Resolve/Resolve.png").appendTo(runepage.find('.property'))

        $('<img>').attr('class', 'runeimg GraspOfTheUndying').attr('src', "/resources/images/perk_images/Styles/Resolve/Keystone/GraspOfTheUndying.png").appendTo(runepage.find('.bigrune'));
        $('<img>').attr('class', 'runeimg Aftershock').attr('src', "/resources/images/perk_images/Styles/Resolve/Keystone/Aftershock.png").appendTo(runepage.find('.bigrune'));
        $('<img>').attr('class', 'runeimg Guardian').attr('src', "/resources/images/perk_images/Styles/Resolve/Keystone/Guardian.png").appendTo(runepage.find('.bigrune'));

        $('<img>').attr('class', 'runeimg Demolish').attr('src', "/resources/images/perk_images/Styles/Resolve/Strength/Demolish.png").appendTo(runepage.find('.arune'));
        $('<img>').attr('class', 'runeimg FontOfLife').attr('src', "/resources/images/perk_images/Styles/Resolve/Strength/FontOfLife.png").appendTo(runepage.find('.arune'));
        $('<img>').attr('class', 'runeimg ShieldBash').attr('src', "/resources/images/perk_images/Styles/Resolve/Strength/ShieldBash.png").appendTo(runepage.find('.arune'));

        $('<img>').attr('class', 'runeimg Conditioning').attr('src', "/resources/images/perk_images/Styles/Resolve/Resistance/Conditioning.png").appendTo(runepage.find('.brune'));
        $('<img>').attr('class', 'runeimg SecondWind').attr('src', "/resources/images/perk_images/Styles/Resolve/Resistance/SecondWind.png").appendTo(runepage.find('.brune'));
        $('<img>').attr('class', 'runeimg BonePlating').attr('src', "/resources/images/perk_images/Styles/Resolve/Resistance/BonePlating.png").appendTo(runepage.find('.brune'));

        $('<img>').attr('class', 'runeimg Overgrowth').attr('src', "/resources/images/perk_images/Styles/Resolve/Vitality/Overgrowth.png").appendTo(runepage.find('.crune'));
        $('<img>').attr('class', 'runeimg Revitalize').attr('src', "/resources/images/perk_images/Styles/Resolve/Vitality/Revitalize.png").appendTo(runepage.find('.crune'));
        $('<img>').attr('class', 'runeimg Unflinching').attr('src', "/resources/images/perk_images/Styles/Resolve/Vitality/Unflinching.png").appendTo(runepage.find('.crune'));
    }


    ///////////////
    if (perk.styles[1].style == 8100) {
        $('<img>').attr('class', 'runeimg Domination').attr('src', "/resources/images/perk_images/Styles/Domination/Domination.png").appendTo(runepage.find('.subproperty'));



        $('<img>').attr('class', 'runeimg CheapShot').attr('src', "/resources/images/perk_images/Styles/Domination/Malice/CheapShot.png").appendTo(runepage.find('.sunrune1'));
        $('<img>').attr('class', 'runeimg TasteOfBlood').attr('src', "/resources/images/perk_images/Styles/Domination/Malice/TasteOfBlood.png").appendTo(runepage.find('.sunrune1'));
        $('<img>').attr('class', 'runeimg SuddenImpact').attr('src', "/resources/images/perk_images/Styles/Domination/Malice/SuddenImpact.png").appendTo(runepage.find('.sunrune1'));

        $('<img>').attr('class', 'runeimg ZombieWard').attr('src', "/resources/images/perk_images/Styles/Domination/Tracking/ZombieWard.png").appendTo(runepage.find('.sunrune2'));
        $('<img>').attr('class', 'runeimg GhostPoro').attr('src', "/resources/images/perk_images/Styles/Domination/Tracking/GhostPoro.png").appendTo(runepage.find('.sunrune2'));
        $('<img>').attr('class', 'runeimg EyeballCollection').attr('src', "/resources/images/perk_images/Styles/Domination/Tracking/EyeballCollection.png").appendTo(runepage.find('.sunrune2'));

        $('<img>').attr('class', 'runeimg RavenousHunter').attr('src', "/resources/images/perk_images/Styles/Domination/Hunter/RavenousHunter.png").appendTo(runepage.find('.sunrune3'));
        $('<img>').attr('class', 'runeimg IngeniousHunter').attr('src', "/resources/images/perk_images/Styles/Domination/Hunter/IngeniousHunter.png").appendTo(runepage.find('.sunrune3'));
        $('<img>').attr('class', 'runeimg RelentlessHunter').attr('src', "/resources/images/perk_images/Styles/Domination/Hunter/RelentlessHunter.png").appendTo(runepage.find('.sunrune3'));
        $('<img>').attr('class', 'runeimg UltimateHunter').attr('src', "/resources/images/perk_images/Styles/Domination/Hunter/UltimateHunter.png").appendTo(runepage.find('.sunrune3'));

    } else if (perk.styles[1].style == 8200) {
        $('<img>').attr('class', 'runeimg Sorcery').attr('src', "/resources/images/perk_images/Styles/Sorcery/Sorcery.png").appendTo(runepage.find('.subproperty'))



        $('<img>').attr('class', 'runeimg NullifyingOrb').attr('src', "/resources/images/perk_images/Styles/Sorcery/Artefact/NullifyingOrb.png").appendTo(runepage.find('.sunrune1'));
        $('<img>').attr('class', 'runeimg ManaflowBand').attr('src', "/resources/images/perk_images/Styles/Sorcery/Artefact/ManaflowBand.png").appendTo(runepage.find('.sunrune1'));
        $('<img>').attr('class', 'runeimg NimbusCloak').attr('src', "/resources/images/perk_images/Styles/Sorcery/Artefact/NimbusCloak.png").appendTo(runepage.find('.sunrune1'));

        $('<img>').attr('class', 'runeimg Transcendence').attr('src', "/resources/images/perk_images/Styles/Sorcery/Excellence/Transcendence.png").appendTo(runepage.find('.sunrune2'));
        $('<img>').attr('class', 'runeimg Celerity').attr('src', "/resources/images/perk_images/Styles/Sorcery/Excellence/Celerity.png").appendTo(runepage.find('.sunrune2'));
        $('<img>').attr('class', 'runeimg AbsoluteFocus').attr('src', "/resources/images/perk_images/Styles/Sorcery/Excellence/AbsoluteFocus.png").appendTo(runepage.find('.sunrune2'));

        $('<img>').attr('class', 'runeimg Scorch').attr('src', "/resources/images/perk_images/Styles/Sorcery/Power/Scorch.png").appendTo(runepage.find('.sunrune3'));
        $('<img>').attr('class', 'runeimg Waterwalking').attr('src', "/resources/images/perk_images/Styles/Sorcery/Power/Waterwalking.png").appendTo(runepage.find('.sunrune3'));
        $('<img>').attr('class', 'runeimg GatheringStorm').attr('src', "/resources/images/perk_images/Styles/Sorcery/Power/GatheringStorm.png").appendTo(runepage.find('.sunrune3'));
    } else if (perk.styles[1].style == 8000) {
        $('<img>').attr('class', 'runeimg Precision').attr('src', "/resources/images/perk_images/Styles/Precision/Precision.png").appendTo(runepage.find('.subproperty'));



        $('<img>').attr('class', 'runeimg Overheal').attr('src', "/resources/images/perk_images/Styles/Precision/Heroism/Overheal.png").appendTo(runepage.find('.sunrune1'));
        $('<img>').attr('class', 'runeimg Triumph').attr('src', "/resources/images/perk_images/Styles/Precision/Heroism/Triumph.png").appendTo(runepage.find('.sunrune1'));
        $('<img>').attr('class', 'runeimg PresenceOfMind').attr('src', "/resources/images/perk_images/Styles/Precision/Heroism/PresenceOfMind.png").appendTo(runepage.find('.sunrune1'));

        $('<img>').attr('class', 'runeimg LegendAlacrity').attr('src', "/resources/images/perk_images/Styles/Precision/Legend/LegendAlacrity.png").appendTo(runepage.find('.sunrune2'));
        $('<img>').attr('class', 'runeimg LegendTenacity').attr('src', "/resources/images/perk_images/Styles/Precision/Legend/LegendTenacity.png").appendTo(runepage.find('.sunrune2'));
        $('<img>').attr('class', 'runeimg LegendBloodline').attr('src', "/resources/images/perk_images/Styles/Precision/Legend/LegendBloodline.png").appendTo(runepage.find('.sunrune2'));

        $('<img>').attr('class', 'runeimg CoupDeGrace').attr('src', "/resources/images/perk_images/Styles/Precision/Combat/CoupDeGrace.png").appendTo(runepage.find('.sunrune3'));
        $('<img>').attr('class', 'runeimg CutDown').attr('src', "/resources/images/perk_images/Styles/Precision/Combat/CutDown.png").appendTo(runepage.find('.sunrune3'));
        $('<img>').attr('class', 'runeimg LastStand').attr('src', "/resources/images/perk_images/Styles/Precision/Combat/LastStand.png").appendTo(runepage.find('.sunrune3'));
    } else if (perk.styles[1].style == 8300) {
        $('<img>').attr('class', 'runeimg Inspiration').attr('src', "/resources/images/perk_images/Styles/Inspiration/Inspiration.png").appendTo(runepage.find('.subproperty'));


        $('<img>').attr('class', 'runeimg HextechFlashtraption').attr('src', "/resources/images/perk_images/Styles/Inspiration/Contraption/HextechFlashtraption.png").appendTo(runepage.find('.sunrune1'));
        $('<img>').attr('class', 'runeimg MagicalFootwear').attr('src', "/resources/images/perk_images/Styles/Inspiration/Contraption/MagicalFootwear.png").appendTo(runepage.find('.sunrune1'));
        $('<img>').attr('class', 'runeimg PerfectTiming').attr('src', "/resources/images/perk_images/Styles/Inspiration/Contraption/PerfectTiming.png").appendTo(runepage.find('.sunrune1'));

        $('<img>').attr('class', 'runeimg FuturesMarket').attr('src', "/resources/images/perk_images/Styles/Inspiration/Tomorrow/FuturesMarket.png").appendTo(runepage.find('.sunrune2'));
        $('<img>').attr('class', 'runeimg MinionDematerializer').attr('src', "/resources/images/perk_images/Styles/Inspiration/Tomorrow/MinionDematerializer.png").appendTo(runepage.find('.sunrune2'));
        $('<img>').attr('class', 'runeimg BiscuitDelivery').attr('src', "/resources/images/perk_images/Styles/Inspiration/Tomorrow/BiscuitDelivery.png").appendTo(runepage.find('.sunrune2'));

        $('<img>').attr('class', 'runeimg CosmicInsight').attr('src', "/resources/images/perk_images/Styles/Inspiration/Beyond/CosmicInsight.png").appendTo(runepage.find('.sunrune3'));
        $('<img>').attr('class', 'runeimg ApproachVelocity').attr('src', "/resources/images/perk_images/Styles/Inspiration/Beyond/ApproachVelocity.png").appendTo(runepage.find('.sunrune3'));
        $('<img>').attr('class', 'runeimg TimeWarpTonic').attr('src', "/resources/images/perk_images/Styles/Inspiration/Beyond/TimeWarpTonic.png").appendTo(runepage.find('.sunrune3'));
    } else if (perk.styles[1].style == 8400) {
        $('<img>').attr('class', 'runeimg Resolve').attr('src', "/resources/images/perk_images/Styles/Resolve/Resolve.png").appendTo(runepage.find('.subproperty'));

        $('<img>').attr('class', 'runeimg Demolish').attr('src', "/resources/images/perk_images/Styles/Resolve/Strength/Demolish.png").appendTo(runepage.find('.sunrune1'));
        $('<img>').attr('class', 'runeimg FontOfLife').attr('src', "/resources/images/perk_images/Styles/Resolve/Strength/FontOfLife.png").appendTo(runepage.find('.sunrune1'));
        $('<img>').attr('class', 'runeimg ShieldBash').attr('src', "/resources/images/perk_images/Styles/Resolve/Strength/ShieldBash.png").appendTo(runepage.find('.sunrune1'));

        $('<img>').attr('class', 'runeimg Conditioning').attr('src', "/resources/images/perk_images/Styles/Resolve/Resistance/Conditioning.png").appendTo(runepage.find('.sunrune2'));
        $('<img>').attr('class', 'runeimg SecondWind').attr('src', "/resources/images/perk_images/Styles/Resolve/Resistance/SecondWind.png").appendTo(runepage.find('.sunrune2'));
        $('<img>').attr('class', 'runeimg BonePlating').attr('src', "/resources/images/perk_images/Styles/Resolve/Resistance/BonePlating.png").appendTo(runepage.find('.sunrune2'));

        $('<img>').attr('class', 'runeimg Overgrowth').attr('src', "/resources/images/perk_images/Styles/Resolve/Vitality/Overgrowth.png").appendTo(runepage.find('.sunrune3'));
        $('<img>').attr('class', 'runeimg Revitalize').attr('src', "/resources/images/perk_images/Styles/Resolve/Vitality/Revitalize.png").appendTo(runepage.find('.sunrune3'));
        $('<img>').attr('class', 'runeimg Unflinching').attr('src', "/resources/images/perk_images/Styles/Resolve/Vitality/Unflinching.png").appendTo(runepage.find('.sunrune3'));
    }

    $('<img>').attr('class', 'runeimg stat5008').attr('src', "/resources/images/perk_images/Styles/Stats/5008.png").appendTo(runepage.children('.flex').children('.offense'))
    $('<img>').attr('class', 'runeimg stat5005').attr('src', "/resources/images/perk_images/Styles/Stats/5005.png").appendTo(runepage.children('.flex').children('.offense'))
    $('<img>').attr('class', 'runeimg stat5007').attr('src', "/resources/images/perk_images/Styles/Stats/5007.png").appendTo(runepage.children('.flex').children('.offense'))

    $('<img>').attr('class', 'runeimg stat5008').attr('src', "/resources/images/perk_images/Styles/Stats/5008.png").appendTo(runepage.children('.flex').children('.flex'))
    $('<img>').attr('class', 'runeimg stat5002').attr('src', "/resources/images/perk_images/Styles/Stats/5002.png").appendTo(runepage.children('.flex').children('.flex'))
    $('<img>').attr('class', 'runeimg stat5003').attr('src', "/resources/images/perk_images/Styles/Stats/5003.png").appendTo(runepage.children('.flex').children('.flex'))

    $('<img>').attr('class', 'runeimg stat5001').attr('src', "/resources/images/perk_images/Styles/Stats/5001.png").appendTo(runepage.children('.flex').children('.defense'))
    $('<img>').attr('class', 'runeimg stat5002').attr('src', "/resources/images/perk_images/Styles/Stats/5002.png").appendTo(runepage.children('.flex').children('.defense'))
    $('<img>').attr('class', 'runeimg stat5003').attr('src', "/resources/images/perk_images/Styles/Stats/5003.png").appendTo(runepage.children('.flex').children('.defense'))



    runepage.find('.rune1').find('img').css('-webkit-filter', 'grayscale(100%)');
    runepage.find('.rune2').find('img').css('-webkit-filter', 'grayscale(100%)');
    runepage.find('.flex').find('img').css('-webkit-filter', 'grayscale(100%)');
    for (let x of perk.styles[0].selections) {
        for (let z of runeInfo) {
            if (x.perk == z.id) {
                runepage.children('.rune1').find("." + z.name_eng).css('-webkit-filter', 'grayscale(0%)');
            }

        }
    }
    for (let x of perk.styles[1].selections) {
        for (let z of runeInfo) {
            if (x.perk == z.id) {
                runepage.children('.rune2').find("." + z.name_eng).css('-webkit-filter', 'grayscale(0%)');
            }

        }
    }
    runepage.children('.flex').children('.offense').find(".stat" + perk.statPerks.offense).css('-webkit-filter', 'grayscale(0%)');
    runepage.children('.flex').children('.flex').find(".stat" + perk.statPerks.flex).css('-webkit-filter', 'grayscale(0%)');
    runepage.children('.flex').children('.defense').find(".stat" + perk.statPerks.defense).css('-webkit-filter', 'grayscale(0%)');
    runepage.find('.subproperty').children('img').css('-webkit-filter', 'grayscale(0%)');

    if (y.teamId == 100) {
        runepage.appendTo($rune.children('.runeblue'));
    } else if (y.teamId == 200) {
        runepage.appendTo($rune.children('.runered'));
    }

}

//아이템 빌드 생성 함수
function getItemBuild(y, w, $item) {
    let personitembuild = $item.find('.personitem').clone(true).attr('class', "row personitem" + y.participantId);
    let itemList = new Array();

    for (let z of championNameInfo) {
        if (y.championId == z.championid) {
            $('<img>').attr('class', 'champimg').attr('src', "/resources/images/LOL_CHAMPION_ICON/lol_champion_" +
                z.champion_name_eng + ".png").appendTo(personitembuild.find('.champd'));
            $('<p>').text(y.summonerName).appendTo(personitembuild.find('.champd'));
        }
    }

    for (let i of w.frames) {
        for (let q of i.events) {
            if (q.type == "ITEM_PURCHASED") {
                if (y.participantId == q.participantId) {
                    for (let t of itemInfo) {
                        if (q.itemId == t.item_code) {
                            if (q.itemId != 3340 && q.itemId != 3363 && q.itemId != 3364 && q.itemId != 2055 && q.itemId != 2003 && q.itemId != 2031 && q.itemId != 2033 && q.itemId != 2138 && q.itemId != 2139 && q.itemId != 2140 && q.itemId != 2010) {
                                $('<img>').attr('class', 'itemimg').attr('src', "/resources/images/LOL_ITEM_ICON/" + t.item_name_eng + ".png").appendTo(personitembuild.children('.peritembuild'));
                                //console.log('아이템 삿다')
                            }
                        }
                    }
                }
            } else if (q.type == "ITEM_UNDO") {
                if (y.participantId == q.participantId) {
                    for (let t of itemInfo) {
                        if (q.beforeId == t.item_code) {
                            if (q.beforeId != 3340 && q.beforeId != 3363 && q.beforeId != 3364 && q.beforeId != 2055 && q.beforeId != 2003 && q.beforeId != 2031 && q.beforeId != 2033 && q.beforeId != 2138 && q.beforeId != 2139 && q.beforeId != 2140 && q.beforeId != 2010) {
                                personitembuild.children('.peritembuild').children('img').last().remove();
                                //console.log('아이템 되돌리기')
                            }
                        }
                    }
                }
            }
        }
    }
    if (y.teamId == 100) {
        personitembuild.appendTo($item.children('.teamblue'));
    } else if (y.teamId == 200) {
        personitembuild.appendTo($item.children('.teamred'));
    }
}
//스킬빌드
function getSkillBuild(y, timeData, $skill) {
    let personskill = $skill.find('.personskill').clone(true).attr('class', "row personskill" + y.participantId);
    let master = personskill.find('.master');
    let table = personskill.find('.skillbuild').css('background-color', 'white');
    let skillbuildlist = new Array();
    for (let i of timeData.frames) {
        for (let q of i.events) {
            if (q.levelUpType == "NORMAL") {
                if (q.participantId == y.participantId) {
                    skillbuildlist.push(q.skillSlot);

                }

            }
        }

    }
    for (let z of championNameInfo) {
        if (y.championId == z.championid) {
            $('<td>').attr('class', "Qimg").html("<img src='/resources/images/LOL_CHAMPION_SPELLS/" + z.champion_name_eng + "/" + z.champion_name_eng + "Q.png'>").appendTo(table.find('.Q'));
            $('<td>').attr('class', "Qimg").html("<img src='/resources/images/LOL_CHAMPION_SPELLS/" + z.champion_name_eng + "/" + z.champion_name_eng + "W.png'>").appendTo(table.find('.W'));
            $('<td>').attr('class', "Qimg").html("<img src='/resources/images/LOL_CHAMPION_SPELLS/" + z.champion_name_eng + "/" + z.champion_name_eng + "E.png'>").appendTo(table.find('.E'));
            $('<td>').attr('class', "Qimg").html("<img src='/resources/images/LOL_CHAMPION_SPELLS/" + z.champion_name_eng + "/" + z.champion_name_eng + "R.png'>").appendTo(table.find('.R'));
            $('<img>').attr('class', 'champimg').attr('src', "/resources/images/LOL_CHAMPION_ICON/lol_champion_" +
                z.champion_name_eng + ".png").appendTo(personskill.find('.champs'));
            $('<p>').text(y.summonerName).appendTo(personskill.find('.champs'));
        }
    }

    for (let f in skillbuildlist) {
        let mastery = new Array()
        let b = Number(f);
        if (skillbuildlist[b] == 1) {
            $('<td>').text(b + 1).attr('class', 'value up').css('background-color', 'orange').appendTo(table.find('.Q'));
            $('<td>').appendTo(table.find('.W'));
            $('<td>').appendTo(table.find('.E'));
            $('<td>').appendTo(table.find('.R'));
        }
        if (skillbuildlist[b] == 2) {
            $('<td>').appendTo(table.find('.Q'));
            $('<td>').text(b + 1).attr('class', 'value up').css('background-color', 'orange').appendTo(table.find('.W'));
            $('<td>').appendTo(table.find('.E'));
            $('<td>').appendTo(table.find('.R'));

        }
        if (skillbuildlist[b] == 3) {
            $('<td>').appendTo(table.find('.Q'));
            $('<td>').appendTo(table.find('.W'));
            $('<td>').text(b + 1).attr('class', 'value up').css('background-color', 'orange').appendTo(table.find('.E'));
            $('<td>').appendTo(table.find('.R'));
        }
        if (skillbuildlist[b] == 4) {
            $('<td>').appendTo(table.find('.Q'));
            $('<td>').appendTo(table.find('.W'));
            $('<td>').appendTo(table.find('.E'));
            $('<td>').text(b + 1).attr('class', 'value up').css('background-color', 'orange').appendTo(table.find('.R'));
        }
    }
    table.find('td').css('width', '50px').css('border', '1px solid black');

    if (y.teamId == 100) {
        personskill.appendTo($skill.children('.buildblue'));
    } else if (y.teamId == 200) {
        personskill.appendTo($skill.children('.buildred'));
    }

}