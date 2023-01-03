function shippingInsertOnClick() {
	const url = cpath + '/shipping/insert'
	window.open(url, 'shippingInsert', 'width=500px, height=600px')
}
function shippingUpdateOnClick(shipping_idx) {
	const url = cpath + '/shipping/update?shipping_idx=' + shipping_idx
	window.open(url, 'shippingUpdate', 'width=500px, height=600px')
}