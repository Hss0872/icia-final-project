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
                        <img class="Champ_champ140c__ZSREE" src=/resources/images/LOL_CHAMPION_ICON/lol_champion_${championName}.png alt="${championName}">
                        <svg class="CircleBig_border__3QsNj">
                            <circle cx="72" cy="72" r="72" stroke="#333" stroke-width="2" fill="#111"></circle>
                        </svg>
<%--                        <div class="CircleBig_lane__2qKzs">--%>
<%--                            <div class="laneicon"--%>
<%--                                 style="background-position: 0px 0px;--%>
<%--                                 width: 27px;--%>
<%--                                 height: 27px;--%>
<%--                                 background-repeat: no-repeat;--%>
<%--                                 margin-left: auto;--%>
<%--                                 margin-right: auto;--%>
<%--                                 &lt;%&ndash; 라인 포지션 이미지 &ndash;%&gt;--%>
<%--                                 background-image: url('/resources/images/LOL_POSITION/top.png');--%>
<%--                                 background-size: 243px 27px;">--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <svg class="CircleBig_laneborder__2kf6I">--%>
<%--                            <circle cx="23" cy="23" r="23" stroke="#333" stroke-width="1" fill="#111"></circle>--%>
<%--                        </svg>--%>
<%--                        <div class="CircleBig_tier__ul2zF">S+</div><svg class="CircleBig_tierborder__16GoL">--%>
<%--                            <circle cx="23" cy="23" r="23" stroke="#333" stroke-width="1" fill="#111"></circle>--%>
<%--                        </svg>--%>
                    </div>
                    <div class="SkillList_wrapper__1HtlM">
                        <div class="Skill_skill30__CEeFI">
                            <img src="/resources/images/LOL_CHAMPION_PASSIVE/${championName}Passive.png" alt="${championName}P">
                            <div>P</div>
                        </div>
                        <div class="Skill_skill30__CEeFI">
                            <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}Q.png" alt="${championName}Q">
                            <div>Q</div>
                        </div>
                        <div class="Skill_skill30__CEeFI">
                            <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}W.png" alt="${championName}W">
                            <div>W</div>
                        </div>
                        <div class="Skill_skill30__CEeFI">
                            <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}E.png" alt="${championName}E">
                            <div>E</div>
                        </div>
                        <div class="Skill_skill30__CEeFI">
                            <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}R.png" alt="${championName}R">
                            <div>R</div>
                        </div>
                    </div>
                </div>

                <div>
                    <h1>${championName} Build</h1>
                    <div class="champion_title"></div>
                    <div class="champion_blurb"></div>
                </div>
                <div>
                    <div class="Circle_circle__1UKAB">
                        <div>
                            <svg width="80" height="80">
    <%--                            <g transform="translate(40,40)">--%>
    <%--                                <path d="M1.3182269663177186,38.97771514167131A39,39,0,0,1,-17.622486381192008,-34.79149283581695L-10.805147645018803,-20.303910568394073A23,23,0,0,0,0.3128604547662688,22.997872039296233Z" stroke="rgb(193,105,104)" fill-opacity="0.5" fill="rgb(193,105,104)"></path>--%>
    <%--                                <path d="M1.131805237291119,-38.98357368052396A39,39,0,0,1,3.577370722700992,38.83558186396029L2.572004211149535,22.85573876158522A23,23,0,0,0,1.1318052372911143,-22.972135662685794Z" stroke="rgb(104,185,214)" fill-opacity="0.5" fill="rgb(104,185,214)"></path>--%>
    <%--                                <path d="M-15.574310387544559,-35.75529130006385A39,39,0,0,1,-1.131805237291089,-38.98357368052396L-1.1318052372910916,-22.972135662685794A23,23,0,0,0,-8.75697165137137,-21.267709032640965Z" stroke="rgb(223,223,223)" fill-opacity="0.5" fill="rgb(223,223,223)"></path>--%>
    <%--                            </g>--%>
                            </svg>
                        </div>
                    </div>
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

                                    <!-- 챔피언 스킬 선마순서 로직 -->
<%--                                <div class="Skill_skill36__yk-DO">--%>
<%--                                    <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}Q.png" alt="Shen Q">--%>
<%--                                    <div>Q</div>--%>
<%--                                </div>--%>
<%--                                <div class="SkillPriority_skillnext__38Exi">--%>
<%--                                    <i>▷</i>--%>
<%--                                </div>--%>
<%--                                <div class="Skill_skill36__yk-DO">--%>
<%--                                    <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}E.png" alt="Shen E">--%>
<%--                                    <div>E</div>--%>
<%--                                </div>--%>
<%--                                <div class="SkillPriority_skillnext__38Exi">--%>
<%--                                    <i>▷</i>--%>
<%--                                </div>--%>
<%--                                <div class="Skill_skill36__yk-DO">--%>
<%--                                    <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}W.png" alt="Shen W">--%>
<%--                                    <div>W</div>--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="Summary_pickwin__PRaVa">--%>
<%--                                <!-- DB 정보에 있는 CNT와 WIN_RATE 컬럼값을 불러와서 이에 따른 동적 DIV를 구성해야 함 -->--%>
<%--                                <div style="color: rgb(70, 175, 46);">53.1% Win Rate</div>--%>
<%--                                <span>53.5%</span>--%>
<%--                           </div>--%>
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
                                    <div class="First_Rune1"></div>
                                    <div class="Second_Rune1"></div>
                                    <div class="Stats_Rune1"></div>
                                </div>
                                <div class="Rune_Build_Div2">
                                    <div class="First_Rune2"></div>
                                    <div class="Second_Rune2"></div>
                                    <div class="Stats_Rune2"></div>
                                </div>

                                <div>
                                    <div style="background-size: 25px;
                                        background-image: url('/resources/images/perk_images/Styles/Resolve/Keystone/GraspOfTheUndying.png');
                                        background-position: 100%;
                                        width: 24px;
                                        height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Resolve/Keystone/Aftershock.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Resolve/Keystone/Guardian.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                </div>

                                <div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Resolve/Strength/Demolish.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Resolve/Strength/FontOfLife.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div style="background-size: 25px;
                                        background-image: url('/resources/images/perk_images/Styles/Resolve/Strength/ShieldBash.png');
                                        background-position: 100%;
                                        width: 24px;
                                        height: 24px;">
                                    </div>
                                </div>

                                <div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Resolve/Resistance/Conditioning.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div style="background-size: 25px;
                                        background-image: url('/resources/images/perk_images/Styles/Resolve/Resistance/SecondWind.png');
                                        background-position: 100%;
                                        width: 24px;
                                        height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Resolve/Resistance/BonePlating.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                </div>

                                <div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Resolve/Vitality/Overgrowth.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div style="background-size: 25px;
                                        background-image: url('/resources/images/perk_images/Styles/Resolve/Vitality/Revitalize.png');
                                        background-position: 100%;
                                        width: 24px;
                                        height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Resolve/Vitality/Unflinching.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 서브 룬 선택 로직 콘솔에 찍힌 값을 토대로 이미지를 불러오도록 로직을 짜야함 -->
                    <div>
                        <div class="Summary_runes__1b7qR">
                            <div class="RuneSet_rune__3PQbj">
                                <div>
                                    <div style="background-size: 25px;
                                        background-image: url('/resources/images/perk_images/Styles/Domination/Malice/CheapShot.png');
                                        background-position: 100%;
                                        width: 24px;
                                        height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Domination/Malice/TasteOfBlood.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Domination/Malice/SuddenImpact.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                </div>

                                <div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Domination/Tracking/ZombieWard.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Domination/Tracking/GhostPoro.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Domination/Tracking/EyeballCollection.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                </div>
                                <div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Domination/Hunter/RavenousHunter.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Domination/Hunter/IngeniousHunter.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Domination/Hunter/RelentlessHunter.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div style="background-size: 25px;
                                        background-image: url('/resources/images/perk_images/Styles/Domination/Hunter/UltimateHunter.png');
                                        background-position: 100%;
                                        width: 24px;
                                        height: 24px;">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="Summary_pickwin__PRaVa">
                            <div>
                                <div style="color: rgb(70, 175, 46);">52.8% Win Rate</div>
                                <div class="Tip_q__3v_Eo">?</div>
                            </div><span class="Summary_keystonegames__3ypEL">101,258 Games</span>
                        </div>
                    </div>

                    <!-- 스탯 룬 선택 로직 콘솔에 찍힌 값을 토대로 이미지를 불러오도록 로직을 짜야함 -->
                    <div>
                        <div class="Summary_runes__1b7qR">
                            <div class="RuneSet_mod__1-l2z RuneSet_rune__3PQbj">
                                <div>
                                    <div style="background-size: 25px;
                                        background-image: url('/resources/images/perk_images/Styles/Stats/5008.png');
                                        background-position: 100%;
                                        width: 24px;
                                        height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Stats/5005.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Stats/5007.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                </div>

                                <div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Stats/5008.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Stats/5002.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Stats/5003.png');
                                         background-position: -100%;
                                         width: 24px;
                                         height:24px;">
                                    </div>
                                </div>

                                <div>
                                    <div style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Stats/5001.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Stats/5002.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
                                    </div>
                                    <div class="Rune_grey__39iTw"
                                         style="background-size: 25px;
                                         background-image: url('/resources/images/perk_images/Styles/Stats/5003.png');
                                         background-position: 100%;
                                         width: 24px;
                                         height: 24px;">
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

<%--                <div class="Summary_itemsrow__27AYY">--%>
<%--                    <div class="Summary_items__1Hq4v">--%>
<%--                        <div>--%>
<%--                            <img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/1054.jpg" alt="Doran's Shield" data-id="1054">--%>
<%--                        </div>--%>
<%--                        <div class="Summary_spacer__2XFIf"></div>--%>
<%--                        <div>--%>
<%--                            <img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/2003.jpg" alt="Health Potion" data-id="2003">--%>
<%--                        </div>--%>
<%--                        <div class="Summary_spacer__2XFIf"></div>--%>
<%--                        <div class="Summary_pickwin__PRaVa">--%>
<%--                            <div style="color: rgb(70, 175, 46);">52.8% Win Rate</div>--%>
<%--                            <span> 100,606 Games</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <div class="Summary_items__1Hq4v">--%>
<%--                        <div>--%>
<%--                            <img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/6662.jpg" alt="Frostfire Gauntlet" data-id="6662">--%>
<%--                        </div>--%>
<%--                        <div class="Summary_skillnext__1dEk0">--%>
<%--                            <i>▷</i>--%>
<%--                        </div>--%>
<%--                        <div>--%>
<%--                            <img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/3047.jpg" alt="Plated Steelcaps" data-id="3047">--%>
<%--                            <div class="Summary_win__2epkg">--%>
<%--                                <div style="color: rgb(36, 163, 0);">61.56%</div>--%>
<%--                            </div>--%>
<%--                            <div class="Summary_pick__1tuJG">2,094</div>--%>
<%--                        </div>--%>
<%--                        <div class="Summary_skillnext__1dEk0">--%>
<%--                            <i>▷</i>--%>
<%--                        </div>--%>
<%--                        <div>--%>
<%--                            <img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/4637.jpg" alt="Demonic Embrace" data-id="4637">--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="Summary_items__1Hq4v">--%>
<%--                        <div>--%>
<%--                            <img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/3748.jpg" alt="Titanic Hydra" data-id="3748">--%>
<%--                            <div class="Summary_win__2epkg">--%>
<%--                                <div style="color: rgb(36, 163, 0);">62.99%</div>--%>
<%--                            </div>--%>
<%--                            <div class="Summary_pick__1tuJG">4,739</div>--%>
<%--                        </div>--%>

<%--                        <div class="Summary_or__2BEIC"> OR </div>--%>
<%--                        <div>--%>
<%--                            <img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/3075.jpg" alt="Thornmail" data-id="3075">--%>
<%--                            <div class="Summary_win__2epkg">--%>
<%--                                <div style="color: rgb(36, 163, 0);">60.58%</div>--%>
<%--                            </div>--%>
<%--                            <div class="Summary_pick__1tuJG">12,585</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="Summary_items__1Hq4v">--%>
<%--                        <div>--%>
<%--                            <img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/4401.jpg" alt="Force of Nature" data-id="4401">--%>
<%--                            <div class="Summary_win__2epkg">--%>
<%--                                <div style="color: rgb(36, 163, 0);">61.51%</div>--%>
<%--                            </div>--%>
<%--                            <div class="Summary_pick__1tuJG">1,299</div>--%>
<%--                        </div>--%>

<%--                        <div class="Summary_or__2BEIC"> OR </div>--%>
<%--                        <div>--%>
<%--                            <img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/3075.jpg" alt="Thornmail" data-id="3075">--%>
<%--                            <div class="Summary_win__2epkg">--%>
<%--                                <div style="color: rgb(36, 163, 0);">59.39%</div>--%>
<%--                            </div>--%>
<%--                            <div class="Summary_pick__1tuJG">1,758</div>--%>
<%--                        </div>--%>

<%--                        <div class="Summary_or__2BEIC"> OR </div>--%>
<%--                        <div>--%>
<%--                            <img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/3143.jpg" alt="Randuin's Omen" data-id="3143">--%>
<%--                            <div class="Summary_win__2epkg">--%>
<%--                                <div style="color: rgb(36, 163, 0);">58.87%</div>--%>
<%--                            </div>--%>
<%--                            <div class="Summary_pick__1tuJG">2,509</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="Summary_items__1Hq4v">--%>
<%--                        <div>--%>
<%--                            <img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/3065.jpg" alt="Spirit Visage" data-id="3065">--%>
<%--                            <div class="Summary_win__2epkg">--%>
<%--                                <div style="color: rgb(36, 163, 0);">63.10%</div>--%>
<%--                            </div>--%>
<%--                            <div class="Summary_pick__1tuJG">168</div>--%>
<%--                        </div>--%>

<%--                        <div class="Summary_or__2BEIC"> OR </div>--%>

<%--                        <div>--%>
<%--                            <img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/4401.jpg" alt="Force of Nature" data-id="4401">--%>
<%--                            <div class="Summary_win__2epkg">--%>
<%--                                <div style="color: rgb(36, 163, 0);">58.67%</div>--%>
<%--                            </div>--%>
<%--                            <div class="Summary_pick__1tuJG">196</div>--%>
<%--                        </div>--%>

<%--                        <div class="Summary_or__2BEIC"> OR </div>--%>
<%--                        <div>--%>
<%--                            <img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/3143.jpg" alt="Randuin's Omen" data-id="3143">--%>
<%--                            <div class="Summary_win__2epkg">--%>
<%--                                <div style="color: rgb(36, 163, 0);">55.94%</div>--%>
<%--                            </div>--%>
<%--                            <div class="Summary_pick__1tuJG">286</div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
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

        let RB_Div1 = $('.Rune_Build_Div1');
        let RB_Div2 = $('.Rune_Build_Div2');

        let RB_First1 = $('.First_Rune1');
        let RB_Second1 = $('.Second_Rune1');
        let RB_Third1 = $('.Stats_Rune1');

        let RB_First2 = $('.First_Rune2');
        let RB_Second2 = $('.Second_Rune2');
        let RB_Third2 = $('.Stats_Rune2');

        //룬 빌드1
        //Domination (지배)
        // $('<img>').attr("class", "Domination_Keystone_Predator").attr("style", "width: 70px").attr("src", "/resources/images/perk_images/Styles/Domination/Keystone/Predator.png").appendTo(RB_First1);
        // $('<img>').attr("class", "Domination_Keystone_Electrocute").attr("style", "width: 70px").attr("src", "/resources/images/perk_images/Styles/Domination/Keystone/Electrocute.png").appendTo(RB_First1);
        // $('<img>').attr("class", "Domination_Keystone_DarkHarvest").attr("style", "width: 70px").attr("src", "/resources/images/perk_images/Styles/Domination/Keystone/DarkHarvest.png").appendTo(RB_First1);
        // $('<img>').attr("class", "Domination_Keystone_HailOfBlades").attr("style", "width: 70px").attr("src", "/resources/images/perk_images/Styles/Domination/Keystone/HailOfBlades.png").appendTo(RB_First1);
        //
        // $('<img>').attr("class", "Domination_Malice_CheapShot").attr("style", "width: 70px").attr("src", "/resources/images/perk_images/Styles/Domination/Malice/CheapShot.png").appendTo(RB_First1);
        // $('<img>').attr("class", "Domination_Malice_TasteOfBlood").attr("style", "width: 70px").attr("src", "/resources/images/perk_images/Styles/Domination/Malice/TasteOfBlood.png").appendTo(RB_First1);
        // $('<img>').attr("class", "Domination_Malice_SuddenImpact").attr("style", "width: 70px").attr("src", "/resources/images/perk_images/Styles/Domination/Malice/SuddenImpact.png").appendTo(RB_First1);
        //
        // $('<img>').attr("class", "Domination_Tracking_ZombieWard").attr("style", "width: 70px").attr("src", "/resources/images/perk_images/Styles/Domination/Tracking/ZombieWard.png").appendTo(RB_First1);
        // $('<img>').attr("class", "Domination_Tracking_GhostPoro").attr("style", "width: 70px").attr("src", "/resources/images/perk_images/Styles/Domination/Tracking/GhostPoro.png").appendTo(RB_First1);
        // $('<img>').attr("class", "Domination_Tracking_EyeballCollection").attr("style", "width: 70px").attr("src", "/resources/images/perk_images/Styles/Domination/Tracking/EyeballCollection.png").appendTo(RB_First1);
        //
        // $('<img>').attr("class", "Domination_Hunter_RavenousHunter").attr("style", "width: 70px").attr("src", "/resources/images/perk_images/Styles/Domination/Hunter/RavenousHunter.png").appendTo(RB_First1);
        // $('<img>').attr("class", "Domination_Hunter_IngeniousHunter").attr("style", "width: 70px").attr("src", "/resources/images/perk_images/Styles/Domination/Hunter/IngeniousHunter.png").appendTo(RB_First1);
        // $('<img>').attr("class", "Domination_Hunter_RelentlessHunter").attr("style", "width: 70px").attr("src", "/resources/images/perk_images/Styles/Domination/Hunter/RelentlessHunter.png").appendTo(RB_First1);
        // $('<img>').attr("class", "Domination_Hunter_UltimateHunter").attr("style", "width: 70px").attr("src", "/resources/images/perk_images/Styles/Domination/Hunter/UltimateHunter.png").appendTo(RB_First1);

        $('<p>').attr("class", "Rune_Build_Rate").text(RB_Rate1+"% Win Rate").appendTo(RB_Div1);
        $('<p>').attr("class", "Rune_Build_cnt").text(RB_Cnt1+" Games").appendTo(RB_Div1);

        //룬 빌드2
        $('<p>').attr("class", "Rune_Build_Rate").text(RB_Rate2+"% Win Rate").appendTo(RB_Div2);
        $('<p>').attr("class", "Rune_Build_cnt").text(RB_Cnt2+" Games").appendTo(RB_Div2);
    </script>
</html>
