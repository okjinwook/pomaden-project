function questionOnClick(event) {
	let target = event.target.parentNode.nextElementSibling
	if(target.classList.contains('hidden') == false && target.classList.contains('myPage_myQuestion_detail_box')) {
		target.classList.add('hidden')
	}
	else {
		target.classList.remove('hidden')
	}
}