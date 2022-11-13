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
		
		
		<div class="myPage_member_info_title">내 회원정보</div>
		<div class="myPage_member_info_box">
			<div class="myPage_member_id_box aice">
				<div class="myPage_sen_box">아이디</div>
				<div class="myPage_member_id myPage_info_box">dhrwlsdnr33</div>
			</div>
			<div class="myPage_member_pw_box aice">
				<div class="myPage_sen_box">비밀번호</div>
				<div class="myPage_member_pw myPage_info_box">********</div>
				<div class="myPage_change_button jcce aice">비밀번호 변경</div>
			</div>
			<div class="myPage_member_name_box aice">
				<div class="myPage_sen_box">이름</div>
				<div class="myPage_member_name myPage_info_box">옥진욱</div>
				<div class="myPage_change_button jcce aice">이름수정</div>
			</div>
			<div class="myPage_member_email_box aice">
				<div class="myPage_sen_box">이메일</div>
				<div class="myPage_member_email myPage_info_box">wook17625@naver.com</div>
				<div class="myPage_change_button jcce aice">이메일 변경</div>
			</div>
			<div class="myPage_member_phone_box aice">
				<div class="myPage_sen_box">휴대전화</div>
				<div class="myPage_member_phone myPage_info_box">010-1234-5678</div>
				<div class="myPage_change_button jcce aice">휴대전화 변경</div>
			</div>
			<div class="myPage_member_address_box aice">
				<div class="myPage_sen_box">배송지</div>
				<div class="myPage_member_address myPage_info_box">
					<div class="">50841</div>
					<div class="">김해시 분성로 499번길 9 미소지움 아파트</div>
					<div class="">111동 123호</div>
				</div>
				<div class="myPage_change_button jcce aice">배송지 변경</div>				
			</div>
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