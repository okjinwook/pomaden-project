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
				<div class="myPage_sen_box aice">아이디</div>
				<input class="myPage_member_id myPage_info_box" readonly="readonly" value="${login.member_id }">
			</div>
			<div class="myPage_member_pw_box aice">
				<div class="myPage_sen_box aice">비밀번호</div>
				<input class="myPage_member_pw myPage_info_box" type="password" onkeyup="myPagePwOnKeyUp(this)">
				<div class="myPage_pw_msg myPage_msg"></div>
			</div>
			<div class="myPage_member_pw_box aice">
				<div class="myPage_sen_box aice">비밀번호 확인</div>
				<input class="myPage_member_pwCheck myPage_info_box" type="password" onkeyup="myPagePwCheckOnKeyUp(this)">
				<div class="myPage_pwCheck_msg myPage_msg"></div>
			</div>
			<div class="myPage_member_name_box aice">
				<div class="myPage_sen_box aice">이름</div>
				<input class="myPage_member_name myPage_info_box" readonly="readonly"  value="${login.member_name }">
			</div>
			<div class="myPage_member_email_box aice">
				<div class="myPage_sen_box aice">이메일</div>
				<div class="">
					<div class="aice">
						<input class="myPage_member_email myPage_info_box" value="${login.member_email }">
						<div class="myPage_email_button jcce aice" onclick="myPageEmailOnClick(event)">인증요청</div>
						<div class="myPage_email_send_msg jcce aice"></div>
					</div>
					<div class="myPage_email_code_box aice hidden">
						<input class="myPage_email_code_input">
						<div class="myPage_email_check jcce aice" onclick="myPageCodeCheckOnClick(event)">인증확인</div>
						<div class="myPage_code_time_box">3:30</div>
						<div class="myPage_code_msg_box"></div>
					</div>
				</div>
				
			</div>
			<div class="myPage_member_phone_box aice">
				<div class="myPage_sen_box aice">휴대전화</div>
				<input class="myPage_member_phone myPage_info_box" readonly="readonly" value="${login.member_phone }">
			</div>
			<div class="myPage_member_address_box aice">
				<div class="myPage_sen_box aice">배송지</div>
				<div class="myPage_member_address df">
					<div class="">50841</div>
					<div class="">김해시 분성로 499번길 9 미소지움 아파트</div>
					<div class="">111동 123호</div>
				</div>
			</div>
		</div>
		<div class="myPage_change_button_box jcce">
			<div class="myPage_change_button jcce aice">회원정보수정</div>
			<div class="myPage_cancel_button jcce aice">취소</div>
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