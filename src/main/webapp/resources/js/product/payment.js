// 자식 부모창에서 쿠폰 정보를 받아오는 함수입니다
function sendCoupon(coupon_name, coupon_sale) {
	const coupon_box = document.querySelector('.payment_coupon_box')
	const discount = document.querySelector('.payment_orderPrice_price > .payment_orderPrice_discount')
	const total = document.querySelector('.payment_orderPrice_price > .payment_orderPrice_total')
	
	coupon_box.innerText = '- ' + Number(totalResultPrice * (coupon_sale / 100)).toLocaleString() + '원'
	totalSalePrice = Math.floor(totalSalePrice + totalResultPrice * (coupon_sale / 100))
	totalResultPrice =  Math.floor(totalResultPrice * (100 - coupon_sale) / 100 )
	
	discount.innerText = '- ' + Number(totalSalePrice + point * 1).toLocaleString() + '원'
	total.innerText = Number(totalResultPrice - point * 1).toLocaleString() + '원'
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
	
	discount.innerText = '- ' + Number((totalSalePrice * 1) + (point * 1)).toLocaleString() + '원'
	total.innerText = Number((totalResultPrice * 1) - (point * 1)).toLocaleString() + '원'
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
	let total_amount = totalResultPrice // 상품 총액
	let quantity = 0 // 총 상품 개수
	let item_name = '' // 상품명
	
	totalCount.forEach(count => {
		quantity += count.id * 1
	})
	item.forEach(box => {
		item_name += box.getElementsByClassName('order_orderList_name')[0].id + " / "
	})
	const url = cpath + '/kakaopay/paymentReady'
	const ob = {
		"item_name" : item_name,
		"quantity" : quantity + '',
		"total_amount" : total_amount + '',
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
		window.open(json.next_redirect_pc_url, 'kakaopay', 'width=600px, height=500px')
		
		// 주문내역 insert 
//		const url = cpath + '/orderList/insert'
//		const ob = []
//		item.forEach(box => {
//			const map = {
//				'orderList_order_number' : orderList_order_number,
//				'orderList_img' : box.getElementsByClassName('order_orderList_img')[0].id,
//				'orderList_name' : box.getElementsByClassName('order_orderList_name')[0].id,
//				'orderList_color' : box.getElementsByClassName('order_orderList_color')[0].id,
//				'orderList_size' : box.getElementsByClassName('order_orderList_size')[0].id,
//				'orderList_count' : box.getElementsByClassName('order_orderList_count')[0].id,
//				'orderList_price' : box.getElementsByClassName('order_orderList_price')[0].id,
//				'orderList_progress' : '결제완료',
//			}
//			ob.push(map)
//		})
//		const opt = {
//			method : 'POST',
//			body : JSON.stringify(ob),
//			headers : {
//				'Content-type' : 'application/json'
//			},
//		}
//		fetch(url, opt)
//		.then(resp => resp.json())
//		.then(json => {
//			if(json.status == 'FAIL') {
//				alert(json.msg)
//				return false
//			}
//		})
	})
}

// 결제수단 무통장입금 함수입니다
function depositPayment(item, orderList_order_number) {
	const url = cpath + '/orderList/insert'
	const ob = []
	item.forEach(box => {
		const map = {
			'orderList_order_number' : orderList_order_number,
			'orderList_img' : box.getElementsByClassName('order_orderList_img')[0].id,
			'orderList_name' : box.getElementsByClassName('order_orderList_name')[0].id,
			'orderList_color' : box.getElementsByClassName('order_orderList_color')[0].id,
			'orderList_size' : box.getElementsByClassName('order_orderList_size')[0].id,
			'orderList_count' : box.getElementsByClassName('order_orderList_count')[0].id,
			'orderList_price' : box.getElementsByClassName('order_orderList_price')[0].id,
			'orderList_progress' : '입금대기',
		}
		ob.push(map)
	})
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
		console.log(json)
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
	let day = today.getDay() + ''  // 요일
	let orderList_order_number = year + month + date + day
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