src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"



// modal login
  function loginFrm2(e){  //유효성 검사 시작
	e.preventDefault();  //위에 폼태그에있는 submit함수 실행되기전
						//submit자체를 안하겠다
						//이 코드가 먼저 실행되게 한다.
	const id = document.querySelector('#id');
	const pw = document.querySelector('#pw');

	function resetFrm(){
	id.value = null; //defualt
	pw.value = null;
	}


	if(id.value.length < 3){  
		Swal.fire({
			icon: 'error',
			title: 'Oops...',
			text: '아이디는 최소 4글자 입니다!',
		  })
		  resetFrm();
	}else if(pw.value.length < 3 ){
		Swal.fire({
			icon: 'error',
			title: 'Oops...',
			text: '비밀번호는 최소 4글자 입니다!',
		  })
		  resetFrm();
	} else{    //서버에 보낼 가치가없는 위에 조건들은 위에서 다 거르고 
				//id, pw --> more than 4words == 아래 함수를 실행 시킨다

		const formData = new FormData() //file을 담으려고 특별한 객체를 통해서 만든다
		formData.append('id', id.value); //jquery방식
		formData.append('pw', pw.value)  //순수 자바스크립트 변수를 따로 만들어줘야하는 불편함이있다.
	}
}




// 매니저 로그인 폼 

	
	
