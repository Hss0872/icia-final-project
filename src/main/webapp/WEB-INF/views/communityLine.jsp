<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://kit.fontawesome.com/f9589fd651.js"></script>
    <link rel="stylesheet" href="/resources/css/board.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="home.js"></script>
</head>
<body>
<header class="header">
    <div class="header_logo">
        <a href="#">
            <a href="/">
                <img src= "/resources/images/pngwing.com (3).png">
            </a>
            <h1>Community</h1>
            <p>You Are Free</p>
            <div class="dropdown">
                <span class="dropbtn">Login</span>
                <div class="dropdown-content">
                    <button id="loginBtn" type="button" class="btn btn-primary"  data-bs-toggle="modal" data-bs-target="#exampleModal">Join</button>
                </div>
        </a>
    </div>
    <div class="header_gnb">
        <ul>
            <li><a href="#">something</a></li>
            <li><a href="#">something</a></li>
            <li><a href="#">something</a></li>
            <li><a href="#">something</a></li>
            <li><a href="#">something</a></li>
        </ul>
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
                            <a href="./joinFrm.html">SignUp</a>
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
            <a class="Logo" href="/community" width="100%">
                <img src="/resources/images/Full.png" alt="First in Last out Logo" width="100%">
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
                <div class="allboard" style="cursor: pointer;" onclick="location.href='/community/free/board';">자유 게시판</div>
                <div class="tierboard" style="cursor: pointer;" onclick="location.href='/community/lane/board';">라인별 게시판</div>
            </div>
            <div class="boardA">
                <div class="MainLineS">
                    <ul class="mline">
                        <li class="mtop">top</li>
                        <li class="mmid">mid</li>
                        <li class="mjungle">jungle</li>
                        <li class="mbot">bot</li>
                        <li class="msup">sup</li>
                    </ul>
                </div>
                <div class="MainLine">
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
                    <div>
                        <div class="post">
                            <div class="bNo">20</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">19</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">18</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">17</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">16</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">15</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">14</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">13</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">12</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">11</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">10</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">9</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">8</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">7</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">6</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">5</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">4</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">3</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">2</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                        <div class="post">
                            <div class="bNo">1</div>
                            <div class="bTitle">가10</div>
                            <div class="bWr">10</div>
                            <div class="bDate">10</div>
                            <div class="bLook">10</div>
                            <div class="bLike">10</div>
                        </div>
                    </div>

                    <div class="pageout">
                        <ul class="pageNo">
                            <a href="#"><li class="pagingNoS">이전</li></a>
                            <a href="#"><li class="pagingNo">1</li></a>
                            <a href="#"><li class="pagingNo">2</li></a>
                            <a href="#"><li class="pagingNo">3</li></a>
                            <a href="#"><li class="pagingNo">4</li></a>
                            <a href="#"><li class="pagingNo">5</li></a>
                            <a href="#"><li class="pagingNo">6</li></a>
                            <a href="#"><li class="pagingNo">7</li></a>
                            <a href="#"><li class="pagingNo">8</li></a>
                            <a href="#"><li class="pagingNo">9</li></a>
                            <a href="#"><li class="pagingNo">10</li></a>
                            <a href="#"><li class="pagingNoS">이후</li></a>
                        </ul>
                    </div>
                </div>
                <div class="LowMenu">
                    <input type="button" class="write" value="글작성" style="cursor: pointer;" onclick="location.href='communityWrite';" >
                    <div class="searchA">
                        <SElect class="search">
                            <option value="작성자" selected="selected">작성자</option>
                            <option value="제목">제목</option>
                            <option value="내용">내용</option>
                        </SElect>
                        <input type="text" class="searchText">
                        <input type="button" class="searchB" value="검색">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>