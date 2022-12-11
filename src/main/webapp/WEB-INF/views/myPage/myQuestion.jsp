<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="myPage_component">
		<div class="myPage_title">마이페이지</div>
		<div class="myPage_kinds_box aice jcsb">
			<a href="${cpath }/myPage/orderList" class="myPage_orderList myPage_kind jcce aice">주문내역</a>
			<a href="${cpath }/myPage/point" class="myPage_point myPage_kind jcce aice">포인트</a>
			<a href="${cpath }/myPage/coupon" class="myPage_coupon myPage_kind jcce aice">쿠폰</a>
			<a href="${cpath }/myPage/board" class="myPage_board myPage_kind jcce aice">게시글</a>
			<a href="${cpath }/myPage/like" class="myPage_like myPage_kind jcce aice">좋아요 상품</a>
			<a href="${cpath }/myPage/member_info" class="myPage_member_info myPage_kind jcce aice">회원정보 관리</a>
			<a href="${cpath }/myPage/myQuestion" class="myPage_question myPage_kind jcce aice">문의내역</a>
		</div>
		
		<div class="myPage_myQuestion_title">문의내역</div>
		<div class="myPage_myQuestion_box">
			<div class="myPage_myQuestion_info df">
				<div class="myPage_myQuestion_date jcce aice">작성일자</div>
				<div class="myPage_myQuestion_questionTitle jcce aice">제목</div>
				<div class="myPage_myQuestion_content_info jcce aice">문의내용</div>
				<div class="myPage_myQuestion_check jcce aice">답변여부</div>
			</div>
			<c:forEach var="dto" items="${list }">
				<div class="myPage_myQuestion_item df">
					<div class="myPage_myQuestion_date jcce aice">작성일자</div>
					<div class="myPage_myQuestion_questionTitle jcce aice">제목</div>
					<div class="myPage_myQuestion_content_info jcce aice">문의내용</div>
					<div class="myPage_myQuestion_check jcce aice">답변여부</div>
				</div>
			</c:forEach>
		</div>
	</div>
</main>
<script>
	const myPage_category = '${category}'
	const class_category = document.querySelector('.myPage_' + myPage_category)
	class_category.style.color = 'black'
	class_category.style.fontWeight = '700'
</script>
<%@ include file="../footer.jsp" %>