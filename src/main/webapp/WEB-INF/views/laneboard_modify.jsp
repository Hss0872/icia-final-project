<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>라인별 게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/free_lane.css">
    <script src="/resources/js/login.js?ver=1"></script>
    <script src="/resources/js/community.js?ver=1"></script>
    <script src = "https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
<header class="header">
    <div class="header_logo">
        <a href="/">
            <img src="/resources/images/pngwing.com (3).png">
        </a>
        <h1><a href="/community">Community</a></h1>
        <p>You Are Free</p>
        <div class="dropdown">
            <span class="dropbtn">Login</span>
            <div class="dropdown-content">
                <button class="btn-open-popup" onclick="modal_open()">Join</button>   <!--login -->
                <button class="logout_btn" onclick="logout()">Logout</button>   <!--logout-->
            </div>
        </div>

        <div class="modal" >
            <div class="modal_body">Modal
                <button class="fas fa-times" onclick="back()"></button>
                <!-- 로그인 form태그 -->
                <form class= "login_modal" onsubmit="return loginFrm()" action="/member/access" method="post">
                    <div class="login_id">
                        <h4>ID</h4>
                        <input type="id" name="m_id" id="id" placeholder="Id" onblur="inspectId()" data-value="false">
                        <div class="idMsg" id="id_check"></div>
                    </div>
                    <div class="login_pw">
                        <h4>Password</h4>
                        <input type="password" name="m_pw" id="pw" placeholder="Password" onblur="inspectPw()" data-value="false">
                        <div class="idMsg" id="pw_check"></div>
                    </div>
                    <div class="login_etc">
                        <div class="forgot_pw">
                            <button type="button" onclick="searchId()" >Forgot ID?</button>
                            <button type="button" onclick="searchPw()" >
                                Forgot Password?</button>
                        </div>
                        <div class="signUp">
                            <a href="/member/join">SignUp</a>
                        </div>
                    </div>
                    <div class="submit" id="loginSubmitBtn">
                        <input type="submit" value="submit"/>
                    </div>
                </form>
                <form method="post" class="searchId" style="display: none">
                    <input id="id_search" onblur="inspectEmail()" name="m_email" data-value="false" placeholder="이메일 입력" required>
                    <button type="button" id="id_search_btn" onclick="idSearch()">아이디 찾기</button>
                </form>

                <form method="get" class="certify" style="display: none">
                    <input id="certifyInput"  onblur="certifyInspect()" data-value="false" placeholder="인증번호 입력" required>
                    <button type="button" id="certifyBtn" onclick="certifyCation()">확인</button>
                </form>
                <form method="get" class="new_total_form" style="display: none">
                    <input id="change_by_id" class="changeById" type="text" required name="m_id" placeholder="아이디">
                    <input id="new_pw1" class="new_pw" type="password" onblur="new_pw1_inspect()" name="m_pw" data-value="false" placeholder="새비밀번호 설정">
                    <div id="new_pw1_comment" style="display: none">8~16자 영문, 숫자 조합</div>
                    <input id="new_pw2" class="new_pw" type="password" onblur="new_pw2_inspect()" data-value="false" placeholder="새비밀번호 확인">
                    <button type="button" id="new_pw_submit" onclick="changePw()">비밀번호 변경</button>
                    <div id="new_pw2_comment" style="display: none">동일한 비밀번호를 입력해주세요.</div>
                </form>
            </div>
        </div>
    </div>

</header>

<div class="bg">
    <video muted autoplay loop>
        <source src="animated-zaun.mp4" type="video/mp4">
    </video>
    <div id="boardTitle">
        <a href="/community/board/free">자유게시판</a>
        <div class="dropdown2">
            <span class="dropbtn2">라인별 게시판</span>
            <div class="dropdown2-content">
                <button class="btn-open-popup2" onclick="location.href='/community/board/lane?lane=TOP'">Top</button>
                <button class="btn-open-popup2" onclick="location.href='/community/board/lane?lane=MIDDLE'">Jungle</button>
                <button class="btn-open-popup2" onclick="location.href='/community/board/lane?lane=JUNGLE'">Middle</button>
                <button class="btn-open-popup2" onclick="location.href='/community/board/lane?lane=BUTTOM'">Bottom</button>
                <button class="btn-open-popup2" onclick="location.href='/community/board/lane?lane=SUPPOTER'">Support</button>
            </div>
        </div>
    </div>
    <table>
        <colgroup>
            <col class="free_no">
            <col class="free_title">
            <col class="free_writer">
            <col class="free_date">
            <col class="free_views">
            <col class="free_likes">
        </colgroup>
        <thead>
        <tr id="mainTr">
            <th>글번호</th>
            <th>글제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
            <th>좋아요</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="board" items="${bList}">
            <tr>
                <td>${board.b_lane_num}</td>
                <td><a href="/community/board/lane/${board.b_lane_num}">
                        ${board.b_lane_title}</a>
                    <c:if test="${board.b_lane_rycount != 0}">
                        [${board.b_lane_rycount}]
                    </c:if></td>
                <td>${board.b_lane_nickname}</td>
                <td>${board.b_lane_date}</td>
                <td>${board.b_lane_view}</td>
                <td>${board.b_lane_lcount}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="page-box">
    </div>

    <form class="searchFrm" action="/community/board/lane">
        <select class="search" name="searchType">
            <option value="b_lane_nickname" selected="selected">작성자</option>
            <option value="b_lane_title" >제목</option>
            <option value="b_lane_content" >내용</option>
        </select>
        <input type="text" name="lane" value="${boardPaging.lane}" style="display: none">
        <input type="text" name="keyword" class="searchText">
        <input type="submit" class="searchB" value="검색">
    </form>
    <button onclick="location.href='/community/board/write'">글작성</button>
</div>
</body>
<script>
    let boardSearchKeyword = '${boardSearch.keyword}';
    console.log("boardSearchKeyword = " + boardSearchKeyword);
    let boardSearchType = '${boardSearch.searchType}';
    console.log("boardSearchType = " + boardSearchType);
    let boardPagingStart = Number('${boardPaging.start}');
    console.log("boardPagingStart = " + boardPagingStart);
    let boardPagingEnd = Number('${boardPaging.end}')
    console.log("boardPagingEnd = " + boardPagingEnd)
    let boardPagingTotalPage = Number('${boardPaging.totalPage}')
    console.log("boardPagingTotalPage = " + boardPagingTotalPage);
    let boardPagingType = '${boardPaging.type}';
    console.log("boardPagingType = " + boardPagingType);
    let boardPagingLane = '${boardPaging.lane}';
    console.log("boardPagingLane = " + boardPagingLane);
    let boardPagingNum = Number('${boardPaging.pageNum}');
    console.log("boardPagingNum = " + boardPagingNum);
    let boardPageNo = document.querySelector('.page-box');

    if (boardPagingStart != 1 && boardPagingStart != 0) {
        let a_pre = document.createElement('a');
        a_pre.setAttribute('class', 'btn');
        if (boardSearchType != '') {
            a_pre.setAttribute('href', '/community/board/lane?pageNum=' + (boardPagingStart - 1) + '&lane=' + boardPagingLane + '&searchType=' + boardSearchType +
                '&keyword=' + boardSearchKeyword);
        } else {
            a_pre.setAttribute('href', '/community/board/lane?pageNum=' + (boardPagingStart - 1) + '&lane=' + boardPagingLane);
        }
        a_pre.innerHTML = '&lt;';
        boardPageNo.append(a_pre);
    }

    for (let i = boardPagingStart; i <= boardPagingEnd; i++) {

        if (boardPagingStart == 0) {
            break;
        }

        if (boardPagingNum != i) {
            let a_paging = document.createElement('a');
            a_paging.setAttribute('class', 'btn');
            if (boardSearchType != '') {
                a_paging.setAttribute('href', '/community/board/lane?pageNum=' + i + '&lane=' + boardPagingLane + '&searchType=' + boardSearchType +
                    '&keyword=' + boardSearchKeyword);
            } else {
                a_paging.setAttribute('href', '/community/board/lane?pageNum=' + i + '&lane=' + boardPagingLane);
            }
            a_paging.innerText = i;
            boardPageNo.append(a_paging);
        } else {
            let a_paging = document.createElement('a');
            a_paging.setAttribute('class', 'btn');
            a_paging.style.color = '#646464';
            a_paging.innerText = i;
            a_paging.removeAttribute('href');
            boardPageNo.append(a_paging);
        }
    }

    if (boardPagingTotalPage != boardPagingEnd) {
        let a_next = document.createElement('a');
        a_next.setAttribute('class', 'btn');
        if (boardSearchType != '') {
            a_next.setAttribute('href', '/community/board/lane?pageNum=' + (boardPagingEnd + 1) + '&lane=' + boardPagingLane + '&searchType=' + boardSearchType +
                '&keyword=' + boardSearchKeyword);
        } else {
            a_next.setAttribute('href', '/community/board/lane?pageNum=' + (boardPagingEnd + 1) + '&lane=' + boardPagingLane);
        }
        a_next.innerHTML = '&gt;';
        boardPageNo.append(a_next);
    }

    let id = "${sessionScope.id}";
    if (id != "") {
        $('<button>').text('글작성').attr('type', 'button').attr('onclick', "location.href=`/community/board/write`").appendTo($('.searchFrm'));
    }

</script>
</html>
