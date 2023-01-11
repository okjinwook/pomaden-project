function adminUpload(event) {
	const admin_img = document.querySelector('.admin_img')
	const file_span = document.querySelector('.admin_img_label > span')
	admin_img.innerHTML = ''
	let target = event.target
	let file = target.files[0]
	var reader = new FileReader();
    reader.readAsDataURL(file); //파일을 읽는 메서
    reader.onload =  function() {
    	const img = document.createElement('img')
    	img.src = reader.result
		img.classList.add('admin_load_img')
		admin_img.appendChild(img)
		file_span.innerText = ''
	}
}

function adminCegoryOnChange(event){
	const value = event.target.value
	const box = document.querySelector('.admin_sub_category_box')
	box.innerHTML = ''
	let dom = '<div class="admin_info_box">서브 카테고리</div>'
	if(value == '아우터') {
		dom += '<select class="admin_sub_outer" name="product_kind" required="required">'
		dom += 		'<option>--선택--</option>'
		dom += 		'<option>가디건</option>'
		dom += 		'<option>코치자켓</option>'
		dom += 		'<option>폴리스</option>'
		dom += 		'<option>코트</option>'
		dom += 		'<option>패딩</option>'
		dom += '</select>'
	}
	else if(value == '티셔츠') {
		dom += '<select class="admin_sub_Tshirts" name="product_kind" required="required">'
		dom += 		'<option>--선택--</option>'
		dom += 		'<option>맨투맨</option>'
		dom += 		'<option>니트/스웨터</option>'
		dom += 		'<option>후드</option>'
		dom += 		'<option>폴라넥</option>'
		dom += '</select>'
	}
	else if(value == '셔츠') {
		dom += '<select class="admin_sub_shirts" name="product_kind" required="required">'
		dom += 		'<option>--선택--</option>'
		dom += 		'<option>긴팔셔츠</option>'
		dom += 		'<option>반팔셔츠</option>'
		dom += 		'<option>스트라이프</option>'
		dom += '</select>'
	}
	else if(value == '팬츠') {
		dom += '<select class="admin_sub_pants" name="product_kind" required="required">'
		dom += 		'<option>--선택--</option>'
		dom += 		'<option>청바지</option>'
		dom += 		'<option>슬랙스</option>'
		dom += 		'<option>트레이닝</option>'
		dom += '</select>'
	}
	else if(value == '슈즈') {
		dom += '<select class="admin_sub_shoose" name="product_kind" required="required">'
		dom += 		'<option>--선택--</option>'
		dom += 		'<option>스니커즈</option>'
		dom += 		'<option>구두</option>'
		dom += 		'<option>부츠</option>'
		dom += 		'<option>슬리퍼</option>'
		dom += '</select>'
	}
	box.innerHTML = dom
}


