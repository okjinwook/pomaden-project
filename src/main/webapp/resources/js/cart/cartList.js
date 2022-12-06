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
function upOnClick(event, idx) {
	const count_input = event.target.parentNode.previousElementSibling
	let value = count_input.value
	count_input.value = ++value
	const url = cpath + "/cart/updateCount"
	const ob = {
		'cart_idx' : idx,
		'cart_count' : count_input.value,
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
// 장바구니 상품 수량 감소 함수입니다
function downOnClick(event, idx) {
	const count_input = event.target.parentNode.previousElementSibling
	let value = count_input.value
	if(value == 1) {
		return
	}
	else {
		count_input.value = --value
		const url = cpath + "/cart/updateCount"
		const ob = {
			'cart_idx' : idx,
			'cart_count' : count_input.value,
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
}
