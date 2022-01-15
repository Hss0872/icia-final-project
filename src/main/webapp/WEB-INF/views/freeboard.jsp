<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://kit.fontawesome.com/f9589fd651.js"></script>
    <link rel="stylesheet" href="/resources/css/board.css?ver=1">
    <link rel="stylesheet" href="/resources/css/community.css?ver=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css?ver=1" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js?ver=1" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="/resources/js/login.js?ver=1"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js?ver=1"></script>
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
<div class="back">
    <div class="out">
        <div class="leftMenu">
            <a class="Logo" href="pMain.html" width="100%">
                <img src="/resources/images/Full.png" alt="First in Last out Logo">
            </a>
            <div class="coment">댓글 많이 쓴 회원 Top10
                <div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">100</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">90</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">80</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">70</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">60</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">50</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">40</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">30</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">20</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">10</div>
                    </div>
                </div>
            </div>
            <div class="look">조회수 많은 글 Top10
                <div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">100</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">90</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">80</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">70</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">60</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">50</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">40</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">30</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">20</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">10</div>
                    </div>
                </div>
            </div>
            <div class="like">좋아요 많은 글 Top10
                <div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">100</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">90</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">80</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">70</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">60</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">50</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">40</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">30</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">20</div>
                    </div>
                    <div>
                        <div class="BLeft">사과</div>
                        <div class="BRight">10</div>
                    </div>
                </div>
            </div>

        </div>
        <div class="Main2">
            <div class="topMenu">
                <div class="allboard" style="cursor: pointer;" onclick="location.href='/community/board/free';">자유 게시판</div>
                <div class="tierboard" style="cursor: pointer;" onclick="location.href='/community/board/lane';">라인별 게시판</div>
            </div>
            <div class="boardA">
                <div class="MainFree">
                    <div class="boardtop">
                        <div class="bTN">
                            <div class="bNot"><b>번호</b></div>
                            <div class="bTitlet"><b>글 제목</b></div>
                            <div class="bWrt"><b>글작성자</b></div>
                            <div class="bDatet"><b>글작성일</b></div>
                            <div class="bLookt"><b>조회수</b></div>
                            <div class="bLiket"><b>좋아요</b></div>
                        </div>
                    </div>
                    <c:forEach var="board" items="${bList}">
                        <div>
                            <div class="post">
                                <div class="bNo">${board.b_free_num}</div>
                                <div class="bTitle">${board.b_free_title}</div>
                                <div class="bWr">${board.b_free_nickname}</div>
                                <div class="bDate">${board.b_free_date}</div>
                                <div class="bLook">${board.b_free_view}</div>
                                <div class="bLike">${board.b_free_like}</div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="pageout">
                        <div class="pageNo" id="pageNo">

                        </div>
                    </div>
                </div>
                <div class="LowMenu">
                    <input type="button" class="write" value="글작성" style="cursor: pointer;" onclick="location.href='/community/write'" >
                    <div class="searchA">
                        <form action="/community/board/free">
                            <select class="search" name="searchType">
                                <option value="b_free_nickname" selected="selected">작성자</option>
                                <option value="b_free_title" >제목</option>
                                <option value="b_free_content" >내용</option>
                            </select>
                            <input type="text" name="keyword" class="searchText">
                            <input type="submit" class="searchB" value="검색">
                        </form>
                    </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
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
    let boardPageNo = document.querySelector('#pageNo');

    if (boardPagingStart != 1 && boardPagingStart != 0) {
        let div_pre = document.createElement('div');
        div_pre.setAttribute('class', 'pagingNoS');
        let a_pre = document.createElement('a');
        if (boardSearchType != '') {
            a_pre.setAttribute('href', '/community/board/free?pageNum=' + (boardPagingStart - 1) + '&searchType=' + boardSearchType +
                '&keyword=' + boardSearchKeyword);
        } else {
            a_pre.setAttribute('href', '/community/board/free?pageNum=' + (boardPagingStart - 1));
        }
        a_pre.innerText = '이전';
        div_pre.append(a_pre);
        boardPageNo.append(div_pre);
    }

    for (let i = boardPagingStart; i <= boardPagingEnd; i++) {

        if (boardPagingStart == 0) {
            break;
        }

        if (boardPagingNum != i) {
            let div_paging = document.createElement('div');
            div_paging.setAttribute('class', 'pagingNoS');
            let a_paging = document.createElement('a');
            if (boardSearchType != '') {
                a_paging.setAttribute('href', '/community/board/free?pageNum=' + i + '&searchType=' + boardSearchType +
                '&keyword=' + boardSearchKeyword);
            } else {
                a_paging.setAttribute('href', '/community/board/free?pageNum=' + i);
            }
            a_paging.innerText = i;
            div_paging.append(a_paging);
            boardPageNo.append(div_paging);
        } else {
            let div_paging = document.createElement('div');
            div_paging.setAttribute('class', 'pagingNoS');
            let font_paging = document.createElement('font');
            font_paging.style.color = '#646464';
            font_paging.innerText = i;
            div_paging.append(font_paging);
            boardPageNo.append(div_paging);
        }
    }

    if (boardPagingTotalPage != boardPagingEnd) {
        let div_next = document.createElement('div');
        div_next.setAttribute('class', 'pagingNoS');
        let a_next = document.createElement('a');
        if (boardSearchType != '') {
            a_next.setAttribute('href', '/community/board/free?pageNum=' + (boardPagingEnd + 1) + '&searchType=' + boardSearchType +
                '&keyword=' + boardSearchKeyword);
        } else {
            a_next.setAttribute('href', '/community/board/free?pageNum=' + (boardPagingEnd + 1));
        }
        a_next.innerText = '다음';
        div_next.append(a_next);
        boardPageNo.append(div_next);
    }
</script>
</html>