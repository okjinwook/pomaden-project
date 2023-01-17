// 답변 할 대상의 질문 객체 전달
function answerOnClick(question_idx, member_id, question_title, question_content) {
	const writer = document.querySelector('.admin_question_answer_writer')
	const title = document.querySelector('.admin_question_answer_title')
	const content = document.querySelector('.admin_question_answer_content')
	const idx = document.querySelector('input[name="answer_question_idx"]')
	idx.value = question_idx
	writer.innerText = member_id
	title.innerText = question_title
	content.innerText = question_content 
}
function answerOnSubmit(event) {
	const idx = document.querySelector('input[name="answer_question_idx"]')
	if(idx.value == '') {
		alert('질문을 선택해주세요.')
		event.preventDefault()
	}
	
}
