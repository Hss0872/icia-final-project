<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>라인게시판</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://kit.fontawesome.com/f9589fd651.js"></script>
    <link rel="stylesheet" href="/resources/css/board.css?ver=2">
    <link rel="stylesheet" href="/resources/css/Hboard.css?ver=2">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css?ver=2" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js?ver=2"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script src="/resources/js/login.js?ver=2"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js?ver=2"></script>
</head>
<body>
<header class="header">
    <div class="header_logo">
        <a href="#">
            <a href="/">
                <img src="/resources/images/pngwing.com (3).png">
            </a>
            <h1>Community</h1>
            <p>You Are Free</p>
            <div class="dropdown">
                <span class="dropbtn">Login</span>
                <div class="dropdown-content">
                    <button id="loginBtn" type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal">Join
                    </button>
                </div>
        </a>
    </div>

    <!-- Modal박스 -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Join</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <!-- 로그인 form태그 -->
                <form onsubmit="return loginFrm(event)">
                    <div class="login_id">
                        <h4>ID</h4>
                        <input type="id" name="" id="id" placeholder="Id">
                    </div>
                    <div class="login_pw">
                        <h4>Password</h4>
                        <input type="password" name="" id="pw" placeholder="Password">
                    </div>
                    <div class="login_etc">
                        <div class="forgot_pw">
                            <a href="">Forgot Password?</a>
                        </div>
                        <div class="signUp">
                            <a href="/member/access">SignUp</a>
                        </div>
                    </div>
                    <div class="submit">
                        <input type="submit" value="submit">
                    </div>
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
        <div class="Main">
            <div class="topMenu">
                <div class="allboard" style="cursor: pointer;" onclick="location.href='/community/board/free';">자유 게시판
                </div>
                <div class="tierboard" style="cursor: pointer;" onclick="location.href='/community/board/lane';">라인별 게시판
                </div>
            </div>

            <div class="boardA">
                <div class="MainLineS">
                    <button class="button-56" onclick="location.href='/community/board/lane?lane=TOP'">TOP</button>
                    <button class="button-56" onclick="location.href='/community/board/lane?lane=MIDDLE'">MIDDLE</button>
                    <button class="button-56" onclick="location.href='/community/board/lane?lane=JUNGLE'">JUNGLE</button>
                    <button class="button-56" onclick="location.href='/community/board/lane?lane=BUTTOM'">BUTTOM</button>
                    <button class="button-56" onclick="location.href='/community/board/lane?lane=SUPPOTER'">SUPPOTER</button>
                </div>
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
                                <div class="bNo">${board.b_lane_num}</div>
                                <div class="bTitle">
                                        <a href="/community/board/lane/${board.b_lane_num}">
                                                ${board.b_lane_title}
                                        </a>
                                    <c:if test="${board.b_lane_rycount != 0}">
                                        [${board.b_lane_rycount}]
                                    </c:if>
                                </div>
                                <div class="bWr">${board.b_lane_nickname}</div>
                                <div class="bDate">${board.b_lane_date}</div>
                                <div class="bLook">${board.b_lane_view}</div>
                                <div class="bLike">${board.b_lane_lcount}</div>
                            </div>
                        </div>
                    </c:forEach>
                    <div class="pageout">
                        <ul class="pageNo" id="pageNo">

                        </ul>
                    </div>
                </div>
                <div class="LowMenu">
                    <input type="button" class="write" value="글작성" style="cursor: pointer;"
                           onclick="location.href='/community/write'">
                    <div class="searchA">
                        <form action="/community/board/lane">
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
    let boardPageNo = document.querySelector('#pageNo');

    if (boardPagingStart != 1 && boardPagingStart != 0) {
        let li_pre = document.createElement('li');
        li_pre.setAttribute('class', 'pagingNoS');
        let a_pre = document.createElement('a');
        if (boardSearchType != '') {
            a_pre.setAttribute('href', '/community/board/lane?pageNum=' + (boardPagingStart - 1) + '&lane=' + boardPagingLane + '&searchType=' + boardSearchType +
                '&keyword=' + boardSearchKeyword);
        } else {
            a_pre.setAttribute('href', '/community/board/lane?pageNum=' + (boardPagingStart - 1) + '&lane=' + boardPagingLane);
        }
        a_pre.innerText = '이전';
        li_pre.append(a_pre);
        boardPageNo.append(li_pre);
    }

    for (let i = boardPagingStart; i <= boardPagingEnd; i++) {

        if (boardPagingStart == 0) {
            break;
        }

        if (boardPagingNum != i) {
            let li_paging = document.createElement('li');
            li_paging.setAttribute('class', 'pagingNoS');
            let a_paging = document.createElement('a');
            if (boardSearchType != '') {
                a_paging.setAttribute('href', '/community/board/lane?pageNum=' + i + '&lane=' + boardPagingLane + '&searchType=' + boardSearchType +
                    '&keyword=' + boardSearchKeyword);
            } else {
                a_paging.setAttribute('href', '/community/board/lane?pageNum=' + i + '&lane=' + boardPagingLane);
            }
            a_paging.innerText = i;
            li_paging.append(a_paging);
            boardPageNo.append(li_paging);
        } else {
            let li_paging = document.createElement('li');
            li_paging.setAttribute('class', 'pagingNoS');
            let font_paging = document.createElement('font');
            font_paging.style.color = '#646464';
            font_paging.innerText = i;
            li_paging.append(font_paging);
            boardPageNo.append(li_paging);
        }
    }

    if (boardPagingTotalPage != boardPagingEnd) {
        let li_next = document.createElement('li');
        li_next.setAttribute('class', 'pagingNoS');
        let a_next = document.createElement('a');
        if (boardSearchType != '') {
            a_next.setAttribute('href', '/community/board/lane?pageNum=' + (boardPagingEnd + 1) + '&lane=' + boardPagingLane + '&searchType=' + boardSearchType +
                '&keyword=' + boardSearchKeyword);
        } else {
            a_next.setAttribute('href', '/community/board/lane?pageNum=' + (boardPagingEnd + 1) + '&lane=' + boardPagingLane);
        }
        a_next.innerText = '다음';
        li_next.append(a_next);
        boardPageNo.append(li_next);
    }
</script>
</html>