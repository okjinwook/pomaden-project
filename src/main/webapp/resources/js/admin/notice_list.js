function itemOnClick(notice_title, notice_content) {
	const title = document.querySelector('.admin_notice_detail_title')
	const content = document.querySelector('.admin_notice_detail_content')
	title.innerText = notice_title
	content.innerText = notice_content 
}

function adminNoticeDelete(idx) {
	if(confirm('상품을 삭제하시겠습니까?')) {
		const url = cpath + '/admin/notice_delete?notice_idx=' + idx
		const opt = {
			method : 'POST'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
		 	alert(json.msg)
			location.reload()
		})
	}
}


