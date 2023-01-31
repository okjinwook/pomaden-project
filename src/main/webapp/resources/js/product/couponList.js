// 부모창 값 넘겨주기 (opener <= 부모창 객체(?))
function sendCoupon(){
	opener.sendCoupon(total_sale_price, coupon_arr, item_arr);
	window.close();
}
// 쿠폰 적용 함수입니다.
function selectCoupon(coupon_name, coupon_sale, coupon_idx) {
	for(idx of coupon_arr) {
		if(idx == coupon_idx) {
			// 사용한 쿠폰이랑 동일한 idx이면 함수 막기
			return false
		}
	}
	selectCouponName.innerText = coupon_name
	selectSalePrice.innerText = Number(selectPrice * (coupon_sale * 1 / 100)).toLocaleString() + '원'
	total_sale_price = total_sale_price * 1 + selectPrice * (coupon_sale * 1 / 100)
	const ob = {
		'cart_idx' : cart_idx,
		'cart_price' : selectPrice * (coupon_sale * 1 / 100),
	}
	coupon_arr.push(coupon_idx)
	item_arr.push(ob)
	modal.classList.add('hidden')
	overlay.classList.add('hidden')
}
// 쿠폰 리스트 모달 띄우는 함수입니다.
function selectCouponList(event, totalPrice, item_idx) {
	const couponList = document.querySelectorAll('.couponList_coupon_item > .couponList_coupon_idx')
	let target = event.target
	while(target.classList.contains('couponItemList_item_box') == false) {
		target = target.parentNode
	}
	// 사용한 쿠폰은 사용불가 만드는 로직
	couponList.forEach(coupon => {
		for(idx of coupon_arr) {
			if(coupon.value == idx) {
				const button = coupon.parentNode.getElementsByClassName('couponList_apply_button')[0] 
				button.innerText = '선택 완료'
				button.classList.add('useCoupon_button')
			}
		}
	})
	modal.classList.remove('hidden')
	overlay.classList.remove('hidden')
	cart_idx = item_idx
	selectPrice = totalPrice
	selectCouponName = target.getElementsByClassName('couponItemList_coupon_name_box')[0]
	selectSalePrice = target.getElementsByClassName('couponItemList_item_salePrice')[0]
}
function cancleOnClick() {
	modal.classList.add('hidden')
	overlay.classList.add('hidden')
}