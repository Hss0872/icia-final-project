src="https://code.jquery.com/jquery-3.6.0.js"


//joinFrm js
function joinFrm(e){  //유효성 검사   //회원가입 폼
	e.preventDefault();  //joinTable 폼태그에있는 submit함수 실행되기전
	//submit자체를 안하겠다
	//이 코드가 먼저 실행되게 한다.
	var id = document.querySelector('#id');
	var nickname = document.querySelector('#nickname');
	var email = document.querySelector('#email');
	var phonenumber = document.querySelector('#phonenumber');
	var pw = document.querySelector('#pw');
	var confirmpw = document.querySelector('#confirmpw');

	// 이메일, 전화번호, 비밀번호 정규식
	var emailRegExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	var phoneRegExp = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
	var pwregExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/;



	// 프론트 유효성 검사
	if(id.value.length < 3){   //추가사항 * 아이디 중복검사 필요
		Swal.fire({
			icon: 'error',
			title: 'Oops...',
			text: '아이디는 최소 4글자 입니다!',
		})
		id.value = null;

	}else if(nickname.value.length < 2 ){   //추가사항 * 닉네임 중복검사 필요
		Swal.fire({
			icon: 'error',
			title: 'Oops...',
			text: '닉네임은 최소 3글자 입니다!',
		})
		nickname.value = null;

	}else if(!emailRegExp.test(email.value)){    //이메일 인증 js 가능
		Swal.fire({
			icon: 'error',
			title: 'Oops...',
			text: '이메일 형식을 제대로 쓰시오!',
		})
		email.value = null;

	}else if(!phoneRegExp.test(phonenumber.value)){
		Swal.fire({
			icon: 'error',
			title: 'Oops...',
			text: '전화번호  " - " 형식에 맞게쓰세요 ',
		})
		phonenumber.value = null;

	}else if(!pwregExp.test(pw.value)){    //8~10자 영문, 숫자 조합
		Swal.fire({
			icon: 'error',
			title: 'Oops...',
			text: '8~10자 영문, 숫자 조합',
		})
		pw.value = null;

	}else if(confirmpw.value != pw.value){
		Swal.fire({
			icon: 'error',
			title: 'Oops...',
			text: '두개의 비밀번호가 일치하지않습니다.',
		})
		pw.value = null;
		confirmpw.value = null;
	}else{

		const formData = new FormData();    //div 태그에 name이 필요없어지는 이유는
		formData.append('id', id.value); 	//form 데이타가 자바스크립트함수를 실행하기때문
		formData.append('nickname', nickname.value);
		formData.append('email', email.value);
		formData.append('phonenumber', phonenumber.value);
		formData.append('pw', pw);
		formData.append('confirmpw', confirmpw.value);
	}
}
//아이디 중복확인
function id_check(e) {  	//blur 포커싱 끝났을때 실행되게
	e.preventDefault()
	let id = document.querySelector('#id');
	if (id.value.length < 4) {   //추가사항 * 아이디 중복검사 필요
		$('#id_check').text('아이디는 3글자 이상입니다.');
		$('#id_check').css("color", "#FFB400");
		$('#id_check').css("font-weight", "600");
		$('#id_check').show();
		id.value = null;
		 $('#id').attr('data-value', 'false');
		setTimeout(()=>{  //3초뒤에 div 가리기
			$('#id_check').css("display", "none");
		},2000);

	} else {   //비동기 시작
		let id_value = $('#id').val();
		return fetch('dupleCheck',
			{
				method: 'post',    //json 형태로 보낼때는 post만 가능
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
		setTimeout(()=>{
			$('#nickname_check').css("display", "none");
		},2000);

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
function  emailDupleCheck(){
	let emailDuple = document.querySelector('#email').value;
	return fetch('url',
		{
			method : 'post',
			headers : {"Content-Type" : "application/json"},
			body : JSON.stringify({
				email : emailDuple
			})
		}).then((response)=>{
		if(response !== true){
			Swal.fire({
				icon: 'error',
				title: 'Oops...',
				text: '존재하는 이메일입니다',
			})
			$('#email').attr('data-value', 'true');
			$('#emailCheck').show();
		}else{
			//$('#email').attr('data-value', 'true'); 실제구동할때
			// $('#emailCheck').show(); 실제로 쓸때
		}
	})
}

// 이메일 인증확인

function certificationCheck(){
	let email = document.querySelector('#email').value;
	return fetch('certificationCheck',
		{
			method : 'post',
			headers : {"Content-Type" : "application/json"},
			body : JSON.stringify({
				email : email
			})

		}).then((response)=>{
		if(response !== 1){
			Swal.fire({
				icon: 'error',
				title: 'Oops...',
				text: '이메일 인증을 완료해주세요',
			})
		}else{

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