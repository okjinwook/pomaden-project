// 장바구니에 있는 상품을 전체 선택하는 함수입니다
function cartOnCheck(event) {
	let target = event.target
	const item_boxs  = document.querySelectorAll('.cartList_item')
	const checkBox = document.querySelectorAll('.cartList_item_check')
	const item_prices = document.querySelectorAll('.cartList_item_totalPrice')
	const total_box = document.querySelector(".cartList_select_total_price")
	const expected_box = document.querySelector(".cartList_select_expected_price")
	let price = 0
	if(target.checked == true) {
		checkBox.forEach(box => {
			box.checked = true
		}) 
		// 상품을 선택하면 상품리스트에 넣습니다
		buy_product = []
		buy_price = []
		// 선택한 합친 상품 가격
		item_prices.forEach(ob => {
			let result = ob.innerText.split('원')[0].replace(',','') * 1
			price += result
			buy_price.push(result)
		})
		// 선택한 합친 상품 
		item_boxs.forEach(box => {
			  buy_product.push(box.id)
		})
		// 전체 상품 박스의 색상 변경을 해주는 코드입니다
		item_boxs.forEach(box => {
			box.style.backgroundColor = 'cornsilk'
		})
		total_box.innerHTML = Number(price).toLocaleString() + '원'
		expected_box.innerHTML = Number(price).toLocaleString() + '원'
	}
	else {
		checkBox.forEach(box => {
			box.checked = false
		}) 
		// 전체 상품 박스의 색상 변경을 해주는 코드입니다
		item_boxs.forEach(box => {
			box.style.backgroundColor = 'white'
		})
		total_box.innerHTML = '0원'
		expected_box.innerHTML = '0원'
		buy_product = []
		buy_price = []
	}
}
// 장바구니 상품 수량 증가 함수입니다
function upOnClick(event, cart_idx, cart_price) {
	const count_input = event.target.parentNode.previousElementSibling
	let cart_count = count_input.value * 1
	const url = cpath + "/cart/update"
	const ob = {
		'cart_idx' : cart_idx,
		'cart_count' : cart_count + 1,
		'cart_total' : (cart_count + 1) * cart_price,
	}
	const opt = {
		method: 'POST',
		body: JSON.stringify(ob),
		headers: {
			'Content-type' : 'application/json'
		}
	}
	fetch(url, opt) 
	.then(resp => resp.json()) 
	.then(json => {
			alert(json.msg)
			location.href = cpath + '/cart/cartList'
		})
}
function downOnClick(event, idx, cart_price) {
	const count_input = event.target.parentNode.previousElementSibling
	let cart_count = count_input.value * 1
	if(cart_count == 1) {
		return false
	}
	else {
		const url = cpath + "/cart/update"
		const ob = {
			'cart_idx' : idx,
			'cart_count' : cart_count - 1,
			'cart_total' : (cart_count - 1)* cart_price,
		}
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-type' : 'application/json'
			}
		}
		fetch(url, opt)
		.then(resp => resp.json()) 
		.then(json => {
			alert(json.msg)
			location.href = cpath + '/cart/cartList'
		})
	}
}
function cartOnDelete(event) {
	if(confirm("장바구니에서 삭제를 하시겠습니까?")) {
		return
	}
	else {
		event.preventDefault()
	}
}

function checkOnClick(event, cart_price, cart_idx) {
	let target = event.target
	const allCheckBox = document.querySelector(".cartList_checkBox > input")
	const check_inputs = document.querySelectorAll(".cartList_item_check")
	const total_box = document.querySelector(".cartList_select_total_price")
	const expected_box = document.querySelector(".cartList_select_expected_price")
	let price = 0
	let count = 1 
	// 아이템 체크박스를 체크했을 때 체크를 false로 만든다면 전체 체크박스도 false를 만듭니다
	if(event.target.checked == false) {
		allCheckBox.checked = false
		for(let i = 0 ; i < buy_price.length; i++) {
			// 체크박스가 false이기 때문에 리스트에서 제거
			if(buy_price[i] == cart_price) {
				buy_product.splice(i,1)
				buy_price.splice(i,1)
				i--			
			}
		}
		// 선택한 상품의 박스 색 변경을 합니다 (만족하는 클래스명을 가진 객체를 선택을 위한 코드입니다)
		while(target.classList.contains('cartList_item') == false) {
			target = target.parentNode
		}
		target.style.backgroundColor = 'white'
	}
	// 상품을 선택하면 상품리스트에 넣습니다
	else {
		buy_product.push(cart_idx)
		buy_price.push(cart_price)
		// 선택한 상품의 박스 색 변경을 합니다 (만족하는 클래스명을 가진 객체를 선택을 위한 코드입니다)
		while(target.classList.contains('cartList_item') == false) {
			target = target.parentNode
		}
		target.style.backgroundColor = 'cornsilk'
	}
	
	check_inputs.forEach(box => {
		if(box.checked == false) {
			count = 0
		}
	})
	// count가 1이라는 것은 모두 체크 되어있는 상태이므로 전체 체크박스도 체크됩니다
	if(count == 1) {
		allCheckBox.checked = true
	}
	// 선택한 상품 리스트에 있는 상품 가격 전부 더합니다 (총 금액)
	buy_price.forEach(ob => {
		price += ob		
	})
	total_box.innerHTML = Number(price).toLocaleString() + '원' 
	expected_box.innerHTML = Number(price).toLocaleString()  + '원'
}
function cartPaymentOnClick() {
	if(buy_product.length == 0) {
		alert('상품을 선택해주세요.')
		return false
	}
	const url = cpath + '/product/payment?list='
	const arr = []
	for(idx of buy_product) {
		arr.push(idx)
	}
	location.href = url + arr
}