// 자식 부모창에서 쿠폰 정보를 받아오는 함수입니다
function sendCoupon(coupon_name, coupon_sale) {
	const coupon_box = document.querySelector('.payment_coupon_box')
	const discount = document.querySelector('.payment_orderPrice_price > .payment_orderPrice_discount')
	const total = document.querySelector('.payment_orderPrice_price > .payment_orderPrice_total')
	
	coupon_box.innerText = '- ' + Number(totalPrice * (coupon_sale / 100)).toLocaleString() + '원'
	discount.innerText = '- ' + Number(totalSale + totalPrice * (coupon_sale / 100)).toLocaleString() + '원'
	totalSale = Math.floor(totalSale + totalPrice * (coupon_sale / 100))
	totalPrice =  Math.floor(totalPrice * (100 - coupon_sale) / 100 )
	
	total.innerText = Number(totalPrice).toLocaleString() + '원'
}
// 적립금 적용 함수입니다
function pointOnClick() {
	const point = document.querySelector('.payment_discount_point_input').value
	const total = document.querySelector('.payment_orderPrice_price > .payment_orderPrice_total')
	const discount = document.querySelector('.payment_orderPrice_price > .payment_orderPrice_discount')
	
	
	discount.innerText = '- ' + Number((totalSale * 1) + (point * 1)).toLocaleString() + '원'
	total.innerText = Number((totalPrice * 1) - (point * 1)).toLocaleString() + '원'
}

// 결제수단 선택 함수입니다
function paymentWayOnClick(ob) {
	const paymentWay = document.querySelectorAll('.payment_paymentWay')
	paymentWay.forEach(ob => {
		ob.classList.add('hidden')
	})
	document.querySelector('.' + ob).classList.remove('hidden')
}