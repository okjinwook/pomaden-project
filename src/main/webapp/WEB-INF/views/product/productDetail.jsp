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
							<fmt:formatNumber pattern="###,###" value="${prodDto.product_price * (100 - prodDto.product_sale) / 100 }" />원
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
				<div class="productDetail_buyList_box hidden">
				</div>
				<div class="productDetail_button_box jcsb">
					<div class="productDetail_buy_button jcce aice" onclick="paymentOnClick()">바로구매</div>
					<div class="productDetail_cart_button jcce aice" onclick="cartOnclick()">
						<img src="${cpath }/resources/img/cart.png" width="30px">
					</div>
					<div class="productDetail_like_button jcce aice" onclick="likeOnClick(event)">
						<c:if test="${empty likeCheck }">
							<img class="productDetail_blackHearts" src="${cpath }/resources/img/blackHearts.png" width="30px">
						</c:if>
						<c:if test="${not empty likeCheck }">
							<img class="productDetail_colorHearts" src="${cpath }/resources/img/colorHearts.png" width="30px">
						</c:if>
					</div>
				</div>
			</div>
		</div>
		<div class="productDetail_review_title">REVIEW</div>
		<div class="productDetail_review_box">
			<div class="productDetail_review_short_box df">
				<div class="productDetail_review_short_new">최신순</div>
				<div class="productDetail_review_short_high">평점순</div>
			</div>
			<c:forEach var="reviewDto" items="${reviewList }">
				<div class="productDetail_review_item df">
					<div class="productDetail_review_info">
						<div class="productDetail_review_writer">작성자 : ${reviewDto.review_member_id }님</div>
						<div class="productDetail_review_point">
						<c:forEach begin="1" end="${reviewDto.review_grade }">
							★						
						</c:forEach>
						 	최고에요
						</div>
						<div class="productDetail_review_content">${reviewDto.review_content }</div>
						<div class="productDetail_review_img"><img src="${reviewDto.review_img }" width="100px"></div>
						<div class="productDetail_review_reply">
							<div class="productDetail_review_reply_button" onclick="detailReplyOnClick(event)">댓글 (0)</div>
							<div class="productDetail_review_reply_dropbox hidden">
								<c:forEach var="i" begin="1" end="3">
									<div class="productDetail_review_reply_item">
										<div class="productDetail_reply_writer">fanta님</div>
										<div class="productDetail_reply_content">잘 어울립니다!!</div>
									</div>
								</c:forEach>
							</div>
							<div class="productDetail_review_reply_write aice">
								<input class="productDetail_review_reply_write_input" placeholder="댓글입력..">
								<div class="productDetail_review_reply_write_button jcce aice" onclick="replyOnWrite(${reviewDto.review_idx})">댓글입력</div>
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
	const img = document.querySelector('.productDetail_like_button > img')
	const member_id = '${login.member_id}'
	const product_name = '${prodDto.product_name}'
	const product_img = '${prodDto.product_img}'
	const product_price = '${prodDto.product_price}'
	const product_sale = '${prodDto.product_sale}'
	const product_category = '${prodDto.product_category}'
	let product_like = '${prodDto.product_like}'
	const product_kind = '${prodDto.product_kind}'
	const product_salePrice = ${prodDto.product_price * (100 - prodDto.product_sale) / 100 }
	let item_color = ''
	let item_size = ''
	if(img.classList.contains('productDetail_colorHearts')) {
		document.querySelector('.productDetail_like_button').style.backgroundColor = 'antiquewhite'
	}
	else {
		document.querySelector('.productDetail_like_button').style.backgroundColor = 'white'
	} 
</script>
<%@ include file="../footer.jsp" %>