<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="https://kit.fontawesome.com/f9589fd651.js"></script>
    <link rel="stylesheet" href="/resources/css/community.css?ver=3">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <script src="/resources/js/login.js?ver=3"></script>
    <script src="/resources/js/community.js?ver=3"></script>
    <script src = "https://code.jquery.com/jquery-3.6.0.js"></script>
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
                <button class="btn-open-popup" onclick="modal_open()">Join</button>   <!--login -->
                <button class="logout_btn" onclick="logout()">Logout</button>   <!--logout-->
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
        <div class="modal" >
            <div class="modal_body">Modal
                <button class="fas fa-times" onclick="back()"></button>
                <!-- 로그인 form태그 -->
                <form class= "login_modal" onsubmit="return loginFrm()" action="/member/access" method="post">
                    <div class="login_id">
                        <h4>ID</h4>
                        <input type="id" name="m_id" id="id" placeholder="Id" onblur="inspectId()" data-value="false">
                        <div class="idMsg" id="id_check"></div>


        <!-- Modal박스 -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Join</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

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
                    <div class="submit">

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



<script>
    //회원가입시
        let $check = '${check}';  //jsp만 읽을수있으므로

        if ($check === '1') {
            Swal.fire({
                title: '이메일 인증을 해주세요.',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                }
            })

        } else if ($check === '2') {
            alert('로그인 실패');
        }


        //클라이언트 -> 이메일 인증
        let $accept = '${emailCheck}';

        if($accept === '1'){

                Swal.fire({
                    title: '이메일 인증에 성공했습니다.',
                    showClass: {
                        popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                        popup: 'animate__animated animate__fadeOutUp'
                    }
                })

        }else if($accept === '2'){
            alert('이메일 인증 실패');

        }else if($accept === '3'){
            Swal.fire({
                title: '이메일 인증을 이미 하셨습니다.',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                }
            })
        }



    //로그인 시
    let $checkLogin = '${checkLogin}';
    let joinBtn = document.querySelector('.btn-open-popup'); //조인버튼
    let logoutBtn = document.querySelector('.logout_btn');  //로그아웃


    if($checkLogin === '1') {
        Swal.fire({
            title: '비밀번호가 일치하지 않습니다.',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        })

    }else if($checkLogin === '2'){
        Swal.fire({
            title: '아이디가 일치하지 않습니다.',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        })

    }else if($checkLogin === '3'){
        Swal.fire({
            title: '이메일 인증을 해주세요',
            showClass: {
                popup: 'animate__animated animate__fadeInDown'
            },
            hideClass: {
                popup: 'animate__animated animate__fadeOutUp'
            }
        })
    }else if($checkLogin === '0'){
        Swal.fire({
            title: 'Congratulations on becoming our member',
            text: 'first.gg',
            imageUrl: '/resources/images/2880x1620_league-of-legends-ekko-4k.jpg',
            imageWidth: 400,
            imageHeight: 200,
            imageAlt: 'Custom image',
        })



        joinBtn.setAttribute('data-value','false');
        joinBtn.style.display = 'none';
        logoutBtn.style.display = 'block';


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
        //let id = "<%=session.getAttribute("id")%>"  //문자열로해서 담아주려고
        let id = "${sessionScope.id}";
        console.log(id);
        if(id != ""){
            joinBtnStyle.style.display = 'none';
            logoutStyle.style.display = 'block';
        }else if(id == ""){
            joinBtnStyle.style.display = 'block';
            logoutStyle.style.display = 'none';
        }

    }






</script>
</body>
</html>
