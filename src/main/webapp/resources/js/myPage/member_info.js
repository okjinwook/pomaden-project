function myPagePwOnKeyUp(ob) {
	let value = ob.value
	const pw_msg = document.querySelector('.myPage_pw_msg')
	const pwCheck_msg = document.querySelector('.myPage_pwCheck_msg')
	const pwCheck_input = document.querySelector('.myPage_member_pwCheck')
	const english = /[a-zA-Z]/
	const number = /[0-9]/
	// 정규식을 사용하여 대소문자/숫자 2가지 조합 , 8 ~ 16자 이내인가 체크
	if (value.length >= 8 && value.length <= 16 && english.test(ob.value)
		&& number.test(ob.value)) {
		pw_msg.innerText = '사용 가능한 비밀번호입니다.'
		pw_msg.style.color = 'blue'
	} else {
		pw_msg.innerText = '부적합한 비밀번호입니다.'
		pw_msg.style.color = 'red'
	}
	pwCheck_input.value = ''
	if (value == pwCheck_input.value) {
		pwCheck_msg.innerText = '일치'
		pwCheck_msg.style.color = 'blue'
	} else {
		pwCheck_msg.innerText = '불일치'
		pwCheck_msg.style.color = 'red'
	}

}

// 패스워드 확인 함수입니다, 일치 여부 확인 메세지
function myPagePwCheckOnKeyUp(ob) {
	let value = ob.value
	const pwCheck_msg = document.querySelector('.myPage_pwCheck_msg')
	const pw_input = document.querySelector('.myPage_member_pw')
	if (value == pw_input.value) {
		pwCheck_msg.innerText = '일치'
		pwCheck_msg.style.color = 'blue'
	} else {
		pwCheck_msg.innerText = '불일치'
		pwCheck_msg.style.color = 'red'
	}
}



function myPageEmailOnClick(event) {
	const email_code_box = document.querySelector('.myPage_email_code_box')
	const email_send_msg = document.querySelector('.myPage_email_send_msg')
	const email_code_input_ = document.querySelector('.myPage_email_code_input_')
	const member_email = document.querySelector('.myPage_member_email').value
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
				email_send_msg.innerText = '이미 사용중인 이메일입니다'
			}
			// 사용 가능한 이메일이면 인증코드 보냅니다.
			else {
				const url = cpath + '/member/sendEmail?member_email=' + member_email
				const opt = {
					method: 'GET'
				}
				// 타이머 실행 
				time = 180
				timer = setInterval(myPageCodeTimer, 1000)
				email_code_box.classList.remove('hidden')
				const json = fetch(url,opt)
				.then(resp => resp.json())
				.then(json => {
					if(json.status == 'OK') {
						email_send_msg.innerText = json.message
						email_send_msg.style.color = 'blue'
						email_code_input_.focus()
					}
					else {
						email_send_msg.innerText = json.message
						email_send_msg.style.color = 'red'
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
function myPageCodeTimer() {
	const code_time_box = document.querySelector('.myPage_code_time_box')
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
	code_time_box.innerText = '( ' + tm + ' : ' + ts + ' )'
	if (time == 0) {
		clearInterval(timer)
		code_time_box.style.color = 'red'
		time = 180
	}
	time -= 1
}

// 인증확인 클릭 함수입니다.
function myPageCodeCheckOnClick(event) {
	const codeNumber = document.querySelector('.myPage_email_code_input').value
	const msgBox = document.querySelector('.myPage_code_msg_box')
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

// 회원정보 수정 눌렀을 때 발생하는 함수입니다.
function memeberUpdateOnClick(event) {
	const check_msg = document.querySelectorAll('.myPage_msg')
	const member_pw = document.querySelector('.myPage_member_pw').value
	const code_msg = document.querySelector('.myPage_code_msg_box')
	const send_msg = document.querySelector('.myPage_email_send_msg')
	let count = 0
	// 유효성 검사에 만족하지 못 하는 객체가 있으면 submit 막습니다
	if(member_pw != '') {
		check_msg.forEach(msg => {
			if (msg.style.color == 'red' || msg.innerText == '') {
				event.preventDefault()
				count = 1
			}
		})
	}
	if(send_msg.innerText != '') {
		if (code_msg.style.color == 'red' || code_msg.innerText == '') {
			event.preventDefault()
			count = 1
		}
	}
	// alert 반복 방지 코드입니다
	if (count == 1) {
		alert('잘못된 입력정보입니다.')
	}
}
function shippingChangeOnClick(member_id) {
	const url = cpath + '/shipping/shippingList?member_id=' + member_id
	window.open(url, 'shippingList', 'width=600px, height=700px')
}
