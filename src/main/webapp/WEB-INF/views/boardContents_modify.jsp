<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 상세보기</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://kit.fontawesome.com/f9589fd651.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/free_lane.css">
    <link rel="stylesheet" href="/resources/css/community.css?ver=2">
    <link rel="stylesheet" href="/resources/css/mypage.css?ver=2">
    <link rel="stylesheet" href="/resources/css/boardContents.css?ver=2">
    <link rel="stylesheet" href="/resources/css/test123.css?ver=2">
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
                        <input type="id" name="m_id" id="id" placeholder="Id"
                               onkeydown="javascript:if(event.keyCode ==13) loginFrm()"
                               onblur="inspectId()" data-value="false">
                        <div class="idMsg" id="id_check"></div>
                    </div>
                    <div class="login_pw">
                        <h4>Password</h4>
                        <input type="password" name="m_pw" id="pw" placeholder="Password"
                               onkeydown="javascript:if(event.keyCode ==13) loginFrm()"
                               onblur="inspectPw()" data-value="false">
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
    <div id="boardTitle" class="row" style="margin-top: 7px">
        <div class="col-6" style="text-align: center">
            <a href="/community/board/free" >자유게시판</a>
        </div>
        <div class="col-6" style="text-align: center">
            <a href="/community/board/lane">라인별 게시판</a>
        </div>

    </div>
    <div class="boardContent1">
        <div class="contentsInfo">
            <div class="contentsWriter"></div>
            <div class="contentsDate"></div>
            <div class="contentsHit"></div>
        </div>
        <div class="contentsHeadMenu">
            <div class="watch-face">
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
                <div class="circle"></div>
            </div>
            <div class="topmenuInfo">
                <div class="contentsCategory"></div>
                <div class="boardNumber"></div>
                <div class="contentsIp"></div>
                <div class="contentsTopMenu">
            </div>
        </div>
        <div class="boardMain">
            <div class="boardSubject">
                <h1 id="boardSubjectH1"></h1>
            </div>
            <div class="boardcontent2">
                <div id="maincontentBody" class="contentBody"></div>
                <div class="bbsViewRecom">
                    <div class="contentsBotMenu">
                        <div class="botMenuLeft">
                            <div class="contentsBottomMenu">
                            </div>
                        </div>
                        <div class="botMenuCenter">
                            <div class="bttnRecom">
                                <button class="like_button" onclick="add_like_count()"></button>
                                <button class="dislike_button" onclick="delete_like_count()"></button>
                            </div>
                        </div>
                        <div class="botMenuRight">
                            <div class="bttn84Report">
                                <a></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="boardBotMenu">
                <div class="leftMenu">
                </div>
                <div class="rightMenu">
                </div>
            </div>
            <div class="replyFrm">
                <div class="replyList">
                    <table id="add_reply_list">
                    </table>
                </div>
                <div class="addreply">
                    <form>
                        <table>
                            <tr>
                                <td class="replyTextareaTd">
                                    <div class="replyTextarea">
                                        <textarea id="replyTextarea"></textarea>
                                    </div>
                                </td>
                                <td class="replySubmitTd">
                                    <div>
                                        <button type="button" class="replySubmit" onclick="add_reply()">
                                            버튼
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>
    let boardType = '${boardType}';
    let board_number;
    let currentStatus = '${currentStatus}';

    if (boardType == "free") {
        console.log('${freeBoardInfo.b_free_nickname}');
        $('.contentsWriter').text('${freeBoardInfo.b_free_nickname}');
        $('.contentsDate').text('${freeBoardInfo.b_free_date}');
        $('.contentsHit').text('조회수 : ' + '${freeBoardInfo.b_free_view}' + ' 좋아요 : ' + '${freeBoardInfo.b_free_lcount}');
        $('.contentsCategory').text('[자유게시판]');
        board_number = '${freeBoardInfo.b_free_num}';
        change_like_button_tag(currentStatus, '${freeBoardInfo.b_free_lcount}');
        $('#boardSubjectH1').text('${freeBoardInfo.b_free_title}');
        $('#maincontentBody').html(`
            ${freeBoardInfo.b_free_content}
           `);

        $('<button>').attr('onclick', "location.href=`/community/board/free/`")
            .text("목록이동").appendTo($('.rightMenu'));

        if ('${freeBoardInfo.b_free_id}' == '${id}') {
            $('<button>').attr('onclick', "location.href=`/community/board/free/${freeBoardInfo.b_free_num}/update`")
            .text("글수정").appendTo($('.leftMenu'));
            $('<button>').attr('onclick', "location.href=`/community/board/free/${freeBoardInfo.b_free_num}/delete`")
                .text("글삭제").appendTo($('.leftMenu'));
            $('<button>').attr('onclick', "location.href=`/community/board/write`")
                .text("글작성").appendTo($('.rightMenu'));
        }

        getReplyList(boardType, '${freeBoardInfo.b_free_num}').then(
            function (result) {
                add_reply_tag(result, boardType);
            }
        );


    } else {
        $('.contentsWriter').text('${laneBoardInfo.b_lane_nickname}');
        $('.contentsDate').text('${laneBoardInfo.b_lane_date}');
        $('.contentsHit').text('조회수 : ' + '${laneBoardInfo.b_lane_view}' + ' 좋아요 : ' + '${laneBoardInfo.b_lane_lcount}');
        $('.contentsCategory').text('[라인게시판] [' + '${laneBoardInfo.b_lane_type}' + ']');
        board_number = '${laneBoardInfo.b_lane_num}';
        change_like_button_tag(currentStatus, '${laneBoardInfo.b_lane_lcount}');
        $('#boardSubjectH1').text('${laneBoardInfo.b_lane_title}');
        $('#maincontentBody').html(`
            ${laneBoardInfo.b_lane_content}
            `);

        $('<button>').attr('onclick', "location.href=`/community/board/lane/`")
            .text("목록이동").appendTo($('.rightMenu'));

        if ('${laneBoardInfo.b_lane_id}' == '${id}') {
            $('<button>').attr('onclick', "location.href=`/community/board/lane/${laneBoardInfo.b_lane_num}/update`")
                .text("글수정").appendTo($('.leftMenu'));
            $('<button>').attr('onclick', "location.href=`/community/board/lane/${laneBoardInfo.b_lane_num}/delete`")
                .text("글삭제").appendTo($('.leftMenu'));
            $('<button>').attr('onclick', "location.href=`/community/board/write`")
                .text("글작성").appendTo($('.rightMenu'));
        }

        getReplyList(boardType, '${laneBoardInfo.b_lane_num}').then(
            function (result) {
                add_reply_tag(result, boardType);
            }
        )
    }

    function getReplyList(boardType, bNum) {

        return fetch('/community/board/' + boardType + '/' + bNum,
            {
                method: 'post',
                headers: {
                    "Content-Type": "application/json",
                    "accept": "application/json;charset=utf-8"
                }
            }).then(response => response.json())
    }

    /*function add_reply_tag(result, boardType) {
        let $add_reply_list = $('.replyList');
        $add_reply_list.empty();
        for (let row of result) {
            let $reply_setTr = $('<tr>').attr('class', 'reply_setTr');
            let $reply_innerTr = $('<tr>').attr('class', 'reply_innerTr');
            $('<td>').text(row['r_' + boardType + '_nickname']).attr('class', 'reply_id').appendTo($reply_innerTr);
            let playTime = new Date(row['r_' + boardType + '_date']);
            $('<td>').text(playTime.toLocaleString()).attr('class', 'reply_date').appendTo($reply_innerTr);
            if (row['r_' + boardType + '_id'] == '${id}') {
                let $reply_delete = $('<td>').attr('class', 'reply_delete');
                $('<button>').text('삭제').attr('onclick', 'delete_reply(' + row['r_' + boardType + '_num'] + ')').appendTo($reply_delete);
                $reply_delete.appendTo($reply_innerTr);
            } else {
                $('<td>').attr('class', 'reply_delete').appendTo($reply_innerTr);
            }

            $reply_innerTr.appendTo($reply_setTr);
            let $2nd_tr = $('<tr>');
            $('<td>').attr('class', 'reply_td').attr('colspan', '3').text(row['r_' + boardType + '_content']).appendTo($2nd_tr);
            $2nd_tr.appendTo($reply_setTr);
            $reply_setTr.appendTo($add_reply_list);
        }
    }*/
    function add_reply_tag(result,boardType){
        let boardList=$('.replyList').attr('class','container replyList').css("width","81.2%").css("margin","auto");
        boardList.empty();
        for(let i of result){
            let row1 = $('<div>').attr('class','row').css('border', 'solid 1px lightgray').css('padding', '1px');
            let row2 = $("<div>").attr('class',"row con").css('margin-left', '15px' );
            let col1 = $("<div>").attr('class',"col-4 name").css("text-align","center");
            let col2 = $("<div>").attr('class',"col-4 time").css("text-align","center");
            let col3 = $("<div>").attr('class',"col-4 btn").css("text-align","right");
            col1.text(i['r_' + boardType + '_nickname']).attr('class', 'reply_id');
            let playTime = new Date(i['r_' + boardType + '_date']);
            col2.text(playTime.toLocaleString()).attr('class', 'reply_date');
            if (i['r_' + boardType + '_id'] == '${id}') {
                $('<button>').attr('class', 'btn btn-light').text('삭제').attr('onclick', 'delete_reply(' + i['r_' + boardType + '_num'] + ')').appendTo(col3);
            }

            row2.text(i['r_' + boardType + '_content']);
            row1.append(col1);
            row1.append(col2);
            row1.append(col3);
            row1.append(row2);
            row1.appendTo(boardList);
        }
    }

    function delete_reply(r_type_num) {
        return fetch('/community/board/' + boardType + '/' + board_number + '/reply/delete',
            {
                method: 'post',
                headers: {
                    "Content-Type": "application/json",
                    "accept": "application/json;charset=utf-8"
                },
                body: JSON.stringify({
                    r_type_num: r_type_num
                })
            }).then(response => response.json())
            .then(result => add_reply_tag(result, boardType))
            .catch((err) => {
                alert("로그인 해주세요.");
            })
    }

    function add_reply() {
        let replyTextarea = $('#replyTextarea').val();
        return fetch('/community/board/' + boardType + '/' + board_number + '/reply',
            {
                method: 'post',
                headers: {
                    "Content-Type": "application/json",
                    "accept": "application/json;charset=utf-8"
                },
                body: JSON.stringify({
                    content: replyTextarea
                })
            }).then(response => response.json())
            .then(result => add_reply_tag(result, boardType))
            .catch((err) => {
                alert("로그인 해주세요.");
            })
    }

    function add_like_count(){
        return fetch('/community/board/' + boardType + '/' + board_number + '/like',
            {
                method: 'post',
                headers: {
                    "Content-Type": "application/json",
                    "accept": "application/json;charset=utf-8"
                }
            })
            .then(response => response.json())
            .then((result) =>{
                change_like_button_tag('true', result);
            })
            .catch((err) => {
                alert("로그인 해주세요.");
            })
    }

    function delete_like_count(){
        return fetch('/community/board/' + boardType + '/' + board_number + '/dislike',
            {
                method: 'post',
                headers: {
                    "Content-Type": "application/json",
                    "accept": "application/json;charset=utf-8"
                }
            })
            .then(response => response.json())
            .then((result) =>{
                change_like_button_tag('false', result);
            })
            .catch((err) => {
                alert("로그인 해주세요.");
            })
    }

    function change_like_button_tag(status, result) {
        if (status == 'true') {
            $('.like_button').css('display', 'none');
            $('.like_button').empty();
            $('.dislike_button').css('display', 'inline-block') ;
            $('.dislike_button').empty();
            $('.dislike_button').text('추천 ' + result);
        } else {
            $('.dislike_button').css('display', 'none');
            $('.dislike_button').empty();
            $('.like_button').css('display', 'inline-block') ;
            $('.like_button').empty();
            $('.like_button').text('추천 ' + result);
        }
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