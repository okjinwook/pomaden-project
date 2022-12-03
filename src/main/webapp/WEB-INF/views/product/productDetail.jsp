<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="productDetail_component">
		<div class="productDetail_info jcsb">
			<div class="productDetail_img_box jcce">
				<img src="${dto.product_img }">
			</div>
			<div class="productDetail_info_box">
				<div class="productDetail_product_name">${dto.product_name }</div>
				<div class="jcsb">
					<div class="df">
						<div class="productDetail_product_price">
							<fmt:formatNumber pattern="###,###" value="${dto.product_price}" />원
						</div>
						<div class="productDetail_product_salePrice">
							<fmt:formatNumber pattern="###,###" value="${dto.product_price * (100 - dto.product_sale) / 100}" />원
						</div>
					</div>
					<div class="productDetail_product_sale">
						( <span style="color: red;">${dto.product_sale }%</span> 할인 )	
					</div>
				</div>
				<div class="productDetail_product_info_box jcsb" onclick="infoOnClick(event)">
					<div class="productDetail_product_info_title">상품정보</div>
					<div>+</div>
					<div class="productDetail_info_dropbox hidden">
						<div class="productDetail_product df">
							<div class="productDetail_info_span">- 소비자가</div>
							<span class="productDetail_price_span"><fmt:formatNumber pattern="###,###" value="${dto.product_price}" />원</span>
						</div>
						<div class="productDetail_product df">
							<div class="productDetail_info_span">- 판매가</div>
							<span class="productDetail_price_span"><fmt:formatNumber pattern="###,###" value="${dto.product_price * (100 - dto.product_sale) / 100}" />원</span>
						</div>
						<div class="productDetail_product df">
							<div class="productDetail_info_span">- 배송비 결제</div>
							<span class="productDetail_price_span">2500원</span>
						</div>
					</div>
				</div>
				<div class="productDetail_item_color_box aice">
					<div class="productDetail_item_color_title">색상</div>
					<div class="productDetail_color_button df">
						<div class="productDetail_colors aice jcce">블랙</div>
						<div class="productDetail_colors aice jcce">화이트</div>
						<div class="productDetail_colors aice jcce">그레이</div>
						<div class="productDetail_colors aice jcce">옐로우</div>
					</div>
				</div>
				<div class="productDetail_item_size_box aice">
					<div class="productDetail_item_size_title">사이즈</div>
					<div class="productDetail_size_button df">
						<div class="productDetail_sizes aice jcce">XL</div>
						<div class="productDetail_sizes aice jcce">L</div>
						<div class="productDetail_sizes aice jcce">M</div>
					</div>
				</div>
				<div class="productDetail_button_box jcsb">
					<div class="productDetail_buy_button jcce aice">구매</div>
					<div class="productDetail_cart_button jcce aice">장바구니 담기</div>
				</div>
			</div>
		</div>
		<div class="productDetail_review_box">
			<div class="productDetail_review_title">REVIEW</div>
			<div></div>
		</div>
	</div>
</main>

<script>
	const colors = document.querySelectorAll(".productDetail_colors")
	const sizes = document.querySelectorAll(".productDetail_sizes")
	
	colors.forEach(color => {
		color.addEventListener('click', colorOnClick)
	})
	sizes.forEach(size => {
		size.addEventListener('click', sizeOnClick)
	})
</script>
<%@ include file="../footer.jsp" %>