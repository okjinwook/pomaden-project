function shippingCancleOnClick() {
	window.close()
}


// 전화번호 셀렉트 박스 선택 함수입니다, 전화번호 입력시 합치는 함수입니다 ex) 010 + 1234 + 5678 
function phoneOnSelect(ob) {
	const resultPhoneInput = document.querySelector('.shipping_phone_result')
	phone_select_number = ob.value
	resultPhoneInput.value = phone_select_number + phone_start_number + phone_end_number
	console.log(resultPhoneInput.value)
}

// 전화번호 입력시 합치는 함수입니다 ex) 010 + 1234 + 5678 
function phoneStartOnkeyUp(ob) {
	const resultPhoneInput = document.querySelector('.shipping_phone_result')
	phone_start_number = ob.value
	resultPhoneInput.value = phone_select_number + phone_start_number + phone_end_number
	console.log(resultPhoneInput.value)
}

// 전화번호 입력시 합치는 함수입니다 ex) 010 + 1234 + 5678 
function phoneEndOnkeyUp(ob) {
	const resultPhoneInput = document.querySelector('.shipping_phone_result')
	phone_end_number = ob.value
	resultPhoneInput.value = phone_select_number + phone_start_number + phone_end_number
	console.log(resultPhoneInput.value)
}
// 배송지 주소 API 함수 입니다
function postcodeOnClick() {
	const address_detail = document.querySelector('.shipping_address_detail')

	new daum.Postcode({
		oncomplete: function(data) {
			var roadAddr = data.roadAddress; // 도로명 주소 변수

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('shipping_postcode').value = data.zonecode;
			document.getElementById("shipping_loadAddress").value = roadAddr;
			address_detail.readOnly = false
		}
	}).open();
}