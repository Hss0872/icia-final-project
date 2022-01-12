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
    </head>

    <body>
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

        <%-- 챔피언 이미지 테스트 : 아래 경로 (챔피언에 따라)로 받아도 실행이 안되면 톰캣 클린하기 -->
<%--        <div class="FiddleSticks imageTest">--%>
<%--            <img src="/resources/images/LOL_CHAMPION_SPELLS/Fiddlesticks/FiddlesticksQ.png">--%>
<%--            <img src="/resources/images/LOL_CHAMPION_SPELLS/Fiddlesticks/FiddlesticksW.png">--%>
<%--            <img src="/resources/images/LOL_CHAMPION_SPELLS/Fiddlesticks/FiddlesticksE.png">--%>
<%--            <img src="/resources/images/LOL_CHAMPION_SPELLS/Fiddlesticks/FiddlesticksR.png">--%>
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

        <div class="ChampionHeader_champion__2ZqIZ ChampionHeader_header__TkIzw">
            <div>
                <div class="CircleBig_wrapper__3hOuX">
                    <img class="Champ_champ140c__ZSREE" src=/resources/images/LOL_CHAMPION_ICON/lol_champion_${championName}.png alt="${championName}">
                    <svg class="CircleBig_border__3QsNj">
                        <circle cx="72" cy="72" r="72" stroke="#333" stroke-width="2" fill="#111"></circle>
                    </svg>

                    <!-- ↑ 까지 작업함 -->

                    <div class="CircleBig_lane__2qKzs">
                        <div class="laneicon" style="background-position: 0px 0px; width: 27px; height: 27px; background-repeat: no-repeat; margin-left: auto; margin-right: auto; background-image: url(resources/images/LOL_POSITION/top.png); background-size: 243px 27px;"></div>
                    </div><svg class="CircleBig_laneborder__2kf6I">
                        <circle cx="23" cy="23" r="23" stroke="#333" stroke-width="1" fill="#111"></circle>
                    </svg>
                    <div class="CircleBig_tier__ul2zF">S+</div><svg class="CircleBig_tierborder__16GoL">
                        <circle cx="23" cy="23" r="23" stroke="#333" stroke-width="1" fill="#111"></circle>
                    </svg>
                </div>
                <div class="SkillList_wrapper__1HtlM">
                    <div class="Skill_skill30__CEeFI"><img src="https://cdn.lolalytics.com/generated/spell64px/shen_p.jpg"
                                                           alt="Shen P">
                        <div>P</div>
                    </div>
                    <div class="Skill_skill30__CEeFI"><img src="https://cdn.lolalytics.com/generated/spell64px/shen_q.jpg"
                                                           alt="Shen Q">
                        <div>Q</div>
                    </div>
                    <div class="Skill_skill30__CEeFI"><img src="https://cdn.lolalytics.com/generated/spell64px/shen_w.jpg"
                                                           alt="Shen W">
                        <div>W</div>
                    </div>
                    <div class="Skill_skill30__CEeFI"><img src="https://cdn.lolalytics.com/generated/spell64px/shen_e.jpg"
                                                           alt="Shen E">
                        <div>E</div>
                    </div>
                    <div class="Skill_skill30__CEeFI"><img src="https://cdn.lolalytics.com/generated/spell64px/shen_r.jpg"
                                                           alt="Shen R">
                        <div>R</div>
                    </div>
                </div>
            </div>
            <div>
                <h1>Shen Build</h1>
                <h2>Shen Top Build, Runes &amp; Counters</h2>
                <p><a href="/lol/shen/build/?lane=top">Shen</a> top has a 52.66% win rate in Platinum+ on Patch 12.1 coming in
                    at rank 1 of 87 and graded S+ Tier on the <a href="/lol/tierlist/">LoL Tierlist</a>. Shen top is a strong
                    counter to <a href="/lol/shen/vs/akali/build/?lane=top&amp;vslane=top">Akali</a>, <a
                            href="/lol/shen/vs/warwick/build/?lane=top&amp;vslane=top">Warwick</a> &amp; <a
                            href="/lol/shen/vs/sylas/build/?lane=top&amp;vslane=top">Sylas</a> while Shen is countered most by <a
                            href="/lol/shen/vs/kayle/build/?lane=top&amp;vslane=top">Kayle</a>, <a
                            href="/lol/shen/vs/vayne/build/?lane=top&amp;vslane=top">Vayne</a> &amp; <a
                            href="/lol/shen/vs/singed/build/?lane=top&amp;vslane=top">Singed</a>. The best Shen players have a
                    56.87% win rate with an average rank of Diamond I on the <a href="/lol/shen/leaderboard/">Shen
                        Leaderboard</a>. Below is a detailed breakdown of the Shen build, runes &amp; counters.</p>
            </div>
            <div>
                <div class="Circle_circle__1UKAB">
                    <div><svg width="80" height="80">
                        <g transform="translate(40,40)">
                            <path
                                    d="M1.3182269663177186,38.97771514167131A39,39,0,0,1,-17.622486381192008,-34.79149283581695L-10.805147645018803,-20.303910568394073A23,23,0,0,0,0.3128604547662688,22.997872039296233Z"
                                    stroke="rgb(193,105,104)" fill-opacity="0.5" fill="rgb(193,105,104)"></path>
                            <path
                                    d="M1.131805237291119,-38.98357368052396A39,39,0,0,1,3.577370722700992,38.83558186396029L2.572004211149535,22.85573876158522A23,23,0,0,0,1.1318052372911143,-22.972135662685794Z"
                                    stroke="rgb(104,185,214)" fill-opacity="0.5" fill="rgb(104,185,214)"></path>
                            <path
                                    d="M-15.574310387544559,-35.75529130006385A39,39,0,0,1,-1.131805237291089,-38.98357368052396L-1.1318052372910916,-22.972135662685794A23,23,0,0,0,-8.75697165137137,-21.267709032640965Z"
                                    stroke="rgb(223,223,223)" fill-opacity="0.5" fill="rgb(223,223,223)"></path>
                        </g>
                    </svg></div>
                    <div class="Circle_magicdamage__Vk_z3">49%</div>
                    <div style="opacity: 0;"></div>
                </div>
            </div>
            <div class="ChampionHeader_stats__f84LW">
                <div>
                    <div>52.66%</div>Win Rate
                </div>
                <div>
                    <div>1 / 87</div>Rank
                </div>
                <div>
                    <div>S+</div>Tier<div class="Tip_q__3v_Eo">?</div>
                </div>
                <div>
                    <div>6.34%</div>Pick Rate
                </div>
                <div>
                    <div>1.91%</div>Ban Rate
                </div>
                <div>
                    <div>105,411</div>Games
                </div>
            </div>
        </div>

        <!-- 챔피언 정보 분석 창 -->
        <div class="Summary_quick__3le_e">
            <div class="Summary_row1__3rZk8">
                <div>Skill Priority<div class="Tip_q__3v_Eo">?</div>
                </div>
                <div>Skill Order<div class="Tip_q__3v_Eo">?</div>
                </div>
                <div>Primary Runes</div>
                <div>Secondary</div>
                <div>Stat Mods</div>
            </div>

            <div class="Summary_row2__3iVg7">
                <div>
                    <div>
                        <div class="SkillPriority_skillpriority__oC3Z5">
                            <div class="Skill_skill36__yk-DO"><img src="https://cdn.lolalytics.com/generated/spell64px/shen_q.jpg" alt="Shen Q">
                                <div>Q</div>
                            </div>
                            <div class="SkillPriority_skillnext__38Exi">
                                <i></i>
                            </div>
                            <div class="Skill_skill36__yk-DO"><img src="https://cdn.lolalytics.com/generated/spell64px/shen_e.jpg" alt="Shen E">
                                <div>E</div>
                            </div>
                            <div class="SkillPriority_skillnext__38Exi">
                                <i></i>
                            </div>
                            <div class="Skill_skill36__yk-DO"><img src="https://cdn.lolalytics.com/generated/spell64px/shen_w.jpg" alt="Shen W">
                                <div>W</div>
                            </div>
                        </div>
                        <div class="Summary_pickwin__PRaVa">
                            <div style="color: rgb(70, 175, 46);">53.1% Win Rate</div><span> 100,454 Games</span>
                        </div>
                    </div>
                    <div class="Summary_title__1Mkrz">Summoner Spells</div>
                    <div class="Summary_items__1Hq4v">
                        <div><img class="Spell_spell32br__og7Xy"
                                  src="https://cdn.lolalytics.com/generated/summonerspell64px/4.jpg" alt="Flash"></div>
                        <div class="Summary_spacer__2XFIf"></div>
                        <div><img class="Spell_spell32br__og7Xy"
                                  src="https://cdn.lolalytics.com/generated/summonerspell64px/14.jpg" alt="Ignite"></div>
                        <div class="Summary_pickwin__PRaVa">
                            <div style="color: rgb(36, 163, 0);">54.3% Win Rate</div><span> 38,109 Games</span>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="SkillOrder_light__2BKVU">
                        <div>
                            <div class="Skill_skill24__272D3"><img
                                    src="https://cdn.lolalytics.com/generated/spell64px/shen_q.jpg" alt="Shen Q">
                                <div>Q</div>
                            </div>
                            <div class=""></div>
                            <div class="SkillOrder_active__1t7oF">2</div>
                            <div class=""></div>
                            <div class="SkillOrder_active__1t7oF">4</div>
                            <div class="SkillOrder_active__1t7oF">5</div>
                            <div class=""></div>
                            <div class="SkillOrder_active__1t7oF">7</div>
                            <div class=""></div>
                            <div class="SkillOrder_active__1t7oF">9</div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                        </div>
                        <div>
                            <div class="Skill_skill24__272D3"><img
                                    src="https://cdn.lolalytics.com/generated/spell64px/shen_w.jpg" alt="Shen W">
                                <div>W</div>
                            </div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class="SkillOrder_active__1t7oF">3</div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class="SkillOrder_active__1t7oF">14</div>
                            <div class="SkillOrder_active__1t7oF">15</div>
                        </div>
                        <div>
                            <div class="Skill_skill24__272D3"><img
                                    src="https://cdn.lolalytics.com/generated/spell64px/shen_e.jpg" alt="Shen E">
                                <div>E</div>
                            </div>
                            <div class="SkillOrder_active__1t7oF">1</div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class="SkillOrder_active__1t7oF">8</div>
                            <div class=""></div>
                            <div class="SkillOrder_active__1t7oF">10</div>
                            <div class=""></div>
                            <div class="SkillOrder_active__1t7oF">12</div>
                            <div class="SkillOrder_active__1t7oF">13</div>
                            <div class=""></div>
                            <div class=""></div>
                        </div>
                        <div>
                            <div class="Skill_skill24__272D3"><img
                                    src="https://cdn.lolalytics.com/generated/spell64px/shen_r.jpg" alt="Shen R">
                                <div>R</div>
                            </div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class="SkillOrder_active__1t7oF">6</div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class="SkillOrder_active__1t7oF">11</div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                            <div class=""></div>
                        </div>
                    </div>
                    <div class="Summary_pickwin__PRaVa">
                        <div style="color: rgb(36, 163, 0);">64.0% Win Rate</div><span> 6,623 Games</span>
                    </div>
                </div>
                <div>
                    <div class="Summary_runes__1b7qR">
                        <div class="RuneSet_rune__3PQbj">
                            <div>
                                <div
                                        style="background-size: 360px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -3px -152px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 360px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -33px -152px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 360px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -213px -152px; width: 24px; height: 24px;">
                                </div>
                            </div>
                            <div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -72px -120px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -144px -120px; width: 24px; height: 24px;">
                                </div>
                                <div
                                        style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -168px -96px; width: 24px; height: 24px;">
                                </div>
                            </div>
                            <div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -216px -96px; width: 24px; height: 24px;">
                                </div>
                                <div
                                        style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -48px -120px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -216px -120px; width: 24px; height: 24px;">
                                </div>
                            </div>
                            <div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -96px -120px; width: 24px; height: 24px;">
                                </div>
                                <div
                                        style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -120px -120px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -24px -72px; width: 24px; height: 24px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="Summary_runes__1b7qR">
                        <div class="RuneSet_rune__3PQbj">
                            <div>
                                <div
                                        style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -144px -24px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: 0px -48px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -24px -48px; width: 24px; height: 24px;">
                                </div>
                            </div>
                            <div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -240px -24px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -96px -24px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -264px -24px; width: 24px; height: 24px;">
                                </div>
                            </div>
                            <div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -216px -24px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -192px -24px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -24px -24px; width: 24px; height: 24px;">
                                </div>
                                <div
                                        style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -48px -24px; width: 24px; height: 24px;">
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
                <div>
                    <div class="Summary_runes__1b7qR">
                        <div class="RuneSet_mod__1-l2z RuneSet_rune__3PQbj">
                            <div>
                                <div
                                        style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -120px 0px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -72px 0px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -96px 0px; width: 24px; height: 24px;">
                                </div>
                            </div>
                            <div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -120px 0px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -24px 0px; width: 24px; height: 24px;">
                                </div>
                                <div
                                        style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -48px 0px; width: 24px; height: 24px;">
                                </div>
                            </div>
                            <div>
                                <div
                                        style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: 0px 0px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -24px 0px; width: 24px; height: 24px;">
                                </div>
                                <div class="Rune_grey__39iTw"
                                     style="background-size: 288px; background-image: url(&quot;https://cdn.lolalytics.com/v/12.1.1/img/tiled/rune60px.png&quot;); background-position: -48px 0px; width: 24px; height: 24px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="Summary_row3__3lr5H">
                <div>Starting Items</div>
                <div>Core Build</div>
                <div>Item 4</div>
                <div>Item 5</div>
                <div>Item 6</div>
            </div>
            <div class="Summary_itemsrow__27AYY">
                <div class="Summary_items__1Hq4v">
                    <div><img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/1054.jpg"
                              alt="Doran's Shield" data-id="1054"></div>
                    <div class="Summary_spacer__2XFIf"></div>
                    <div><img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/2003.jpg"
                              alt="Health Potion" data-id="2003"></div>
                    <div class="Summary_spacer__2XFIf"></div>
                    <div class="Summary_pickwin__PRaVa">
                        <div style="color: rgb(70, 175, 46);">52.8% Win Rate</div><span> 100,606 Games</span>
                    </div>
                </div>
                <div class="Summary_items__1Hq4v">
                    <div><img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/6662.jpg"
                              alt="Frostfire Gauntlet" data-id="6662"></div>
                    <div class="Summary_skillnext__1dEk0"> <i></i> </div>
                    <div><img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/3047.jpg"
                              alt="Plated Steelcaps" data-id="3047">
                        <div class="Summary_win__2epkg">
                            <div style="color: rgb(36, 163, 0);">61.56%</div>
                        </div>
                        <div class="Summary_pick__1tuJG">2,094</div>
                    </div>
                    <div class="Summary_skillnext__1dEk0"> <i></i> </div>
                    <div><img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/4637.jpg"
                              alt="Demonic Embrace" data-id="4637"></div>
                </div>
                <div class="Summary_items__1Hq4v">
                    <div><img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/3748.jpg"
                              alt="Titanic Hydra" data-id="3748">
                        <div class="Summary_win__2epkg">
                            <div style="color: rgb(36, 163, 0);">62.99%</div>
                        </div>
                        <div class="Summary_pick__1tuJG">4,739</div>
                    </div>
                    <div class="Summary_or__2BEIC"> OR </div>
                    <div><img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/3075.jpg"
                              alt="Thornmail" data-id="3075">
                        <div class="Summary_win__2epkg">
                            <div style="color: rgb(36, 163, 0);">60.58%</div>
                        </div>
                        <div class="Summary_pick__1tuJG">12,585</div>
                    </div>
                </div>
                <div class="Summary_items__1Hq4v">
                    <div><img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/4401.jpg"
                              alt="Force of Nature" data-id="4401">
                        <div class="Summary_win__2epkg">
                            <div style="color: rgb(36, 163, 0);">61.51%</div>
                        </div>
                        <div class="Summary_pick__1tuJG">1,299</div>
                    </div>
                    <div class="Summary_or__2BEIC"> OR </div>
                    <div><img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/3075.jpg"
                              alt="Thornmail" data-id="3075">
                        <div class="Summary_win__2epkg">
                            <div style="color: rgb(36, 163, 0);">59.39%</div>
                        </div>
                        <div class="Summary_pick__1tuJG">1,758</div>
                    </div>
                    <div class="Summary_or__2BEIC"> OR </div>
                    <div><img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/3143.jpg"
                              alt="Randuin's Omen" data-id="3143">
                        <div class="Summary_win__2epkg">
                            <div style="color: rgb(36, 163, 0);">58.87%</div>
                        </div>
                        <div class="Summary_pick__1tuJG">2,509</div>
                    </div>
                </div>
                <div class="Summary_items__1Hq4v">
                    <div><img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/3065.jpg"
                              alt="Spirit Visage" data-id="3065">
                        <div class="Summary_win__2epkg">
                            <div style="color: rgb(36, 163, 0);">63.10%</div>
                        </div>
                        <div class="Summary_pick__1tuJG">168</div>
                    </div>
                    <div class="Summary_or__2BEIC"> OR </div>
                    <div><img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/4401.jpg"
                              alt="Force of Nature" data-id="4401">
                        <div class="Summary_win__2epkg">
                            <div style="color: rgb(36, 163, 0);">58.67%</div>
                        </div>
                        <div class="Summary_pick__1tuJG">196</div>
                    </div>
                    <div class="Summary_or__2BEIC"> OR </div>
                    <div><img class="Item_item32br__3G4j0" src="https://cdn.lolalytics.com/generated/item64px/3143.jpg"
                              alt="Randuin's Omen" data-id="3143">
                        <div class="Summary_win__2epkg">
                            <div style="color: rgb(36, 163, 0);">55.94%</div>
                        </div>
                        <div class="Summary_pick__1tuJG">286</div>
                    </div>
                </div>
            </div>
        </div>
    </body>

<script>
    //아이템 빌드 (승률)
    let itemBulidWinRates = ${itemBulidWinRates}
    console.log(itemBulidWinRates);

    //룬 빌드 (승률)
    let runeBulidWinRates = ${runeBulidWinRates}
    console.log(runeBulidWinRates)

    //스킬 빌드 (승률)
    let skillWinRates = ${skillWinRates}
    console.log(skillWinRates)

    //시작 아이템 (승률)
    let startItemWinRates = ${startItemWinRates}
    console.log(startItemWinRates);

    //챔피언 포인트 (숙련도)
    let masterPoints = ${masterPoints}
    console.log(masterPoints);

    //챔피언 패시브
    let championPassives = ${championPassives}
    console.log(championPassives);

    //챔피언별 초상화
    let championNameInfo = ${championInfo};

    //챔피언별 스킬
    let skillInfo = ${skillInfo};

    //아이템
    let itemInfo = ${itemInfo};

    //룬
    let runeInfo = ${runeInfo};

</script>
</html>
