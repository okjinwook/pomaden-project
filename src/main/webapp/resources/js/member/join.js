function idOnKeyUp(ob) {
	let value = ob.value
	const join_id_check = document.querySelector('.join_id_check')
	// 4 ~ 8 자리 체크
	if (value.length >= 4 && value.length <= 16) {
		join_id_check.innerText = '사용 가능한 아이디입니다.'
		join_id_check.style.color = 'blue'
	} else {
		join_id_check.innerText = '부적합한 아이디입니다.'
		join_id_check.style.color = 'red'
	}
}

function pwOnKeyUp(ob) {
	let value = ob.value
	const join_pw_check = document.querySelector('.join_pw_check')
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
}

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









function phoneOnSelect(ob) {
	const resultPhoneInput = document.querySelector('.join_phone_result_value')
	join_phone_select_number = ob.value
	resultPhoneInput.value = join_phone_select_number + join_phone_start_number + join_phone_end_number
}
function phoneStartOnkeyUp(ob) {
	const resultPhoneInput = document.querySelector('.join_phone_result_value')
	let value = ob.value
	if(value.length == 4) {
		join_phone_start_number = ob.value
	}
	resultPhoneInput.value = join_phone_select_number + join_phone_start_number + join_phone_end_number
}
function phoneEndOnkeyUp(ob) {
	const resultPhoneInput = document.querySelector('.join_phone_result_value')
	let value = ob.value
	if(value.length == 4) {
		join_phone_end_number = ob.value
	}
	resultPhoneInput.value = join_phone_select_number + join_phone_start_number + join_phone_end_number
}



















