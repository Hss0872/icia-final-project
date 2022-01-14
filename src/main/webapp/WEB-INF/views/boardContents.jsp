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
                <div class="allboard" style="cursor: pointer;" onclick="location.href='/community/board/free';">자유
                    게시판</div>
                <div class="tierboard" style="cursor: pointer;" onclick="location.href='/community/board/lane';">라인별
                    게시판</div>
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
                        <div class="contentsIp"></div>
                        <div class="contentsTopMenu">목록 | 댓글</div>
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
                                                <a>목록</a>
                                                |
                                                <a>댓글</a>
                                            </span>
                                    </div>
                                </div>
                                <div class="botMenuCenter">
                                    <div class="bttnRecom">
                                        <a class="bttnRecommend" title="추천하기">따봉업</a>
                                    </div>
                                </div>
                                <div class="botMenuRight">
                                    <div class="bttn84Report">
                                        <a>신고하기</a>
                                        <a>따봉업확인</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="boardBotMenu">
                        <div class="rightMenu">
                            <button>목록이동</button>
                            <button>글작성</button>
                        </div>
                    </div>
                    <div class="replyFrm">
                        <div class="replyList">
                            <table class="">
                                <tr class="reply_setTr">
                                <tr class="reply_innerTr">
                                    <td class="reply_id">
                                        아이디
                                    </td>
                                    <td class="reply_date">
                                        2021-01-13
                                    </td>
                                    <td class="reply_delete">
                                        <button>삭제하기</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">내용ㅇㅇㅇㅇㅇㅇㅇㅇddddddㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
                                        ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
                                </tr>
                                </tr>
                                <tr class="reply_setTr">
                                <tr class="reply_innerTr">
                                    <td class="reply_id">
                                        아이디
                                    </td>
                                    <td class="reply_date">
                                        2021-01-13
                                    </td>
                                    <td class="reply_delete">
                                        <button>삭제하기</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">내용ㅇㅇㅇㅇㅇㅇㅇㅇddddddㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
                                        ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
                                </tr>
                                </tr>
                                <tr class="reply_setTr">
                                <tr class="reply_innerTr">
                                    <td class="reply_id">
                                        아이디
                                    </td>
                                    <td class="reply_date">
                                        2021-01-13
                                    </td>
                                    <td class="reply_delete">
                                        <button>삭제하기</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3">내용ㅇㅇㅇㅇㅇㅇㅇㅇddddddㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
                                        ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</td>
                                </tr>
                                </tr>
                            </table>
                        </div>
                        <div class="addreply">
                            <form>
                                <table>
                                    <tr>
                                        <td class="replyTextareaTd">
                                            <div class="replyTextarea">
                                                <textarea>dsds</textarea>
                                            </div>
                                        </td>
                                        <td class="replySubmitTd">
                                            <div>
                                                <button class="replySubmit">
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
    if (boardType == "free") {
        console.log('${freeBoardInfo.b_free_nickname}');
        $('.contentsWriter').text('${freeBoardInfo.b_free_nickname}');
        $('.contentsDate').text('${freeBoardInfo.b_free_date}');
        $('.contentsHit').text('조회수 : ' + '${freeBoardInfo.b_free_view}' + ' 좋아요 : ' + '${freeBoardInfo.b_free_like}');
        $('.contentsCategory').text('[자유게시판]');
        $('#boardSubjectH1').text('${freeBoardInfo.b_free_title}');
        $('#maincontentBody').text('${freeBoardInfo.b_free_content}');
    } else {
        $('.contentsWriter').text('${laneBoardInfo.b_lane_nickname}');
        $('.contentsDate').text('${laneBoardInfo.b_lane_date}');
        $('.contentsHit').text('조회수 : ' + '${laneBoardInfo.b_lane_view}' + ' 좋아요 : ' + '${laneBoardInfo.b_lane_like}');
        $('.contentsCategory').text('[라인게시판] [' + '${laneBoardInfo.b_lane_type}' + ']');
        $('#boardSubjectH1').text('${laneBoardInfo.b_lane_title}');
        $('#maincontentBody').text('${laneBoardInfo.b_lane_content}');
    }
</script>
</html>