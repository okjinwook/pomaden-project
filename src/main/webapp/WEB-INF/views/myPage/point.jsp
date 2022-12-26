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
		
		
		<div class="myPage_orderList_title">포인트 내역</div>
		<div class="myPage_point_box">
			<div class="myPage_point_info df">
				<div class="myPage_point_date jcce aice">적용일자</div>
				<div class="myPage_point_use jcce aice">포인트 내역</div>
				<div class="myPage_point_change jcce aice">변경 포인트</div>
				<div class="myPage_point_total jcce aice">총 포인트</div>
			</div>
			<c:forEach var="dto" items="${list }">
				<div class="myPage_point_item df">
					<div class="myPage_point_date jcce aice">${dto.point_date }</div>
					<div class="myPage_point_use jcce aice">${dto.point_content }</div>
					<div class="myPage_point_change jcce aice">${dto.point_change }</div>
					<div class="myPage_point_total jcce aice">${dto.point_total }</div>
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