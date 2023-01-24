// color 선택 함수입니다
function colorOnClick(event) {
	const buyList_box = document.querySelector('.productDetail_buyList_box')
	const colors = document.querySelectorAll(".productDetail_colors")
	const sizes = document.querySelectorAll(".productDetail_sizes")
	buyList_box.classList.remove('soldOut')
	buyList_box.innerHTML = '<div class="productDetail_none_option jcce aice">옵션을 선택해주세요</div>'
	colors.forEach(color => {
		color.style.backgroundColor = '#F9F9F9'
		color.style.color = 'black'
	})
	event.target.style.backgroundColor = '#333'
	event.target.style.color = 'white'
	sizes.forEach(size => {
		size.style.backgroundColor = '#F9F9F9'
		size.style.color = 'black'
	})
}
// size 선택 함수입니다
function sizeOnClick(event) {
	const buyList_box = document.querySelector(".productDetail_buyList_box")
	const sizes = document.querySelectorAll(".productDetail_sizes")
	const colors = document.querySelectorAll(".productDetail_colors")
	const size = event.target
	buyList_box.classList.remove('soldOut')
	// 색상이 선택이 먼저 되어 있으면 사이즈 선택할 수 있습니다
	colors.forEach(color => {
		if(color.style.color == 'white'){
			sizes.forEach(size => {
				size.style.backgroundColor = '#F9F9F9'
				size.style.color = 'black'
			})
			event.target.style.backgroundColor = '#333'
			event.target.style.color = 'white'
			item_color = color.innerText
			item_size = size.innerText
			const url = cpath + '/item/getCount'
			const ob = {
				'item_name' : product_name,
				'item_color' : item_color, 
				'item_size' : item_size,
			}
			const opt = {
	            method: 'POST',
	            body: JSON.stringify(ob),
	            headers: {
               		'Content-type': 'application/json'
	        	},
         	}
			// 선택한 상품 수량 가져오는 ajax입니다
			fetch(url, opt)
			.then(resp => resp.json())
			.then(json => {
				if(json.count != 0) {
					let dom = ''
					dom += '<div class="jcsb">'
					dom += `	<div class="aice">`
					dom += `		<div class="productDetail_buyList_color" id="${item_color}">색상[${item_color}]</div>`
					dom += `		<div class="productDetail_buyList_size" id="${item_size}">사이즈[${item_size}]</div>`
					dom += `		<div class="productDetail_buyList_count" id="${json.count}">남은수량[${json.count}개]</div>`
					dom += `		<div class="productDetail_buyList_orderCount df">`
					dom += `			<input class="productDetail_buy_count" type="number" value="1" min="1">`
					dom += `			<div class="productDetail_upDownBox">`
					dom += `				<img class="productDetail_up_button" src="https://img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif" onclick="detailUpOnClick()">`
					dom += `				<img class="productDetail_down_button" src="https://img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif" onclick="detailDownOnClick()">`
					dom += `			</div>`
					dom += '		</div>'
					dom += '	</div>'
					dom += '</div>'
					dom += '<div class="jcsb">'
					dom += `	<div class="productDetail_buyList_total_info">상품 가격 : ${Number(product_salePrice).toLocaleString()}</div>`
					dom += '	<div class="productDetail_buyList_salePrice">'
					dom += `		총가격 : ${Number(product_salePrice).toLocaleString() }원`
					dom += '	</div>'
					dom += '</div>'
					buyList_box.innerHTML = dom
					buyList_box.classList.remove('hidden')
					buyList_box.classList.add('choose_item')
				}
				else {
					buyList_box.innerHTML = '<div class="soldOut jcce aice">품절된 상품입니다!!</div>'
					buyList_box.classList.add('soldOut')
				}
			})
		}
	})
}
// 수량 변동에 따른 총 가격 변경 함수입니다.
function renderSalePrice(count) {
	const salePrice = document.querySelector(".productDetail_buyList_salePrice")
	salePrice.innerHTML = `총가격 : ${Number(product_salePrice * (count * 1)).toLocaleString()}원`
}
// 수량 조절하는 함수입니다
function detailUpOnClick() {
	const count_input = document.querySelector(".productDetail_buy_count")
	let value = document.querySelector(".productDetail_buy_count").value
	count_input.value = ++value
	renderSalePrice(count_input.value)
}
function detailDownOnClick() {
	const count_input = document.querySelector(".productDetail_buy_count")
	let value = document.querySelector(".productDetail_buy_count").value
	if(value == 1) {
		return
	}
	else {
		count_input.value = --value
	}
	renderSalePrice(count_input.value)
}

// 상품정보 클릭시 드롭박스 띄우기 함수입니다
function infoOnClick(event) {
	const info_dropbox = document.querySelector(".productDetail_info_dropbox")
	const info_box = document.querySelector(".productDetail_product_info_box")
	if(info_box == event.target) {
		if(info_dropbox.classList.contains('hidden') == false ) {
			info_dropbox.classList.add('hidden')
			event.target.style.height = 'auto'
		}
		else {
			info_dropbox.classList.remove('hidden')
			event.target.style.height = '150px'
		}
	}
}

// 리뷰 댓글 드롭박스 띄우기 함수입니다
function detailReplyOnClick(event) {
	const reply_dropbox = event.target.nextElementSibling
	if(reply_dropbox.classList.contains('hidden') == false ) {
		reply_dropbox.classList.add('hidden')
	}
	else {
		reply_dropbox.classList.remove('hidden')
	}
}
function cartUpdateAjax(count , cart_idx) {
	let product_count = document.querySelector(".productDetail_buy_count").value
					// (product_count * 1) + (count  * 1) <= 선택한 수량 + 기존 수량
	const cart_count = (product_count * 1) + (count  * 1)
				    // (product_price * (100 - product_sale) / 100) <= 세일된 가격
	const cart_total = (product_price * (100 - product_sale) / 100) * (cart_count * 1)
	const url = cpath + '/cart/update'
	const ob = {
		'cart_idx' : cart_idx,
		'cart_count' : cart_count,
		'cart_total' : cart_total,
	}
	const opt = {
        method: 'POST',
        body: JSON.stringify(ob),
        headers: {
           'Content-type': 'application/json'
        },
     }
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		if(json.confirm != null) {
			if(confirm(json.msg)) {
				location.href = cpath + '/cart/cartList'
			}
		}
		else{ 
			alert(json.msg)
		}
	})
}

// 장바구니 담기 버튼 클릭 함수입니다
function cartOnclick() {
	if(member_id == '') {
		alert('로그인 후 이용가능합니다.')
		location.href = cpath + '/member/login'
	}
	else {
		const buyList_box = document.querySelector(".productDetail_buyList_box")
		if(buyList_box.classList.contains('choose_item') == false) {
			alert('상품을 선택해주세요.')
		}
		else if(buyList_box.classList.contains('soldOut') == true) {
			alert('품절된 상품입니다')
		}
		else {
			const product_count = document.querySelector(".productDetail_buy_count").value
			const product_color = document.querySelector(".productDetail_buyList_color").id
			const product_size = document.querySelector(".productDetail_buyList_size").id
			// 가격의 총 합
			const cart_total = (product_salePrice * 1) * (product_count * 1)
			
			const url = cpath + '/cart/insert'
			const ob = {
				'cart_member_id': member_id,
				'cart_name' : product_name,
				'cart_img' :  product_img,
				'cart_price' : product_price * 1,
				'cart_sale' : product_sale * 1,
				'cart_count' : product_count * 1,
				'cart_color' : product_color,
				'cart_size' : product_size,
				'cart_total' : cart_total,
			}
			const opt = {
	            method: 'POST',
	            body: JSON.stringify(ob),
	            headers: {
	               'Content-type': 'application/json'
	            },
	         }
			fetch(url, opt)
			.then(resp => resp.json())
			.then(json => {
				// 컨펌 값이 있으면 컨펌메세지
				if(json.confirm != null) {
					if(confirm(json.msg)) {
						// 메세지 확인선택시 기존에 있던 장바구니 상품 추가 작업(update)
						cartUpdateAjax(json.cart_count, json.cart_idx)
					}
				}
				else {
					if(confirm(json.msg)) {
						location.href = cpath + '/cart/cartList'
					}
				}
			})
		}
	}
}
// 좋아요 누르면 발생하는 함수입니다.
function likeOnClick(event) {
	if(member_id == '') {
		alert('로그인 후 이용가능합니다.')
		location.href = cpath + '/member/login'
	}
	else {
		let result_like = ''
		let src = ''
		// 좋아요 버튼이 활성화 되어있으면
		if(img.classList.contains('productDetail_colorHearts')) {
			result_like = (product_like * 1) - 1
			product_like = (product_like * 1) - 1
			src = 'http://192.168.1.100:80/icon/blackHearts.png'
			img.classList.remove('productDetail_colorHearts')
			img.classList.add('productDetail_blackHearts')
			document.querySelector('.productDetail_like_button').style.backgroundColor = 'white'
		}
		// 좋아요 버튼이 비활성화 상태의 이미지면
		else {
			result_like = (product_like * 1) + 1
			product_like = (product_like * 1) + 1
			src = 'http://192.168.1.100:80/icon/colorHearts.png'
			img.classList.remove('productDetail_blackHearts')
			img.classList.add('productDetail_colorHearts')
			document.querySelector('.productDetail_like_button').style.backgroundColor = 'antiquewhite'
		}
		const url = cpath + '/product/likeUpdate'
		const ob = {
			'member_id' : member_id,
			'product_name' : product_name,
			'product_img' : product_img,
			'product_price' : product_price,
			'product_sale' : product_sale,
			'product_category' : product_category,
			'product_kind' : product_kind,
			'product_like' : result_like,
		}
		const opt = {
			method : 'POST',
			body : JSON.stringify(ob),
			headers : {
				'Content-type' : 'application/json'
			}
		}
		fetch(url, opt)
		.then(resp => resp.text())
		.then(text => {
			if(text == 1) {
				document.querySelector('.productDetail_like_button > img').src = src
			}
		})
	}
}
// 구매하기 버튼 클릭함수입니다.
function paymentOnClick() {
	const buyList_box = document.querySelector(".productDetail_buyList_box")
	if(member_id == '') {
		alert('로그인 후 이용가능합니다.')
		location.href = cpath + '/member/login'
	}
	if(buyList_box.classList.contains('choose_item') == false) {
		alert('상품을 선택해주세요.')
		}
	else if(buyList_box.classList.contains('soldOut') == true) {
		alert('품절된 상품입니다')
	}
	else {
		const count = document.querySelector(".productDetail_buy_count").value
		const url = cpath + '/product/paymentSingle?'
			 	  + 'item_name=' + product_name
				  + '&item_color=' + item_color 
				  + '&item_size=' + item_size
				  + '&count=' + count
		location.href = url
	}
}

// 리뷰 댓글 ajax함수입니다
function replyOnWrite(event, review_idx) {
	if(member_id == '') {
		alert('로그인 후 이용가능합니다.')
		location.href = cpath + '/member/login'
	}
	else {
		const write_input = event.target.previousElementSibling.value
		if(write_input == '') {
			alert('댓글을 입력해주세요.')
			return false
		}
		const url = cpath + '/reply/insert'
		const ob = {
			'reply_member_id' : member_id,
			'reply_review_idx' : review_idx,
			'reply_content' : write_input,
		}
		const opt = {
			method : 'POST',
			body : JSON.stringify(ob),
			headers : {
				'Content-type' : 'application/json'
			}
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			alert(json.msg)
			location.reload()
		})
	}
} 
// 댓글 수정 함수입니다.
function replyUpdate(event, reply_idx, reply_content) {
	let target = event.target
	if(target.innerText == '수정') {
		target.innerText = '수정완료'
		target.style.width = '55px'
		while(target.classList.contains('productDetail_reply_info') == false) {
			target = target.parentNode
		}
		target = target.nextElementSibling
		target.innerHTML = `<input class="productDetail_reply_content_input" value='${reply_content}'>`
		document.querySelector('.productDetail_reply_content').style.padding = '0px'
	}
	else {
		if(confirm('댓글을 수정하시겠습니까?')) {
			const reply_content_input = document.querySelector('.productDetail_reply_content_input').value
			const url = cpath + '/reply/update?reply_idx=' + reply_idx + '&reply_content=' + reply_content_input
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
}
// 댓글 삭제 함수입니다.
function replyDelete(reply_idx) {
	if(confirm('댓글을 삭제하시겠습니까?')) {
		const url = cpath + '/reply/delete?reply_idx=' + reply_idx
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
function loginTest() {
	if(member_id == '') {
		alert('로그인 후 이용가능합니다.')
		location.href = cpath + '/member/login'
	}
}
function setReload() {
	location.reload()
}