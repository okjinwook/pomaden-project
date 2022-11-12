function csButtonClick(event) {
	const target = event.target
	const cs_notice_content_box = document.querySelector('.cs_notice_content_box')
	const cs_oftenQeution_content_box = document.querySelector('.cs_oftenQeution_content_box')
	
	cs_buttons.forEach(button => {
		button.style.border = 'none' 
		button.style.borderBottom = '1px solid black' 
	})
	
	target.style.border = '1px solid black'
	target.style.borderBottom = 'none'
	if(target.classList.contains('cs_notice_button') == true) {
		cs_notice_content_box.classList.remove('hidden')
		cs_oftenQeution_content_box.classList.add('hidden')
	}
	else {
		cs_notice_content_box.classList.add('hidden')
		cs_oftenQeution_content_box.classList.remove('hidden')
	}
}