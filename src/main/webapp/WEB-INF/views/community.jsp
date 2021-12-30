<%--
  Created by IntelliJ IDEA.
  User: MinwooKim
  Date: 2021-12-29
  Time: 오후 1:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://kit.fontawesome.com/f9589fd651.js"></script>
    <link rel="stylesheet" href="/resources/css/community.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script src="/resources/js/login.js"></script>
</head>
<body>
<header class="header">
    <div class="header_logo">
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

<!-- main -->
<div class="main">
    <div class="main_chat" id="topmember" name="topmember">

    </div>
    <div class="main_views" id="topviews" name="topviews">

    </div>
    <div class="main_likes" id="toplikes" name="toplikes">

    </div>
</div>

<div class="board">
    <span>자유게시판</span>
    <span>라인별게시판</span>
    <div class="mainboard">
        <div class="mainboard_free"></div>
        <div class="mainboard_lane">
            <a href="#"></a>
            <a href="#"></a>
            <a href="#"></a>
            <a href="#"></a>
            <a href="#"></a>
        </div>
        <div></div>
    </div>
</div>
</body>
</html>
