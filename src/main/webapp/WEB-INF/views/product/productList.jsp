<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<main>
	<div class="productList_component">
		<div class="productList_title">${category }</div>
		<div class="productList_category_box aice">
			<div class="productList_outer30_component productList_category">아우터 30</div>
			<div class="productList_shirts30_component productList_category">셔츠 30</div>
			<div class="productList_Tshirts_component productList_category">티셔츠 30</div>
			<div class="productList_pants30_component productList_category">팬츠 30</div>
			<div class="productList_shoose30_component productList_category">슈즈 30</div>
		</div>
		<div class="productList_item_box df">
			<c:forEach var="i" begin="1" end="16">
				<div class="productList_item">
					<div class="productList_item_img">
						<img src="https://www.smallman.co.kr/web/product/medium/202208/770d79f1fa1212186d103da49e7bf8b8.jpg" width="300px">
					</div>
					<div class="productList_item_name">라운드 넥 티셔츠</div>
					<div class="productList_item_price">32000 원</div>
					<div class="productList_item_sale">( 20% 할인 )</div>
					<div class="productList_item_review">리뷰 : 23개</div>
					<div class="productList_item_like">❤ 302</div>
				</div>
			</c:forEach>
		</div>
	</div>
</main>
<script>
	const productList_categorys = document.querySelectorAll('.productList_category')
	productList_categorys.forEach(box => {
		box.addEventListener('click', productCategoryClick)
	})
	
</script>
<%@ include file="../footer.jsp" %>