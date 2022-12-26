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
		
		<div class="myPage_board_title">리뷰 게시글 관리</div>
		<div class="myPage_board_box">
			<div class="myPage_board_info aice">
				<div class="myPage_board_date jcce aice">게시일자</div>
				<div class="myPage_board_img jcce aice">이미지</div>
				<div class="myPage_board_name jcce aice">상품명</div>
				<div class="myPage_board_content jcce aice">내용</div>
				<div class="myPage_board_grade jcce aice">평점</div>
			</div>
			<c:if test="${empty list }">
				<div class="empty_msg jcce aice">작성하신 게시글이 없습니다.</div>
			</c:if>
			<c:forEach var="dto" items="${list }">
				<div class="myPage_board_item aice">
					<div class="myPage_board_date jcce aice">${dto.review_date }</div>
					<div class="myPage_board_img jcce aice"><img src="${dto.review_img }" width="50px"></div>
					<div class="myPage_board_name jcce aice">${dto.review_product }</div>
					<div class="myPage_board_content jcce aice">${dto.review_content }</div>
					<div class="myPage_board_grade aice">
						<c:forEach begin="1" end="${dto.review_grade }">
							★						
						</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</main>
<script>
	const myPage_category = document.location.href.split('myPage/')[1].split('?')[0]
	const class_category = document.querySelector('.myPage_' + myPage_category)
	class_category.style.color = 'black'
	class_category.style.fontWeight = '700'
</script>
<%@ include file="../footer.jsp" %>