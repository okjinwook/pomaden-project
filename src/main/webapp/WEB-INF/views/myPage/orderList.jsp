<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="myPage_component">
		<div class="myPage_title">마이페이지</div>
		<div class="myPage_kinds_box aice jcsb">
			<a href="${cpath }/myPage?category=orderList" class="myPage_orderList myPage_kind jcce aice">주문내역</a>
			<a href="${cpath }/myPage?category=point" class="myPage_point myPage_kind jcce aice">포인트</a>
			<a href="${cpath }/myPage?category=coupon" class="myPage_coupon myPage_kind jcce aice">쿠폰</a>
			<a href="${cpath }/myPage?category=board" class="myPage_board myPage_kind jcce aice">게시글</a>
			<a href="${cpath }/myPage?category=like" class="myPage_like myPage_kind jcce aice">좋아요 상품</a>
			<a href="${cpath }/myPage?category=member_info" class="myPage_member_info myPage_kind jcce aice">회원정보 관리</a>
			<a href="${cpath }/myPage?category=myQuestion" class="myPage_question myPage_kind jcce aice">문의내역</a>
		</div>
		<div class="myPage_orderList_title">주문내역</div>
		
		<div class="myPage_orderList_box">
			<div class="myPage_orderList_info df">
				<div class="myPage_orderList_date jcce aice">주문일자</div>
				<div class="myPage_orderList_img jcce aice">이미지</div>
				<div class="myPage_orderList_product_info jcce aice">상품정보</div>
				<div class="myPage_orderList_count jcce aice">수량</div>
				<div class="myPage_orderList_price jcce aice">구매금액</div>
				<div class="myPage_orderList_progress jcce aice">주문처리상태</div>
				<div class="myPage_orderList_check jcce aice">처리여부</div>
			</div>
			<div class="myPage_orderList_content">
				<div class="myPage_orderList_item df">
					<div class="myPage_orderList_date jcce aice">2022.11.8</div>
					<div class="myPage_orderList_img jcce aice">이미지</div>
					<div class="myPage_orderList_product_info jcce aice">라운드 넥 가디건</div>
					<div class="myPage_orderList_count jcce aice">1개</div>
					<div class="myPage_orderList_price jcce aice">구매금액</div>
					<div class="myPage_orderList_progress jcce aice">입금대기</div>
					<div class="myPage_orderList_check jcce aice">정상</div>
				</div>
				<div class="myPage_orderList_item df">
					<div class="myPage_orderList_date jcce aice">2022.11.8</div>
					<div class="myPage_orderList_img jcce aice">이미지</div>
					<div class="myPage_orderList_product_info jcce aice">라운드 넥 가디건</div>
					<div class="myPage_orderList_count jcce aice">1개</div>
					<div class="myPage_orderList_price jcce aice">구매금액</div>
					<div class="myPage_orderList_progress jcce aice">입금대기</div>
					<div class="myPage_orderList_check jcce aice">정상</div>
				</div>
			</div>
		</div>
	</div>
</main>
<script>
	const link =  'myPage_' + document.location.href.split("/").reverse()[0];
	
	const myPage_category = '${category}'
	const class_category = document.querySelector('.myPage_' + myPage_category)
	class_category.style.color = 'black'
	class_category.style.fontWeight = '700'
</script>
<%@ include file="../footer.jsp" %>