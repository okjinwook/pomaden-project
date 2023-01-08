function questionOnWrite(){
	const modal = document.querySelector('.question_modal_box')
	const overlay = document.querySelector(".overlay")
	modal.classList.remove('hidden')
	overlay.classList.remove('hidden')
}
function modalCancleClick(){
	const modal = document.querySelector('.question_modal_box')
	const overlay = document.querySelector(".overlay")
	modal.classList.add('hidden')
	overlay.classList.add('hidden')
}

