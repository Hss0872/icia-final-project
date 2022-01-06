src = "https://code.jquery.com/jquery-3.6.0.js"


//joinFrm js
function joinFrm() {  //유효성 검사   //회원가입 폼
    const id_value = document.getElementById('id').getAttribute('data-value');
    const nickname_value = document.getElementById('nickname').getAttribute('data-value');
    const email_value = document.getElementById('email').getAttribute('data-value');
    const phone_value = document.getElementById('phonenumber').getAttribute('data-value');
    const pw_value = document.getElementById('pw').getAttribute('data-value');
    const confirm_value = document.getElementById('confirmpw').getAttribute('data-value');


    if((id_value == 'true') && (nickname_value == 'true') && (email_value == 'true') &&
        (phone_value == 'true') && (pw_value == 'true') && (confirm_value == 'true')){
        console.log("성공~!!!");
        return true;

    }else{
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: '양식을 모두 완성해주세요.'
        })
        return false;
    }

}




//아이디 중복확인
function id_check(e) {  	//blur 포커싱 끝났을때 실행되게
    e.preventDefault()  //불필요함
    let id = document.querySelector('#id');
    if (id.value.length < 4) {   //추가사항 * 아이디 중복검사 필요
        const $idCheck = $('#id_check')  //전체의 dom에서 불필요하게 조회를 해버리기때문에 이렇게 자바스크립트 변수로 담아뒀다.
        $idCheck.text('아이디는 3글자 이상입니다.');
        $idCheck.css("color", "#FFB400");
        $idCheck.css("font-weight", "600");
        $idCheck.show();
        id.value = null;
        //idEl.setAttribute('data-value', 'false')
        $('#id').attr('data-value', 'false');
        // setTimeout(()=>{  //3초뒤에 div 가리기
        // 	$('#id_check').css("display", "none");
        // },2000);

    } else {   //비동기 시작
        let id_value = $('#id').val();
        return fetch('dupleCheck',
            {
                method: 'post',    //json 형태로 보낼때는 post만 가능 /가없으면 상대경로
                headers: {
                    "Accept": "application/json;",
                    "ContentType": "application/json;"
                },
                body: JSON.stringify({
                    m_id: id_value
                })
            }).then((response) => {
            if (response.status == 200) {  //보내지기만하면 200으로 뜨니까 서버단에 entity 사용해서 정해주자
                console.log(response.status);
                $('#id').attr('data-value', 'true');
                $('#id_check').text("사용가능합니다.");
                $('#id_check').css("color", "#06f809");
                $('#id_check').css("font-weight", "600");
                $('#id_check').show();

            } else {
                $('#id_check').text("사용중인 아이디입니다.");
                $('#id_check').css("color", "#FFB400");
                $('#id_check').css("font-weight", "600");
                $('#id_check').css("display", "none");
                $('#id').attr('data-value', 'false'), $('#id_check').show();  //display show
                //formdata안에 data-value 체인지를 통한 아이디 중복여부 최종확인
            }
        })
    }
}


//닉네임 중복확인
function nickname_check(e) {  	//blur 포커싱 끝났을때 실행되게
    e.preventDefault()
    let nickname = document.querySelector('#nickname');
    if (nickname.value.length < 4) {   //추가사항 * 아이디 중복검사 필요
        $('#nickname_check').text('아이디는 3글자 이상입니다.');
        $('#nickname_check').css("color", "#EB0000");
        $('#nickname_check').css("font-weight", "600");
        $('#nickname_check').show();
        nickname.value = null;
        $('#nickname').attr('data-value', 'false');

    } else {
        let nickname_value = $('#nickname').val();
        return fetch('dupleCheck',
            {
                method: 'post',
                headers: {
                    "Accept": "application/json;",
                    "ContentType": "application/json;"
                },
                body: JSON.stringify({
                    m_nickname: nickname_value
                })
            }).then((response) => {
            if (response.status == 200) {  //보내지기만하면 200으로 뜨니까 서버단에 entity 사용해서 정해주자
                console.log(response.status);
                $('#nickname').attr('data-value', 'true');
                $('#nickname_check').text("사용가능합니다.");
                $('#nickname_check').css("color", "#06f809");
                $('#nickname_check').css("font-weight", "600");
                $('#nickname_check').show();
            } else {
                $('#nickname_check').text("사용중인 닉네임입니다.");
                $('#nickname_check').css("color", "#EB0000");
                $('#nickname_check').css("font-family", "Arial Black");
                $('#nickname_check').css("font-weight", "600");
                $('#nickname_check').css("display", "none");
                $('#nickname').attr('data-value', 'false'), $('#nickname_check').show();  //display show
            }
        })
    }
}


//이메일 중복 검사
function email_check(e) {  	//blur 포커싱 끝났을때 실행되게
    e.preventDefault()
    let email = document.querySelector('#email');
    let emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;   //이메일 정규식
    if (!emailRegExp.test(email.value)) {
        $('#email_check').text('이메일 @ 형식에 맞게쓰시오.');
        $('#email_check').css("color", "#EB0000");
        $('#email_check').css("font-weight", "600");
        $('#email_check').show();
        email.value = null;
        $('#email').attr('data-value', 'false');

    } else {
        let email_value = $('#email').val();
        return fetch('dupleCheck',
            {
                method: 'post',
                headers: {
                    "Accept": "application/json;",
                    "ContentType": "application/json;"
                },
                body: JSON.stringify({
                    m_email: email_value
                })
            }).then((response) => {
            if (response.status == 200) {
                console.log(response.status);
                $('#email').attr('data-value', 'true');
                $('#email_check').text("사용가능합니다.");
                $('#email_check').css("color", "#06f809");
                $('#email_check').css("font-weight", "600");
                $('#email_check').show();
            } else {
                $('#email_check').text("사용중인 이메일입니다.");
                $('#email_check').css("color", "#EB0000");
                $('#email_check').css("font-family", "Arial Black");
                $('#email_check').css("font-weight", "600");
                $('#email_check').css("display", "none");
                $('#email').attr('data-value', 'false');
                $('#email_check').show();
            }
        })
    }
}

//전화번호 컨펌
function phone_check() {
    let phoneRegExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;   //전화번호 정규식
    let phonenumber = document.querySelector('#phonenumber');
    if (!phoneRegExp.test(phonenumber.value)) {
        $('#phoneNumber_check').text('전화번호  " - " 형식에 맞게쓰세요 ');
        $('#phoneNumber_check').css('color', 'red');
        $('#phoneNumber_check').css("font-weight", "500");
        $('#phoneNumber_check').show();
        phonenumber.value = null;
        $('#phonenumber').attr('data-value', 'false');
    } else {
        $('#phoneNumber_check').text('사용 가능합니다.');
        $('#phoneNumber_check').css("color", "green");
        $('#phoneNumber_check').css("font-weight", "500");
        $('#phoneNumber_check').show();
        $('#phonenumber').attr('data-value', 'true');

    }

}


//비밀번호
function password_check() {
    let pwregExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;  //비번 정규식
    let pw = document.querySelector('#pw');
    if (!pwregExp.test(pw.value)) {
        $('#pw_check').text('8~16자 영문, 숫자 조합');
        $('#pw_check').css('color', 'red');
        $('#pw_check').css('font-weight', '500');
        pw.value = null;
        $('#pw').attr('data-value', 'false');
    } else {
        $('#pw_check').text('사용 가능합니다.');
        $('#pw_check').css('color', 'green');
        $('#pw_check').css('font-weight', '500');
        $('#pw').attr('data-value', 'true');
    }

}

//비밀번호 컨펌
function confirm_password() {
    let confirmpw = document.querySelector('#confirmpw');
    if (confirmpw.value != '') {

        if (confirmpw.value != pw.value) {
            $('#confirmpw_check').text('두개의 비밀번호가 일치하지않습니다.');
            $('#confirmpw_check').css('color', 'red');
            $('#confirmpw_check').css('font-weight', '500');
            $('#confirmpw').attr('data-value', 'false');
        } else {
            $('#confirmpw_check').text('사용 가능합니다.');
            $('#confirmpw_check').css('color', 'green');
            $('#confirmpw_check').css('font-weight', '500');
            $('#confirmpw').attr('data-value', 'true');
        }

    }else{
        $('#confirmpw').attr('data-value', 'false');
        $('#confirmpw_check').text('동일한 비밀번호를 입력해주세요.');
        $('#confirmpw_check').css('color', 'red');
        $('#confirmpw_check').css('font-weight', '500');

    }


}


// 이메일 인증확인
function certificationCheck() {
    let email = document.querySelector('#email').value;
    return fetch('certificationCheck',
        {
            method: 'post',
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({
                email: email
            })

        }).then((response) => {
        if (response !== 1) {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '이메일 인증을 완료해주세요',
            })
        } else {

        }
    })

}


// async function emailAjax(){
// 	const email = document.querySelector('#email').value;
// 	if(!isValidEmail(email)) {
// 		alert('check email check')
// 		return;
// 	}
// 	const dupleCheck = await emailDupleCheck(email2);
// 	if(dupleCheck.success === true) {
// 		alert('complete')
// 	}else {
// 		alert('duplicate email')
// 	}
// }