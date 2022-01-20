<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://kit.fontawesome.com/f9589fd651.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/free_lane.css?ver=1">
    <link rel="stylesheet" href="/resources/css/mypage.css?ver=1">
    <link rel="stylesheet" href="/resources/css/community.css?ver=1">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script src="/resources/js/login.js?ver=2"></script>
    <script src="/resources/js/community.js?ver=2"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<div class="mainVideo">
    <video muted autoplay loop>
        <source src="/resources/images/videos/animated-harrowing-2014.webm" type="video/mp4">
    </video>
</div>
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
                        <source src="/resources/images/videos/mypage_v.mp4" type="video/mp4">
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
                    <div id="client_work_lst" class="client_work_lst"></div>

                </div>

                <div class="client_reply" style="display: none;"> 내가 작성한 댓글목록
                    <div id="client_reply_lst" class="client_reply_lst"></div>
                </div>

            </div>
        </div>
    </div>
</header>

<div class="bg">
    <div class="row" id="boardTitle">

        <div class="col-6" style="text-align: center">
            <a href="/community/board/free">자유게시판</a>
        </div>
        <div class="col-6" style="text-align: center">
            <a href="/community/board/lane">라인별 게시판</a>
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
                <td>${board.b_free_num}</td>
                <td><a href="/community/board/free/${board.b_free_num}">${board.b_free_title}</a>
                    <c:if test="${board.b_free_rycount != 0}">
                        [${board.b_free_rycount}]
                    </c:if></td>
                <td>${board.b_free_nickname}</td>
                <td>${board.b_free_date}</td>
                <td>${board.b_free_view}</td>
                <td>${board.b_free_lcount}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="page-box">
    </div>

    <form class="searchFrm" action="/community/board/free">
        <select class="search" name="searchType">
            <option value="b_free_nickname" selected="selected">작성자</option>
            <option value="b_free_title">제목</option>
            <option value="b_free_content">내용</option>
        </select>
        <input type="text" name="keyword" class="searchText">
        <input type="submit" class="searchB" value="검색">
    </form>
</div>
</body>
<script>

    <%-- ---------------------------- 게시판 관련 스크립트 -------------------------------------- --%>

    let boardSearchKeyword = '${boardSearch.keyword}';
    console.log("boardSearchKeyword = " + boardSearchKeyword);
    let boardSearchType = '${boardSearch.searchType}';
    console.log("boardSearchType = " + boardSearchType);
    let boardPagingStart = Number('${boardPaging.start}');
    console.log("boardPagingStart = " + boardPagingStart);
    let boardPagingEnd = Number('${boardPaging.end}');
    console.log("boardPagingEnd = " + boardPagingEnd);
    let boardPagingTotalPage = Number('${boardPaging.totalPage}');
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
            a_pre.setAttribute('href', '/community/board/free?pageNum=' + (boardPagingStart - 1) + '&searchType=' + boardSearchType +
                '&keyword=' + boardSearchKeyword);
        } else {
            a_pre.setAttribute('href', '/community/board/free?pageNum=' + (boardPagingStart - 1));
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
                a_paging.setAttribute('href', '/community/board/free?pageNum=' + i + '&searchType=' + boardSearchType +
                    '&keyword=' + boardSearchKeyword);
            } else {
                a_paging.setAttribute('href', '/community/board/free?pageNum=' + i);
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
            a_next.setAttribute('href', '/community/board/free?pageNum=' + (boardPagingEnd + 1) + '&searchType=' + boardSearchType +
                '&keyword=' + boardSearchKeyword);
        } else {
            a_next.setAttribute('href', '/community/board/free?pageNum=' + (boardPagingEnd + 1));
        }
        a_next.innerHTML = '&gt;';
        boardPageNo.append(a_next);
    }

    let id = "${sessionScope.id}";
    if (id != "") {
        $('<button>').text('글작성').attr('type', 'button').attr('onclick', "location.href=`/community/board/write`").attr('id','writeBtn').appendTo($('.searchFrm'));
    }

    <%-- ---------------------------- 게시판 관련 스크립트 -------------------------------------- --%>

    //회원가입시
    let $check = '${check}';  //jsp만 읽을수있으므로

    if ($check === '1') {
        Swal.fire({
            title: '이메일 인증을 해주세요.',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        })

    } else if ($check === '2') {
        alert('로그인 실패');
    }


    //클라이언트 -> 이메일 인증
    let $accept = '${emailCheck}';

    if($accept === '1'){

        Swal.fire({
            title: '이메일 인증에 성공했습니다.',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        })

    }else if($accept === '2'){
        alert('이메일 인증 실패');

    }else if($accept === '3'){
        Swal.fire({
            title: '이메일 인증을 이미 하셨습니다.',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        })
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