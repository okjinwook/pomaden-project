function adminUpload(event) {
	let target = event.target
	let file = target.files[0]
	var reader = new FileReader();
    reader.readAsDataURL(file); //파일을 읽는 메서
    reader.onload =  function() {
    	const img = document.createElement('img')
    	img.src = reader.result
		img.classList.add('admin_load_img')
		target.parentNode.parentNode.appendChild(img)
		target.parentNode.style.display = 'none'
		
	}
    console.log(target.value)
}