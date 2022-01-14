src = "https://code.jquery.com/jquery-3.6.0.js"

//로그인 id 유효성
function inspectId(){
    let loginId = document.querySelector('#id');
    if(loginId.value <= 3){
        loginId.setAttribute('data-value','false');
    }else{
        loginId.setAttribute('data-value','true');
    }
}

//로그인 비밀번호 유효성
function inspectPw(){
    let pwregExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;
    let pw = document.querySelector('#pw');
    if(!pwregExp.test(pw.value)){
        pw.setAttribute('data-value', 'false');
    }else{
        pw.setAttribute('data-value', 'true');
    }

}


//로그인 submit 되기전 로직
function loginFrm(){
    let id_value = document.getElementById('id').getAttribute('data-value');
    let pw_value = document.getElementById("pw").getAttribute('data-value');
    let id_check = document.querySelector('#id_check');
    let pw_check = document.querySelector('#pw_check');



    if(id_value == 'true' && pw_value == 'true'){
        console.log('성공~');

        return true;

    }else if(id_value =='true' && pw_value =='false'){
        pw_check.style.display ='block';
        pw_check.style.color = "#FFB400";
        pw_check.innerText ='8~16자 영문, 숫자 조합.'
        id_check.style.display = 'none';
        return false;

    }else if(id_value == 'false' && pw_value == 'true'){
        id_check.style.display ='block';
        id_check.style.color = "#FFB400";
        id_check.innerText ='아이디는 3글자 이상입니다.'
        pw_check.style.display ='none';
        return false;
    }else{
        pw_check.style.display ='none';
        id_check.style.display = 'none';
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: '양식을 모두 완성해주세요.'
        })
        return false;
    }

}


//id찾기 모달창
function searchId() {
    console.log('야야투레레레');
    let login_modal = document.querySelector('.login_modal');
    login_modal.style.display ='none';
    let searchIdForm = document.querySelector('.searchId');
    searchIdForm.style.display ='block';
    console.log('야야투레');

    let modal = document.querySelector('.modal');
    let modal_body = document.querySelector('.modal_body');

}


//이메일 유효성
function inspectEmail(){
    let id_value = document.getElementById('id_search').getAttribute('data-value');
    let id = document.querySelector('#id_search');
    let emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    if(!emailRegExp.test(id.value)){
        id.setAttribute('data-value', 'false');
    }else{
        id.setAttribute('data-value', 'true');
    }
}

//아이디 찾기 최종
function idSearch(){
    let idSearchValue = document.getElementById('id_search').getAttribute('data-value');
    let idValue = document.querySelector('#id_search');
    let idSearchForm = document.querySelector('.searchId');
    let login_modal = document.querySelector('.login_modal');

    if(idSearchValue == 'true'){
        return fetch( '/member/id/search',
            {
                method :'post',
                headers : {
                    "Accept": "application/json",
                    "ContentType": "application/json"
                },
                body : JSON.stringify({
                    m_email : idValue.value,
                })
        }).then((res)=>{
                return res.json();
        }).then((res)=>{
            idValue.value =null;
            idSearchForm.style.display ='none';
            login_modal.style.display = 'block';
            Swal.fire({
                title: `고객님의 아이디는: ${res} 입니다.`,
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                }
            })

        }).catch((res)=>{
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '존재 하지않는 이메일입니다.',
            })

            setTimeout(()=>{
                idValue.value = null;
            }, 2000);
        })

    }else{
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: '양식을 모두 완성해주세요.',

        })
        idValue =null;
    }

}




//비번찾기
function searchPw(){
    let login_modal = document.querySelector('.login_modal');
    login_modal.style.display ='none';

    let modal = document.querySelector('.modal');
    let modal_body = document.querySelector('.modal_body');

    let total_form = document.createElement('form');
    total_form.setAttribute('method','post');
    total_form.setAttribute('class', 'total_form');

    let email_input = document.createElement('input');
    email_input.setAttribute('class','email_input');
    email_input.setAttribute('id','email');
    email_input.setAttribute('data-value','false');
    email_input.setAttribute('onblur','email_inspect()');
    email_input.setAttribute('name','m_email');

    let email_submit = document.createElement('button');
    email_submit.setAttribute('class', 'email_submit');
    email_submit.setAttribute('type', 'button');
    email_submit.setAttribute('onclick', 'searchPwAjax()');
    email_submit.innerText = '이메일 전송'

    // let new_pw1 = document.createElement('input');  //새비밀번호
    // new_pw1.setAttribute('class','new_pw1');
    // new_pw1.setAttribute('id','new_pw1');
    // new_pw1.setAttribute('data-value','false');
    // new_pw1.setAttribute('onblur','new_pw1_inspect()');
    // new_pw1.setAttribute('name','new_pw');
    // new_pw1.setAttribute('placeholder','새비밀번호 설정');
    //
    // let new_pw2 = document.createElement('input');  //비번확인
    // new_pw2.setAttribute('class','new_pw2');
    // new_pw2.setAttribute('id','new_pw2');
    // new_pw2.setAttribute('data-value','false');
    // new_pw2.setAttribute('onblur','new_pw2_inspect()');
    // new_pw2.setAttribute('name','new_pw2');
    // new_pw2.setAttribute('placeholder','8~16자 영문, 숫자 조합');


    // let new_pw_submit = document.createElement('button');
    // new_pw_submit.setAttribute('class', 'new_email_submit');
    // new_pw_submit.setAttribute('type', 'button');
    // new_pw_submit.setAttribute('onclick', 'newPwAjax()');
    // new_pw_submit.innerText = '비밀번호 변경'


    // let warningPw = document.createElement('div');
    // warningPw.setAttribute('id','warningPw');
    // warningPw.style.display = 'block';
    // warningPw.style.color ='red';
    // warningPw.innerText = '8~16자 영문, 숫자 조합';
    // warningPw.style.display ='none';


    total_form.append(email_input);
    total_form.append(email_submit);

    // new_total_form.append(new_pw1);
    // new_total_form.append(new_pw2);
    // new_total_form.append(warningPw);
    // new_total_form.append(new_pw_submit);

    modal_body.appendChild(total_form);
    //modal_body.appendChild(new_total_form);

}

//pw찾기(이메일인증) 유효성
function email_inspect(){
    //유효성 먼저

    let email = document.querySelector('#email');
    if(email.value <= 1){
        email.setAttribute('data-value', 'false');
    }else{
        email.setAttribute('data-value', 'true');
    }
}

//pw찾기(이메일인증)
function searchPwAjax(){
    let email_data_value = document.getElementById('email').getAttribute('data-value');
    let email = document.querySelector('#email');
    let emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    let total_form = document.querySelector('.total_form');

    if(email_data_value == 'true' && emailRegExp.test(email.value)){
        console.log('이메일인증 시작');
        let certify = document.querySelector('.certify');

        return fetch( '/member/pw/search',
            { method: 'post',
                headers : {
                    "Accept": "application/json",
                    "ContentType": "application/json"
                },
                body : JSON.stringify({
                    m_email : email.value
                })
        }).then((res)=>{
                return res.json();   //그래야 아래 제이슨형태의 객체로 바꿔줄수있으니
        }).then((res)=>{
            total_form.style.display ='none';
            certify.style.display ='block';
            window.emailCode = res;
        }).catch((res)=>{
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '존재 하지않는 이메일입니다.',
            })
        })

    }else{
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: '이메일 형식에 맞게 입력해주세요!',
        })
        email.value = null;
        return false;

    }
}

//클라이언트가 받은 인증번호 유효성
function certifyInspect(){
    let certifyBtn = document.querySelector('#certifyInput');
    if(certifyBtn.value <= 1){
        certifyBtn.setAttribute('data-value','false');

    }else{
        certifyBtn.setAttribute('data-value','true');
    }
}

function certifyCation(){  //인증번호 검사
    let certifyInput = document.querySelector('#certifyInput');
    let certifyValue = document.getElementById('certifyInput').getAttribute('data-value');
    let certifyForm = document.querySelector('.certify');
    let new_total_form = document.querySelector('.new_total_form');
    if(certifyValue =='true'){
        if(window.emailCode == certifyInput.value){
            certifyForm.style.display ='none';
            new_total_form.style.display ='block';

        }else{
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '인증번호가 일치하지 않습니다.',
            })
        }
    }else{
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: '인증번호를 입력해주세요.',
        })

    }

}





//새로운 비밀번호 유효성검사
function new_pw1_inspect(){
    let pwregExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/;  //비번 정규식
    let new_pw1 = document.querySelector('#new_pw1');
    let new_pw1_comment = document.querySelector('#new_pw1_comment');


    if(!pwregExp.test(new_pw1.value) ){
        new_pw1.setAttribute('data-value','false');
        new_pw1_comment.style.display ='block';
        new_pw1_comment.style.color ='red';
        new_pw1_comment.style.fontWeight ='400';
        new_pw1.value = null;
    }else{
        new_pw1.setAttribute('data-value','true');
        new_pw1_comment.style.display ='none';

    }

}
//새로운 비밀번호 컨펌 검사
function new_pw2_inspect(){
    let new_pw1 = document.querySelector('#new_pw1');
    let new_pw2 = document.querySelector('#new_pw2');
    let new_pw2_comment = document.querySelector('#new_pw2_comment');

    if(new_pw1.value !== new_pw2.value){
        new_pw2.setAttribute('data-value','false');
        new_pw2_comment.style.display = 'block';
        new_pw2_comment.style.color ='red';
        new_pw2_comment.style.fontWeight ='400';
        new_pw2.value = null;
    }else{
        new_pw2.setAttribute('data-value','true');
        new_pw2_comment.style.display ='none';
    }

}

// 최종 비밀번호 변경
function changePw(){
    let new_pw1_value = document.getElementById('new_pw1').getAttribute('data-value');
    let new_pw2_value = document.getElementById('new_pw2').getAttribute('data-value');
    let m_newPw_value = document.querySelector('#new_pw1').value;
    let m_id_value = document.querySelector('#change_by_id').value;
    let login_modal = document.querySelector('.login_modal');
    let new_total_form = document.querySelector('.new_total_form');

    if(new_pw1_value =='true' && new_pw2_value == 'true'){
        return fetch('/member/pw/change',
            {
            method :'post',
                headers : {
                    "Accept": "application/json",
                    "ContentType": "application/json"
                },
                body : JSON.stringify({
                    m_pw : m_newPw_value,
                    m_id :m_id_value
                })
        }).then((res)=>{
                new_total_form.style.display ='none';
                login_modal.style.display ='block';

                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: '변경완료되었습니다, 로그인 해주시면됩니다.',
                    showConfirmButton: false,
                    timer: 2700
                })
        }).catch((err)=>{
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '존재하지 않는 아이디입니다.'
            })

        })

    }else{
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: '양식을 모두 완성해주세요.'
        })
        return false;
    }
}









//로그아웃
function logout(){
    return fetch('/member/logout',
        {
            method : 'post',
    }).then((response)=>{
        location.href ="/community"
    })
}




//모달창 닫기
function back(){
    //아이디찾기 모달
    let searchIdForm = document.querySelector('.searchId');

    //비번찾기 모달
    let modal = document.querySelector('.modal');
    let total_form = document.querySelector('.total_form');
    let certify = document.querySelector('.certify');
    let new_pw_form = document.querySelector('.new_total_form');

    if(total_form !== null || certify !== null || new_pw_form !== null || searchIdForm !== null){
        total_form && total_form.remove && total_form.remove();
        certify.style.display ='none';
        new_pw_form.style.display ='none';
        searchIdForm.style.display ='none';
    }

    modal.style.display ='none';

}

//모달창 다시 킬때마다
function modal_open(){
    let modal = document.querySelector('.modal');
    let login_modal = document.querySelector('.login_modal');
    let id = document.querySelector('#id');
    let pw = document.querySelector('#pw');
    let id_check = document.querySelector('#id_check');
    let pw_check = document.querySelector('#pw_check');

        id.value = null;
        pw.value = null;
        id_check.value = null;
        pw_check.value = null;
        modal.style.display = 'block';
        login_modal.style.display ="block";


}


//게시판 관련
function append_lane_preview_list(lane) {
    let $lane_board = $('#lane_board');
    $lane_board.empty();
    getPreviewList('lane', lane).then(
        function(result) {
            let $lane_board = $('#lane_board')
            for (let row of result) {
                $('<div>').text(row['b_lane_title']).attr('class', 'HotLine').appendTo($lane_board);
            }
        }
    )
};

function getPreviewList(boardType, lane) {
    return fetch('/community/board/preview',
        {
            method : 'post',
            headers : {
                "Content-Type" : "application/json",
                "accept" : "application/json;charset=utf-8"
            },
            body : JSON.stringify({
                boardType : boardType,
                lane : lane
            })
        }).then(response => response.json())
};