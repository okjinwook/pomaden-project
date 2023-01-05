function adminProductUpdate(event, product_name) {
	let target = event.target
	while(target.classList.contains('admin_product_item') == false) {
		target = target.parentNode
	}
	const product_price = target.getElementsByClassName('admin_product_price_input')[0].value
	const product_sale = target.getElementsByClassName('admin_product_sale_input')[0].value
	const url = cpath + '/admin/product_update'
	const ob = {
		'product_name' : product_name,
		'product_price' : product_price,
		'product_sale' : product_sale
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
	})
}
function adminProductDelete(product_name) {
	if(confirm('상품을 삭제하시겠습니까?')) {
		const url = cpath + '/admin/product_delete?product_name=' + product_name
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


