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
		
		<div class="myPage_like_title">좋아요 누른 상품</div>
		<div class="myPage_like_box">
			<c:if test="${empty list }">
				<div class="empty_msg jcce aice">좋아요 누른 상품이 없습니다.</div>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="dto" items="${list }">
					<div class="myPage_like_item aice jcce">
						<div class="myPage_like_img">
							<img src="${dto.like_img }" width="130px">
						</div>
						<div class="myPage_like_info">
							<div class="myPage_like_name jcce aice"><a href="${cpath }/product/productDetail/${dto.like_name}/review_grade">${dto.like_name }</a></div>
							<div class="myPage_like_price jcce aice">
								<fmt:formatNumber pattern="###,###" value="${dto.like_price}" />원
							</div>
							<div class="myPage_like_sale jcce aice">( ${dto.like_sale }% 할인 )</div>
							<div class="myPage_like_salePrice jcce aice">
								<fmt:formatNumber pattern="###,###" value="${dto.like_price * (100 - dto.like_sale) / 100}" />원
							</div>
							<div class="myPage_like_likeCount jcce aice">♥ ${dto.like_like }</div>
							<form action="${cpath}/likeProduct/delete" method="POST">
								<input name="like_name" value="${dto.like_name}" hidden="">
								<input type="submit" class="myPage_like_delete_button jcce aice" value="삭제"></span>
							</form>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</main>
<script>
	const msg = '${param.msg}'
	if(msg != '') {
		alert(msg)
	}
	const myPage_category = document.location.href.split('myPage/')[1].split('?')[0]
	const class_category = document.querySelector('.myPage_' + myPage_category)
	class_category.style.color = 'black'
	class_category.style.fontWeight = '700'
</script>
<%@ include file="../footer.jsp" %>