<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<main>
	<div class="productList_component">
		<div class="productList_title">${category }</div>
		<div class="productList_category_box aice">
			<div class="productList_category">
				<a href="${cpath }/product/productList?category=${category }&kind=전체">전체</a>
			</div>
			<c:forEach var="dto" items="${kindAll }">
				<div class="productList_category">
					<a href="${cpath }/product/productList?category=${category }&kind=${dto.product_kind}">${dto.product_kind }</a>
				</div>
			</c:forEach>
		</div>
		<div class="productList_item_box df">
			<c:forEach var="dto" items="${list }">
				<div class="productList_item">
					<div class="productList_item_img">
						<img src="${dto.product_img }" width="300px">
					</div>
					<div class="productList_item_name">${dto.product_name }</div>
					<div class="productList_item_price">
						<fmt:formatNumber pattern="###,###" value="${dto.product_price}" />원
					</div>
					<div class="productList_item_sale">( ${dto.product_sale }% 할인 )</div>
					<div class="productList_item_salePrice">
						<fmt:formatNumber pattern="###,###" value="${dto.product_price * (100 - dto.product_sale) / 100}" />원
					</div>
					<div class="productList_item_review">리뷰 : 0개</div>
					<div class="productList_item_like">❤ ${dto.product_like }</div>
				</div>
			</c:forEach>
		</div>
	</div>
</main>
<script>
	const productList_categorys = document.querySelectorAll('.productList_category > a')
	
	productList_categorys.forEach(box => {
		if(box.innerText == '${kind}') {
			box.style.fontWeight = '700'
			box.style.color = 'black'
		}
		box.addEventListener('click', productCategoryClick)
	})
	
</script>
<%@ include file="../footer.jsp" %>