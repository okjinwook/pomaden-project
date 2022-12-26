// 리뷰 모달 띄우는 함수입니다. 
function reviewOnClick(product_name, product_color, product_size){
	const modal = document.querySelector('.review_modal_box')
	const overlay = document.querySelector('.overlay')
	const product = document.querySelector('.review_modal_product > input[name="review_product"]')
	const color = document.querySelector('.review_modal_color > input[name="review_color"]')
	const size = document.querySelector('.review_modal_size > input[name="review_size"]')
	product.value = product_name
	color.value = product_color
	size.value = product_size
	modal.classList.remove('hidden')
	overlay.classList.remove('hidden')
	
}
// 리뷰 모달 숨기는 함수입니다.
function reviewModalCancleClick(){
	const modal = document.querySelector(".review_modal_box")
	const overlay = document.querySelector(".overlay")
	modal.classList.add('hidden')
	overlay.classList.add('hidden')
}

// 사진 선택시 이미지 띄우는 함수입니다
function reviewUpload(event) {
	let target = event.target
	let file = target.files[0]
	var reader = new FileReader();
    reader.readAsDataURL(file); //파일을 읽는 메서
    reader.onload =  function() {
		const img_box = document.querySelector('.review_modal_img_box')
    	const img = document.createElement('img')
    	img.src = reader.result
		img.classList.add('review_load_img')
		img_box.appendChild(img)
		target.parentNode.style.display = 'none'
		
	}
}

// 평점 별 클릭 함수입니다
function gradeOnClick(count) {
	const grade_box = document.querySelector('.review_grade_star')
	const review_grade = document.querySelector('.review_grade_input')
	// 실제 평점 값 넣습니다
	review_grade.value = count
	let whiteStar = 0
	let dom = ''
	// 클릭한 평점 만큼 색칠 된 별 생성합니다
	for(let i = 1; i <= count; i++) {
		dom += `<div class="" onclick="gradeOnClick(${i})">★</div>`
		whiteStar = i
	}
	// 클릭한 평점 만큼 색칠 하고 5개까지 남은 빈 별 생성합니다
	for(let k = whiteStar + 1; k <= 5; k++) {
		dom += `<div class="" onclick="gradeOnClick(${k})">☆</div>`
	}
	grade_box.innerHTML = dom
}