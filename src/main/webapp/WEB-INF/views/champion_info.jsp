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
        <h1>챔피언 정보 사이트 입니다.</h1>
        <p>환자 : 의사 선생님 아침에 일어날 때 허리가 아파요</p>
        <p>의사 : 그러면 오후에 일어나세요</p>
        <p>환자 : 감사합니다 선생님</p>

        <div class="ChampPortrait">
            <img src="/resources/images/LOL_CHAMPION_ICON/lol_champion_${championName}.png" alt="${championName} img">
        </div>

        <div class="ChampSkill">
            <div class="ChampSkill_Passive">
                <img src="/resources/images/LOL_CHAMPION_PASSIVE/${championName}Passive.png" alt="${championName} P">
                <p class="Explain_box">패시브 텍스트 설명란입니다.</p>
            </div>

            <div class="ChampSkill_Q">
                <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}Q.png" alt="${championName} Q">
            </div>

            <div class="ChampSkill_W">
                <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}W.png" alt="${championName} W">
            </div>

            <div class="ChampSkill_E">
                <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}E.png" alt="${championName} E">
            </div>

            <div class="ChampSkill_R">
                <img src="/resources/images/LOL_CHAMPION_SPELLS/${championName}/${championName}R.png" alt="${championName} R">
            </div>
        </div>

        <%-- 챔피언 이미지 테스트 아래 경로 (챔피언에 따라)로 받아도 실행이 안되면 톰캣 클린하기 -->
<%--        <div class="FiddleSticks imageTest">--%>
<%--            <img src="/resources/images/LOL_CHAMPION_SPELLS/Fiddlesticks/FiddlesticksQ.png">--%>
<%--            <img src="/resources/images/LOL_CHAMPION_SPELLS/Fiddlesticks/FiddlesticksW.png">--%>
<%--            <img src="/resources/images/LOL_CHAMPION_SPELLS/Fiddlesticks/FiddlesticksE.png">--%>
<%--            <img src="/resources/images/LOL_CHAMPION_SPELLS/Fiddlesticks/FiddlesticksR.png">--%>
<%--        </div>--%>

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
