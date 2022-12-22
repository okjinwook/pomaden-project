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

// 최종 결제 클릭 함수입니다.
function ResultPaymentOnClick() {
	const paymentWay = document.querySelectorAll('input[name=paymentWay]')
	const item = document.querySelectorAll('.payment_orderList_item')
	paymentWay.forEach(way => {
		if(way.value == 'kakaopay') {
			
		}
		else {
			const url = cpath + '/orderList/insert'
			const ob = []
			item.forEach(box => {
				const map = {
					'orderList_img' : box.children[0].id,
					'orderList_name' : box.children[1].children[0].id,
					'orderList_color' : box.children[1].children[1].id,
					'orderList_size' : box.children[1].children[2].id,
					'orderList_count' : box.children[2].id,
					'orderList_price' : totalResultPrice,
					'orderList_price' : '입금대기',
				}
				ob.push(map)
			})
			
			const opt = {
				method : 'POST',
				body : JSON.stringify(ob),
				headers : {
					'Content-type' : 'application/json'
				}
			}
			fetch(url, opt)
			.then(resp => resp.json())
			.then(json => {
			})
		}
		
	})
}