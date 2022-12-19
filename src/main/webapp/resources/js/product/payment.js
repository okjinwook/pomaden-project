function sendCoupon(coupon_name, coupon_sale) {
	const box = document.querySelector('.payment_coupon_box')
	const discount = document.querySelector('.payment_orderPrice_price > .payment_orderPrice_discount')
	box.innerText = '- ' + Number(salePrice * (coupon_sale / 100)).toLocaleString() + '원'
	salePrice =  salePrice * (100 - coupon_sale) / 100
	totalSale = totalSale + salePrice * (coupon_sale / 100)
	discount.innerText = '- ' + totalSale + '원'
}
function pointOnClick() {
	const point = document.querySelector('.payment_discount_point_input').value
	const total = document.querySelector('.payment_orderPrice_price > .payment_orderPrice_total')
	const discount = document.querySelector('.payment_orderPrice_price > .payment_orderPrice_discount')
	salePrice = salePrice - point
	total.innerText = Number(salePrice).toLocaleString() + '원'
	totalSale = totalSale + point
	discount.innerText = '- ' + totalSale + '원'
}