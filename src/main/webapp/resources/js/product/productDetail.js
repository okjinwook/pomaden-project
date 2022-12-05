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
	let dom = ''
	// 색상이 선택이 먼저 되어 있으면 사이즈 선택할 수 있습니다
	colors.forEach(color => {
		if(color.style.color == 'white'){
			sizes.forEach(size => {
				size.style.backgroundColor = '#F9F9F9'
				size.style.color = 'black'
			})
			event.target.style.backgroundColor = '#333'
			event.target.style.color = 'white'
			dom += `<div class="productDetail_buyList_name">${product_name}</div>`
			dom += '<div class="jcsb">'
			dom += '	<div class="df">'
			dom += `		<div class="productDetail_buyList_color">색상[${color.innerText}]</div>`
			dom += `		<div class="productDetail_buyList_size">사이즈[${size.innerText}]</div>`
			dom += '	</div>'
			dom += '	<div>'
			dom += '		<div class="productDetail_buyList_salePrice">'
			dom += `			총가격 : ${product_salePrice}원`
			dom += '		</div>'
			dom += '	</div>'
			dom += '</div>	'
			buyList_box.innerHTML = dom
		}
	})
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

// 장바구니 담기 버튼 클릭 함수입니다
function cartOnclick(event) {
	const buyList_box = document.querySelector(".productDetail_buyList_box")
	if(buyList_box.innerText == '') {
		alert('상품을 선택해주세요.')
	}
	else {
		const url = cpath + '/cart/insert'
		const ob = {
			'product_member_id': product_member_id,
			'product_name' : product_name,
			'product_img' :  product_img,
			'product_price' : product_price,
			'product_sale' : product_sale,
			'product_category' : product_category,
			'product_count' : product_count,
			'product_color' : product_color,
			'product_size' : product_size,
			'product_salePrice' : product_salePrice
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
			console.log(json)
		})
	}
}
