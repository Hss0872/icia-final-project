<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글수정 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/free_lane.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script src="/resources/ckeditor/ckeditor.js"></script>
    <link rel="stylesheet" href="/resources/css/boardWriter_modify.css">
    <link rel="stylesheet" href="/resources/css/community.css?ver=1">
    <link rel="stylesheet" href="/resources/css/mypage.css?ver=1">

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="/resources/js/login.js?ver=1"></script>
    <script src="/resources/js/community.js?ver=1"></script>
    <style>
        .test{
            width: 92%;
        }
    </style>
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
                    <div class="client_work_lst"><a href="" style="color: rgb(136, 17, 184);">글1</a></div>
                    <div class="client_work_lst"><a href="" style="color: rgb(136, 17, 184);">글2</a></div>
                    <div class="client_work_lst"><a href="" style="color: rgb(136, 17, 184);">글3</a></div>
                    <div class="client_work_lst"><a href="" style="color: rgb(136, 17, 184);">글4</a></div>
                    <div class="client_work_lst"><a href="" style="color: rgb(136, 17, 184);">글5</a></div>
                    <div class="client_work_lst"><a href="" style="color: rgb(136, 17, 184);">글6</a></div>
                    <div class="client_work_lst"><a href="" style="color: rgb(136, 17, 184);">글7</a></div>
                </div>

                <div class="client_reply" style="display: none;"> 내가 작성한 댓글목록
                    <div class="client_reply_lst"><a href="" style="color: rgb(136, 17, 184);">댓글1</a></div>
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

<div class="container-fluid bg">
    <video muted autoplay loop>
        <source src="animated-zaun.mp4" type="video/mp4">
    </video>
    <div id="boardTitle" class="row selectborad">
        <div class="col-6">
            <a href="/community/board/free">자유게시판</a>
        </div>
        <div class="col-6">
            <a href="/community/board/lane">라인별 게시판</a>
        </div>

    </div>

    <form action=""  method="post" enctype="multipart/form-data">

        <div class="container-fluid kk">
            <div class="row row1">
                <div class="col-1 title">
                    <p>제목</p>
                </div>
                <div class="col-11 searchBar">
                    <select class="form-select selectbar" aria-label="Default select example" name="b_write_type" aria-readonly="true">
                        <option>게시판 목록</option>
                        <option class="select_free" value="free">자유 게시판</option>
                        <option class="TOP" value="TOP" >TOP</option>
                        <option class="JUNGLE" value="JUNGLE" >JUNGLE</option>
                        <option class="MIDDLE" value="MIDDLE" >MIDDLE</option>
                        <option class="BUTTOM" value="BUTTOM" >BUTTOM</option>
                        <option class="SUPPOTER" value="SUPPOTER">SUPPOTER</option>
                    </select>
                    <input name="b_write_title" required class="form-control form-control-lg" type="text" placeholder="title" aria-label=".form-control-lg example">

                </div>
            </div>
            <div class="row content">
                <div class="col-12 input-group">
                    <span class="input-group-text" style="width: 8%">내용</span>
                    <div class="test">
                        <textarea class="form-control" aria-label="With textarea" id="b_write_content" name="b_write_content" style="height: 300px;"></textarea>
                    </div>
                </div>
            </div>
            <div class="row button">
                <div class="col-4"></div>

                <div class="col-4 btn-group" role="group" aria-label="Basic outlined example">
                    <button type="submit" class="btn btn-outline-primary">글수정</button>
                    <button type="reset" class="btn btn-outline-primary" id="reset">취소</button>
                    <button type="button" class="btn btn-outline-primary" onclick="location.href='/community/free/board'">글목록</button>
                </div>
                <div class="col-4"></div>
            </div>
        </div>
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

    let boardType = '${boardType}';

    if (boardType == 'free') {
        $('.select_free').attr('selected', 'selected');
        $('.form-control').val('${freeBoardInfo.b_free_title}');
        CKEDITOR.instances.b_write_content.setData(`
            ${freeBoardInfo.b_free_content}
        `)
    } else {
        $('.${laneBoardInfo.b_lane_type}').attr('selected', 'selected');
        $('.form-control').val('${laneBoardInfo.b_lane_title}');
        CKEDITOR.instances.b_write_content.setData(`
            ${laneBoardInfo.b_lane_content}
        `)
    }
</script>
</html>