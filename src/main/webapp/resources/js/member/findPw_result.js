function findPwOnKeyUp(ob) {
	let value = ob.value
	const pwResult_pw_msg = document.querySelector('.pwResult_pw_msg')
	const pwResult_pwCheck_msg = document.querySelector('.pwResult_pwCheck_msg')
	const pwResult_pwCheck_input = document.querySelector('.pwResult_pwCheck_input')
	const english = /[a-zA-Z]/
	const number = /[0-9]/
	// 정규식을 사용하여 대소문자/숫자 2가지 조합 , 8 ~ 16자 이내인가 체크
	if (value.length >= 8 && value.length <= 16 && english.test(ob.value)
		&& number.test(ob.value)) {
		pwResult_pw_msg.innerText = '사용 가능한 비밀번호입니다.'
		pwResult_pw_msg.style.color = 'blue'
	} else {
		pwResult_pw_msg.innerText = '부적합한 비밀번호입니다.'
		pwResult_pw_msg.style.color = 'red'
	}
	pwResult_pwCheck_input.value = ''
	if (value == pwResult_pwCheck_input.value) {
		pwResult_pwCheck_msg.innerText = '일치'
		pwResult_pwCheck_msg.style.color = 'blue'
	} else {
		pwResult_pwCheck_msg.innerText = '불일치'
		pwResult_pwCheck_msg.style.color = 'red'
	}

}

// 패스워드 확인 함수입니다, 일치 여부 확인 메세지
function findPwCheckOnKeyUp(ob) {
	let value = ob.value
	const pwResult_pwCheck_msg = document.querySelector('.pwResult_pwCheck_msg')
	const pwResult_pw_input = document.querySelector('.pwResult_pw_input')
	if (value == pwResult_pw_input.value) {
		pwResult_pwCheck_msg.innerText = '일치'
		pwResult_pwCheck_msg.style.color = 'blue'
	} else {
		pwResult_pwCheck_msg.innerText = '불일치'
		pwResult_pwCheck_msg.style.color = 'red'
	}
}

function pwResultSubmit(event) {
	const pwResult_pw_input = document.querySelector('.pwResult_pw_input').value
	const pwResult_msg = document.querySelectorAll('.pwResult_msg')
	const url = cpath + '/member/change_pw?pw=' + pwResult_pw_input
	const opt = {
		method: 'POST'
	}
	let count = 0
	pwResult_msg.forEach(msg => {
		if (msg.style.color == 'red' || msg.innerText == '') {
			count = 1
		}
	})
	if(count == 1) {
		alert('잘못된 비밀번호입니다.')
	}
	else {
		const json = fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			if(json.status == 'OK') {
				const url = cpath + '/member/login'
				alert(json.message)
				location.replace(url)
			}
			else {
				alert(json.message)
			}
		})
	}
}