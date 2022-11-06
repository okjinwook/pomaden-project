// 전체보기 클릭 했을 때 컨텐츠 띄우기 함수입니다
function menuAllClick(event) {
	const dropbox_menuAll = document.querySelector('.dropbox_menuAll')
	
	// 클릭에 맞는 컨텐츠 보이게 합니다
	if (dropbox_menuAll.classList.contains('hidden') == false) {
		dropbox_menuAll.classList.add('hidden')
		menuAll_button.innerText = '전체보기'
	} else {
		dropbox_menuAll.classList.remove('hidden')
		menuAll_button.innerText = '전체보기 X'
	}
}