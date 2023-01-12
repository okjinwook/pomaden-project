// 배송지 추가 팝업 띄우기
function shippingInsertOnClick() {
	const url = cpath + '/shipping/insert'
	window.open(url, 'shippingInsert', 'width=500px, height=600px')
}
// 배송지 수정 팝업 띄우기
function shippingUpdateOnClick(shipping_idx) {
	const url = cpath + '/shipping/update?shipping_idx=' + shipping_idx
	window.open(url, 'shippingUpdate', 'width=500px, height=600px')
}
// 배송지 삭제
function shippingDeleteOnClick(shipping_idx) {
	if(confirm('정말 배송지를 삭제하시겠습니까?')) {
		const url = cpath + '/shipping/delete?shipping_idx=' + shipping_idx
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
// 수정이나 배송지 추가 후 새로고침
function setReload() {
	location.reload()
}
// 배송지 변경할 idx 대입
function repOnclick(ob) {
	rep = ob.value
}

// 배송지 변경버튼 클릭 함수입니다
function repChangeOnClick() {
	if(rep != '') {
		// 기존에 대표로 지정된 배송지의 shipping_rep 값을 0 (즉, 대표가 아님)
		const unRep_url = cpath + '/shipping/repUpdate?shipping_idx=' + unRep * 1 + '&shipping_rep=0'
		// radio 체크된 배송지의 shipping_rep 값을 1 (즉, 대표)
		const rep_url = cpath + '/shipping/repUpdate?shipping_idx=' + rep * 1 + '&shipping_rep=1'
		const opt = {
			method : 'POST'
		}
		fetch(rep_url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1 && unRep != '') {
				fetch(unRep_url, opt)
				.then(resp => resp.text())
				.then(text => {
					if(text == 1) {
						alert('정상적으로 변경되었습니다.')
						opener.setReload()
						window.close()
					}
					else {
						alert('변경 실패!!')
						location.reload()
					}
				})
			}
			else if(text == 1){
				alert('정상적으로 변경되었습니다.')
				opener.setReload()
				window.close()
			}
			else {
				alert('변경 실패!!')
				location.reload()
			}
		})
	}
	else {
		opener.setReload()
		window.close()
	}
}