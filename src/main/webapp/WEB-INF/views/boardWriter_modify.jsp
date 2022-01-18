<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글작성 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/free_lane.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script src="/resources/ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="/resources/css/boardWriter_modify.css">
    <script src="/resources/js/login.js?ver=1"></script>
    <script src="/resources/js/community.js?ver=1"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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

        <div class="modal">
            <div class="modal_body">Modal
                <button class="fas fa-times" onclick="back()"></button>
                <!-- 로그인 form태그 -->
                <form class="login_modal" onsubmit="return loginFrm()" action="/member/access" method="post">
                    <div class="login_id">
                        <h4>ID</h4>
                        <input type="id" name="m_id" id="id" placeholder="Id" onblur="inspectId()" data-value="false">
                        <div class="idMsg" id="id_check"></div>
                    </div>
                    <div class="login_pw">
                        <h4>Password</h4>
                        <input type="password" name="m_pw" id="pw" placeholder="Password" onblur="inspectPw()"
                               data-value="false">
                        <div class="idMsg" id="pw_check"></div>
                    </div>
                    <div class="login_etc">
                        <div class="forgot_pw">
                            <button type="button" onclick="searchId()">Forgot ID?</button>
                            <button type="button" onclick="searchPw()">
                                Forgot Password?
                            </button>
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
                    <input id="id_search" onblur="inspectEmail()" name="m_email" data-value="false" placeholder="이메일 입력"
                           required>
                    <button type="button" id="id_search_btn" onclick="idSearch()">아이디 찾기</button>
                </form>

                <form method="get" class="certify" style="display: none">
                    <input id="certifyInput" onblur="certifyInspect()" data-value="false" placeholder="인증번호 입력" required>
                    <button type="button" id="certifyBtn" onclick="certifyCation()">확인</button>
                </form>
                <form method="get" class="new_total_form" style="display: none">
                    <input id="change_by_id" class="changeById" type="text" required name="m_id" placeholder="아이디">
                    <input id="new_pw1" class="new_pw" type="password" onblur="new_pw1_inspect()" name="m_pw"
                           data-value="false" placeholder="새비밀번호 설정">
                    <div id="new_pw1_comment" style="display: none">8~16자 영문, 숫자 조합</div>
                    <input id="new_pw2" class="new_pw" type="password" onblur="new_pw2_inspect()" data-value="false"
                           placeholder="새비밀번호 확인">
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
        <a href="/community/board/lane">라인별 게시판</a>
    </div>

    <form action="/community/board/write" id="frm" method="post" enctype="multipart/form-data">
        <table border="1">
            <tr>
                <td>제목</td>
                <td>
                    <select class="search" name="b_write_type">
                        <option value="free" selected="selected">자유게시판</option>
                        <option value="TOP">TOP</option>
                        <option value="JUNGLE">JUNGLE</option>
                        <option value="MIDDLE">MIDDLE</option>
                        <option value="BUTTOM">BUTTOM</option>
                        <option value="SUPPOTER">SUPPOTER</option>
                    </select>
                    <input type="text" id="b_write_title" name="b_write_title" required>
                </td>
            </tr>
            <tr>
                <td>내용</td>
                <td><textarea rows="20" cols="60" id="b_write_content" name="b_write_content"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="글작성">
                    <input type="reset" id="reset" value="취소">
                    <input type="button" onclick="location.href='/community/free/board'" value="글목록">
                </td>
            </tr>
        </table>
    </form>

</div>
</body>
<script>
    var ckeditor_config = {
        resize_enaleb : false,
        enterMode : CKEDITOR.ENTER_BR,
        shiftEnterMode : CKEDITOR.ENTER_P,
        filebrowserUploadUrl : "/community/ckUpload"
    };
    CKEDITOR.replace("b_write_content", ckeditor_config);
</script>
</html>