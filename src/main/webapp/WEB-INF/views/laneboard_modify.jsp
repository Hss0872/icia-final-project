<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>라인별 게시판</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://kit.fontawesome.com/f9589fd651.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/free_lane.css?ver=1">
    <link rel="stylesheet" href="/resources/css/community.css?ver=1">
    <link rel="stylesheet" href="/resources/css/mypage.css?ver=1">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script src = "https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="/resources/js/login.js?ver=2"></script>
    <script src="/resources/js/community.js?ver=2"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

</head>
<body>
<header class="header">
    <div class="header_logo">
        <a href="/">
            <img src="/resources/images/pngwing.com (3).png">
        </a>
        <h1><a href="/community/board/free">Community</a></h1>
        <p>You Are Free</p>
        <div class="dropdown">
            <span class="dropbtn">Login</span>
            <div class="dropdown-content">
                <button class="btn-open-popup" onclick="modal_open()">Join</button>   <!--login -->
                <button class="logout_btn" onclick="logout()">Logout</button>   <!--logout-->
                <button class="myPage_btn" onclick="myPage()">myPage</button>   <!--myPage-->
            </div>
        </div>

        <div class="modal" >
            <div class="modal_body">
                <button onclick="back()"> <i class="fas fa-angle-double-left fa-2x"></i></button>
                <!-- 로그인 form태그 -->
                <form class= "login_modal" method="post">
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
                        <input type="button" onclick="loginFrm()" value="submit"/>
                    </div>
                </form>
                <form method="post" class="searchId" style="display: none"> 아이디찾기
                    <div> <input id="id_search" onblur="inspectEmail()" name="m_email" data-value="false" placeholder="이메일 입력" required> </div>
                    <button type="button" id="id_search_btn" onclick="idSearch()">전송</button>
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
                <div class="myPage_form" style="display: none">  <!--마이페이지 -->
                    <video muted autoplay loop>
                        <source src="/resources/images/videos/animated-starguardian.mp4" type="video/mp4">
                    </video>
                    <div  class="client_info" onclick="client_info()"><button>사용자 가입정보 수정</button></div>
                    <div class="client_info_update" onclick="client_work()">
                        <button>내가 작성한 글 목록</button>
                    </div>
                    <div class="client_info_update" onclick="client_reply()">
                        <button>내가 작성한 댓글 목록</button></div>
                </div>

                <form class="profileFrm" style="display: none;" method="post"> 회원정보 수정
                    <div style="display: none"> <input id="p_id" name="m_id" style="display: none"/></div>
                    <div class="profileDiv"> <input id="p_nickname" type="text" placeholder="닉네임 변경" name="m_nickname" onblur="profile_nickname()"  data-value="false"/></div>
                    <div class="profileDiv"> <input id="p_phone" type="text" placeholder="전화번호 변경" name="m_phone" onblur="profile_phone()" data-value="false"></div>
                    <div class="profileDiv"> <input id="p_pw" type="password" placeholder="기존 비밀번호" name="m_pw" onblur="profile_pw()" data-value="false"></div>
                    <div class="profileDiv"> <input id="p_newPw" type="password" placeholder="변경할 비밀번호" name="m_newpw" onblur="profile_newPw()" data-value="false"></div>
                    <div class="profileDiv"> <input id="p_confirmPw" type="password" placeholder="변경할 비밀번호확인" name="m_newpw2" onblur="profile_confirmPw()" data-value="false"></div>
                    <button id="profileBtn" type="button" onclick="profile_inspect()">변경</button>
                </form>

                <div class="client_work" style="display: none;"> 내가 작성한 글목록
                    <div class="client_work_lst"><a href="" style="color: rgb(136, 17, 184);">글1dsfdfdfdf</a></div>
                    <div class="client_work_lst"><a href="" style="color: rgb(136, 17, 184);">글2</a></div>
                    <div class="client_work_lst"><a href="" style="color: rgb(136, 17, 184);">글3</a></div>
                    <div class="client_work_lst"><a href="" style="color: rgb(136, 17, 184);">글4</a></div>
                    <div class="client_work_lst"><a href="" style="color: rgb(136, 17, 184);">글5</a></div>
                    <div class="client_work_lst"><a href="" style="color: rgb(136, 17, 184);">글6</a></div>
                    <div class="client_work_lst"><a href="" style="color: rgb(136, 17, 184);">글7</a></div>
                </div>

                <div class="client_reply" style="display: none;"> 내가 작성한 댓글목록
                    <div class="client_reply_lst"><a href="" style="color: rgb(136, 17, 184);">댓글1dsfdfdfdf</a></div>
                    <div class="client_reply_lst"><a href="" style="color: rgb(136, 17, 184);">댓글2</a></div>
                    <div class="client_reply_lst"><a href="" style="color: rgb(136, 17, 184);">댓글3</a></div>
                    <div class="client_reply_lst"><a href="" style="color: rgb(136, 17, 184);">댓글4</a></div>
                    <div class="client_reply_lst"><a href="" style="color: rgb(136, 17, 184);">댓글5</a></div>
                    <div class="client_reply_lst"><a href="" style="color: rgb(136, 17, 184);">댓글6</a></div>
                    <div class="client_reply_lst"><a href="" style="color: rgb(136, 17, 184);">댓글7</a></div>
                </div>
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

    //아이디 찾기 이메일 존재 유무
    let $emailHas = '${hasEmailCheck}';

    if($emailHas == '1'){
        Swal.fire({
            title: '존재하지 않는 이메일입니다.',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        })
    }



    //세션객체를 통한 새로고침 문제 해결

    window.onload = function(){

        let joinBtnStyle = document.querySelector('.btn-open-popup');
        let logoutStyle = document.querySelector('.logout_btn');
        let myPageBtn = document.querySelector('.myPage_btn');
        //let id = "<%=session.getAttribute("id")%>"  //문자열로해서 담아주려고
        window.id = "${sessionScope.id}";
        console.log(id);
        if(window.id != ""){ //세션객체 null이 아닐때
            joinBtnStyle.style.display = 'none';
            logoutStyle.style.display = 'block';
            myPageBtn.style.display ='block';
        }else if(window.id == ""){
            joinBtnStyle.style.display = 'block';
            logoutStyle.style.display = 'none';
            myPageBtn.style.display ='none';
        }
    }
</script>
</html>
