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
							<fmt:parseNumber var="salePrice" integerOnly="true" value="${((prodDto.product_price * (100 - prodDto.product_sale) / 100) / 100 )}" />
							<fmt:formatNumber pattern="###,###" value="${salePrice * 100}" />원
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
							<fmt:parseNumber var="resultPrice" integerOnly="true" value="${prodDto.product_price * (100 - prodDto.product_sale) / 100 / 100}"/>
							<span class="productDetail_price_span"><fmt:formatNumber pattern="###,###" value="${resultPrice * 100 }" />원</span>
						</div>
						<div class="productDetail_product df">
							<div class="productDetail_info_span">- 배송비 결제</div>
							<span class="productDetail_price_span">무료</span>
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
					<div class="productDetail_none_option jcce aice">옵션을 선택해주세요</div>
				</div>
				<div class="productDetail_button_box jcsb">
					<div class="productDetail_buy_button jcce aice" onclick="paymentOnClick()">바로구매</div>
					<div class="productDetail_cart_button jcce aice" onclick="cartOnclick()">
						<img src="https://pomadenimg.cafe24.com/icon/cart.png" width="30px">
					</div>
					<c:if test="${empty likeCheck }">
						<div class="productDetail_like_button productDetail_blackHearts_button jcce aice" onclick="likeOnClick(event)">
							<img class="productDetail_blackHearts" src="https://pomadenimg.cafe24.com/icon/blackH.png" width="30px">
						</div>
					</c:if>
					<c:if test="${not empty likeCheck }">
						<div class="productDetail_like_button productDetail_colorHearts_button jcce aice" onclick="likeOnClick(event)">
							<img class="productDetail_colorHearts" src="https://pomadenimg.cafe24.com/icon/colorH.png" width="30px">
						</div>
					</c:if>
				</div>
			</div>
		</div>
		<div class="productDetail_review_title">REVIEW</div>
		<div class="productDetail_review_box">
			<c:set var="grade_5" value="0"/>
			<c:set var="grade_4" value="0"/>
			<c:set var="grade_3" value="0"/>
			<c:set var="grade_2" value="0"/>
			<c:set var="grade_1" value="0"/>
			<c:forEach var="reviewDto" items="${reviewList }">
				<c:if test="${reviewDto.review_grade == 5 }">
					<c:set var="grade_5" value="${grade_5 + 1 }"/>
				</c:if>
				<c:if test="${reviewDto.review_grade == 4 }">
					<c:set var="grade_4" value="${grade_4 + 1 }"/>
				</c:if>
				<c:if test="${reviewDto.review_grade == 3 }">
					<c:set var="grade_3" value="${grade_3 + 1 }"/>					
				</c:if>
				<c:if test="${reviewDto.review_grade == 2 }">
					<c:set var="grade_2" value="${grade_2 + 1 }"/>
				</c:if>
				<c:if test="${reviewDto.review_grade == 1 }">
					<c:set var="grade_1" value="${grade_1 + 1 }"/>
				</c:if>
			</c:forEach>
			<div class="productDetail_review_chart jcsb">
				<div class="productDetail_review_chart_5 aice">
					<div class="productDetail_review_chart_mean">최고에요</div>
					<div class="productDetail_review_chart_info">★★★★★</div>
					<input type="range" value="${grade_5 }" disabled="disabled">
					<span>${grade_5 }개</span>
				</div>
				<div class="productDetail_review_chart_4 aice">
					<div class="productDetail_review_chart_mean">좋아요</div>
					<div class="productDetail_review_chart_info">★★★★</div>
					<input type="range" value="${grade_4 }" disabled="disabled">
					<span>${grade_4 }개</span>
				</div>
				<div class="productDetail_review_chart_3 aice">
					<div class="productDetail_review_chart_mean">보통이에요</div>
					<div class="productDetail_review_chart_info">★★★</div>
					<input type="range" value="${grade_3 }" disabled="disabled">
					<span>${grade_3 }개</span>
				</div>
				<div class="productDetail_review_chart_2 aice">
					<div class="productDetail_review_chart_mean">별로에요</div>
					<div class="productDetail_review_chart_info">★★</div>
					<input type="range" value="${grade_2 }" disabled="disabled">
					<span>${grade_2 }개</span>
				</div>
				<div class="productDetail_review_chart_1 aice">
					<div class="productDetail_review_chart_mean">나빠요</div>
					<div class="productDetail_review_chart_info">★</div>
					<input type="range" value="${grade_1 }" disabled="disabled">
					<span>${grade_1 }개</span>
				</div>
			</div>
			<div class="productDetail_review_short_box df">
				<a href="${cpath }/product/productDetail/${prodDto.product_name}/review_grade" class="productDetail_review_short_high">평점순</a>
				<a href="${cpath }/product/productDetail/${prodDto.product_name}/review_date" class="productDetail_review_short_new">최신순</a>
			</div>
			<c:if test="${empty reviewList }">
				<div class="empty_msg jcce aice">작성된 리뷰가 없습니다.</div>
			</c:if>
			<c:forEach var="reviewDto" items="${reviewList }">
				<c:set var="reply_count" value="0"/>
				<c:forEach var="replyDto" items="${replyList }">
					<c:if test="${replyDto.reply_review_idx == reviewDto.review_idx}">
						<c:set var="reply_count" value="${reply_count + 1 }"/>
					</c:if>
				</c:forEach>
				<div class="productDetail_review_item df">
					<div class="productDetail_review_info">
						<div class="productDetail_review_writer">${reviewDto.review_member_id }님</div>
						<div class="productDetail_review_point">
						평점 : 
						<c:forEach begin="1" end="${reviewDto.review_grade }">
							★						
						</c:forEach>
						</div>
						<div class="productDetail_review_img">
							<c:if test="${reviewDto.review_img  != 'none'}">
								<img src="${reviewDto.review_img }" width="100px">
							</c:if>
						</div>
						<div class="productDetail_review_content">${reviewDto.review_content }</div>
						<div class="productDetail_review_reply">
							<div class="productDetail_review_reply_button" onclick="detailReplyOnClick(event)">
								댓글 (${reply_count})
							</div>
							<div class="productDetail_review_reply_dropbox hidden">
								<c:forEach var="replyDto" items="${replyList }">
									<c:if test="${replyDto.reply_review_idx == reviewDto.review_idx}">
										<div class="productDetail_review_reply_item">
											<div class="productDetail_reply_info jcsb">
												<div class="productDetail_reply_writer">${replyDto.reply_member_id }님</div>
												<div class="df">
													<div class="productDetail_reply_date aice">${replyDto.reply_date }</div>
													<c:if test="${replyDto.reply_member_id == login.member_id }">
														<div class="productDetail_reply_update_box df">
															<div class="productDetail_reply_update_button jcce aice" onclick="replyUpdate(event,${replyDto.reply_idx}, '${replyDto.reply_content }')">수정</div>
															<div class="productDetail_reply_update_delete jcce aice" onclick="replyDelete(${replyDto.reply_idx})">삭제</div>
														</div>
													</c:if>
												</div>
											</div>
											<div class="productDetail_reply_content aice">${replyDto.reply_content }</div>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<div class="productDetail_review_reply_write aice">
								<input class="productDetail_review_reply_write_input" placeholder="댓글입력.." onclick="loginTest() ">
								<div class="productDetail_review_reply_write_button jcce aice" onclick="replyOnWrite(event, ${reviewDto.review_idx})">댓글입력</div>
							</div>
						</div>
					</div>
					<div class="productDetail_review_buyInfo jcce aice">
						<div class="">구매하신 상품</div>
						<div class="">컬러 : ${reviewDto.review_color }</div>
						<div class="">사이즈 : ${reviewDto.review_size }</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</main>
<script>
	const sort = window.location.href.split('/')[7]
	// 리뷰 정렬에 따른 css
	if(sort == 'review_grade') {
		document.querySelector('.productDetail_review_short_high').classList.add('productDetail_review_short_button')
	}
	else {
		document.querySelector('.productDetail_review_short_new').classList.add('productDetail_review_short_button')
	}
	const img = document.querySelector('.productDetail_like_button > img')
	const product_name = '${prodDto.product_name}'
	const product_img = '${prodDto.product_img}'
	const product_price = '${prodDto.product_price}'
	const product_sale = '${prodDto.product_sale}'
	const product_category = '${prodDto.product_category}'
	let product_like = '${prodDto.product_like}'
	const product_kind = '${prodDto.product_kind}'
	const product_salePrice = ${salePrice * 100}
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