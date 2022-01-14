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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css?ver=1" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js?ver=1" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="/resources/js/login.js?ver=1"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js?ver=1"></script>
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
                <div class="allboard" style="cursor: pointer;" onclick="location.href='/community/board/free';">자유 게시판</div>
                <div class="tierboard" style="cursor: pointer;" onclick="location.href='/community/board/lane';">라인별 게시판</div>
            </div>
            <div class="boardA">
                <div class="board">
                    아놔
                </div>
                <div class="table">
                    아놔
                </div>
            </div>
        </div>
    </div>
</body>
</html>