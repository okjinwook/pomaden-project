function productCategoryClick(event) {
	let target = event.target
	productList_categorys.forEach(box => {
		box.style.color = 'darkgrey'
		box.style.fontWeight = 'normal'
	})
	
	target.style.color = 'black'
	target.style.fontWeight = '700'
}