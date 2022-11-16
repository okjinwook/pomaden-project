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
function idOnClick(event) {
	let id = event.target.previousElementSibling.value
	console.log(id)
	const url = '/member/check?id=' + id
	const opt = 'GET'
	const json = fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		return json
	})
	console.log(json)
	
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
// 배송지 주소 API 
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

function addressOnKeyUp(ob) {
	const join_result_address = document.querySelector(".join_result_address")
	const join_address_postcode = document.querySelector(".join_address_postcode")
	const join_address_load = document.querySelector(".join_address_load")
	
	join_result_address.value = '(' + join_address_postcode.value + ')' + join_address_load.value +  join_address_load.value + ob.value
	console.log(join_result_address.value)
}












