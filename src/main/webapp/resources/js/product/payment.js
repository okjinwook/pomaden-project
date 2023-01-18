// 자식 부모창에서 쿠폰 정보를 받아오는 함수입니다
function sendCoupon(total_sale_price, coupon_arr, item_arr) {
	const coupon_box = document.querySelector('.payment_coupon_box')
	const discount = document.querySelector('.payment_orderPrice_price > .payment_orderPrice_discount')
	const total = document.querySelector('.payment_orderPrice_price > .payment_orderPrice_total')
	const item_idx = document.querySelectorAll('.order_orderList_idx') // 상품 idx
	if(coupon_arr.length != 0) {
		coupon_box.innerText = '- ' + Number(total_sale_price).toLocaleString() + '원'
		totalSalePrice = Math.floor(totalSalePrice + total_sale_price)
		totalResultPrice =  Math.floor(totalResultPrice - total_sale_price )
		discount.children[0].innerText = '- ' + Number(totalSalePrice + point * 1).toLocaleString() + '원'
		total.innerText = Number(totalResultPrice - point * 1).toLocaleString() + '원'
		
		coupon = coupon_arr
		for(ob in item_arr) {
			let idx = item_arr[ob].cart_idx
			let salePrice = item_arr[ob].cart_price
			// 쿠폰 사용한 상품 가격 변경
			item_idx.forEach(item => {
				if(item.value == idx) {
					let target = item
					while(target.classList.contains('payment_orderList_item') == false) {
						target = target.parentNode
					}
					// target_price = 상품 최종 가격
					// target_sale = 상품 최종 세일
					let target_price = target.getElementsByClassName('order_orderList_price')[0]
					let target_sale = target.getElementsByClassName('payment_orderList_sale_price')[0]
					target_price.id = target_price.id * 1 - salePrice * 1
					target_sale.id = target_sale.id * 1 + salePrice * 1
					target_price.innerText = Number(target_price.id).toLocaleString() + '원'
					target_sale.innerText = '- ' + Number(target_sale.id).toLocaleString() + '원'
				}
			})
		}
	}
}

// 보유한 적립금액 만큼만 적용하는 제한 함수입니다.
function PointOnKeyUp(ob, myPoint) {
	let usePoint = ob.value
	// 입력한 적립금 > 보유한 적립금
	if(usePoint > myPoint) {
		ob.value = myPoint
	}
	point = ob.value
}

// 적립금 적용 함수입니다
function pointOnClick() {
	const discount = document.querySelector('.payment_orderPrice_price > .payment_orderPrice_discount')
	const total = document.querySelector('.payment_orderPrice_price > .payment_orderPrice_total')
	const item = document.querySelectorAll('.payment_orderList_item')
	discount.children[0].innerText = '- ' + Number((totalSalePrice * 1) + (point * 1)).toLocaleString() + '원'
	total.innerText = Number((totalResultPrice * 1) - (point * 1)).toLocaleString() + '원'
	totalResultPrice -= point
	totalSalePrice += point
	for(ob of item){
		let target = ob
		while(target.classList.contains('payment_orderList_item') == false) {
			target = target.parentNode
		}
		// target_price = 상품 최종 가격
		// target_sale = 상품 최종 세일
		let target_price = target.getElementsByClassName('order_orderList_price')[0]
		target_price.id = target_price.id * 1 - point
		target_price.innerText = Number(target_price.id).toLocaleString() + '원'
		return false
	}
}


// 결제수단 선택 함수입니다
function paymentWayOnClick(ob) {
	const paymentWay = document.querySelectorAll('.payment_paymentWay')
	paymentWay.forEach(ob => {
		ob.classList.add('hidden')
	})
	document.querySelector('.' + ob).classList.remove('hidden')
}

// 결제수단 카카오페이 함수입니다.
function kakaopayPayment(item, orderList_order_number) {
	const totalCount = document.querySelectorAll('.payment_orderList_count')
	const total_amount = totalResultPrice // 상품 총액
	const size = item.length
	let quantity = 0 // 총 상품 개수
	let item_name = '' // 상품명
	
	totalCount.forEach(count => {
		quantity += count.id * 1
	})
	item.forEach(box => {
		item_name = box.getElementsByClassName('order_orderList_name')[0].id
		return
	})
	if(quantity != 1) {
		item_name += ' 외 ' + ((quantity * 1) - 1) + '개' // ex) 가디건 외 1개
	}
	
	const url = cpath + '/kakaopay/paymentReady'
	const ob = {
		kakaopay : {
		"item_name" : item_name,
		"quantity" : quantity + '',
		"total_amount" : total_amount + '',
		}
	}
	item.forEach(box => {
		recPoint += box.getElementsByClassName('payment_orderList_point')[0].id * 1
		const map = {
			'orderList_order_number' : orderList_order_number,
			'orderList_img' : box.getElementsByClassName('order_orderList_img')[0].id,
			'orderList_name' : box.getElementsByClassName('order_orderList_name')[0].id,
			'orderList_color' : box.getElementsByClassName('order_orderList_color')[0].id,
			'orderList_size' : box.getElementsByClassName('order_orderList_size')[0].id,
			'orderList_count' : box.getElementsByClassName('order_orderList_count')[0].id,
			'orderList_price' : box.getElementsByClassName('order_orderList_price')[0].id,
			'orderList_progress' : '결제완료',
			'orderList_shipping_msg' : document.querySelector('.payment_shipping_msg').innerText,
			'orderList_shipping_address' : document.querySelector('.payment_shipping_address').innerText,
			'orderList_shipping_phone' : document.querySelector('.payment_shipping_phone').innerText,
			'orderList_shipping_name' : document.querySelector('.payment_shipping_name').innerText,
		}
		if(size != 1) {
			map.cart_idx = box.getElementsByClassName('order_orderList_idx')[0].value		
		}
		const name = box.getElementsByClassName('order_orderList_name')[0].id
		ob[name]  = map
	})
	if(coupon.length != 0) {
		let coupon_map = {}
		for(idx of coupon) {
			coupon_map[idx] = idx
		}
		ob['coupon'] = coupon_map
	}
	if(recPoint != 0) {
		const recPoint_map = {
			'recPoint' : recPoint * 1
		}
		ob['recPoint'] = recPoint_map
	}
	if(point != 0) {
		const point_map = {
			'point_use' : point * 1
		}
		ob['point'] = point_map
	}
	const opt = {
		method : 'POST',
		body : JSON.stringify(ob),
		headers : {
			'Content-type' : 'application/json'
		},
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		location.href = json.next_redirect_pc_url
	})
}

// 결제수단 무통장입금 함수입니다
function depositPayment(item, orderList_order_number) {
	const size = item.length
	const url = cpath + '/orderList/insert'
	const ob = []
	item.forEach(box => {
		recPoint += box.getElementsByClassName('payment_orderList_point')[0].id * 1
		const map = {
			'orderList_order_number' : orderList_order_number,
			'orderList_img' : box.getElementsByClassName('order_orderList_img')[0].id,
			'orderList_name' : box.getElementsByClassName('order_orderList_name')[0].id,
			'orderList_color' : box.getElementsByClassName('order_orderList_color')[0].id,
			'orderList_size' : box.getElementsByClassName('order_orderList_size')[0].id,
			'orderList_count' : box.getElementsByClassName('order_orderList_count')[0].id,
			'orderList_price' : box.getElementsByClassName('order_orderList_price')[0].id,
			'orderList_progress' : '입금대기',
			'orderList_shipping_msg' : document.querySelector('.payment_shipping_msg').innerText,
			'orderList_shipping_address' : document.querySelector('.payment_shipping_address').innerText,
			'orderList_shipping_phone' : document.querySelector('.payment_shipping_phone').innerText,
			'orderList_shipping_name' : document.querySelector('.payment_shipping_name').innerText,
		}
		if(size != 1) {
			map.cart_idx = box.getElementsByClassName('order_orderList_idx')[0].value		
		}
		ob.push(map)
	})
	if(coupon.length != 0) {
		let coupon_map = {}
		for(idx of coupon) {
			coupon_map[idx] = idx
		}
		ob.push(coupon_map)
	}
	if(point != 0) {
		const point_map = {
			'point_use' : point * 1
		}
		ob.push(point_map)
	}
	if(recPoint != 0) {
		const recPoint_map = {
			'recPoint' : recPoint * 1
		}
		ob.push(recPoint_map)
	}
	const opt = {
		method : 'POST',
		body : JSON.stringify(ob),
		headers : {
			'Content-type' : 'application/json'
		},
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		if(json.status == 'OK') {
			alert(json.msg)
			location.href = cpath + '/myPage/orderList'
		}
		else {
			alert(json.msg)
		}
	})
}

// 최종 결제 클릭 함수입니다.
function ResultPaymentOnClick() {
	const paymentWay = document.querySelectorAll('input[name=paymentWay]')
	const item = document.querySelectorAll('.payment_orderList_item')
	let resultWay = ''
	let today = new Date()
	let year = today.getFullYear() + '' // 년도
	let month = today.getMonth() + 1 + ''  // 월
	let date = today.getDate() + ''  // 날짜
	const random = Math.floor(Math.random() * (9999 - 1000) + 1000); // 1000 ~ 9999 난수
	let orderList_order_number = year + month + date + random
	// 결제 수단 대입
	paymentWay.forEach(way => {
		if(way.checked == true) {
			resultWay = way
		}
	})
	if(resultWay != '') {
		if(resultWay.value == 'kakaopay') {
			kakaopayPayment(item, orderList_order_number)
		}
		else {
			depositPayment(item, orderList_order_number)
		}
	}
	else {
		alert('결제 방식을 선택해주세요!')
	}
}