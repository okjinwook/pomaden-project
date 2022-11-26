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
function cartMinusOnClick(event) {
}
function cartPlusOnClick(event) {
	
}
