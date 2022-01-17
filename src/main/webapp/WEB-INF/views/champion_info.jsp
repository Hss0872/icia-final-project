<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ICIAjunhyeong
  Date: 2022-01-10
  Time: 오후 5:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>${championName} Information</title>
        <link rel="stylesheet" type="text/css" href="/resources/css/champion_info.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js?ver=1"></script>
        <script>
            //아이템 빌드 (승률)
            let itemBulidWinRates = ${itemBulidWinRates};
            console.log(itemBulidWinRates);
            console.log(itemBulidWinRates[0]);
            console.log(itemBulidWinRates[0].item_Bulid);
            console.log(itemBulidWinRates[0].item_Bulid.split('|'));

            //룬 빌드 (승률)
            let runeBulidWinRates = ${runeBulidWinRates};
            console.log(runeBulidWinRates);
            console.log(runeBulidWinRates[0]);
            console.log(runeBulidWinRates[0].main_Runes);
            console.log(runeBulidWinRates[0].main_Runes.split('|'));
            console.log(runeBulidWinRates[0].sub_Runes);
            console.log(runeBulidWinRates[0].sub_Runes.split('|'));
            console.log(runeBulidWinRates[0].stats_Runes);
            console.log(runeBulidWinRates[0].stats_Runes.split('|'));
            console.log(runeBulidWinRates[1].main_Runes);
            console.log(runeBulidWinRates[1].main_Runes.split('|'));
            console.log(runeBulidWinRates[1].sub_Runes);
            console.log(runeBulidWinRates[1].sub_Runes.split('|'));
            console.log(runeBulidWinRates[1].stats_Runes);
            console.log(runeBulidWinRates[1].stats_Runes.split('|'));

            //스킬 빌드 (승률)
            let skillWinRates = ${skillWinRates};
            console.log(skillWinRates);
            console.log(skillWinRates[0]);
            console.log(skillWinRates[0].skill_Bulid);
            console.log(skillWinRates[0].skill_Bulid.split('|'));
            console.log(skillWinRates[1].skill_Bulid);
            console.log(skillWinRates[1].skill_Bulid.split('|'));
            console.log(skillWinRates[2].skill_Bulid);
            console.log(skillWinRates[2].skill_Bulid.split('|'));

            //시작 아이템 (승률)
            let startItemWinRates = ${startItemWinRates};
            console.log(startItemWinRates);
            console.log(startItemWinRates[0]);
            console.log(startItemWinRates[0].start_Item);
            console.log(startItemWinRates[0].start_Item.split('|'));

            //챔피언 포인트 (숙련도)
            let masterPoints = ${masterPoints};
            console.log(masterPoints);

            //챔피언 패시브
            let championPassives = ${championPassives};
            console.log(championPassives);
            console.log(championPassives.champion_passive_kor);
            console.log(championPassives.split);

            //챔피언 배경 (championInfo)
            let championBlurb = ${championBlurb};
            console.log(championBlurb);
            console.log(championBlurb.champion_kr);
            console.log(championBlurb.blurb);

            //챔피언별 스킬 설명 (Q, W, E, R)
            let championSkillDesc = ${championSkillDesc};
            console.log(championSkillDesc)

            //챔피언별 타이틀
            let championTitle = ${championTitle};
            console.log(championTitle)
            console.log(championTitle.champion_name_kr);
            console.log(championTitle.title);

            //챔피언별 초상화
            let championNameInfo = ${championInfo};

            //챔피언별 스킬
            let skillInfo = ${skillInfo};

            //아이템
            let itemInfo = ${itemInfo};

            //룬
            let runeInfo = ${runeInfo};
        </script>
    </head>

    <body>
<%--        <div>--%>
<%--            <p>${itemBulidWinRates}</p>--%>
<%--            <p>${runeBulidWinRates}</p>--%>
<%--            <p>${skillWinRates}</p>--%>
<%--            <p>${startItemWinRates}</p>--%>
<%--            <p>${masterPoints}</p>--%>
<%--            <p>${championPassives}</p>--%>
<%--        </div>--%>

<%--        <h1>챔피언 정보 사이트 입니다.</h1>--%>
<%--        <p>환자 : 의사 선생님 아침에 일어날 때 허리가 아파요</p>--%>
<%--        <p>의사 : 그러면 오후에 일어나세요</p>--%>
<%--        <p>환자 : 감사합니다 선생님</p>--%>

<%--        <div class="ChampPortrait">--%>
<%--            <img src="/resources/images/LOL_CHAMPION_ICON/lol_champion_${championName}.png" alt="${championName} img">--%>
<%--        </div>--%>

<%--        <div class="ChampSkill">--%>
<%--            <div class="ChampSkill_Passive">--%>
<%--                <img src="/resources/images/LOL_CHAMPION_PASSIVE/${championName}Passive.png" alt="${championName} P">--%>
<%--                <p class="Explain_box">패시브 텍스트 설명란입니다.</p>--%>
<%--            </div>--%>

<%--            <div class="ChampSkill_Q">--%>
<%--                <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}Q.png" alt="${championName} Q">--%>
<%--            </div>--%>

<%--            <div class="ChampSkill_W">--%>
<%--                <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}W.png" alt="${championName} W">--%>
<%--            </div>--%>

<%--            <div class="ChampSkill_E">--%>
<%--                <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}E.png" alt="${championName} E">--%>
<%--            </div>--%>

<%--            <div class="ChampSkill_R">--%>
<%--                <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}R.png" alt="${championName} R">--%>
<%--            </div>--%>
<%--        </div>--%>

        <!-- 챔피언 이미지 테스트 : 아래 경로 (챔피언에 따라)로 받아도 실행이 안되면 톰캣 클린하기 -->
<%--        <div class="FiddleSticks QWER imageTest">--%>
<%--            <img src="/resources/images/LOL_CHAMPION_SPELLS/FiddleSticks/FiddleSticksQ.png">--%>
<%--            <img src="/resources/images/LOL_CHAMPION_SPELLS/FiddleSticks/FiddleSticksW.png">--%>
<%--            <img src="/resources/images/LOL_CHAMPION_SPELLS/FiddleSticks/FiddleSticksE.png">--%>
<%--            <img src="/resources/images/LOL_CHAMPION_SPELLS/FiddleSticks/FiddleSticksR.png">--%>
<%--        </div>--%>

    <%------------------------------------------ 챔피언 상세정보 페이지 프론트 작업란 -------------------------------------------%>

        <!-- 챔피언 백그라운드 -->
        <!-- url에 챔피언 백그라운드 경로 파일을 올리면 될 것 같음 -->
        <!-- <div class="Background_back__29qGw"></div>
            <img src="./Shen_basic_skin.jpg" alt="shen_background">
            ::after
        </div> -->

        <!-- 챔피언 헤더 -->
        <!-- 마우스 오버 (설명 말풍선) 따로 로직 구성하기 -->

        <div class ="Wrapper_content__1wGv-">
            <div class="ChampionHeader_champion__2ZqIZ ChampionHeader_header__TkIzw">
                <div>
                    <div class="CircleBig_wrapper__3hOuX">
                        <img class="Champ_champ140c__ZSREE" src=/resources/images/CHAMPION_PHOTO/${championName}.jpg alt="${championName}">
                        <svg class="CircleBig_border__3QsNj">
                            <circle cx="72" cy="72" r="72" stroke="#333" stroke-width="2" fill="#111"></circle>
                        </svg>
                    </div>
                    <div class="SkillList_wrapper__1HtlM">
                        <div class="Skill_skill30__CEeFI">
                            <img class="Champ_Passive" src="/resources/images/LOL_CHAMPION_PASSIVE/${championName}Passive.png" alt="${championName}P">
                            <div>P</div>
                            <p class="Explain_box">${championName}Passive</p>
                        </div>
                        <div class="Skill_skill30__CEeFI">
                            <img class="Champ_Q" src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}Q.png" alt="${championName}Q">
                            <div>Q</div>
                            <p class="Explain_box">${championName}Q</p>
                        </div>
                        <div class="Skill_skill30__CEeFI">
                            <img class="Champ_W" src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}W.png" alt="${championName}W">
                            <div>W</div>
                            <p class="Explain_box">${championName}W</p>
                        </div>
                        <div class="Skill_skill30__CEeFI">
                            <img class="Champ_E" src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}E.png" alt="${championName}E">
                            <div>E</div>
                            <p class="Explain_box">${championName}E</p>
                        </div>
                        <div class="Skill_skill30__CEeFI">
                            <img class="Champ_R" src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}R.png" alt="${championName}R">
                            <div>R</div>
                            <p class="Explain_box">${championName}R</p>
                        </div>
                    </div>
                </div>

                <div>
                    <h1>${championName} Build</h1>
                    <div class="champion_title"></div>
                    <div class="champion_blurb"></div>
                </div>
            </div>

            <!-- 챔피언 정보 분석 창 -->
            <div class="Summary_quick__3le_e">
                <div class="Summary_row1__3rZk8">
                    <div>
                        Skill Priority
                        <div class="Tip_q__3v_Eo">?</div>
                    </div>
                    <div>
                        Item Build
                        <div class="Tip_q__3v_Eo">?</div>
                    </div>
                    <div>
                        Primary Runes
                        <div class="Tip_q__3v_Eo">?</div>
                    </div>
                    <div>Secondary</div>
                    <div>Stat Mods</div>
                </div>

                <!-- 챔피언 스킬 트리 로직 (스킬을 선마한 구간에는 이미지가 표시되도록 로직을 짜야함) -->
                <div class="Summary_row2__3iVg7">
                    <div>
                        <div>
                            <div class="SkillPriority_skillpriority__oC3Z5">
                                <div class="Skill_Tree_Div1">
                                    <table class="Skill_Tree1">
                                        <tr>
                                            <th>1</th>
                                            <th>2</th>
                                            <th>3</th>
                                            <th>4</th>
                                            <th>5</th>
                                            <th>6</th>
                                            <th>7</th>
                                            <th>8</th>
                                            <th>9</th>
                                            <th>10</th>
                                            <th>11</th>
                                            <th>12</th>
                                            <th>13</th>
                                            <th>14</th>
                                            <th>15</th>
                                        </tr>
                                    </table>
                                </div>

                                <div class="Skill_Tree_Div2">
                                    <table class="Skill_Tree2">
                                        <tr>
                                            <th>1</th>
                                            <th>2</th>
                                            <th>3</th>
                                            <th>4</th>
                                            <th>5</th>
                                            <th>6</th>
                                            <th>7</th>
                                            <th>8</th>
                                            <th>9</th>
                                            <th>10</th>
                                            <th>11</th>
                                            <th>12</th>
                                            <th>13</th>
                                            <th>14</th>
                                            <th>15</th>
                                        </tr>
                                    </table>
                                </div>

                                <div class="Skill_Tree_Div3">
                                    <table class="Skill_Tree3">
                                        <tr>
                                            <th>1</th>
                                            <th>2</th>
                                            <th>3</th>
                                            <th>4</th>
                                            <th>5</th>
                                            <th>6</th>
                                            <th>7</th>
                                            <th>8</th>
                                            <th>9</th>
                                            <th>10</th>
                                            <th>11</th>
                                            <th>12</th>
                                            <th>13</th>
                                            <th>14</th>
                                            <th>15</th>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="Master_Point_Div">
                        <div class="Master_Summoner1"></div>
                        <div class="Master_Summoner2"></div>
                        <div class="Master_Summoner3"></div>
                        <div class="Master_Summoner4"></div>
                        <div class="Master_Summoner5"></div>
                    </div>

                    <!-- 주요 룬 선택 로직 콘솔에 찍힌 값을 토대로 이미지를 불러오도록 로직을 짜야함 -->
                    <div>
                        <div class="Summary_runes__1b7qR">
                            <div class="RuneSet_rune__3PQbj">
                                <div class="Rune_Build_Div1">
                                    <div class="First_Rune1">
                                        <div class="Oneline_Rune1" style="display: flex"></div>
                                        <div class="Twoline_Rune1" style="display: flex"></div>
                                        <div class="Threeline_Rune1" style="display: flex"></div>
                                        <div class="Fourline_Rune1" style="display: flex"></div>
                                    </div>
                                    <div class="Second_Rune1">
                                        <div class="Summary_One1" style="display: flex"></div>
                                        <div class="Summary_Two1" style="display: flex"></div>
                                        <div class="Summary_Three1" style="display: flex"></div>
                                    </div>
                                    <div class="Stats_Rune1">
                                        <div class="Stats_One1" style="display: flex"></div>
                                        <div class="Stats_Two1" style="display: flex"></div>
                                        <div class="Stats_Three1" style="display: flex"></div>
                                    </div>
                                </div>
                                <div class="Rune_Build_Div2">
                                    <div class="First_Rune2">
                                        <div class="Oneline_Rune2" style="display: flex"></div>
                                        <div class="Twoline_Rune2" style="display: flex"></div>
                                        <div class="Threeline_Rune2" style="display: flex"></div>
                                        <div class="Fourline_Rune2" style="display: flex"></div>
                                    </div>
                                    <div class="Second_Rune2">
                                        <div class="Summary_One2" style="display: flex"></div>
                                        <div class="Summary_Two2" style="display: flex"></div>
                                        <div class="Summary_Three2" style="display: flex"></div>
                                    </div>
                                    <div class="Stats_Rune2">
                                        <div class="Stats_One2" style="display: flex"></div>
                                        <div class="Stats_Two2" style="display: flex"></div>
                                        <div class="Stats_Three2" style="display: flex"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 아이템 빌드 콘솔에 찍힌 값을 토대로 이미지를 불러오도록 로직을 짜야함 -->
                <div class="Summary_row3__3lr5H">
                    <div class="Staring_Item_Build">
                        <p>Starting Items</p>
                        <div class="Starting_Build_Tree1">
                            <div class="Starting_Build_Div1">
                                <p>Starting Build 1</p>
                            </div>
                        </div>
                        <div class="Starting_Build_Tree2">
                            <div class="Starting_Build_Div2">
                                <p>Starting Build 2</p>
                            </div>
                        </div>
                    </div>

                    <div class="Item_Build">
                        <p>Item Build</p>
                        <div class="Item_Build_Tree1">
                            <div class="Item_Build_Div1">
                                <p>Item Build 1</p>
                            </div>
                        </div>
                        <div class="Item_Build_Tree2">
                            <div class="Item_Build_Div2">
                                <p>Item Build 2</p>
                            </div>
                        </div>
                        <div class="Item_Build_Tree3">
                            <div class="Item_Build_Div3">
                                <p>Item Build 3</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    <script>
        //챔피언 소개 로직에 사용하는 변수들 (챔피언 인트로, 챔피언 타이틀)
        let title =  championTitle.title;   //챔피언 타이틀
        let blurb =  championBlurb.blurb;   //챔피언 인트로

        let T_Div = $('.champion_title');
        let B_Div = $('.champion_blurb');

        $('<p>').attr("class", "champion_title_desc").text(title).appendTo(T_Div);
        $('<p>').attr("class", "champion_blurb_desc").text(blurb).appendTo(B_Div);

        //─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─  로직 구분 주석 ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─

        //장인 랭킹 로직에 사용하는 변수들
        //소환사 이름
        let M_Summoner1 = masterPoints[0].summonerName;
        let M_Summoner2 = masterPoints[1].summonerName;
        let M_Summoner3 = masterPoints[2].summonerName;
        let M_Summoner4 = masterPoints[3].summonerName;
        let M_Summoner5 = masterPoints[4].summonerName;

        //챔피언 숙련도 점수
        let M_Point1 = masterPoints[0].championPoints;
        let M_Point2 = masterPoints[1].championPoints;
        let M_Point3 = masterPoints[2].championPoints;
        let M_Point4 = masterPoints[3].championPoints;
        let M_Point5 = masterPoints[4].championPoints;

        let Master1 = $('.Master_Summoner1');
        let Master2 = $('.Master_Summoner2');
        let Master3 = $('.Master_Summoner3');
        let Master4 = $('.Master_Summoner4');
        let Master5 = $('.Master_Summoner5');

        //1등 (챔피언 숙련도 점수 순) 1st
        $('<p>').attr("class", "Master_Champion_Summoner").text(M_Summoner1).appendTo(Master1);
        $('<p>').attr("class", "Master_Champion_Points").text(M_Point1).appendTo(Master1);

        //2등 (챔피언 숙련도 점수 순) 2rd
        $('<p>').attr("class", "Master_Champion_Summoner").text(M_Summoner2).appendTo(Master2);
        $('<p>').attr("class", "Master_Champion_Points").text(M_Point2).appendTo(Master2);

        //3등 (챔피언 숙련도 점수 순) 3th
        $('<p>').attr("class", "Master_Champion_Summoner").text(M_Summoner3).appendTo(Master3);
        $('<p>').attr("class", "Master_Champion_Points").text(M_Point3).appendTo(Master3);

        //4등 (챔피언 숙련도 점수 순) 4th
        $('<p>').attr("class", "Master_Champion_Summoner").text(M_Summoner4).appendTo(Master4);
        $('<p>').attr("class", "Master_Champion_Points").text(M_Point5).appendTo(Master5);

        //5등 (챔피언 숙련도 점수 순) 5th
        $('<p>').attr("class", "Master_Champion_Summoner").text(M_Summoner5).appendTo(Master5);
        $('<p>').attr("class", "Master_Champion_Points").text(M_Point5).appendTo(Master5);

        //─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─  로직 구분 주석 ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─

        //스킬트리 로직에 사용하는 변수들
        let cnt1 = skillWinRates[0].cnt;
        let cnt2 = skillWinRates[1].cnt;
        let cnt3 = skillWinRates[2].cnt;

        let win_rate1 = skillWinRates[0].win_rate;
        let win_rate2 = skillWinRates[1].win_rate;
        let win_rate3 = skillWinRates[2].win_rate;

        let lst1 = skillWinRates[0].skill_Bulid.split('|');
        let lst2 = skillWinRates[1].skill_Bulid.split('|');
        let lst3 = skillWinRates[2].skill_Bulid.split('|');

        //상위 div
        let $Skill_Div1 = $('.Skill_Tree_Div1');
        let $Skill_Div2 = $('.Skill_Tree_Div2');
        let $Skill_Div3 = $('.Skill_Tree_Div3');

        //하위 div
        let $table1 = $('.Skill_Tree1');
        let $table2 = $('.Skill_Tree2');
        let $table3 = $('.Skill_Tree3');

        let $tr1 = $('<tr>');
        let $tr2 = $('<tr>');
        let $tr3 = $('<tr>');

        let Q_count1 = 0;
        let W_count1 = 0;
        let E_count1 = 0;

        let Q_count2 = 0;
        let W_count2 = 0;
        let E_count2 = 0;

        let Q_count3 = 0;
        let W_count3 = 0;
        let E_count3 = 0;

        //스킬트리 1
        for (let idx in lst1) {
            if (idx == 15) {
                break;
            }
            if (lst1[idx] == "1") {
                Q_count1 = Q_count1 + 1;
                if (Q_count1 == 5) {
                    let $img = $('<img>').attr('class', 'Skillimg').attr("src", "/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}Q.png");
                    $('<td>').append($img).appendTo($tr1);
                } else {
                    $('<td>').text("Q").appendTo($tr1);
                }
            } else if (lst1[idx] == "2") {
                W_count1 = W_count1 + 1;
                if (W_count1 == 5) {
                    let $img = $('<img>').attr('class', 'Skillimg').attr("src", "/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}W.png");
                    $('<td>').append($img).appendTo($tr1);
                } else {
                    $('<td>').text("W").appendTo($tr1);
                }
            } else if (lst1[idx] == "3") {
                E_count1 = E_count1 + 1;
                if (E_count1 == 5) {
                    let $img = $('<img>').attr('class', 'Skillimg').attr("src", "/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}E.png");
                    $('<td>').append($img).appendTo($tr1);
                } else {
                    $('<td>').text("E").appendTo($tr1);
                }
            } else if (lst1[idx] == "4") {
                <!-- 스킬트리를 15까지만 출력하기 때문에 궁극기(R) 이미지 출력은 제외 -->
                $('<td>').text("R").appendTo($tr1);
            }
        }
        $table1.append($tr1);
        $('<p>').attr("class", "skill_rate").text(win_rate1+"% Win Rate").appendTo($Skill_Div1);
        $('<p>').attr("class", "skill_cnt").text(cnt1+" Games").appendTo($Skill_Div1);

        //스킬트리 2
        for (let idx in lst2) {
            if (idx == 15) {
                break;
            }
            if (lst2[idx] == "1") {
                Q_count2 = Q_count2 + 1;
                if (Q_count2 == 5) {
                    let $img = $('<img>').attr('class', 'Skillimg').attr("src", "/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}Q.png");
                    $('<td>').append($img).appendTo($tr2);
                } else {
                    $('<td>').text("Q").appendTo($tr2);
                }
            } else if (lst2[idx] == "2") {
                W_count2 = W_count2 + 1;
                if (W_count2 == 5) {
                    let $img = $('<img>').attr('class', 'Skillimg').attr("src", "/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}W.png");
                    $('<td>').append($img).appendTo($tr2);
                } else {
                    $('<td>').text("W").appendTo($tr2);
                }
            } else if (lst2[idx] == "3") {
                E_count2 = E_count2 + 1;
                if (E_count2 == 5) {
                    let $img = $('<img>').attr('class', 'Skillimg').attr("src", "/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}E.png");
                    $('<td>').append($img).appendTo($tr2);
                } else {
                    $('<td>').text("E").appendTo($tr2);
                }
            } else if (lst2[idx] == "4") {
                <!-- 스킬트리를 15까지만 출력하기 때문에 궁극기(R) 이미지 출력은 제외 -->
                $('<td>').text("R").appendTo($tr2);
            }
        }
        $table2.append($tr2);
        $('<p>').attr("class", "skill_rate").text(win_rate2+"% Win Rate").appendTo($Skill_Div2);
        $('<p>').attr("class", "skill_cnt").text(cnt2+" Games").appendTo($Skill_Div2);

        //스킬트리 3
        for (let idx in lst3) {
            if (idx == 15) {
                break;
            }
            if (lst3[idx] == "1") {
                Q_count3 = Q_count3 + 1;
                if (Q_count3 == 5) {
                    let $img = $('<img>').attr('class', 'Skillimg').attr("src", "/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}Q.png");
                    $('<td>').append($img).appendTo($tr3);
                } else {
                    $('<td>').text("Q").appendTo($tr3);
                }
            } else if (lst3[idx] == "2") {
                W_count3 = W_count3 + 1;
                if (W_count3 == 5) {
                    let $img = $('<img>').attr('class', 'Skillimg').attr("src", "/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}W.png");
                    $('<td>').append($img).appendTo($tr3);
                } else {
                    $('<td>').text("W").appendTo($tr3);
                }
            } else if (lst3[idx] == "3") {
                E_count3 = E_count3 + 1;
                if (E_count3 == 5) {
                    let $img = $('<img>').attr('class', 'Skillimg').attr("src", "/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}E.png");
                    $('<td>').append($img).appendTo($tr3);
                } else {
                    $('<td>').text("E").appendTo($tr3);
                }
            } else if (lst3[idx] == "4") {
                <!-- 스킬트리를 15까지만 출력하기 때문에 궁극기(R) 이미지 출력은 제외 -->
                $('<td>').text("R").appendTo($tr3);
            }
        }
        $table3.append($tr3);
        $('<p>').attr("class", "skill_rate").text(win_rate3+"% Win Rate").appendTo($Skill_Div3);
        $('<p>').attr("class", "skill_cnt").text(cnt3+" Games").appendTo($Skill_Div3);

        //─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─  로직 구분 주석 ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─

        //시작 아이템 로직에 사용하는 변수들
        let SI_cnt1 = startItemWinRates[0].cnt;
        let SI_cnt2 = startItemWinRates[1].cnt;

        let SI_rate1 = startItemWinRates[0].win_rate;
        let SI_rate2 = startItemWinRates[1].win_rate;

        let SI_lst1 = startItemWinRates[0].start_Item.split('|');
        let SI_lst2 = startItemWinRates[1].start_Item.split('|');

        let SI_Tree1 = $('.Starting_Build_Tree1');
        let SI_Tree2 = $('.Starting_Build_Tree2');

        let SI_Div1 = $('.Starting_Build_Div1');
        let SI_Div2 = $('.Starting_Build_Div2');

        //시작 아이템 1
        for (let m of itemInfo) {
            if (m.item_code == SI_lst1[0]) {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(SI_Div1);
            } else if (m.item_code == SI_lst1[1])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(SI_Div1);
            } else if (m.item_code == SI_lst1[2])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(SI_Div1);
            } else if (m.item_code == SI_lst1[3])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(SI_Div1);
            }
        }
        $('<p>').attr("class", "start_item_rate").text(SI_rate1+"% Win Rate").appendTo(SI_Tree1);
        $('<p>').attr("class", "start_cnt").text(SI_cnt1+" Games").appendTo(SI_Tree1);

        //시작 아이템 2
        for (let m of itemInfo) {
            if (m.item_code == SI_lst2[0]) {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(SI_Div2);
            } else if (m.item_code == SI_lst2[1])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(SI_Div2);
            } else if (m.item_code == SI_lst2[2])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(SI_Div2);
            } else if (m.item_code == SI_lst2[3])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(SI_Div2);
            }
        }
        $('<p>').attr("class", "start_item_rate").text(SI_rate2+"% Win Rate").appendTo(SI_Tree2);
        $('<p>').attr("class", "start_cnt").text(SI_cnt2+" Games").appendTo(SI_Tree2);

        //─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─  로직 구분 주석 ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─

        //아이템 빌드 로직에 사용하는 변수들
        let IB_cnt1 = itemBulidWinRates[0].cnt;
        let IB_cnt2 = itemBulidWinRates[1].cnt;
        let IB_cnt3 = itemBulidWinRates[2].cnt;

        let IB_rate1 = itemBulidWinRates[0].win_rate
        let IB_rate2 = itemBulidWinRates[1].win_rate;
        let IB_rate3 = itemBulidWinRates[2].win_rate;

        let IB_lst1 = itemBulidWinRates[0].item_Bulid.split('|');
        let IB_lst2 = itemBulidWinRates[1].item_Bulid.split('|');
        let IB_lst3 = itemBulidWinRates[2].item_Bulid.split('|');

        let IB_Tree1 = $('.Item_Build_Tree1');
        let IB_Tree2 = $('.Item_Build_Tree2');
        let IB_Tree3 = $('.Item_Build_Tree3');

        let IB_Div1 = $('.Item_Build_Div1');
        let IB_Div2 = $('.Item_Build_Div2');
        let IB_Div3 = $('.Item_Build_Div3');

        //아이템 빌드 1
        for (let m of itemInfo) {
            if (m.item_code == IB_lst1[0]) {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div1);
            } else if (m.item_code == IB_lst1[1])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div1);
            } else if (m.item_code == IB_lst1[2])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div1);
            } else if (m.item_code == IB_lst1[3])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div1);
            } else if (m.item_code == IB_lst1[4])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div1);
            } else if (m.item_code == IB_lst1[5])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div1);
            }
        }
        $('<p>').attr("class", "item_build_rate").text(IB_rate1+"% Win Rate").appendTo(IB_Tree1);
        $('<p>').attr("class", "item_cnt").text(IB_cnt1+" Games").appendTo(IB_Tree1);

        //아이템 빌드 2
        for (let m of itemInfo) {
            if (m.item_code == IB_lst2[0]) {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div2);
            } else if (m.item_code == IB_lst2[1])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div2);
            } else if (m.item_code == IB_lst2[2])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div2);
            } else if (m.item_code == IB_lst2[3])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div2);
            } else if (m.item_code == IB_lst2[4])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div2);
            } else if (m.item_code == IB_lst2[5])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div2);
            }
        }
        $('<p>').attr("class", "item_build_rate").text(IB_rate2+"% Win Rate").appendTo(IB_Tree2);
        $('<p>').attr("class", "item_cnt").text(IB_cnt2+" Games").appendTo(IB_Tree2);

        //아이템 빌드 3
        for (let m of itemInfo) {
            if (m.item_code == IB_lst3[0]) {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div3);
            } else if (m.item_code == IB_lst3[1])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div3);
            } else if (m.item_code == IB_lst3[2])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div3);
            } else if (m.item_code == IB_lst3[3])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div3);
            } else if (m.item_code == IB_lst3[4])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div3);
            } else if (m.item_code == IB_lst3[5])   {
                let $img = $('<img>').attr("class", "start_item_img").attr("src", "/resources/images/LOL_ITEM_ICON/" + m.item_name_eng + ".png");
                $('<div>').append($img).appendTo(IB_Div3);
            }
        }
        $('<p>').attr("class", "item_build_rate").text(IB_rate3+"% Win Rate").appendTo(IB_Tree3);
        $('<p>').attr("class", "item_cnt").text(IB_cnt3+" Games").appendTo(IB_Tree3);

        //─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─  로직 구분 주석 ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─

        //룬 빌드 로직에 사용하는 변수들
        let RB_Cnt1 = runeBulidWinRates[0].cnt;
        let RB_Cnt2 = runeBulidWinRates[1].cnt;

        let RB_Rate1 = runeBulidWinRates[0].win_Rate;
        let RB_Rate2 = runeBulidWinRates[1].win_Rate;

        let PM_Rune1 = runeBulidWinRates[0].main_Runes.split('|')[0];
        let PM_Rune1A = runeBulidWinRates[0].main_Runes.split('|')[1];
        let PM_Rune1B = runeBulidWinRates[0].main_Runes.split('|')[2];
        let PM_Rune1C = runeBulidWinRates[0].main_Runes.split('|')[3];

        let SM_Rune1 = runeBulidWinRates[0].sub_Runes.split('|')[0];
        let SM_Rune1A = runeBulidWinRates[0].sub_Runes.split('|')[1];

        let Stats_Rune1 = runeBulidWinRates[0].stats_Runes.split('|')[0];
        let Stats_Rune1A = runeBulidWinRates[0].stats_Runes.split('|')[1];
        let Stats_Rune1B = runeBulidWinRates[0].stats_Runes.split('|')[2];

        let PM_Rune2 = runeBulidWinRates[1].main_Runes.split('|')[0];
        let PM_Rune2A = runeBulidWinRates[1].main_Runes.split('|')[1];
        let PM_Rune2B = runeBulidWinRates[1].main_Runes.split('|')[2];
        let PM_Rune2C = runeBulidWinRates[1].main_Runes.split('|')[3];

        let SM_Rune2 = runeBulidWinRates[1].sub_Runes.split('|')[0];
        let SM_Rune2A = runeBulidWinRates[1].sub_Runes.split('|')[1];

        let Stats_Rune2 = runeBulidWinRates[1].stats_Runes.split('|')[0];
        let Stats_Rune2A = runeBulidWinRates[1].stats_Runes.split('|')[1];
        let Stats_Rune2B = runeBulidWinRates[1].stats_Runes.split('|')[2];

        let RB_Div1 = $('.Rune_Build_Div1');
        let RB_Div2 = $('.Rune_Build_Div2');

        //첫번째 (Primary Runes) 룬페이지 변수
        let RB_One1 = $('.Oneline_Rune1');
        let RB_Two1 = $('.Twoline_Rune1');
        let RB_Three1 = $('.Threeline_Rune1');
        let RB_Four1 = $('.Fourline_Rune1');

        let RB_One2 = $('.Oneline_Rune2');
        let RB_Two2 = $('.Twoline_Rune2');
        let RB_Three2 = $('.Threeline_Rune2');
        let RB_Four2 = $('.Fourline_Rune2');

        //두번째 (Summary Runes) 룬페이지 변수
        let RBs_One1 = $('.Summary_One1');
        let RBs_Two1 = $('.Summary_Two1');
        let RBs_Three1 = $('.Summary_Three1');

        let RBs_One2 = $('.Summary_One2');
        let RBs_Two2 = $('.Summary_Two2');
        let RBs_Three2 = $('.Summary_Three2');

        //세번째 (Stats Mod) 룬페이지 변수
        let SM_One1 = $('.Stats_One1');
        let SM_Two1 = $('.Stats_Two1');
        let SM_Three1 = $('.Stats_Three1');

        let SM_One2 = $('.Stats_One2');
        let SM_Two2 = $('.Stats_Two2');
        let SM_Three2 = $('.Stats_Three2');

        //룬 빌드1
        //Primay Runes
        if (PM_Rune1 == "8112" || PM_Rune1 == "8124" || PM_Rune1 == "8128" || PM_Rune1 == "9923") {     //Domination (지배)
            $('<div>').attr("class", "Domination_Keystone_Predator_A").html("<img src='/resources/images/perk_images/Styles/Domination/Keystone/Predator.png' style='width: 50px'>").css('-webkit-filter', 'grayscale(100%)').appendTo(RB_One1);
            $('<div>').attr("class", "Domination_Keystone_Electrocute_A").html("<img src='/resources/images/perk_images/Styles/Domination/Keystone/Electrocute.png' style='width: 50px'>").css('-webkit-filter', 'grayscale(100%)').appendTo(RB_One1);
            $('<div>').attr("class", "Domination_Keystone_DarkHarvest_A").html("<img src='/resources/images/perk_images/Styles/Domination/Keystone/DarkHarvest.png' style='width: 50px'>").css('-webkit-filter', 'grayscale(100%)').appendTo(RB_One1);
            $('<div>').attr("class", "Domination_Keystone_HailOfBlades_A").html("<img src='/resources/images/perk_images/Styles/Domination/Keystone/HailOfBlades.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One1);

            $('<div>').attr("class", "Domination_Malice_CheapShot_A").html("<img src='/resources/images/perk_images/Styles/Domination/Malice/CheapShot.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);
            $('<div>').attr("class", "Domination_Malice_TasteOfBlood_A").html("<img src='/resources/images/perk_images/Styles/Domination/Malice/TasteOfBlood.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);
            $('<div>').attr("class", "Domination_Malice_SuddenImpact_A").html("<img src='/resources/images/perk_images/Styles/Domination/Malice/SuddenImpact.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);

            $('<div>').attr("class", "Domination_Tracking_ZombieWard_A").html("<img src='/resources/images/perk_images/Styles/Domination/Tracking/ZombieWard.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);
            $('<div>').attr("class", "Domination_Tracking_GhostPoro_A").html("<img src='/resources/images/perk_images/Styles/Domination/Tracking/GhostPoro.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);
            $('<div>').attr("class", "Domination_Tracking_EyeballCollection_A").html("<img src='/resources/images/perk_images/Styles/Domination/Tracking/EyeballCollection.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);

            $('<div>').attr("class", "Domination_Hunter_RavenousHunter_A").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/RavenousHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
            $('<div>').attr("class", "Domination_Hunter_IngeniousHunter_A").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/IngeniousHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
            $('<div>').attr("class", "Domination_Hunter_RelentlessHunter_A").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/RelentlessHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
            $('<div>').attr("class", "Domination_Hunter_UltimateHunter_A").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/UltimateHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
        } else if (PM_Rune1 == "8351" || PM_Rune1 == "8360" || PM_Rune1 == "8369") {    //Inspiration (영감)
            $('<div>').attr("class", "Inspiration_Keystone_GlacialAugment_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Keystone/GlacialAugment.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One1);
            $('<div>').attr("class", "Inspiration_Keystone_UnsealedSpellbook_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Keystone/UnsealedSpellbook.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One1);
            $('<div>').attr("class", "Inspiration_Keystone_FirstStrike_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Keystone/FirstStrike.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One1);

            $('<div>').attr("class", "Inspiration_Contraption_HextechFlashtraption_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Contraption/HextechFlashtraption.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);
            $('<div>').attr("class", "Inspiration_Contraption_MagicalFootwear_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Contraption/MagicalFootwear.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);
            $('<div>').attr("class", "Inspiration_Contraption_PerfectTiming_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Contraption/PerfectTiming.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);

            $('<div>').attr("class", "Inspiration_Tomorrow_FuturesMarket_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Tomorrow/FuturesMarket.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);
            $('<div>').attr("class", "Inspiration_Tomorrow_MinionDematerializer_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Tomorrow/MinionDematerializer.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);
            $('<div>').attr("class", "Inspiration_Tomorrow_BiscuitDelivery_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Tomorrow/BiscuitDelivery.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);

            $('<div>').attr("class", "Inspiration_Beyond_CosmicInsight_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Beyond/CosmicInsight.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
            $('<div>').attr("class", "Inspiration_Beyond_ApproachVelocity_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Beyond/ApproachVelocity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
            $('<div>').attr("class", "Inspiration_Beyond_TimeWarpTonic_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Beyond/TimeWarpTonic.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
        } else if (PM_Rune1 == "8005" || PM_Rune1 == "8008" || PM_Rune1 == "8021" || PM_Rune1 == "8010") {    //Precision (정밀)
            $('<div>').attr("class", "Precision_Keystone_PressTheAttack_A").html("<img src='/resources/images/perk_images/Styles/Precision/Keystone/PressTheAttack.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One1);
            $('<div>').attr("class", "Precision_Keystone_LethalTempo_A").html("<img src='/resources/images/perk_images/Styles/Precision/Keystone/LethalTempo.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One1);
            $('<div>').attr("class", "Precision_Keystone_FleetFootwork_A").html("<img src='/resources/images/perk_images/Styles/Precision/Keystone/FleetFootwork.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One1);
            $('<div>').attr("class", "Precision_Keystone_Conqueror_A").html("<img src='/resources/images/perk_images/Styles/Precision/Keystone/Conqueror.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One1);

            $('<div>').attr("class", "Precision_Heroism_Overheal_A").html("<img src='/resources/images/perk_images/Styles/Precision/Heroism/Overheal.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);
            $('<div>').attr("class", "Precision_Heroism_Triumph_A").html("<img src='/resources/images/perk_images/Styles/Precision/Heroism/Triumph.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);
            $('<div>').attr("class", "Precision_Heroism_PresenceOfMind_A").html("<img src='/resources/images/perk_images/Styles/Precision/Heroism/PresenceOfMind.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);

            $('<div>').attr("class", "Precision_Legend_LegendAlacrity_A").html("<img src='/resources/images/perk_images/Styles/Precision/Legend/LegendAlacrity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);
            $('<div>').attr("class", "Precision_Legend_LegendTenacity_A").html("<img src='/resources/images/perk_images/Styles/Precision/Legend/LegendTenacity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);
            $('<div>').attr("class", "Precision_Legend_LegendBloodline_A").html("<img src='/resources/images/perk_images/Styles/Precision/Legend/LegendBloodline.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);

            $('<div>').attr("class", "Precision_Combat_CoupDeGrace_A").html("<img src='/resources/images/perk_images/Styles/Precision/Combat/CoupDeGrace.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
            $('<div>').attr("class", "Precision_Combat_CutDown_A").html("<img src='/resources/images/perk_images/Styles/Precision/Combat/CutDown.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
            $('<div>').attr("class", "Precision_Combat_LastStand_A").html("<img src='/resources/images/perk_images/Styles/Precision/Combat/LastStand.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
        } else if (PM_Rune1 == "8437" || PM_Rune1 == "8439" || PM_Rune1 == "8465") {      //Resolve (결의)
            $('<div>').attr("class", "Resolve_Keystone_GraspOfTheUndying_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Keystone/GraspOfTheUndying.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One1);
            $('<div>').attr("class", "Resolve_Keystone_Aftershock_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Keystone/Aftershock.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One1);
            $('<div>').attr("class", "Resolve_Keystone_Guardian_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Keystone/Guardian.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One1);

            $('<div>').attr("class", "Resolve_Strength_Demolish_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Strength/Demolish.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);
            $('<div>').attr("class", "Resolve_Strength_FontOfLife_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Strength/FontOfLife.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);
            $('<div>').attr("class", "Resolve_Strength_ShieldBash_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Strength/ShieldBash.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);

            $('<div>').attr("class", "Resolve_Resistance_Conditioning_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Resistance/Conditioning.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);
            $('<div>').attr("class", "Resolve_Resistance_SecondWind_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Resistance/SecondWind.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);
            $('<div>').attr("class", "Resolve_Resistance_BonePlating_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Resistance/BonePlating.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);

            $('<div>').attr("class", "Resolve_Vitality_Overgrowth_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Vitality/Overgrowth.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
            $('<div>').attr("class", "Resolve_Vitality_Revitalize_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Vitality/Revitalize.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
            $('<div>').attr("class", "Resolve_Vitality_Unflinching_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Vitality/Unflinching.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
        } else if (PM_Rune1 == "8214" || PM_Rune1 == "8229" || PM_Rune1 == "8230") {        //Sorcery (마법)
            $('<div>').attr("class", "Sorcery_Keystone_SummonAery_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Keystone/SummonAery.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One1);
            $('<div>').attr("class", "Sorcery_Keystone_ArcaneComet_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Keystone/ArcaneComet.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One1);
            $('<div>').attr("class", "Sorcery_Keystone_PhaseRush_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Keystone/PhaseRush.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One1);

            $('<div>').attr("class", "Sorcery_Artefact_NullifyingOrb_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Artefact/NullifyingOrb.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);
            $('<div>').attr("class", "Sorcery_Artefact_ManaflowBand_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Artefact/ManaflowBand.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);
            $('<div>').attr("class", "Sorcery_Artefact_NimbusCloak_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Artefact/NimbusCloak.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two1);

            $('<div>').attr("class", "Sorcery_Excellence_Transcendence_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Excellence/Transcendence.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);
            $('<div>').attr("class", "Sorcery_Excellence_Celerity_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Excellence/Celerity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);
            $('<div>').attr("class", "Sorcery_Excellence_AbsoluteFocus_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Excellence/AbsoluteFocus.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three1);

            $('<div>').attr("class", "Sorcery_Power_Scorch_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Power/Scorch.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
            $('<div>').attr("class", "Sorcery_Power_Waterwalking_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Power/Waterwalking.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
            $('<div>').attr("class", "Sorcery_Power_GatheringStorm_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Power/GatheringStorm.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four1);
        }

        //왕룬 선택란
        if (PM_Rune1 == "8124") {   //지배 왕룬
            document.querySelector('.Domination_Keystone_Predator_A').style.removeProperty('-webkit-filter');     //포식자
        } else if (PM_Rune1 == "8112") {
            document.querySelector('.Domination_Keystone_Electrocute_A').style.removeProperty('-webkit-filter');      //감전
        } else if (PM_Rune1 == "8128") {
            document.querySelector('.Domination_Keystone_DarkHarvest_A').style.removeProperty('-webkit-filter');      //수확자
        } else if (PM_Rune1 == "9923") {
            document.querySelector('.Domination_Keystone_HailOfBlades_A').style.removeProperty('-webkit-filter');     //칼날비
        } else if (PM_Rune1 == "8351") {    //영감 왕룬
            document.querySelector('.Inspiration_Keystone_GlacialAugment_A').style.removeProperty('-webkit-filter');      //빙결강화
        } else if (PM_Rune1 == "8360") {
            document.querySelector('.Inspiration_Keystone_UnsealedSpellbook_A').style.removeProperty('-webkit-filter');       //봉인풀린 주문서
        } else if (PM_Rune1 == "8369") {
            document.querySelector('.Inspiration_Keystone_FirstStrike_A').style.removeProperty('-webkit-filter');     //선제공격
        } else if (PM_Rune1 == "8005") {    //정밀 왕룬
            document.querySelector('.Precision_Keystone_PressTheAttack_A').style.removeProperty('-webkit-filter');        //집중 공격
        } else if (PM_Rune1 == "8008") {
            document.querySelector('.Precision_Keystone_LethalTempo_A').style.removeProperty('-webkit-filter');       //치명적인 속도
        } else if (PM_Rune1 == "8021") {
            document.querySelector('.Precision_Keystone_FleetFootwork_A').style.removeProperty('-webkit-filter');     //기민한 발놀림
        } else if (PM_Rune1 == "8010") {
            document.querySelector('.Precision_Keystone_Conqueror_A').style.removeProperty('-webkit-filter');     //정복자
        } else if (PM_Rune1 == "8437") {    //결의 왕룬
            document.querySelector('.Resolve_Keystone_GraspOfTheUndying_A').style.removeProperty('-webkit-filter');       //착취의 손아귀
        } else if (PM_Rune1 == "8439") {
            document.querySelector('.Resolve_Keystone_Aftershock_A').style.removeProperty('-webkit-filter');      //여진
        } else if (PM_Rune1 == "8465") {
            document.querySelector('.Resolve_Keystone_Guardian_A').style.removeProperty('-webkit-filter');        //수호자
        } else if (PM_Rune1 == "8214") {    //마법 왕룬
            document.querySelector('.Sorcery_Keystone_SummonAery_A').style.removeProperty('-webkit-filter');      //콩콩이 소환
        } else if (PM_Rune1 == "8229") {
            document.querySelector('.Sorcery_Keystone_ArcaneComet_A').style.removeProperty('-webkit-filter');     //신비로운 유성
        } else if (PM_Rune1 == "8230") {
            document.querySelector('.Sorcery_Keystone_PhaseRush_A').style.removeProperty('-webkit-filter');       //난입
        }

        //두번째 룬 선택란
        if (PM_Rune1A == "8126") {   //지배룬
            document.querySelector('.Domination_Malice_CheapShot_A').style.removeProperty('-webkit-filter');     //비열한 한 방
        } else if (PM_Rune1A == "8139") {
            document.querySelector('.Domination_Malice_TasteOfBlood_A').style.removeProperty('-webkit-filter');     //피의 맛
        } else if (PM_Rune1A == "8143") {
            document.querySelector('.Domination_Malice_SuddenImpact_A').style.removeProperty('-webkit-filter');     //돌발일격
        } else if (PM_Rune1A == "8306") {   //영감룬
            document.querySelector('.Inspiration_Contraption_HextechFlashtraption_A').style.removeProperty('-webkit-filter');     //마법공학 점멸기
        } else if (PM_Rune1A == "8304") {
            document.querySelector('.Inspiration_Contraption_MagicalFootwear_A').style.removeProperty('-webkit-filter');     //마법의 신발
        } else if (PM_Rune1A == "8313") {
            document.querySelector('.Inspiration_Contraption_PerfectTiming_A').style.removeProperty('-webkit-filter');     //완벽한 타이밍
        } else if (PM_Rune1A == "9101") {   //정밀룬
            document.querySelector('.Precision_Heroism_Overheal_A').style.removeProperty('-webkit-filter');     //과다치유
        } else if (PM_Rune1A == "9111") {
            document.querySelector('.Precision_Heroism_Triumph_A').style.removeProperty('-webkit-filter');     //승전보
        } else if (PM_Rune1A == "8009") {
            document.querySelector('.Precision_Heroism_PresenceOfMind_A').style.removeProperty('-webkit-filter');     //침착
        } else if (PM_Rune1A == "8446") {   //결의룬
            document.querySelector('.Resolve_Strength_Demolish_A').style.removeProperty('-webkit-filter');     //철거
        } else if (PM_Rune1A == "8463") {
            document.querySelector('.Resolve_Strength_FontOfLife_A').style.removeProperty('-webkit-filter');     //생명의 샘
        } else if (PM_Rune1A == "8401") {
            document.querySelector('.Resolve_Strength_ShieldBash_A').style.removeProperty('-webkit-filter');     //보호막 강타
        } else if (PM_Rune1A == "8224") {   //마법룬
            document.querySelector('.Sorcery_Artefact_NullifyingOrb_A').style.removeProperty('-webkit-filter');     //무효화 구체
        } else if (PM_Rune1A == "8226") {
            document.querySelector('.Sorcery_Artefact_ManaflowBand_A').style.removeProperty('-webkit-filter');     //마나순환 팔찌
        } else if (PM_Rune1A == "8275") {
            document.querySelector('.Sorcery_Artefact_NimbusCloak_A').style.removeProperty('-webkit-filter');     //빛의 망토
        }

        //세번째 룬 선택란
        if (PM_Rune1B == "8136") {   //지배룬
            document.querySelector('.Domination_Tracking_ZombieWard_A').style.removeProperty('-webkit-filter');     //좀비 와드
        } else if (PM_Rune1B == "8120") {
            document.querySelector('.Domination_Tracking_GhostPoro_A').style.removeProperty('-webkit-filter');     //유령 포로
        } else if (PM_Rune1B == "8138") {
            document.querySelector('.Domination_Tracking_EyeballCollection_A').style.removeProperty('-webkit-filter');     //사냥의 증표
        } else if (PM_Rune1B == "8321") {   //영감룬
            document.querySelector('.Inspiration_Tomorrow_FuturesMarket_A').style.removeProperty('-webkit-filter');     //외상
        } else if (PM_Rune1B == "8316") {
            document.querySelector('.Inspiration_Tomorrow_MinionDematerializer_A').style.removeProperty('-webkit-filter');     //미니언 해체분석기
        } else if (PM_Rune1B == "8345") {
            document.querySelector('.Inspiration_Tomorrow_BiscuitDelivery_A').style.removeProperty('-webkit-filter');     //비스킷 배달
        } else if (PM_Rune1B == "9104") {   //정밀룬
            document.querySelector('.Precision_Legend_LegendAlacrity_A').style.removeProperty('-webkit-filter');     //전설 : 민첩함
        } else if (PM_Rune1B == "9105") {
            document.querySelector('.Precision_Legend_LegendTenacity_A').style.removeProperty('-webkit-filter');     //전설 : 강인함
        } else if (PM_Rune1B == "9103") {
            document.querySelector('.Precision_Legend_LegendBloodline_A').style.removeProperty('-webkit-filter');     //전설 : 핏빛 길
        } else if (PM_Rune1B == "8429") {   //결의룬
            document.querySelector('.Resolve_Resistance_Conditioning_A').style.removeProperty('-webkit-filter');     //사전 준비
        } else if (PM_Rune1B == "8444") {
            document.querySelector('.Resolve_Resistance_SecondWind_A').style.removeProperty('-webkit-filter');     //재생의 바람
        } else if (PM_Rune1B == "8473") {
            document.querySelector('.Resolve_Resistance_BonePlating_A').style.removeProperty('-webkit-filter');     //뼈 방패
        } else if (PM_Rune1B == "8210") {   //마법룬
            document.querySelector('.Sorcery_Excellence_Transcendence_A').style.removeProperty('-webkit-filter');     //깨달음
        } else if (PM_Rune1B == "8234") {
            document.querySelector('.Sorcery_Excellence_Celerity_A').style.removeProperty('-webkit-filter');     //기민함
        } else if (PM_Rune1B == "8233") {
            document.querySelector('.Sorcery_Excellence_AbsoluteFocus_A').style.removeProperty('-webkit-filter');     //절대 집중
        }

        //네번째 룬 선택란
        if (PM_Rune1C == "8135") {   //지배룬
            document.querySelector('.Domination_Hunter_RavenousHunter_A').style.removeProperty('-webkit-filter');     //굶주린 사냥꾼
        } else if (PM_Rune1C == "8134") {
            document.querySelector('.Domination_Hunter_IngeniousHunter_A').style.removeProperty('-webkit-filter');     //영리한 사냥꾼
        } else if (PM_Rune1C == "8105") {
            document.querySelector('.Domination_Hunter_RelentlessHunter_A').style.removeProperty('-webkit-filter');     //끈질긴 사냥꾼
        } else if (PM_Rune1C == "8106") {
            document.querySelector('.Domination_Hunter_UltimateHunter_A').style.removeProperty('-webkit-filter');     //궁극의 사냥꾼
        } else if (PM_Rune1C == "8347") {   //영감룬
            document.querySelector('.Inspiration_Beyond_CosmicInsight_A').style.removeProperty('-webkit-filter');     //우주적 통찰력
        } else if (PM_Rune1C == "8410") {
            document.querySelector('.Inspiration_Beyond_ApproachVelocity_A').style.removeProperty('-webkit-filter');     //쾌속 접근
        } else if (PM_Rune1C == "8352") {
            document.querySelector('.Inspiration_Beyond_TimeWarpTonic_A').style.removeProperty('-webkit-filter');     //시간 왜곡 물약
        } else if (PM_Rune1C == "8014") {   //정밀룬
            document.querySelector('.Precision_Combat_CoupDeGrace_A').style.removeProperty('-webkit-filter');     //최후의 일격
        } else if (PM_Rune1C == "8017") {
            document.querySelector('.Precision_Combat_CutDown_A').style.removeProperty('-webkit-filter');     //체력차 극복
        } else if (PM_Rune1C == "8299") {
            document.querySelector('.Precision_Combat_LastStand_A').style.removeProperty('-webkit-filter');     //최후의 저항
        } else if (PM_Rune1C == "8451") {   //결의룬
            document.querySelector('.Resolve_Vitality_Overgrowth_A').style.removeProperty('-webkit-filter');     //과잉성장
        } else if (PM_Rune1C == "8453") {
            document.querySelector('.Resolve_Vitality_Revitalize_A').style.removeProperty('-webkit-filter');     //소생
        } else if (PM_Rune1C == "8242") {
            document.querySelector('.Resolve_Vitality_Unflinching_A').style.removeProperty('-webkit-filter');     //불굴의 의지
        } else if (PM_Rune1C == "8237") {   //마법룬
            document.querySelector('.Sorcery_Power_Scorch_A').style.removeProperty('-webkit-filter');     //주문 작열
        } else if (PM_Rune1C == "8232") {
            document.querySelector('.Sorcery_Power_Waterwalking_A').style.removeProperty('-webkit-filter');     //물 위를 걷는 자
        } else if (PM_Rune1C == "8236") {
            document.querySelector('.Sorcery_Power_GatheringStorm_A').style.removeProperty('-webkit-filter');     //폭풍의 결집
        }

        //Summary Runes
        if (SM_Rune1 == "8126" || SM_Rune1 == "8139" || SM_Rune1 == "8143" || SM_Rune1 == "8136" || SM_Rune1 == "8120" || SM_Rune1 == "8138" || SM_Rune1 == "8135" || SM_Rune1 == "8134" || SM_Rune1 == "8105" || SM_Rune1 == "8106") {      //Domination (지배)8
            $('<div>').attr("class", "Domination_Malice_CheapShot_A").html("<img src='/resources/images/perk_images/Styles/Domination/Malice/CheapShot.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);
            $('<div>').attr("class", "Domination_Malice_TasteOfBlood_A").html("<img src='/resources/images/perk_images/Styles/Domination/Malice/TasteOfBlood.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);
            $('<div>').attr("class", "Domination_Malice_SuddenImpact_A").html("<img src='/resources/images/perk_images/Styles/Domination/Malice/SuddenImpact.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);

            $('<div>').attr("class", "Domination_Tracking_ZombieWard_A").html("<img src='/resources/images/perk_images/Styles/Domination/Tracking/ZombieWard.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);
            $('<div>').attr("class", "Domination_Tracking_GhostPoro_A").html("<img src='/resources/images/perk_images/Styles/Domination/Tracking/GhostPoro.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);
            $('<div>').attr("class", "Domination_Tracking_EyeballCollection_A").html("<img src='/resources/images/perk_images/Styles/Domination/Tracking/EyeballCollection.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);

            $('<div>').attr("class", "Domination_Hunter_RavenousHunter_A").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/RavenousHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
            $('<div>').attr("class", "Domination_Hunter_IngeniousHunter_A").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/IngeniousHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
            $('<div>').attr("class", "Domination_Hunter_RelentlessHunter_A").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/RelentlessHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
            $('<div>').attr("class", "Domination_Hunter_UltimateHunter_A").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/UltimateHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
        } else if (SM_Rune1 == "8306" || SM_Rune1 == "8304" || SM_Rune1 == "8313" || SM_Rune1 == "8321" || SM_Rune1 == "8316" || SM_Rune1 == "8345" || SM_Rune1 == "8347" || SM_Rune1 == "8410" || SM_Rune1 == "8352") {        //Inspiration (영감)
            $('<div>').attr("class", "Inspiration_Contraption_HextechFlashtraption_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Contraption/HextechFlashtraption.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);
            $('<div>').attr("class", "Inspiration_Contraption_MagicalFootwear_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Contraption/MagicalFootwear.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);
            $('<div>').attr("class", "Inspiration_Contraption_PerfectTiming_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Contraption/PerfectTiming.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);

            $('<div>').attr("class", "Inspiration_Tomorrow_FuturesMarket_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Tomorrow/FuturesMarket.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);
            $('<div>').attr("class", "Inspiration_Tomorrow_MinionDematerializer_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Tomorrow/MinionDematerializer.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);
            $('<div>').attr("class", "Inspiration_Tomorrow_BiscuitDelivery_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Tomorrow/BiscuitDelivery.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);

            $('<div>').attr("class", "Inspiration_Beyond_CosmicInsight_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Beyond/CosmicInsight.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
            $('<div>').attr("class", "Inspiration_Beyond_ApproachVelocity_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Beyond/ApproachVelocity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
            $('<div>').attr("class", "Inspiration_Beyond_TimeWarpTonic_A").html("<img src='/resources/images/perk_images/Styles/Inspiration/Beyond/TimeWarpTonic.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
        } else if (SM_Rune1 == "9101" || SM_Rune1 == "9111" || SM_Rune1 == "8009" || SM_Rune1 == "9104" || SM_Rune1 == "9105" || SM_Rune1 == "9103" || SM_Rune1 == "8014" || SM_Rune1 == "8017" || SM_Rune1 == "8299") {        //Precision (정밀)
            $('<div>').attr("class", "Precision_Heroism_Overheal_A").html("<img src='/resources/images/perk_images/Styles/Precision/Heroism/Overheal.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);
            $('<div>').attr("class", "Precision_Heroism_Triumph_A").html("<img src='/resources/images/perk_images/Styles/Precision/Heroism/Triumph.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);
            $('<div>').attr("class", "Precision_Heroism_PresenceOfMind_A").html("<img src='/resources/images/perk_images/Styles/Precision/Heroism/PresenceOfMind.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);

            $('<div>').attr("class", "Precision_Legend_LegendAlacrity_A").html("<img src='/resources/images/perk_images/Styles/Precision/Legend/LegendAlacrity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);
            $('<div>').attr("class", "Precision_Legend_LegendTenacity_A").html("<img src='/resources/images/perk_images/Styles/Precision/Legend/LegendTenacity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);
            $('<div>').attr("class", "Precision_Legend_LegendBloodline_A").html("<img src='/resources/images/perk_images/Styles/Precision/Legend/LegendBloodline.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);

            $('<div>').attr("class", "Precision_Combat_CoupDeGrace_A").html("<img src='/resources/images/perk_images/Styles/Precision/Combat/CoupDeGrace.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
            $('<div>').attr("class", "Precision_Combat_CutDown_A").html("<img src='/resources/images/perk_images/Styles/Precision/Combat/CutDown.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
            $('<div>').attr("class", "Precision_Combat_LastStand_A").html("<img src='/resources/images/perk_images/Styles/Precision/Combat/LastStand.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
        } else if (SM_Rune1 == "8446" || SM_Rune1 == "8463" || SM_Rune1 == "8401" || SM_Rune1 == "8429" || SM_Rune1 == "8444" || SM_Rune1 == "8473" || SM_Rune1 == "8451" || SM_Rune1 == "8453" || SM_Rune1 == "8242") {        //Resolve (결의)
            $('<div>').attr("class", "Resolve_Strength_Demolish_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Strength/Demolish.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);
            $('<div>').attr("class", "Resolve_Strength_FontOfLife_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Strength/FontOfLife.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);
            $('<div>').attr("class", "Resolve_Strength_ShieldBash_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Strength/ShieldBash.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);

            $('<div>').attr("class", "Resolve_Resistance_Conditioning_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Resistance/Conditioning.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);
            $('<div>').attr("class", "Resolve_Resistance_SecondWind_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Resistance/SecondWind.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);
            $('<div>').attr("class", "Resolve_Resistance_BonePlating_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Resistance/BonePlating.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);

            $('<div>').attr("class", "Resolve_Vitality_Overgrowth_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Vitality/Overgrowth.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
            $('<div>').attr("class", "Resolve_Vitality_Revitalize_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Vitality/Revitalize.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
            $('<div>').attr("class", "Resolve_Vitality_Unflinching_A").html("<img src='/resources/images/perk_images/Styles/Resolve/Vitality/Unflinching.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
        } else if (SM_Rune1 == "8224" || SM_Rune1 == "8226" || SM_Rune1 == "8275" || SM_Rune1 == "8210" || SM_Rune1 == "8234" || SM_Rune1 == "8233" || SM_Rune1 == "8237" || SM_Rune1 == "8232" || SM_Rune1 == "8236") {      //Sorcery (마법)
            $('<div>').attr("class", "Sorcery_Artefact_NullifyingOrb_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Artefact/NullifyingOrb.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);
            $('<div>').attr("class", "Sorcery_Artefact_ManaflowBand_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Artefact/ManaflowBand.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);
            $('<div>').attr("class", "Sorcery_Artefact_NimbusCloak_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Artefact/NimbusCloak.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One1);

            $('<div>').attr("class", "Sorcery_Excellence_Transcendence_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Excellence/Transcendence.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);
            $('<div>').attr("class", "Sorcery_Excellence_Celerity_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Excellence/Celerity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);
            $('<div>').attr("class", "Sorcery_Excellence_AbsoluteFocus_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Excellence/AbsoluteFocus.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two1);

            $('<div>').attr("class", "Sorcery_Power_Scorch_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Power/Scorch.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
            $('<div>').attr("class", "Sorcery_Power_Waterwalking_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Power/Waterwalking.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
            $('<div>').attr("class", "Sorcery_Power_GatheringStorm_A").html("<img src='/resources/images/perk_images/Styles/Sorcery/Power/GatheringStorm.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three1);
        }

        //Summary 첫번째 룬 선택란
        if (SM_Rune1 == "8126") {   //지배룬
            document.querySelector('.Domination_Malice_CheapShot_A').style.removeProperty('-webkit-filter');     //비열한 한 방
        } else if (SM_Rune1 == "8139") {
            document.querySelector('.Domination_Malice_TasteOfBlood_A').style.removeProperty('-webkit-filter');     //피의 맛
        } else if (SM_Rune1 == "8143") {
            document.querySelector('.Domination_Malice_SuddenImpact_A').style.removeProperty('-webkit-filter');     //돌발일격
        } else if (SM_Rune1 == "8136") {
            document.querySelector('.Domination_Tracking_ZombieWard_A').style.removeProperty('-webkit-filter');     //좀비 와드
        } else if (SM_Rune1 == "8120") {
            document.querySelector('.Domination_Tracking_GhostPoro_A').style.removeProperty('-webkit-filter');     //유령 포로
        } else if (SM_Rune1 == "8138") {
            document.querySelector('.Domination_Tracking_EyeballCollection_A').style.removeProperty('-webkit-filter');     //사냥의 증표
        } else if (SM_Rune1 == "8135") {
            document.querySelector('.Domination_Hunter_RavenousHunter_A').style.removeProperty('-webkit-filter');     //굶주린 사냥꾼
        } else if (SM_Rune1 == "8134") {
            document.querySelector('.Domination_Hunter_IngeniousHunter_A').style.removeProperty('-webkit-filter');     //영리한 사냥꾼
        } else if (SM_Rune1 == "8105") {
            document.querySelector('.Domination_Hunter_RelentlessHunter_A').style.removeProperty('-webkit-filter');     //끈질긴 사냥꾼
        } else if (SM_Rune1 == "8106") {
            document.querySelector('.Domination_Hunter_UltimateHunter_A').style.removeProperty('-webkit-filter');     //궁극의 사냥꾼
        } else if (SM_Rune1 == "8306") {    //영감룬
            document.querySelector('.Inspiration_Contraption_HextechFlashtraption_A').style.removeProperty('-webkit-filter');     //마법공학 점멸기
        } else if (SM_Rune1 == "8304") {
            document.querySelector('.Inspiration_Contraption_MagicalFootwear_A').style.removeProperty('-webkit-filter');     //마법의 신발
        } else if (SM_Rune1 == "8313") {
            document.querySelector('.Inspiration_Contraption_PerfectTiming_A').style.removeProperty('-webkit-filter');     //완벽한 타이밍
        } else if (SM_Rune1 == "8321") {
            document.querySelector('.Inspiration_Tomorrow_FuturesMarket_A').style.removeProperty('-webkit-filter');     //외상
        } else if (SM_Rune1 == "8316") {
            document.querySelector('.Inspiration_Tomorrow_MinionDematerializer_A').style.removeProperty('-webkit-filter');     //미니언 해체분석기
        } else if (SM_Rune1 == "8345") {
            document.querySelector('.Inspiration_Tomorrow_BiscuitDelivery_A').style.removeProperty('-webkit-filter');     //비스킷 배달
        } else if (SM_Rune1 == "8347") {
            document.querySelector('.Inspiration_Beyond_CosmicInsight_A').style.removeProperty('-webkit-filter');     //우주적 통찰력
        } else if (SM_Rune1 == "8410") {
            document.querySelector('.Inspiration_Beyond_ApproachVelocity_A').style.removeProperty('-webkit-filter');     //쾌속 접근
        } else if (SM_Rune1 == "8352") {
            document.querySelector('.Inspiration_Beyond_TimeWarpTonic_A').style.removeProperty('-webkit-filter');     //시간 왜곡 물약
        } else if (SM_Rune1 == "9101") {    //정밀룬
            document.querySelector('.Precision_Heroism_Overheal_A').style.removeProperty('-webkit-filter');     //과다치유
        } else if (SM_Rune1 == "9111") {
            document.querySelector('.Precision_Heroism_Triumph_A').style.removeProperty('-webkit-filter');     //승전보
        } else if (SM_Rune1 == "8009") {
            document.querySelector('.Precision_Heroism_PresenceOfMind_A').style.removeProperty('-webkit-filter');     //침착
        } else if (SM_Rune1 == "9104") {
            document.querySelector('.Precision_Legend_LegendAlacrity_A').style.removeProperty('-webkit-filter');     //전설 : 민첩함
        } else if (SM_Rune1 == "9105") {
            document.querySelector('.Precision_Legend_LegendTenacity_A').style.removeProperty('-webkit-filter');     //전설 : 강인함
        } else if (SM_Rune1 == "9103") {
            document.querySelector('.Precision_Legend_LegendBloodline_A').style.removeProperty('-webkit-filter');     //전설 : 핏빛 길
        } else if (SM_Rune1 == "8014") {
            document.querySelector('.Precision_Combat_CoupDeGrace_A').style.removeProperty('-webkit-filter');     //최후의 일격
        } else if (SM_Rune1 == "8017") {
            document.querySelector('.Precision_Combat_CutDown_A').style.removeProperty('-webkit-filter');     //체력차 극복
        } else if (SM_Rune1 == "8299") {
            document.querySelector('.Precision_Combat_LastStand_A').style.removeProperty('-webkit-filter');     //최후의 저항
        } else if (SM_Rune1 == "8446") {    //결의룬
            document.querySelector('.Resolve_Strength_Demolish_A').style.removeProperty('-webkit-filter');     //철거
        } else if (SM_Rune1 == "8463") {
            document.querySelector('.Resolve_Strength_FontOfLife_A').style.removeProperty('-webkit-filter');     //생명의 샘
        } else if (SM_Rune1 == "8401") {
            document.querySelector('.Resolve_Strength_ShieldBash_A').style.removeProperty('-webkit-filter');     //보호막 강타
        } else if (SM_Rune1 == "8429") {
            document.querySelector('.Resolve_Resistance_Conditioning_A').style.removeProperty('-webkit-filter');     //사전 준비
        } else if (SM_Rune1 == "8444") {
            document.querySelector('.Resolve_Resistance_SecondWind_A').style.removeProperty('-webkit-filter');     //재생의 바람
        } else if (SM_Rune1 == "8473") {
            document.querySelector('.Resolve_Resistance_BonePlating_A').style.removeProperty('-webkit-filter');     //뼈 방패
        } else if (SM_Rune1 == "8451") {
            document.querySelector('.Resolve_Vitality_Overgrowth_A').style.removeProperty('-webkit-filter');     //과잉성장
        } else if (SM_Rune1 == "8453") {
            document.querySelector('.Resolve_Vitality_Revitalize_A').style.removeProperty('-webkit-filter');     //소생
        } else if (SM_Rune1 == "8242") {
            document.querySelector('.Resolve_Vitality_Unflinching_A').style.removeProperty('-webkit-filter');     //불굴의 의지
        } else if (SM_Rune1 == "8224") {    //마법룬
            document.querySelector('.Sorcery_Artefact_NullifyingOrb_A').style.removeProperty('-webkit-filter');     //무효화 구체
        } else if (SM_Rune1 == "8226") {
            document.querySelector('.Sorcery_Artefact_ManaflowBand_A').style.removeProperty('-webkit-filter');     //마나순환 팔찌
        } else if (SM_Rune1 == "8275") {
            document.querySelector('.Sorcery_Artefact_NimbusCloak_A').style.removeProperty('-webkit-filter');     //빛의 망토
        } else if (SM_Rune1 == "8210") {
            document.querySelector('.Sorcery_Excellence_Transcendence_A').style.removeProperty('-webkit-filter');     //깨달음
        } else if (SM_Rune1 == "8234") {
            document.querySelector('.Sorcery_Excellence_Celerity_A').style.removeProperty('-webkit-filter');     //기민함
        } else if (SM_Rune1 == "8233") {
            document.querySelector('.Sorcery_Excellence_AbsoluteFocus_A').style.removeProperty('-webkit-filter');     //절대 집중
        } else if (SM_Rune1 == "8237") {
            document.querySelector('.Sorcery_Power_Scorch_A').style.removeProperty('-webkit-filter');     //주문 작열
        } else if (SM_Rune1 == "8232") {
            document.querySelector('.Sorcery_Power_Waterwalking_A').style.removeProperty('-webkit-filter');     //물 위를 걷는 자
        } else if (SM_Rune1 == "8236") {
            document.querySelector('.Sorcery_Power_GatheringStorm_A').style.removeProperty('-webkit-filter');     //폭풍의 결집
        }

        //Summary 두번째 룬 선택란
        if (SM_Rune1A == "8126") {   //지배룬
            document.querySelector('.Domination_Malice_CheapShot_A').style.removeProperty('-webkit-filter');     //비열한 한 방
        } else if (SM_Rune1A == "8139") {
            document.querySelector('.Domination_Malice_TasteOfBlood_A').style.removeProperty('-webkit-filter');     //피의 맛
        } else if (SM_Rune1A == "8143") {
            document.querySelector('.Domination_Malice_SuddenImpact_A').style.removeProperty('-webkit-filter');     //돌발일격
        } else if (SM_Rune1A == "8136") {
            document.querySelector('.Domination_Tracking_ZombieWard_A').style.removeProperty('-webkit-filter');     //좀비 와드
        } else if (SM_Rune1A == "8120") {
            document.querySelector('.Domination_Tracking_GhostPoro_A').style.removeProperty('-webkit-filter');     //유령 포로
        } else if (SM_Rune1A == "8138") {
            document.querySelector('.Domination_Tracking_EyeballCollection_A').style.removeProperty('-webkit-filter');     //사냥의 증표
        } else if (SM_Rune1A == "8135") {
            document.querySelector('.Domination_Hunter_RavenousHunter_A').style.removeProperty('-webkit-filter');     //굶주린 사냥꾼
        } else if (SM_Rune1A == "8134") {
            document.querySelector('.Domination_Hunter_IngeniousHunter_A').style.removeProperty('-webkit-filter');     //영리한 사냥꾼
        } else if (SM_Rune1A == "8105") {
            document.querySelector('.Domination_Hunter_RelentlessHunter_A').style.removeProperty('-webkit-filter');     //끈질긴 사냥꾼
        } else if (SM_Rune1A == "8106") {
            document.querySelector('.Domination_Hunter_UltimateHunter_A').style.removeProperty('-webkit-filter');     //궁극의 사냥꾼
        } else if (SM_Rune1A == "8306") {    //영감룬
            document.querySelector('.Inspiration_Contraption_HextechFlashtraption_A').style.removeProperty('-webkit-filter');     //마법공학 점멸기
        } else if (SM_Rune1A == "8304") {
            document.querySelector('.Inspiration_Contraption_MagicalFootwear_A').style.removeProperty('-webkit-filter');     //마법의 신발
        } else if (SM_Rune1A == "8313") {
            document.querySelector('.Inspiration_Contraption_PerfectTiming_A').style.removeProperty('-webkit-filter');     //완벽한 타이밍
        } else if (SM_Rune1A == "8321") {
            document.querySelector('.Inspiration_Tomorrow_FuturesMarket_A').style.removeProperty('-webkit-filter');     //외상
        } else if (SM_Rune1A == "8316") {
            document.querySelector('.Inspiration_Tomorrow_MinionDematerializer_A').style.removeProperty('-webkit-filter');     //미니언 해체분석기
        } else if (SM_Rune1A == "8345") {
            document.querySelector('.Inspiration_Tomorrow_BiscuitDelivery_A').style.removeProperty('-webkit-filter');     //비스킷 배달
        } else if (SM_Rune1A == "8347") {
            document.querySelector('.Inspiration_Beyond_CosmicInsight_A').style.removeProperty('-webkit-filter');     //우주적 통찰력
        } else if (SM_Rune1A == "8410") {
            document.querySelector('.Inspiration_Beyond_ApproachVelocity_A').style.removeProperty('-webkit-filter');     //쾌속 접근
        } else if (SM_Rune1A == "8352") {
            document.querySelector('.Inspiration_Beyond_TimeWarpTonic_A').style.removeProperty('-webkit-filter');     //시간 왜곡 물약
        } else if (SM_Rune1A == "9101") {    //정밀룬
            document.querySelector('.Precision_Heroism_Overheal_A').style.removeProperty('-webkit-filter');     //과다치유
        } else if (SM_Rune1A == "9111") {
            document.querySelector('.Precision_Heroism_Triumph_A').style.removeProperty('-webkit-filter');     //승전보
        } else if (SM_Rune1A == "8009") {
            document.querySelector('.Precision_Heroism_PresenceOfMind_A').style.removeProperty('-webkit-filter');     //침착
        } else if (SM_Rune1A == "9104") {
            document.querySelector('.Precision_Legend_LegendAlacrity_A').style.removeProperty('-webkit-filter');     //전설 : 민첩함
        } else if (SM_Rune1A == "9105") {
            document.querySelector('.Precision_Legend_LegendTenacity_A').style.removeProperty('-webkit-filter');     //전설 : 강인함
        } else if (SM_Rune1A == "9103") {
            document.querySelector('.Precision_Legend_LegendBloodline_A').style.removeProperty('-webkit-filter');     //전설 : 핏빛 길
        } else if (SM_Rune1A == "8014") {
            document.querySelector('.Precision_Combat_CoupDeGrace_A').style.removeProperty('-webkit-filter');     //최후의 일격
        } else if (SM_Rune1A == "8017") {
            document.querySelector('.Precision_Combat_CutDown_A').style.removeProperty('-webkit-filter');     //체력차 극복
        } else if (SM_Rune1A == "8299") {
            document.querySelector('.Precision_Combat_LastStand_A').style.removeProperty('-webkit-filter');     //최후의 저항
        } else if (SM_Rune1A == "8446") {    //결의룬
            document.querySelector('.Resolve_Strength_Demolish_A').style.removeProperty('-webkit-filter');     //철거
        } else if (SM_Rune1A == "8463") {
            document.querySelector('.Resolve_Strength_FontOfLife_A').style.removeProperty('-webkit-filter');     //생명의 샘
        } else if (SM_Rune1A == "8401") {
            document.querySelector('.Resolve_Strength_ShieldBash_A').style.removeProperty('-webkit-filter');     //보호막 강타
        } else if (SM_Rune1A == "8429") {
            document.querySelector('.Resolve_Resistance_Conditioning_A').style.removeProperty('-webkit-filter');     //사전 준비
        } else if (SM_Rune1A == "8444") {
            document.querySelector('.Resolve_Resistance_SecondWind_A').style.removeProperty('-webkit-filter');     //재생의 바람
        } else if (SM_Rune1A == "8473") {
            document.querySelector('.Resolve_Resistance_BonePlating_A').style.removeProperty('-webkit-filter');     //뼈 방패
        } else if (SM_Rune1A == "8451") {
            document.querySelector('.Resolve_Vitality_Overgrowth_A').style.removeProperty('-webkit-filter');     //과잉성장
        } else if (SM_Rune1A == "8453") {
            document.querySelector('.Resolve_Vitality_Revitalize_A').style.removeProperty('-webkit-filter');     //소생
        } else if (SM_Rune1A == "8242") {
            document.querySelector('.Resolve_Vitality_Unflinching_A').style.removeProperty('-webkit-filter');     //불굴의 의지
        } else if (SM_Rune1A == "8224") {    //마법룬
            document.querySelector('.Sorcery_Artefact_NullifyingOrb_A').style.removeProperty('-webkit-filter');     //무효화 구체
        } else if (SM_Rune1A == "8226") {
            document.querySelector('.Sorcery_Artefact_ManaflowBand_A').style.removeProperty('-webkit-filter');     //마나순환 팔찌
        } else if (SM_Rune1A == "8275") {
            document.querySelector('.Sorcery_Artefact_NimbusCloak_A').style.removeProperty('-webkit-filter');     //빛의 망토
        } else if (SM_Rune1A == "8210") {
            document.querySelector('.Sorcery_Excellence_Transcendence_A').style.removeProperty('-webkit-filter');     //깨달음
        } else if (SM_Rune1A == "8234") {
            document.querySelector('.Sorcery_Excellence_Celerity_A').style.removeProperty('-webkit-filter');     //기민함
        } else if (SM_Rune1A == "8233") {
            document.querySelector('.Sorcery_Excellence_AbsoluteFocus_A').style.removeProperty('-webkit-filter');     //절대 집중
        } else if (SM_Rune1A == "8237") {
            document.querySelector('.Sorcery_Power_Scorch_A').style.removeProperty('-webkit-filter');     //주문 작열
        } else if (SM_Rune1A == "8232") {
            document.querySelector('.Sorcery_Power_Waterwalking_A').style.removeProperty('-webkit-filter');     //물 위를 걷는 자
        } else if (SM_Rune1A == "8236") {
            document.querySelector('.Sorcery_Power_GatheringStorm_A').style.removeProperty('-webkit-filter');     //폭풍의 결집
        }

        //Stats Mods
        $('<div>').attr("class", "Stats_5008_A").html("<img src='/resources/images/perk_images/Styles/Stats/5008.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_One1);
        $('<div>').attr("class", "Stats_5005_A").html("<img src='/resources/images/perk_images/Styles/Stats/5005.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_One1);
        $('<div>').attr("class", "Stats_5007_A").html("<img src='/resources/images/perk_images/Styles/Stats/5007.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_One1);

        $('<div>').attr("class", "Stats_5008_Aa").html("<img src='/resources/images/perk_images/Styles/Stats/5008.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_Two1);
        $('<div>').attr("class", "Stats_5002_A").html("<img src='/resources/images/perk_images/Styles/Stats/5002.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_Two1);
        $('<div>').attr("class", "Stats_5003_A").html("<img src='/resources/images/perk_images/Styles/Stats/5003.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_Two1);

        $('<div>').attr("class", "Stats_5001_A").html("<img src='/resources/images/perk_images/Styles/Stats/5001.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_Three1);
        $('<div>').attr("class", "Stats_5002_Aa").html("<img src='/resources/images/perk_images/Styles/Stats/5002.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_Three1);
        $('<div>').attr("class", "Stats_5003_Aa").html("<img src='/resources/images/perk_images/Styles/Stats/5003.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_Three1);

        //Stats 첫번째 룬 선택란
        if (Stats_Rune1 == "5001") {
            document.querySelector('.Stats_5001_A').style.removeProperty('-webkit-filter');     //체력
        } else if (Stats_Rune1 == "5002") {
            document.querySelector('.Stats_5002_Aa').style.removeProperty('-webkit-filter');     //방어력
        } else if (Stats_Rune1 == "5003") {
            document.querySelector('.Stats_5003_Aa').style.removeProperty('-webkit-filter');     //마법 저항력
        }

        //Stats 두번째 룬 선택란
        if (Stats_Rune1A == "5008") {
            document.querySelector('.Stats_5008_Aa').style.removeProperty('-webkit-filter');     //적응형 능력치
        } else if (Stats_Rune1A == "5002") {
            document.querySelector('.Stats_5002_A').style.removeProperty('-webkit-filter');     //방어력
        } else if (Stats_Rune1A == "5003") {
            document.querySelector('.Stats_5003_A').style.removeProperty('-webkit-filter');     //마법 저항력
        }

        //Stats 세번째 룬 선택란
        if (Stats_Rune1B == "5008") {
            document.querySelector('.Stats_5008_A').style.removeProperty('-webkit-filter');     //적응형 능력치
        } else if (Stats_Rune1B == "5005") {
            document.querySelector('.Stats_5005_A').style.removeProperty('-webkit-filter');     //공격속도
        } else if (Stats_Rune1B == "5007") {
            document.querySelector('.Stats_5007_A').style.removeProperty('-webkit-filter');     //스킬가속
        }

        $('<p>').attr("class", "Rune_Build_Rate").text(RB_Rate1+"% Win Rate").appendTo(RB_Div1);
        $('<p>').attr("class", "Rune_Build_cnt").text(RB_Cnt1+" Games").appendTo(RB_Div1);

        //룬 빌드2
        //Primay Runes
        if (PM_Rune2 == "8112" || PM_Rune2 == "8124" || PM_Rune2 == "8128" || PM_Rune2 == "9923") {     //Domination (지배)
            $('<div>').attr("class", "Domination_Keystone_Predator_B").html("<img src='/resources/images/perk_images/Styles/Domination/Keystone/Predator.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);
            $('<div>').attr("class", "Domination_Keystone_Electrocute_B").html("<img src='/resources/images/perk_images/Styles/Domination/Keystone/Electrocute.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);
            $('<div>').attr("class", "Domination_Keystone_DarkHarvest_B").html("<img src='/resources/images/perk_images/Styles/Domination/Keystone/DarkHarvest.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);
            $('<div>').attr("class", "Domination_Keystone_HailOfBlades_B").html("<img src='/resources/images/perk_images/Styles/Domination/Keystone/HailOfBlades.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);

            $('<div>').attr("class", "Domination_Malice_CheapShot_B").html("<img src='/resources/images/perk_images/Styles/Domination/Malice/CheapShot.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);
            $('<div>').attr("class", "Domination_Malice_TasteOfBlood_B").html("<img src='/resources/images/perk_images/Styles/Domination/Malice/TasteOfBlood.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);
            $('<div>').attr("class", "Domination_Malice_SuddenImpact_B").html("<img src='/resources/images/perk_images/Styles/Domination/Malice/SuddenImpact.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);

            $('<div>').attr("class", "Domination_Tracking_ZombieWard_B").html("<img src='/resources/images/perk_images/Styles/Domination/Tracking/ZombieWard.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);
            $('<div>').attr("class", "Domination_Tracking_GhostPoro_B").html("<img src='/resources/images/perk_images/Styles/Domination/Tracking/GhostPoro.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);
            $('<div>').attr("class", "Domination_Tracking_EyeballCollection_B").html("<img src='/resources/images/perk_images/Styles/Domination/Tracking/EyeballCollection.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);

            $('<div>').attr("class", "Domination_Hunter_RavenousHunter_B").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/RavenousHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
            $('<div>').attr("class", "Domination_Hunter_IngeniousHunter_B").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/IngeniousHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
            $('<div>').attr("class", "Domination_Hunter_RelentlessHunter_B").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/RelentlessHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
            $('<div>').attr("class", "Domination_Hunter_UltimateHunter_B").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/UltimateHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
        } else if (PM_Rune2 == "8351" || PM_Rune2 == "8360" || PM_Rune2 == "8369") {    //Inspiration (영감)
            $('<div>').attr("class", "Inspiration_Keystone_GlacialAugment_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Keystone/GlacialAugment.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);
            $('<div>').attr("class", "Inspiration_Keystone_UnsealedSpellbook_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Keystone/UnsealedSpellbook.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);
            $('<div>').attr("class", "Inspiration_Keystone_FirstStrike_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Keystone/FirstStrike.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);

            $('<div>').attr("class", "Inspiration_Contraption_HextechFlashtraption_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Contraption/HextechFlashtraption.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);
            $('<div>').attr("class", "Inspiration_Contraption_MagicalFootwear_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Contraption/MagicalFootwear.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);
            $('<div>').attr("class", "Inspiration_Contraption_PerfectTiming_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Contraption/PerfectTiming.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);

            $('<div>').attr("class", "Inspiration_Tomorrow_FuturesMarket_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Tomorrow/FuturesMarket.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);
            $('<div>').attr("class", "Inspiration_Tomorrow_MinionDematerializer_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Tomorrow/MinionDematerializer.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);
            $('<div>').attr("class", "Inspiration_Tomorrow_BiscuitDelivery_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Tomorrow/BiscuitDelivery.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);

            $('<div>').attr("class", "Inspiration_Beyond_CosmicInsight_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Beyond/CosmicInsight.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
            $('<div>').attr("class", "Inspiration_Beyond_ApproachVelocity_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Beyond/ApproachVelocity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
            $('<div>').attr("class", "Inspiration_Beyond_TimeWarpTonic_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Beyond/TimeWarpTonic.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
        } else if (PM_Rune2 == "8005" || PM_Rune2 == "8008" || PM_Rune2 == "8021" || PM_Rune2 == "8010") {    //Precision (정밀)
            $('<div>').attr("class", "Precision_Keystone_PressTheAttack_B").html("<img src='/resources/images/perk_images/Styles/Precision/Keystone/PressTheAttack.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);
            $('<div>').attr("class", "Precision_Keystone_LethalTempo_B").html("<img src='/resources/images/perk_images/Styles/Precision/Keystone/LethalTempo.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);
            $('<div>').attr("class", "Precision_Keystone_FleetFootwork_B").html("<img src='/resources/images/perk_images/Styles/Precision/Keystone/FleetFootwork.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);
            $('<div>').attr("class", "Precision_Keystone_Conqueror_B").html("<img src='/resources/images/perk_images/Styles/Precision/Keystone/Conqueror.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);

            $('<div>').attr("class", "Precision_Heroism_Overheal_B").html("<img src='/resources/images/perk_images/Styles/Precision/Heroism/Overheal.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);
            $('<div>').attr("class", "Precision_Heroism_Triumph_B").html("<img src='/resources/images/perk_images/Styles/Precision/Heroism/Triumph.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);
            $('<div>').attr("class", "Precision_Heroism_PresenceOfMind_B").html("<img src='/resources/images/perk_images/Styles/Precision/Heroism/PresenceOfMind.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);

            $('<div>').attr("class", "Precision_Legend_LegendAlacrity_B").html("<img src='/resources/images/perk_images/Styles/Precision/Legend/LegendAlacrity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);
            $('<div>').attr("class", "Precision_Legend_LegendTenacity_B").html("<img src='/resources/images/perk_images/Styles/Precision/Legend/LegendTenacity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);
            $('<div>').attr("class", "Precision_Legend_LegendBloodline_B").html("<img src='/resources/images/perk_images/Styles/Precision/Legend/LegendBloodline.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);

            $('<div>').attr("class", "Precision_Combat_CoupDeGrace_B").html("<img src='/resources/images/perk_images/Styles/Precision/Combat/CoupDeGrace.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
            $('<div>').attr("class", "Precision_Combat_CutDown_B").html("<img src='/resources/images/perk_images/Styles/Precision/Combat/CutDown.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
            $('<div>').attr("class", "Precision_Combat_LastStand_B").html("<img src='/resources/images/perk_images/Styles/Precision/Combat/LastStand.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
        } else if (PM_Rune2 == "8437" || PM_Rune2 == "8439" || PM_Rune2 == "8465") {      //Resolve (결의)
            $('<div>').attr("class", "Resolve_Keystone_GraspOfTheUndying_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Keystone/GraspOfTheUndying.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);
            $('<div>').attr("class", "Resolve_Keystone_Aftershock_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Keystone/Aftershock.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);
            $('<div>').attr("class", "Resolve_Keystone_Guardian_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Keystone/Guardian.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);

            $('<div>').attr("class", "Resolve_Strength_Demolish_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Strength/Demolish.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);
            $('<div>').attr("class", "Resolve_Strength_FontOfLife_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Strength/FontOfLife.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);
            $('<div>').attr("class", "Resolve_Strength_ShieldBash_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Strength/ShieldBash.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);

            $('<div>').attr("class", "Resolve_Resistance_Conditioning_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Resistance/Conditioning.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);
            $('<div>').attr("class", "Resolve_Resistance_SecondWind_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Resistance/SecondWind.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);
            $('<div>').attr("class", "Resolve_Resistance_BonePlating_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Resistance/BonePlating.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);

            $('<div>').attr("class", "Resolve_Vitality_Overgrowth_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Vitality/Overgrowth.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
            $('<div>').attr("class", "Resolve_Vitality_Revitalize_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Vitality/Revitalize.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
            $('<div>').attr("class", "Resolve_Vitality_Unflinching_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Vitality/Unflinching.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
        } else if (PM_Rune2 == "8214" || PM_Rune2 == "8229" || PM_Rune2 == "8230") {        //Sorcery (마법)
            $('<div>').attr("class", "Sorcery_Keystone_SummonAery_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Keystone/SummonAery.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);
            $('<div>').attr("class", "Sorcery_Keystone_ArcaneComet_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Keystone/ArcaneComet.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);
            $('<div>').attr("class", "Sorcery_Keystone_PhaseRush_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Keystone/PhaseRush.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_One2);

            $('<div>').attr("class", "Sorcery_Artefact_NullifyingOrb_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Artefact/NullifyingOrb.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);
            $('<div>').attr("class", "Sorcery_Artefact_ManaflowBand_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Artefact/ManaflowBand.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);
            $('<div>').attr("class", "Sorcery_Artefact_NimbusCloak_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Artefact/NimbusCloak.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Two2);

            $('<div>').attr("class", "Sorcery_Excellence_Transcendence_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Excellence/Transcendence.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);
            $('<div>').attr("class", "Sorcery_Excellence_Celerity_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Excellence/Celerity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);
            $('<div>').attr("class", "Sorcery_Excellence_AbsoluteFocus_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Excellence/AbsoluteFocus.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Three2);

            $('<div>').attr("class", "Sorcery_Power_Scorch_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Power/Scorch.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
            $('<div>').attr("class", "Sorcery_Power_Waterwalking_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Power/Waterwalking.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
            $('<div>').attr("class", "Sorcery_Power_GatheringStorm_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Power/GatheringStorm.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RB_Four2);
        }

        //왕룬 선택란
        if (PM_Rune2 == "8124") {   //지배 왕룬
            document.querySelector('.Domination_Keystone_Predator_B').style.removeProperty('-webkit-filter');     //포식자
        } else if (PM_Rune2 == "8112") {
            document.querySelector('.Domination_Keystone_Electrocute_B').style.removeProperty('-webkit-filter');      //감전
        } else if (PM_Rune2 == "8128") {
            document.querySelector('.Domination_Keystone_DarkHarvest_B').style.removeProperty('-webkit-filter');      //수확자
        } else if (PM_Rune2 == "9923") {
            document.querySelector('.Domination_Keystone_HailOfBlades_B').style.removeProperty('-webkit-filter');     //칼날비
        } else if (PM_Rune2 == "8351") {    //영감 왕룬
            document.querySelector('.Inspiration_Keystone_GlacialAugment_B').style.removeProperty('-webkit-filter');      //빙결강화
        } else if (PM_Rune2 == "8360") {
            document.querySelector('.Inspiration_Keystone_UnsealedSpellbook_B').style.removeProperty('-webkit-filter');       //봉인풀린 주문서
        } else if (PM_Rune2 == "8369") {
            document.querySelector('.Inspiration_Keystone_FirstStrike_B').style.removeProperty('-webkit-filter');     //선제공격
        } else if (PM_Rune2 == "8005") {    //정밀 왕룬
            document.querySelector('.Precision_Keystone_PressTheAttack_B').style.removeProperty('-webkit-filter');        //집중 공격
        } else if (PM_Rune2 == "8008") {
            document.querySelector('.Precision_Keystone_LethalTempo_B').style.removeProperty('-webkit-filter');       //치명적인 속도
        } else if (PM_Rune2 == "8021") {
            document.querySelector('.Precision_Keystone_FleetFootwork_B').style.removeProperty('-webkit-filter');     //기민한 발놀림
        } else if (PM_Rune2 == "8010") {
            document.querySelector('.Precision_Keystone_Conqueror_B').style.removeProperty('-webkit-filter');     //정복자
        } else if (PM_Rune2 == "8437") {    //결의 왕룬
            document.querySelector('.Resolve_Keystone_GraspOfTheUndying_B').style.removeProperty('-webkit-filter');       //착취의 손아귀
        } else if (PM_Rune2 == "8439") {
            document.querySelector('.Resolve_Keystone_Aftershock_B').style.removeProperty('-webkit-filter');      //여진
        } else if (PM_Rune2 == "8465") {
            document.querySelector('.Resolve_Keystone_Guardian_B').style.removeProperty('-webkit-filter');        //수호자
        } else if (PM_Rune2 == "8214") {    //마법 왕룬
            document.querySelector('.Sorcery_Keystone_SummonAery_B').style.removeProperty('-webkit-filter');      //콩콩이 소환
        } else if (PM_Rune2 == "8229") {
            document.querySelector('.Sorcery_Keystone_ArcaneComet_B').style.removeProperty('-webkit-filter');     //신비로운 유성
        } else if (PM_Rune2 == "8230") {
            document.querySelector('.Sorcery_Keystone_PhaseRush_B').style.removeProperty('-webkit-filter');       //난입
        }

        //두번째 룬 선택란
        if (PM_Rune2A == "8126") {   //지배룬
            document.querySelector('.Domination_Malice_CheapShot_B').style.removeProperty('-webkit-filter');     //비열한 한 방
        } else if (PM_Rune2A == "8139") {
            document.querySelector('.Domination_Malice_TasteOfBlood_B').style.removeProperty('-webkit-filter');     //피의 맛
        } else if (PM_Rune2A == "8143") {
            document.querySelector('.Domination_Malice_SuddenImpact_B').style.removeProperty('-webkit-filter');     //돌발일격
        } else if (PM_Rune2A == "8306") {   //영감룬
            document.querySelector('.Inspiration_Contraption_HextechFlashtraption_B').style.removeProperty('-webkit-filter');     //마법공학 점멸기
        } else if (PM_Rune2A == "8304") {
            document.querySelector('.Inspiration_Contraption_MagicalFootwear_B').style.removeProperty('-webkit-filter');     //마법의 신발
        } else if (PM_Rune2A == "8313") {
            document.querySelector('.Inspiration_Contraption_PerfectTiming_B').style.removeProperty('-webkit-filter');     //완벽한 타이밍
        } else if (PM_Rune2A == "9101") {   //정밀룬
            document.querySelector('.Precision_Heroism_Overheal_B').style.removeProperty('-webkit-filter');     //과다치유
        } else if (PM_Rune2A == "9111") {
            document.querySelector('.Precision_Heroism_Triumph_B').style.removeProperty('-webkit-filter');     //승전보
        } else if (PM_Rune2A == "8009") {
            document.querySelector('.Precision_Heroism_PresenceOfMind_B').style.removeProperty('-webkit-filter');     //침착
        } else if (PM_Rune2A == "8446") {   //결의룬
            document.querySelector('.Resolve_Strength_Demolish_B').style.removeProperty('-webkit-filter');     //철거
        } else if (PM_Rune2A == "8463") {
            document.querySelector('.Resolve_Strength_FontOfLife_B').style.removeProperty('-webkit-filter');     //생명의 샘
        } else if (PM_Rune2A == "8401") {
            document.querySelector('.Resolve_Strength_ShieldBash_B').style.removeProperty('-webkit-filter');     //보호막 강타
        } else if (PM_Rune2A == "8224") {   //마법룬
            document.querySelector('.Sorcery_Artefact_NullifyingOrb_B').style.removeProperty('-webkit-filter');     //무효화 구체
        } else if (PM_Rune2A == "8226") {
            document.querySelector('.Sorcery_Artefact_ManaflowBand_B').style.removeProperty('-webkit-filter');     //마나순환 팔찌
        } else if (PM_Rune2A == "8275") {
            document.querySelector('.Sorcery_Artefact_NimbusCloak_B').style.removeProperty('-webkit-filter');     //빛의 망토
        }

        //세번째 룬 선택란
        if (PM_Rune2B == "8136") {   //지배룬
            document.querySelector('.Domination_Tracking_ZombieWard_B').style.removeProperty('-webkit-filter');     //좀비 와드
        } else if (PM_Rune2B == "8120") {
            document.querySelector('.Domination_Tracking_GhostPoro_B').style.removeProperty('-webkit-filter');     //유령 포로
        } else if (PM_Rune2B == "8138") {
            document.querySelector('.Domination_Tracking_EyeballCollection_B').style.removeProperty('-webkit-filter');     //사냥의 증표
        } else if (PM_Rune2B == "8321") {   //영감룬
            document.querySelector('.Inspiration_Tomorrow_FuturesMarket_B').style.removeProperty('-webkit-filter');     //외상
        } else if (PM_Rune2B == "8316") {
            document.querySelector('.Inspiration_Tomorrow_MinionDematerializer_B').style.removeProperty('-webkit-filter');     //미니언 해체분석기
        } else if (PM_Rune2B == "8345") {
            document.querySelector('.Inspiration_Tomorrow_BiscuitDelivery_B').style.removeProperty('-webkit-filter');     //비스킷 배달
        } else if (PM_Rune2B == "9104") {   //정밀룬
            document.querySelector('.Precision_Legend_LegendAlacrity_B').style.removeProperty('-webkit-filter');     //전설 : 민첩함
        } else if (PM_Rune2B == "9105") {
            document.querySelector('.Precision_Legend_LegendTenacity_B').style.removeProperty('-webkit-filter');     //전설 : 강인함
        } else if (PM_Rune2B == "9103") {
            document.querySelector('.Precision_Legend_LegendBloodline_B').style.removeProperty('-webkit-filter');     //전설 : 핏빛 길
        } else if (PM_Rune2B == "8429") {   //결의룬
            document.querySelector('.Resolve_Resistance_Conditioning_B').style.removeProperty('-webkit-filter');     //사전 준비
        } else if (PM_Rune2B == "8444") {
            document.querySelector('.Resolve_Resistance_SecondWind_B').style.removeProperty('-webkit-filter');     //재생의 바람
        } else if (PM_Rune2B == "8473") {
            document.querySelector('.Resolve_Resistance_BonePlating_B').style.removeProperty('-webkit-filter');     //뼈 방패
        } else if (PM_Rune2B == "8210") {   //마법룬
            document.querySelector('.Sorcery_Excellence_Transcendence_B').style.removeProperty('-webkit-filter');     //깨달음
        } else if (PM_Rune2B == "8234") {
            document.querySelector('.Sorcery_Excellence_Celerity_B').style.removeProperty('-webkit-filter');     //기민함
        } else if (PM_Rune2B == "8233") {
            document.querySelector('.Sorcery_Excellence_AbsoluteFocus_B').style.removeProperty('-webkit-filter');     //절대 집중
        }

        //네번째 룬 선택란
        if (PM_Rune2C == "8135") {   //지배룬
            document.querySelector('.Domination_Hunter_RavenousHunter_B').style.removeProperty('-webkit-filter');     //굶주린 사냥꾼
        } else if (PM_Rune2C == "8134") {
            document.querySelector('.Domination_Hunter_IngeniousHunter_B').style.removeProperty('-webkit-filter');     //영리한 사냥꾼
        } else if (PM_Rune2C == "8105") {
            document.querySelector('.Domination_Hunter_RelentlessHunter_B').style.removeProperty('-webkit-filter');     //끈질긴 사냥꾼
        } else if (PM_Rune2C == "8106") {
            document.querySelector('.Domination_Hunter_UltimateHunter_B').style.removeProperty('-webkit-filter');     //궁극의 사냥꾼
        } else if (PM_Rune2C == "8347") {   //영감룬
            document.querySelector('.Inspiration_Beyond_CosmicInsight_B').style.removeProperty('-webkit-filter');     //우주적 통찰력
        } else if (PM_Rune2C == "8410") {
            document.querySelector('.Inspiration_Beyond_ApproachVelocity_B').style.removeProperty('-webkit-filter');     //쾌속 접근
        } else if (PM_Rune2C == "8352") {
            document.querySelector('.Inspiration_Beyond_TimeWarpTonic_B').style.removeProperty('-webkit-filter');     //시간 왜곡 물약
        } else if (PM_Rune2C == "8014") {   //정밀룬
            document.querySelector('.Precision_Combat_CoupDeGrace_B').style.removeProperty('-webkit-filter');     //최후의 일격
        } else if (PM_Rune2C == "8017") {
            document.querySelector('.Precision_Combat_CutDown_B').style.removeProperty('-webkit-filter');     //체력차 극복
        } else if (PM_Rune2C == "8299") {
            document.querySelector('.Precision_Combat_LastStand_B').style.removeProperty('-webkit-filter');     //최후의 저항
        } else if (PM_Rune2C == "8451") {   //결의룬
            document.querySelector('.Resolve_Vitality_Overgrowth_B').style.removeProperty('-webkit-filter');     //과잉성장
        } else if (PM_Rune2C == "8453") {
            document.querySelector('.Resolve_Vitality_Revitalize_B').style.removeProperty('-webkit-filter');     //소생
        } else if (PM_Rune2C == "8242") {
            document.querySelector('.Resolve_Vitality_Unflinching_B').style.removeProperty('-webkit-filter');     //불굴의 의지
        } else if (PM_Rune2C == "8237") {   //마법룬
            document.querySelector('.Sorcery_Power_Scorch_B').style.removeProperty('-webkit-filter');     //주문 작열
        } else if (PM_Rune2C == "8232") {
            document.querySelector('.Sorcery_Power_Waterwalking_B').style.removeProperty('-webkit-filter');     //물 위를 걷는 자
        } else if (PM_Rune2C == "8236") {
            document.querySelector('.Sorcery_Power_GatheringStorm_B').style.removeProperty('-webkit-filter');     //폭풍의 결집
        }

        //Summary Runes
        if (SM_Rune2 == "8126" || SM_Rune2 == "8139" || SM_Rune2 == "8143" || SM_Rune2 == "8136" || SM_Rune2 == "8120" || SM_Rune2 == "8138" || SM_Rune2 == "8135" || SM_Rune2 == "8134" || SM_Rune2 == "8105" || SM_Rune2 == "8106") {      //Domination (지배)
            $('<div>').attr("class", "Domination_Malice_CheapShot_B").html("<img src='/resources/images/perk_images/Styles/Domination/Malice/CheapShot.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);
            $('<div>').attr("class", "Domination_Malice_TasteOfBlood_B").html("<img src='/resources/images/perk_images/Styles/Domination/Malice/TasteOfBlood.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);
            $('<div>').attr("class", "Domination_Malice_SuddenImpact_B").html("<img src='/resources/images/perk_images/Styles/Domination/Malice/SuddenImpact.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);

            $('<div>').attr("class", "Domination_Tracking_ZombieWard_B").html("<img src='/resources/images/perk_images/Styles/Domination/Tracking/ZombieWard.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);
            $('<div>').attr("class", "Domination_Tracking_GhostPoro_B").html("<img src='/resources/images/perk_images/Styles/Domination/Tracking/GhostPoro.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);
            $('<div>').attr("class", "Domination_Tracking_EyeballCollection_B").html("<img src='/resources/images/perk_images/Styles/Domination/Tracking/EyeballCollection.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);

            $('<div>').attr("class", "Domination_Hunter_RavenousHunter_B").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/RavenousHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
            $('<div>').attr("class", "Domination_Hunter_IngeniousHunter_B").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/IngeniousHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
            $('<div>').attr("class", "Domination_Hunter_RelentlessHunter_B").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/RelentlessHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
            $('<div>').attr("class", "Domination_Hunter_UltimateHunter_B").html("<img src='/resources/images/perk_images/Styles/Domination/Hunter/UltimateHunter.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
        } else if (SM_Rune2 == "8306" || SM_Rune2 == "8304" || SM_Rune2 == "8313" || SM_Rune2 == "8321" || SM_Rune2 == "8316" || SM_Rune2 == "8345" || SM_Rune2 == "8347" || SM_Rune2 == "8410" || SM_Rune2 == "8352") {        //Inspiration (영감)
            $('<div>').attr("class", "Inspiration_Contraption_HextechFlashtraption_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Contraption/HextechFlashtraption.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);
            $('<div>').attr("class", "Inspiration_Contraption_MagicalFootwear_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Contraption/MagicalFootwear.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);
            $('<div>').attr("class", "Inspiration_Contraption_PerfectTiming_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Contraption/PerfectTiming.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);

            $('<div>').attr("class", "Inspiration_Tomorrow_FuturesMarket_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Tomorrow/FuturesMarket.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);
            $('<div>').attr("class", "Inspiration_Tomorrow_MinionDematerializer_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Tomorrow/MinionDematerializer.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);
            $('<div>').attr("class", "Inspiration_Tomorrow_BiscuitDelivery_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Tomorrow/BiscuitDelivery.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);

            $('<div>').attr("class", "Inspiration_Beyond_CosmicInsight_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Beyond/CosmicInsight.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
            $('<div>').attr("class", "Inspiration_Beyond_ApproachVelocity_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Beyond/ApproachVelocity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
            $('<div>').attr("class", "Inspiration_Beyond_TimeWarpTonic_B").html("<img src='/resources/images/perk_images/Styles/Inspiration/Beyond/TimeWarpTonic.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
        } else if (SM_Rune2 == "9101" || SM_Rune2 == "9111" || SM_Rune2 == "8009" || SM_Rune2 == "9104" || SM_Rune2 == "9105" || SM_Rune2 == "9103" || SM_Rune2 == "8014" || SM_Rune2 == "8017" || SM_Rune2 == "8299") {        //Precision (정밀)
            $('<div>').attr("class", "Precision_Heroism_Overheal_B").html("<img src='/resources/images/perk_images/Styles/Precision/Heroism/Overheal.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);
            $('<div>').attr("class", "Precision_Heroism_Triumph_B").html("<img src='/resources/images/perk_images/Styles/Precision/Heroism/Triumph.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);
            $('<div>').attr("class", "Precision_Heroism_PresenceOfMind_B").html("<img src='/resources/images/perk_images/Styles/Precision/Heroism/PresenceOfMind.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);

            $('<div>').attr("class", "Precision_Legend_LegendAlacrity_B").html("<img src='/resources/images/perk_images/Styles/Precision/Legend/LegendAlacrity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);
            $('<div>').attr("class", "Precision_Legend_LegendTenacity_B").html("<img src='/resources/images/perk_images/Styles/Precision/Legend/LegendTenacity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);
            $('<div>').attr("class", "Precision_Legend_LegendBloodline_B").html("<img src='/resources/images/perk_images/Styles/Precision/Legend/LegendBloodline.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);

            $('<div>').attr("class", "Precision_Combat_CoupDeGrace_B").html("<img src='/resources/images/perk_images/Styles/Precision/Combat/CoupDeGrace.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
            $('<div>').attr("class", "Precision_Combat_CutDown_B").html("<img src='/resources/images/perk_images/Styles/Precision/Combat/CutDown.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
            $('<div>').attr("class", "Precision_Combat_LastStand_B").html("<img src='/resources/images/perk_images/Styles/Precision/Combat/LastStand.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
        } else if (SM_Rune2 == "8446" || SM_Rune2 == "8463" || SM_Rune2 == "8401" || SM_Rune2 == "8429" || SM_Rune2 == "8444" || SM_Rune2 == "8473" || SM_Rune2 == "8451" || SM_Rune2 == "8453" || SM_Rune2 == "8242") {        //Resolve (결의)
            $('<div>').attr("class", "Resolve_Strength_Demolish_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Strength/Demolish.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);
            $('<div>').attr("class", "Resolve_Strength_FontOfLife_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Strength/FontOfLife.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);
            $('<div>').attr("class", "Resolve_Strength_ShieldBash_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Strength/ShieldBash.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);

            $('<div>').attr("class", "Resolve_Resistance_Conditioning_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Resistance/Conditioning.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);
            $('<div>').attr("class", "Resolve_Resistance_SecondWind_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Resistance/SecondWind.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);
            $('<div>').attr("class", "Resolve_Resistance_BonePlating_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Resistance/BonePlating.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);

            $('<div>').attr("class", "Resolve_Vitality_Overgrowth_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Vitality/Overgrowth.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
            $('<div>').attr("class", "Resolve_Vitality_Revitalize_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Vitality/Revitalize.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
            $('<div>').attr("class", "Resolve_Vitality_Unflinching_B").html("<img src='/resources/images/perk_images/Styles/Resolve/Vitality/Unflinching.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
        } else if (SM_Rune2 == "8224" || SM_Rune2 == "8226" || SM_Rune2 == "8275" || SM_Rune2 == "8210" || SM_Rune2 == "8234" || SM_Rune2 == "8233" || SM_Rune2 == "8237" || SM_Rune2 == "8232" || SM_Rune2 == "8236") {      //Sorcery (마법)
            $('<div>').attr("class", "Sorcery_Artefact_NullifyingOrb_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Artefact/NullifyingOrb.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);
            $('<div>').attr("class", "Sorcery_Artefact_ManaflowBand_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Artefact/ManaflowBand.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);
            $('<div>').attr("class", "Sorcery_Artefact_NimbusCloak_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Artefact/NimbusCloak.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_One2);

            $('<div>').attr("class", "Sorcery_Excellence_Transcendence_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Excellence/Transcendence.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);
            $('<div>').attr("class", "Sorcery_Excellence_Celerity_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Excellence/Celerity.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);
            $('<div>').attr("class", "Sorcery_Excellence_AbsoluteFocus_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Excellence/AbsoluteFocus.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Two2);

            $('<div>').attr("class", "Sorcery_Power_Scorch_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Power/Scorch.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
            $('<div>').attr("class", "Sorcery_Power_Waterwalking_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Power/Waterwalking.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
            $('<div>').attr("class", "Sorcery_Power_GatheringStorm_B").html("<img src='/resources/images/perk_images/Styles/Sorcery/Power/GatheringStorm.png' style='width: 50px'>").css('-webkit-filter','grayscale(100%)').appendTo(RBs_Three2);
        }

        //Summary 첫번째 룬 선택란
        if (SM_Rune2 == "8126") {   //지배룬
            document.querySelector('.Domination_Malice_CheapShot_B').style.removeProperty('-webkit-filter');     //비열한 한 방
        } else if (SM_Rune2 == "8139") {
            document.querySelector('.Domination_Malice_TasteOfBlood_B').style.removeProperty('-webkit-filter');     //피의 맛
        } else if (SM_Rune2 == "8143") {
            document.querySelector('.Domination_Malice_SuddenImpact_B').style.removeProperty('-webkit-filter');     //돌발일격
        } else if (SM_Rune2 == "8136") {
            document.querySelector('.Domination_Tracking_ZombieWard_B').style.removeProperty('-webkit-filter');     //좀비 와드
        } else if (SM_Rune2 == "8120") {
            document.querySelector('.Domination_Tracking_GhostPoro_B').style.removeProperty('-webkit-filter');     //유령 포로
        } else if (SM_Rune2 == "8138") {
            document.querySelector('.Domination_Tracking_EyeballCollection_B').style.removeProperty('-webkit-filter');     //사냥의 증표
        } else if (SM_Rune2 == "8135") {
            document.querySelector('.Domination_Hunter_RavenousHunter_B').style.removeProperty('-webkit-filter');     //굶주린 사냥꾼
        } else if (SM_Rune2 == "8134") {
            document.querySelector('.Domination_Hunter_IngeniousHunter_B').style.removeProperty('-webkit-filter');     //영리한 사냥꾼
        } else if (SM_Rune2 == "8105") {
            document.querySelector('.Domination_Hunter_RelentlessHunter_B').style.removeProperty('-webkit-filter');     //끈질긴 사냥꾼
        } else if (SM_Rune2 == "8106") {
            document.querySelector('.Domination_Hunter_UltimateHunter_B').style.removeProperty('-webkit-filter');     //궁극의 사냥꾼
        } else if (SM_Rune2 == "8306") {    //영감룬
            document.querySelector('.Inspiration_Contraption_HextechFlashtraption_B').style.removeProperty('-webkit-filter');     //마법공학 점멸기
        } else if (SM_Rune2 == "8304") {
            document.querySelector('.Inspiration_Contraption_MagicalFootwear_B').style.removeProperty('-webkit-filter');     //마법의 신발
        } else if (SM_Rune2 == "8313") {
            document.querySelector('.Inspiration_Contraption_PerfectTiming_B').style.removeProperty('-webkit-filter');     //완벽한 타이밍
        } else if (SM_Rune2 == "8321") {
            document.querySelector('.Inspiration_Tomorrow_FuturesMarket_B').style.removeProperty('-webkit-filter');     //외상
        } else if (SM_Rune2 == "8316") {
            document.querySelector('.Inspiration_Tomorrow_MinionDematerializer_B').style.removeProperty('-webkit-filter');     //미니언 해체분석기
        } else if (SM_Rune2 == "8345") {
            document.querySelector('.Inspiration_Tomorrow_BiscuitDelivery_B').style.removeProperty('-webkit-filter');     //비스킷 배달
        } else if (SM_Rune2 == "8347") {
            document.querySelector('.Inspiration_Beyond_CosmicInsight_B').style.removeProperty('-webkit-filter');     //우주적 통찰력
        } else if (SM_Rune2 == "8410") {
            document.querySelector('.Inspiration_Beyond_ApproachVelocity_B').style.removeProperty('-webkit-filter');     //쾌속 접근
        } else if (SM_Rune2 == "8352") {
            document.querySelector('.Inspiration_Beyond_TimeWarpTonic_B').style.removeProperty('-webkit-filter');     //시간 왜곡 물약
        } else if (SM_Rune2 == "9101") {    //정밀룬
            document.querySelector('.Precision_Heroism_Overheal_B').style.removeProperty('-webkit-filter');     //과다치유
        } else if (SM_Rune2 == "9111") {
            document.querySelector('.Precision_Heroism_Triumph_B').style.removeProperty('-webkit-filter');     //승전보
        } else if (SM_Rune2 == "8009") {
            document.querySelector('.Precision_Heroism_PresenceOfMind_B').style.removeProperty('-webkit-filter');     //침착
        } else if (SM_Rune2 == "9104") {
            document.querySelector('.Precision_Legend_LegendAlacrity_B').style.removeProperty('-webkit-filter');     //전설 : 민첩함
        } else if (SM_Rune2 == "9105") {
            document.querySelector('.Precision_Legend_LegendTenacity_B').style.removeProperty('-webkit-filter');     //전설 : 강인함
        } else if (SM_Rune2 == "9103") {
            document.querySelector('.Precision_Legend_LegendBloodline_B').style.removeProperty('-webkit-filter');     //전설 : 핏빛 길
        } else if (SM_Rune2 == "8014") {
            document.querySelector('.Precision_Combat_CoupDeGrace_B').style.removeProperty('-webkit-filter');     //최후의 일격
        } else if (SM_Rune2 == "8017") {
            document.querySelector('.Precision_Combat_CutDown_B').style.removeProperty('-webkit-filter');     //체력차 극복
        } else if (SM_Rune2 == "8299") {
            document.querySelector('.Precision_Combat_LastStand_B').style.removeProperty('-webkit-filter');     //최후의 저항
        } else if (SM_Rune2 == "8446") {    //결의룬
            document.querySelector('.Resolve_Strength_Demolish_B').style.removeProperty('-webkit-filter');     //철거
        } else if (SM_Rune2 == "8463") {
            document.querySelector('.Resolve_Strength_FontOfLife_B').style.removeProperty('-webkit-filter');     //생명의 샘
        } else if (SM_Rune2 == "8401") {
            document.querySelector('.Resolve_Strength_ShieldBash_B').style.removeProperty('-webkit-filter');     //보호막 강타
        } else if (SM_Rune2 == "8429") {
            document.querySelector('.Resolve_Resistance_Conditioning_B').style.removeProperty('-webkit-filter');     //사전 준비
        } else if (SM_Rune2 == "8444") {
            document.querySelector('.Resolve_Resistance_SecondWind_B').style.removeProperty('-webkit-filter');     //재생의 바람
        } else if (SM_Rune2 == "8473") {
            document.querySelector('.Resolve_Resistance_BonePlating_B').style.removeProperty('-webkit-filter');     //뼈 방패
        } else if (SM_Rune2 == "8451") {
            document.querySelector('.Resolve_Vitality_Overgrowth_B').style.removeProperty('-webkit-filter');     //과잉성장
        } else if (SM_Rune2 == "8453") {
            document.querySelector('.Resolve_Vitality_Revitalize_B').style.removeProperty('-webkit-filter');     //소생
        } else if (SM_Rune2 == "8242") {
            document.querySelector('.Resolve_Vitality_Unflinching_B').style.removeProperty('-webkit-filter');     //불굴의 의지
        } else if (SM_Rune2 == "8224") {    //마법룬
            document.querySelector('.Sorcery_Artefact_NullifyingOrb_B').style.removeProperty('-webkit-filter');     //무효화 구체
        } else if (SM_Rune2 == "8226") {
            document.querySelector('.Sorcery_Artefact_ManaflowBand_B').style.removeProperty('-webkit-filter');     //마나순환 팔찌
        } else if (SM_Rune2 == "8275") {
            document.querySelector('.Sorcery_Artefact_NimbusCloak_B').style.removeProperty('-webkit-filter');     //빛의 망토
        } else if (SM_Rune2 == "8210") {
            document.querySelector('.Sorcery_Excellence_Transcendence_B').style.removeProperty('-webkit-filter');     //깨달음
        } else if (SM_Rune2 == "8234") {
            document.querySelector('.Sorcery_Excellence_Celerity_B').style.removeProperty('-webkit-filter');     //기민함
        } else if (SM_Rune2 == "8233") {
            document.querySelector('.Sorcery_Excellence_AbsoluteFocus_B').style.removeProperty('-webkit-filter');     //절대 집중
        } else if (SM_Rune2 == "8237") {
            document.querySelector('.Sorcery_Power_Scorch_B').style.removeProperty('-webkit-filter');     //주문 작열
        } else if (SM_Rune2 == "8232") {
            document.querySelector('.Sorcery_Power_Waterwalking_B').style.removeProperty('-webkit-filter');     //물 위를 걷는 자
        } else if (SM_Rune2 == "8236") {
            document.querySelector('.Sorcery_Power_GatheringStorm_B').style.removeProperty('-webkit-filter');     //폭풍의 결집
        }

        //Summary 두번째 룬 선택란
        if (SM_Rune2A == "8126") {   //지배룬
            document.querySelector('.Domination_Malice_CheapShot_B').style.removeProperty('-webkit-filter');     //비열한 한 방
        } else if (SM_Rune2A == "8139") {
            document.querySelector('.Domination_Malice_TasteOfBlood_B').style.removeProperty('-webkit-filter');     //피의 맛
        } else if (SM_Rune2A == "8143") {
            document.querySelector('.Domination_Malice_SuddenImpact_B').style.removeProperty('-webkit-filter');     //돌발일격
        } else if (SM_Rune2A == "8136") {
            document.querySelector('.Domination_Tracking_ZombieWard_B').style.removeProperty('-webkit-filter');     //좀비 와드
        } else if (SM_Rune2A == "8120") {
            document.querySelector('.Domination_Tracking_GhostPoro_B').style.removeProperty('-webkit-filter');     //유령 포로
        } else if (SM_Rune2A == "8138") {
            document.querySelector('.Domination_Tracking_EyeballCollection_B').style.removeProperty('-webkit-filter');     //사냥의 증표
        } else if (SM_Rune2A == "8135") {
            document.querySelector('.Domination_Hunter_RavenousHunter_B').style.removeProperty('-webkit-filter');     //굶주린 사냥꾼
        } else if (SM_Rune2A == "8134") {
            document.querySelector('.Domination_Hunter_IngeniousHunter_B').style.removeProperty('-webkit-filter');     //영리한 사냥꾼
        } else if (SM_Rune2A == "8105") {
            document.querySelector('.Domination_Hunter_RelentlessHunter_B').style.removeProperty('-webkit-filter');     //끈질긴 사냥꾼
        } else if (SM_Rune2A == "8106") {
            document.querySelector('.Domination_Hunter_UltimateHunter_B').style.removeProperty('-webkit-filter');     //궁극의 사냥꾼
        } else if (SM_Rune2A == "8306") {    //영감룬
            document.querySelector('.Inspiration_Contraption_HextechFlashtraption_B').style.removeProperty('-webkit-filter');     //마법공학 점멸기
        } else if (SM_Rune2A == "8304") {
            document.querySelector('.Inspiration_Contraption_MagicalFootwear_B').style.removeProperty('-webkit-filter');     //마법의 신발
        } else if (SM_Rune2A == "8313") {
            document.querySelector('.Inspiration_Contraption_PerfectTiming_B').style.removeProperty('-webkit-filter');     //완벽한 타이밍
        } else if (SM_Rune2A == "8321") {
            document.querySelector('.Inspiration_Tomorrow_FuturesMarket_B').style.removeProperty('-webkit-filter');     //외상
        } else if (SM_Rune2A == "8316") {
            document.querySelector('.Inspiration_Tomorrow_MinionDematerializer_B').style.removeProperty('-webkit-filter');     //미니언 해체분석기
        } else if (SM_Rune2A == "8345") {
            document.querySelector('.Inspiration_Tomorrow_BiscuitDelivery_B').style.removeProperty('-webkit-filter');     //비스킷 배달
        } else if (SM_Rune2A == "8347") {
            document.querySelector('.Inspiration_Beyond_CosmicInsight_B').style.removeProperty('-webkit-filter');     //우주적 통찰력
        } else if (SM_Rune2A == "8410") {
            document.querySelector('.Inspiration_Beyond_ApproachVelocity_B').style.removeProperty('-webkit-filter');     //쾌속 접근
        } else if (SM_Rune2A == "8352") {
            document.querySelector('.Inspiration_Beyond_TimeWarpTonic_B').style.removeProperty('-webkit-filter');     //시간 왜곡 물약
        } else if (SM_Rune2A == "9101") {    //정밀룬
            document.querySelector('.Precision_Heroism_Overheal_B').style.removeProperty('-webkit-filter');     //과다치유
        } else if (SM_Rune2A == "9111") {
            document.querySelector('.Precision_Heroism_Triumph_B').style.removeProperty('-webkit-filter');     //승전보
        } else if (SM_Rune2A == "8009") {
            document.querySelector('.Precision_Heroism_PresenceOfMind_B').style.removeProperty('-webkit-filter');     //침착
        } else if (SM_Rune2A == "9104") {
            document.querySelector('.Precision_Legend_LegendAlacrity_B').style.removeProperty('-webkit-filter');     //전설 : 민첩함
        } else if (SM_Rune2A == "9105") {
            document.querySelector('.Precision_Legend_LegendTenacity_B').style.removeProperty('-webkit-filter');     //전설 : 강인함
        } else if (SM_Rune2A == "9103") {
            document.querySelector('.Precision_Legend_LegendBloodline_B').style.removeProperty('-webkit-filter');     //전설 : 핏빛 길
        } else if (SM_Rune2A == "8014") {
            document.querySelector('.Precision_Combat_CoupDeGrace_B').style.removeProperty('-webkit-filter');     //최후의 일격
        } else if (SM_Rune2A == "8017") {
            document.querySelector('.Precision_Combat_CutDown_B').style.removeProperty('-webkit-filter');     //체력차 극복
        } else if (SM_Rune2A == "8299") {
            document.querySelector('.Precision_Combat_LastStand_B').style.removeProperty('-webkit-filter');     //최후의 저항
        } else if (SM_Rune2A == "8446") {    //결의룬
            document.querySelector('.Resolve_Strength_Demolish_B').style.removeProperty('-webkit-filter');     //철거
        } else if (SM_Rune2A == "8463") {
            document.querySelector('.Resolve_Strength_FontOfLife_B').style.removeProperty('-webkit-filter');     //생명의 샘
        } else if (SM_Rune2A == "8401") {
            document.querySelector('.Resolve_Strength_ShieldBash_B').style.removeProperty('-webkit-filter');     //보호막 강타
        } else if (SM_Rune2A == "8429") {
            document.querySelector('.Resolve_Resistance_Conditioning_B').style.removeProperty('-webkit-filter');     //사전 준비
        } else if (SM_Rune2A == "8444") {
            document.querySelector('.Resolve_Resistance_SecondWind_B').style.removeProperty('-webkit-filter');     //재생의 바람
        } else if (SM_Rune2A == "8473") {
            document.querySelector('.Resolve_Resistance_BonePlating_B').style.removeProperty('-webkit-filter');     //뼈 방패
        } else if (SM_Rune2A == "8451") {
            document.querySelector('.Resolve_Vitality_Overgrowth_B').style.removeProperty('-webkit-filter');     //과잉성장
        } else if (SM_Rune2A == "8453") {
            document.querySelector('.Resolve_Vitality_Revitalize_B').style.removeProperty('-webkit-filter');     //소생
        } else if (SM_Rune2A == "8242") {
            document.querySelector('.Resolve_Vitality_Unflinching_B').style.removeProperty('-webkit-filter');     //불굴의 의지
        } else if (SM_Rune2A == "8224") {    //마법룬
            document.querySelector('.Sorcery_Artefact_NullifyingOrb_B').style.removeProperty('-webkit-filter');     //무효화 구체
        } else if (SM_Rune2A == "8226") {
            document.querySelector('.Sorcery_Artefact_ManaflowBand_B').style.removeProperty('-webkit-filter');     //마나순환 팔찌
        } else if (SM_Rune2A == "8275") {
            document.querySelector('.Sorcery_Artefact_NimbusCloak_B').style.removeProperty('-webkit-filter');     //빛의 망토
        } else if (SM_Rune2A == "8210") {
            document.querySelector('.Sorcery_Excellence_Transcendence_B').style.removeProperty('-webkit-filter');     //깨달음
        } else if (SM_Rune2A == "8234") {
            document.querySelector('.Sorcery_Excellence_Celerity_B').style.removeProperty('-webkit-filter');     //기민함
        } else if (SM_Rune2A == "8233") {
            document.querySelector('.Sorcery_Excellence_AbsoluteFocus_B').style.removeProperty('-webkit-filter');     //절대 집중
        } else if (SM_Rune2A == "8237") {
            document.querySelector('.Sorcery_Power_Scorch_B').style.removeProperty('-webkit-filter');     //주문 작열
        } else if (SM_Rune2A == "8232") {
            document.querySelector('.Sorcery_Power_Waterwalking_B').style.removeProperty('-webkit-filter');     //물 위를 걷는 자
        } else if (SM_Rune2A == "8236") {
            document.querySelector('.Sorcery_Power_GatheringStorm_B').style.removeProperty('-webkit-filter');     //폭풍의 결집
        }

        //Stats Mods
        $('<div>').attr("class", "Stats_5008_B").html("<img src='/resources/images/perk_images/Styles/Stats/5008.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_One2);
        $('<div>').attr("class", "Stats_5005_B").html("<img src='/resources/images/perk_images/Styles/Stats/5005.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_One2);
        $('<div>').attr("class", "Stats_5007_B").html("<img src='/resources/images/perk_images/Styles/Stats/5007.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_One2);

        $('<div>').attr("class", "Stats_5008_Bb").html("<img src='/resources/images/perk_images/Styles/Stats/5008.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_Two2);
        $('<div>').attr("class", "Stats_5002_B").html("<img src='/resources/images/perk_images/Styles/Stats/5002.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_Two2);
        $('<div>').attr("class", "Stats_5003_B").html("<img src='/resources/images/perk_images/Styles/Stats/5003.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_Two2);

        $('<div>').attr("class", "Stats_5001_B").html("<img src='/resources/images/perk_images/Styles/Stats/5001.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_Three2);
        $('<div>').attr("class", "Stats_5002_Bb").html("<img src='/resources/images/perk_images/Styles/Stats/5002.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_Three2);
        $('<div>').attr("class", "Stats_5003_Bb").html("<img src='/resources/images/perk_images/Styles/Stats/5003.png' style='width: 30px'>").css('-webkit-filter','grayscale(100%)').appendTo(SM_Three2);

        //Stats 첫번째 룬 선택란
        if (Stats_Rune2 == "5001") {
            document.querySelector('.Stats_5001_B').style.removeProperty('-webkit-filter');     //체력
        } else if (Stats_Rune2 == "5002") {
            document.querySelector('.Stats_5002_Bb').style.removeProperty('-webkit-filter');     //방어력
        } else if (Stats_Rune2 == "5003") {
            document.querySelector('.Stats_5003_Bb').style.removeProperty('-webkit-filter');     //마법 저항력
        }

        //Stats 두번째 룬 선택란
        if (Stats_Rune2A == "5008") {
            document.querySelector('.Stats_5008_Bb').style.removeProperty('-webkit-filter');     //적응형 능력치
        } else if (Stats_Rune2A == "5002") {
            document.querySelector('.Stats_5002_B').style.removeProperty('-webkit-filter');     //방어력
        } else if (Stats_Rune2A == "5003") {
            document.querySelector('.Stats_5003_B').style.removeProperty('-webkit-filter');     //마법 저항력
        }

        //Stats 세번째 룬 선택란
        if (Stats_Rune2B == "5008") {
            document.querySelector('.Stats_5008_B').style.removeProperty('-webkit-filter');     //적응형 능력치
        } else if (Stats_Rune2B == "5005") {
            document.querySelector('.Stats_5005_B').style.removeProperty('-webkit-filter');     //공격속도
        } else if (Stats_Rune2B == "5007") {
            document.querySelector('.Stats_5007_B').style.removeProperty('-webkit-filter');     //스킬가속
        }

        $('<p>').attr("class", "Rune_Build_Rate").text(RB_Rate2+"% Win Rate").appendTo(RB_Div2);
        $('<p>').attr("class", "Rune_Build_cnt").text(RB_Cnt2+" Games").appendTo(RB_Div2);
    </script>
</html>
