// 이벤트, 공지사항 클릭 했을 때의 함수입니다
function mainNewsClick(event) {
	let button = event.target
	const main_news_content_event = document.querySelector('.main_news_content_event')
	const main_news_content_notice = document.querySelector('.main_news_content_notice')
	main_news_buttonBox.forEach(ob => {
		ob.style.borderBottom = '1px solid #dadada'
	})
	button.style.borderBottom = '3px solid black'
	if(button.classList.contains('event_button') == true) {
		main_news_content_notice.classList.add('hidden')
		main_news_content_event.classList.remove('hidden')
	}
	else {
		main_news_content_event.classList.add('hidden')
		main_news_content_notice.classList.remove('hidden')
	}
}