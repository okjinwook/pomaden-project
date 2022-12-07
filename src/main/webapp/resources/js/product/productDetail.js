// color 선택 함수입니다
function colorOnClick(event) {
	const colors = document.querySelectorAll(".productDetail_colors")
	const sizes = document.querySelectorAll(".productDetail_sizes")
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
	// 색상이 선택이 먼저 되어 있으면 사이즈 선택할 수 있습니다
	colors.forEach(color => {
		if(color.style.color == 'white'){
			sizes.forEach(size => {
				size.style.backgroundColor = '#F9F9F9'
				size.style.color = 'black'
			})
			event.target.style.backgroundColor = '#333'
			event.target.style.color = 'white'
			const item_color = color.innerText
			const item_size = size.innerText
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
				let dom = ''
				dom += '<div class="jcsb">'
				dom += '	<div class="aice">'
				dom += `		<div class="productDetail_buyList_color" id="${color.innerText}">색상[${color.innerText}]</div>`
				dom += `		<div class="productDetail_buyList_size" id="${size.innerText}">사이즈[${size.innerText}]</div>`
				dom += `		<div class="productDetail_buyList_count" id="${json.count}">남은수량[${json.count}개]</div>`
				dom += `		<div class="productDetail_buyList_orderCount df">`
				dom += `			<input class="productDetail_buy_count" type="number" value="1" min="1">`
				dom += `			<div class="productDetail_upDownBox">`
				dom += `				<img class="productDetail_up_button" src="https://img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif" onclick="detailUpOnClick()">`
				dom += `				<img class="productDetail_down_button" src="https://img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif" onclick="detailDownOnClick()">`
				dom += `			</div>`
				dom += '		</div>'
				dom += '	</div>'
				dom += '</div>	'
				dom += '<div class="jcsb">'
				dom += '	<div class="productDetail_buyList_total_info">총 상품 가격</div>'
				dom += '	<div class="productDetail_buyList_salePrice">'
				dom += `		총가격 : ${product_salePrice }원`
				dom += '	</div>'
				dom += '</div>'
				buyList_box.innerHTML = dom
			})
		}
	})
}
// 수량 변동에 따른 총 가격 변경 함수입니다.
function renderSalePrice(count) {
	const salePrice = document.querySelector(".productDetail_buyList_salePrice")
	salePrice.innerHTML = `총가격 : ${Number((product_price * (100 - product_sale) / 100) * (count * 1)).toLocaleString()}원`
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
	.then(resp => resp.text())
	.then(text => {
		if(text == '1') {
			alert("장바구니에 등록되었습니다.")
		}
	})
}

// 장바구니 담기 버튼 클릭 함수입니다
function cartOnclick(event) {
	const buyList_box = document.querySelector(".productDetail_buyList_box")
	if(buyList_box.innerText == '') {
		alert('상품을 선택해주세요.')
	}
	else {
		const product_count = document.querySelector(".productDetail_buy_count").value
		const product_color = document.querySelector(".productDetail_buyList_color").id
		const product_size = document.querySelector(".productDetail_buyList_size").id
		// 세일가 적용된 가격
		const cart_price = product_price * (100 - product_sale) / 100
		// 가격의 총 합
		const cart_total = (cart_price * 1) * (product_count * 1)
		
		const url = cpath + '/cart/insert'
		const ob = {
			'cart_member_id': product_member_id,
			'cart_name' : product_name,
			'cart_img' :  product_img,
			'cart_price' : cart_price,
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
				alert(json.msg)
			}
		})
	}
}
