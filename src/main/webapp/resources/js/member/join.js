// 아이디 중복체크 및 규칙성 만족 체크하는 함수입니다.
function idOnClick(event) {
	let id = event.target.previousElementSibling.value
	const join_id_check = document.querySelector('.join_id_check')
	const url = cpath + '/member/idCheck?member_id=' + id
	const opt = {
		method: 'GET'
	}
	// Ajax 요청, 비동기 요청으로 입력한 id값으로 중복된 아이디인지 체크합니다
	const json = fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			// 4 ~ 16 글자이고 비동기 요청 값이 0(중복되지 않음)이면 사용 가능한 아이디 
			if (id.length >= 4 && id.length <= 16 && text == '0') {
				join_id_check.innerText = '사용 가능한 아이디입니다.'
				join_id_check.style.color = 'blue'
			}
			// 4 ~ 16 이내가 아니면 가입 불가
			else if (id.length < 4 || id.length > 16) {
				join_id_check.innerText = '영문소문자/숫자, 4 ~ 16자 입력바랍니다'
				join_id_check.style.color = 'red'
			}
			// 4 ~ 16 이내 이지만 비동기 요청 값이 1(중복)이면 중복된 아이디
			else if (text == '1' && id.length >= 4 && id.length <= 16) {
				join_id_check.innerText = '중복된 아이디입니다.'
				join_id_check.style.color = 'red'
			}
		})

}
// 패스워드 규칙성 만족 체크하는 함수입니다
function pwOnKeyUp(ob) {
	let value = ob.value
	const join_pw_check = document.querySelector('.join_pw_check')
	const join_pwCheck_input = document.querySelector('.join_pwCheck_input')
	const join_pwCheck_check = document.querySelector('.join_pwCheck_check')
	const english = /[a-zA-Z]/
	const number = /[0-9]/
	// 정규식을 사용하여 대소문자/숫자 2가지 조합 , 8 ~ 16자 이내인가 체크
	if (value.length >= 8 && value.length <= 16 && english.test(ob.value)
		&& number.test(ob.value)) {
		join_pw_check.innerText = '사용 가능한 비밀번호입니다.'
		join_pw_check.style.color = 'blue'
	} else {
		join_pw_check.innerText = '부적합한 비밀번호입니다.'
		join_pw_check.style.color = 'red'
	}
	join_pwCheck_input.value = ''
	if (value == join_pwCheck_input.value) {
		join_pwCheck_check.innerText = '일치'
		join_pwCheck_check.style.color = 'blue'
	} else {
		join_pwCheck_check.innerText = '불일치'
		join_pwCheck_check.style.color = 'red'
	}

}

// 패스워드 확인 함수입니다, 일치 여부 확인 메세지
function pwcheckOnKeyUp(ob) {
	let value = ob.value
	const join_pwCheck_check = document.querySelector('.join_pwCheck_check')
	const join_pw_input = document.querySelector('.join_pw_input')
	if (value == join_pw_input.value) {
		join_pwCheck_check.innerText = '일치'
		join_pwCheck_check.style.color = 'blue'
	} else {
		join_pwCheck_check.innerText = '불일치'
		join_pwCheck_check.style.color = 'red'
	}
}
// 전화번호 셀렉트 박스 선택 함수입니다, 전화번호 입력시 합치는 함수입니다 ex) 010 + 1234 + 5678 
function phoneOnSelect(ob) {
	const resultPhoneInput = document.querySelector('.join_phone_result_value')
	join_phone_select_number = ob.value
	resultPhoneInput.value = join_phone_select_number + join_phone_start_number + join_phone_end_number
	console.log(resultPhoneInput.value)
}

// 전화번호 입력시 합치는 함수입니다 ex) 010 + 1234 + 5678 
function phoneStartOnkeyUp(ob) {
	const resultPhoneInput = document.querySelector('.join_phone_result_value')
	join_phone_start_number = ob.value
	resultPhoneInput.value = join_phone_select_number + join_phone_start_number + join_phone_end_number
	console.log(resultPhoneInput.value)
}

// 전화번호 입력시 합치는 함수입니다 ex) 010 + 1234 + 5678 
function phoneEndOnkeyUp(ob) {
	const resultPhoneInput = document.querySelector('.join_phone_result_value')
	join_phone_end_number = ob.value
	resultPhoneInput.value = join_phone_select_number + join_phone_start_number + join_phone_end_number
	console.log(resultPhoneInput.value)
}


// 배송지 주소 API 함수 입니다
function postcodeOnClick() {
	const join_address_detail = document.querySelector('.join_address_detail')

	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var roadAddr = data.roadAddress; // 도로명 주소 변수

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('join_postcode').value = data.zonecode;
			document.getElementById("join_loadAddress").value = roadAddr;
			join_address_detail.readOnly = false
		}
	}).open();
}

// 이메일 인증요청 버튼 클릭 함수입니다.
function joinEmailOnClick(event) {
	const join_email_code_box = document.querySelector('.join_email_code_box')
	const join_email_send_msg = document.querySelector('.join_email_send_msg')
	const join_email_code_input = document.querySelector('.join_email_code_input')
	const member_email = document.querySelector('.join_input_email').value
	// 이메일 형식이 올바른지 체크합니다.
	if(member_email.split('@')[1] == 'naver.com') {
		const check_url = cpath + '/member/emailCheck?member_email=' + member_email
		const check_opt = {
			method: 'GET'
		}
		const check_json = fetch(check_url,check_opt)
		.then(resp => resp.json())
		.then(json => {
			if(json.status == 'OK') {
				join_email_send_msg.innerText = '이미 사용중인 이메일입니다'
			}
			// 사용 가능한 이메일이면 인증코드 보냅니다.
			else {
				const url = cpath + '/member/sendEmail?member_email=' + member_email
				const opt = {
					method: 'GET'
				}
				// 타이머 실행 
				time = 180
				timer = setInterval(JoinCodeTimer, 1000)
				join_email_code_box.classList.remove('hidden')
				const json = fetch(url,opt)
				.then(resp => resp.json())
				.then(json => {
					if(json.status == 'OK') {
						join_email_send_msg.innerText = json.message
						join_email_send_msg.style.color = 'blue'
						join_email_code_input.focus()
					}
					else {
						join_email_send_msg.innerText = json.message
						join_email_send_msg.style.color = 'red'
					}
				})
			}
		})
	}
	else {
		alert('올바르지 않은 이메일 형식입니다')
	}
}
// 인증코드 제한 타이머 함수입니다
function JoinCodeTimer() {
	const join_code_time_box = document.querySelector('.join_code_time_box')
	let min = Math.floor(time / 60)
	let sec = Math.floor(time % 60)
	let tm = min
	let ts = sec
	if (min < 10) {
		tm = '0' + min
	}
	if (sec < 10) {
		ts = '0' + sec
	}
	join_code_time_box.innerText = '( ' + tm + ' : ' + ts + ' )'
	if (time == 0) {
		clearInterval(timer)
		join_code_time_box.style.color = 'red'
		time = 180
	}
	time -= 1
}

// 인증확인 클릭 함수입니다.
function joinCodeCheckOnClick(event) {
	const codeNumber = document.querySelector('.join_email_code_input').value
	const msgBox = document.querySelector('.join_code_msg_box')
	const url = cpath + '/member/getAuthNumber?userNumber=' + codeNumber
	const opt = {
		method: 'GET'
	}
	const json = fetch(url,opt)
	.then(resp => resp.json())
	.then(json => {
		if(json.status == 'OK') {
			clearInterval(timer)
			msgBox.innerText = json.message
			msgBox.style.color = 'blue'
		}
		else {
			msgBox.innerText = json.message
			msgBox.style.color = 'red'
		}
	})
	
}

// 회원가입 눌렀을 때 발생하는 함수입니다.
function joinSubmitOnClick(event) {
	const join_check_msg = document.querySelectorAll('.join_check_msg')
	let count = 0
	// 유효성 검사에 만족하지 못 하는 객체가 있으면 submit 막습니다
	join_check_msg.forEach(msg => {
		if (msg.style.color == 'red' || msg.innerText == '') {
			event.preventDefault()
			count = 1
		}
	})
	// alert 반복 방지 코드입니다
	if (count == 1) {
		alert('잘못된 입력정보입니다.')
	}
}











