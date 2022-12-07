// 장바구니에 있는 상품을 전체 선택하는 함수입니다
function cartOnCheck(event) {
	let target = event.target
	const checkBox = document.querySelectorAll('.cartList_item_check')
	if(target.checked == true) {
		checkBox.forEach(box => {
			box.checked = true
		}) 
	}
	else {
		checkBox.forEach(box => {
			box.checked = false
		}) 
	}
}
// 장바구니 상품 수량 증가 함수입니다
function upOnClick(event, cart_idx, cart_price) {
	const count_input = event.target.parentNode.previousElementSibling
	let value = count_input.value
	count_input.value = ++value
	const url = cpath + "/cart/update"
	const ob = {
		'cart_idx' : cart_idx,
		'cart_count' : count_input.value,
		'cart_total' : count_input.value * cart_price,
	}
	const opt = {
		method: 'POST',
		body: JSON.stringify(ob),
		headers: {
			'Content-type' : 'application/json'
		}
	}
	fetch(url, opt)
	.then(resp => resp.text()) 
	.then(text => {
		console.log(text)
	})
	location.reload();
}
function downOnClick(event, idx, cart_price) {
	const count_input = event.target.parentNode.previousElementSibling
	let value = count_input.value
	if(value == 1) {
		return
	}
	else {
		count_input.value = --value
		const url = cpath + "/cart/update"
		const ob = {
			'cart_idx' : idx,
			'cart_count' : count_input.value,
			'cart_total' : count_input.value * cart_price,
		}
		const opt = {
			method: 'POST',
			body: JSON.stringify(ob),
			headers: {
				'Content-type' : 'application/json'
			}
		}
		fetch(url, opt)
		.then(resp => resp.text()) 
		.then(text => {
			console.log(text)
		})
	}
	location.reload();
}
function cartOnDelete(event) {
	if(confirm("장바구니에서 삭제를 하시겠습니까?")) {
		return
	}
	else {
		event.preventDefault()
	}
}
