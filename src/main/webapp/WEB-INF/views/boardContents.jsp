<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 상세보기</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://kit.fontawesome.com/f9589fd651.js"></script>
    <link rel="stylesheet" href="/resources/css/board.css?ver=1">
    <link rel="stylesheet" href="/resources/css/boardContents.css?ver=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css?ver=1" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js?ver=1"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script src="/resources/js/login.js?ver=1"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js?ver=1"></script>
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
                <div class="allboard" style="cursor: pointer;" onclick="location.href='/community/board/free';">자유
                    게시판
                </div>
                <div class="tierboard" style="cursor: pointer;" onclick="location.href='/community/board/lane';">라인별
                    게시판
                </div>
            </div>
            <div class="boardContent1">
                <div class="contentsInfo">
                    <div class="contentsWriter"></div>
                    <div class="contentsDate"></div>
                    <div class="contentsHit"></div>
                </div>
                <div class="contentsHeadMenu">
                    <div class="topmenuInfo">
                        <div class="contentsCategory"></div>
                        <div class="boardNumber"></div>
                        <div class="contentsIp"></div>
                        <div class="contentsTopMenu">
                            <a href=javascript:location.href=document.referrer>목록</a>
                            |
                            <a>댓글</a></div>
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
                                            <span>
                                                <a href=javascript:location.href=document.referrer>목록</a>
                                                |
                                                <a>댓글</a>
                                            </span>
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
                                        <a>따봉업확인</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="boardBotMenu">
                        <div class="rightMenu">
                            <button onclick="location.href=document.referrer">목록이동</button>
                            <button>글작성</button>
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
        $('#maincontentBody').text('${freeBoardInfo.b_free_content}');
        getReplyList(boardType, '${freeBoardInfo.b_free_num}').then(
            function (result) {
                add_reply_tag(result, boardType);
            }
        )
    } else {
        $('.contentsWriter').text('${laneBoardInfo.b_lane_nickname}');
        $('.contentsDate').text('${laneBoardInfo.b_lane_date}');
        $('.contentsHit').text('조회수 : ' + '${laneBoardInfo.b_lane_view}' + ' 좋아요 : ' + '${laneBoardInfo.b_lane_lcount}');
        $('.contentsCategory').text('[라인게시판] [' + '${laneBoardInfo.b_lane_type}' + ']');
        board_number = '${laneBoardInfo.b_lane_num}';
        change_like_button_tag(currentStatus, '${laneBoardInfo.b_lane_lcount}');
        $('#boardSubjectH1').text('${laneBoardInfo.b_lane_title}');
        $('#maincontentBody').text('${laneBoardInfo.b_lane_content}');
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

    function add_reply_tag(result, boardType) {
        let $add_reply_list = $('#add_reply_list');
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
            }

            $reply_innerTr.appendTo($reply_setTr);
            let $2nd_tr = $('<tr>');
            $('<td>').attr('colspan', '3').text(row['r_' + boardType + '_content']).appendTo($2nd_tr);
            $2nd_tr.appendTo($reply_setTr);
            $reply_setTr.appendTo($add_reply_list);
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
</script>
</html>