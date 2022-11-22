function findPwEmailOnClick(event) {
	const member_email = document.querySelector('.findPw_email_input').value
	const findPw_code_box = document.querySelector('.findPw_code_box')
	const findPw_email_code_input = document.querySelector('.findPw_email_code_input')
	const findPw_email_send_msg = document.querySelector('.findPw_email_send_msg_box')
	if(member_email.split('@')[1] == 'naver.com') {
		const check_url = cpath + '/member/emailCheck?member_email=' + member_email
		const check_opt = {
			method: 'GET'
		}
		const check_json = fetch(check_url,check_opt)
		.then(resp => resp.json())
		.then(json => {
			if(json.status == 'OK') {
				const url = cpath + '/member/sendEmail?member_email=' + member_email
				const opt = {
					method: 'GET'
				}
				// 타이머 실행 
				time = 180
				timer = setInterval(findPwCodeTimer, 1000)
				findPw_code_box.classList.remove('hidden')
				const json = fetch(url,opt)
				.then(resp => resp.json())
				.then(json => {
					if(json.status == 'OK') {
						findPw_email_send_msg.innerText = json.message
						findPw_email_send_msg.style.color = 'blue'
						findPw_email_code_input.focus()
					}
					else {
						findPw_email_send_msg.innerText = json.message
						findPw_email_send_msg.style.color = 'red'
					}
				})
			}
			else {
				console.log('미등록 이메일입니다.')
			}
		})
	}
	else {
		alert('올바르지 않은 이메일 형식입니다')
	}
}

// 인증코드 제한 타이머 함수입니다
function findPwCodeTimer() {
	const findPw_code_time_box = document.querySelector('.findPw_code_time_box')
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
	findPw_code_time_box.innerText = '( ' + tm + ' : ' + ts + ' )'
	if (time == 0) {
		clearInterval(timer)
		findPw_code_time_box.style.color = 'red'
		time = 180
	}
	time -= 1
}


// 인증확인 클릭 함수입니다.
function findPwCodeCheckOnClick(event) {
	const codeNumber = document.querySelector('.findPw_email_code_input').value
	const msgBox = document.querySelector('.findPw_code_msg_box')
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
function findPwOnClick(event) {
	const findPw_check_msg = document.querySelectorAll('.findPw_check_msg')
	let count = 0
	// 유효성 검사에 만족하지 못 하는 객체가 있으면 submit 막습니다
	findPw_check_msg.forEach(msg => {
		if (msg.style.color == 'red' || msg.innerText == '') {
			event.preventDefault()
			count = 1
		}
	})
	// alert 반복 방지 코드입니다
	if (count == 1) {
		alert('이메일 인증이 필요합니다.')
	}
}

