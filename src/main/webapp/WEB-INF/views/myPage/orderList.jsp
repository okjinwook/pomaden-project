<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="myPage_component">
		<div class="myPage_title">마이페이지</div>
		<div class="myPage_kinds_box aice jcsb">
			<a href="${cpath }/myPage/orderList" class="myPage_orderList myPage_kind jcce aice">주문내역</a>
			<a href="${cpath }/myPage/point" class="myPage_point myPage_kind jcce aice">포인트<span class="myPage_member_point">${login.member_point }</span></a>
			<a href="${cpath }/myPage/coupon" class="myPage_coupon myPage_kind jcce aice">쿠폰<span class="myPage_member_coupon">${login.member_coupon }</span></a>
			<a href="${cpath }/myPage/board" class="myPage_board myPage_kind jcce aice">게시글</a>
			<a href="${cpath }/myPage/like" class="myPage_like myPage_kind jcce aice">좋아요 상품</a>
			<a href="${cpath }/myPage/member_info" class="myPage_member_info myPage_kind jcce aice">회원정보 관리</a>
			<a href="${cpath }/myPage/myQuestion?page=0" class="myPage_myQuestion myPage_kind jcce aice">문의내역</a>
		</div>
		
		<div class="myPage_orderList_title">주문내역</div>
		<div class="myPage_orderList_box">
			<div class="myPage_orderList_info df">
				<div class="myPage_orderList_date jcce aice">주문일자</div>
				<div class="myPage_orderList_img jcce aice">이미지</div>
				<div class="myPage_orderList_product_info jcce aice">상품정보</div>
				<div class="myPage_orderList_order_number jcce aice">주문번호</div>
				<div class="myPage_orderList_count jcce aice">수량</div>
				<div class="myPage_orderList_price jcce aice">구매금액</div>
				<div class="myPage_orderList_progress jcce aice">주문처리상태</div>
				<div class="myPage_orderList_check jcce aice">진행상태</div>
				<div class="myPage_orderList_review jcce aice">후기</div>
			</div>
			<div class="myPage_orderList_content">
				<c:if test="${empty list }">
					<div class="empty_msg jcce aice">주문하신 상품이 없습니다.</div>
				</c:if>
				<c:forEach var="item" items="${orderItemList }">
					<div class="myPage_orderList_item_box">
						<c:forEach var="dto" items="${list }">
							<c:if test="${item == dto.orderList_order_number }">
								<c:set var="resultPrice" value="${resultPrice + dto.orderList_price }"/>
								<div class="myPage_orderList_item df">
									<div class="myPage_orderList_date jcce aice">${dto.orderList_date }</div>
									<div class="myPage_orderList_img jcce aice"><img src="${dto.orderList_img }" width="50px"></div>
									<div class="myPage_orderList_product_info jcce aice">
										<div>${dto.orderList_name }</div>
										<div>[ ${dto.orderList_color } ]</div>
										<div>[ ${dto.orderList_size } ]</div>
									</div>
									<div class="myPage_orderList_order_number jcce aice">${dto.orderList_order_number }</div>
									<div class="myPage_orderList_count jcce aice">${dto.orderList_count }</div>
									<div class="myPage_orderList_price jcce aice">
										<fmt:formatNumber pattern="###,###" value="${dto.orderList_price }" />원
									</div>
									<div class="myPage_orderList_progress jcce aice">${dto.orderList_progress }</div>
									<div class="myPage_orderList_check jcce aice">${dto.orderList_check }</div>
									<div class="myPage_orderList_review jcce aice">
										<c:if test="${dto.orderList_review_check == 0}">
											<div class="myPage_orderList_review_button" onclick="reviewOnClick('${dto.orderList_idx }','${dto.orderList_name}','${dto.orderList_color }', '${dto.orderList_size }')">리뷰 작성</div>
										</c:if>
										<c:if test="${dto.orderList_review_check == 1}">
											<div class="myPage_orderList_review_success_button">작성 완료</div>
										</c:if>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<div class="myPage_orderList_resultPrice aice">
							<div class="myPage_orderList_resultPrice_span jcce aice">
								총 결제 금액 : <fmt:formatNumber pattern="###,###" value="${resultPrice }"/>원
							</div>
						</div>
						<c:set var="resultPrice" value="0"/>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</main>
<div class="review_modal_box modal hidden">
	<form action="${cpath }/review/insert" method="POST" enctype="multipart/form-data">
		<div class="review_modal_title jcce aice">리뷰작성</div>
		<div class="review_modal_component">
			<input type="number" name="review_orderList_idx" hidden="">
			<div class="review_modal_writer aice">
				<div class="review_modal_info aice jcce">작성자</div>
				<input name="review_member_id" value="${login.member_id }" readonly="readonly">
			</div>
			<div class="review_modal_product aice">
				<div class="review_modal_info aice jcce">상품명</div>
				<input name="review_product" readonly="readonly">
			</div>
			<div class="review_modal_color aice">
				<div class="review_modal_info aice jcce">컬러</div>
				<input name="review_color" readonly="readonly">
			</div>
			<div class="review_modal_size aice">
				<div class="review_modal_info aice jcce">사이즈</div>
				<input name="review_size" readonly="readonly">
			</div>
			<div class="review_modal_img aice">
				<div class="review_modal_info aice jcce">이미지</div>
				<div class="review_modal_img_box jcce aice">
					<label class="jcce aice">
						<span class="review_modal_img_span">사진등록</span>
						<input type="file" name="review_upload" hidden="" onchange="reviewUpload(event)">
					</label>
				</div>
			</div>
			<div class="review_modal_category aice">
				<div class="review_modal_info aice jcce">평점</div>
				<input class="review_grade_input" name="review_grade" value="5" hidden="">
				<div class="review_grade_star df">
					<div onclick="gradeOnClick(1)">☆</div>
					<div onclick="gradeOnClick(2)">☆</div>
					<div onclick="gradeOnClick(3)">☆</div>
					<div onclick="gradeOnClick(4)">☆</div>
					<div onclick="gradeOnClick(5)">☆</div>
				</div>
			</div>
			<div class="review_modal_content">
				<textarea name="review_content" placeholder="내용을 작성해주세요."></textarea>
			</div>
			<div class="review_modal_button_box jcsb">
				<input class="review_modal_write_button" type="submit" value="작성" onclick="reviewOnSubmit(event)">
				<div class="review_modal_cancle_button jcce aice" onclick="reviewModalCancleClick()">취소</div>
			</div>
		</div>
	</form>
</div>
<script>
	const myPage_category = document.location.href.split('myPage/')[1].split('?')[0]
	const class_category = document.querySelector('.myPage_' + myPage_category)
	let reviewStar = 0
	class_category.style.color = 'black'
	class_category.style.fontWeight = '700'
	
</script>
<%@ include file="../footer.jsp" %>