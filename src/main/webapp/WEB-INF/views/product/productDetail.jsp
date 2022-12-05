<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="productDetail_component">
		<div class="productDetail_info jcsb">
			<div class="productDetail_img_box jcce">
				<img src="${prodDto.product_img }">
			</div>
			<div class="productDetail_info_box">
				<div class="productDetail_product_name">${prodDto.product_name }</div>
				<div class="jcsb">
					<div class="df">
						<div class="productDetail_product_price">
							<fmt:formatNumber pattern="###,###" value="${prodDto.product_price}" />원
						</div>
						<div class="productDetail_product_salePrice">
							<fmt:formatNumber pattern="###,###" value="${prodDto.product_price * (100 - prodDto.product_sale) / 100}" />원
						</div>
					</div>
					<div class="productDetail_product_sale">
						( <span style="color: red;">${prodDto.product_sale }%</span> 할인 )	
					</div>
				</div>
				<div class="productDetail_product_info_box jcsb" onclick="infoOnClick(event)">
					<div class="productDetail_product_info_title">상품정보</div>
					<div>+</div>
					<div class="productDetail_info_dropbox hidden">
						<div class="productDetail_product df">
							<div class="productDetail_info_span">- 소비자가</div>
							<span class="productDetail_price_span"><fmt:formatNumber pattern="###,###" value="${prodDto.product_price}" />원</span>
						</div>
						<div class="productDetail_product df">
							<div class="productDetail_info_span">- 판매가</div>
							<span class="productDetail_price_span"><fmt:formatNumber pattern="###,###" value="${prodDto.product_price * (100 - prodDto.product_sale) / 100}" />원</span>
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
						<c:forEach var="color" items="${colorList }">
							<div class="productDetail_colors aice jcce" onclick="colorOnClick(event)">${color}</div>
						</c:forEach>
					</div>
				</div>
				<div class="productDetail_item_size_box aice">
					<div class="productDetail_item_size_title">사이즈</div>
					<div class="productDetail_size_button df">
						<c:forEach var="size" items="${sizeList }">
							<div class="productDetail_sizes aice jcce" onclick="sizeOnClick(event)">${size}</div>
						</c:forEach>
					</div>
				</div>
				<div class="productDetail_buyList_box">
					
				</div>
				<div class="productDetail_button_box jcsb">
					<div class="productDetail_buy_button jcce aice">구매</div>
					<div class="productDetail_cart_button jcce aice" onclick="cartOnclick()">장바구니 담기</div>
				</div>
			</div>
		</div>
		<div class="productDetail_review_title">REVIEW (평균 - 5점)</div>
		<div class="productDetail_review_box">
			<c:forEach var="i" begin="1" end="5">
				<div class="productDetail_review_item df">
					<div class="productDetail_review_reply_info">
						<div class="productDetail_review_writer">작성자 : coke님</div>
						<div class="productDetail_review_point">★★★★★ 5점</div>
						<div class="productDetail_review_content">너무 이쁜 옷입니다.</div>
						<div class="productDetail_review_img"><img src="${prodDto.product_img }" width="100px"></div>
						<div class="productDetail_review_reply">
							<div class="productDetail_review_reply_button" onclick="detailReplyOnClick(event)">댓글 (0)</div>
							<div class="productDetail_review_reply_dropbox hidden" >
								<c:forEach var="i" begin="1" end="3">
									<div class="productDetail_review_reply_item">
										<div class="productDetail_reply_writer">fanta님</div>
										<div class="productDetail_reply_content">잘 어울립니다!!</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					<div class="productDetail_review_buyInfo jcce aice">
						<div>구매하신 상품</div>
						<div>컬러 : 그레이</div>
						<div>사이즈 : XL</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</main>
<script>
	const product_member_id = '${login.member_id}'
	const product_name = '${prodDto.product_name}'
	const product_img = '${prodDto.product_img}'
	const product_price = '${prodDto.product_price}'
	const product_sale = '${prodDto.product_sale}'
	const product_category = '${prodDto.product_category}'
	const product_count = '${prodDto.product_count}'
	const product_color = '${prodDto.product_color}'
	const product_size = '${prodDto.product_size}'
	const product_salePrice = Number(product_price * (100 - product_sale) / 100).toLocaleString() 
</script>
<%@ include file="../footer.jsp" %>