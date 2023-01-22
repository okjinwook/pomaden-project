<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<main>
	<div class="findPw_component">
		<div class="findPw_title">비밀번호 찾기</div>	
		<form class="findId_form" action="${cpath }/member/find_pw" method="POST">
			<input class="findPw_id_input" type="text" name="member_id" placeholder="ID" required="required">
			<input class="findPw_name_input" type="text" name="member_name" placeholder="이름" required="required">
			<div class="findPw_email_box jcsb">
				<input class="findPw_email_input" type="email" name="member_email" placeholder="이메일" required="required">
				<div class="findPw_email_check_button jcce aice" onclick="findPwEmailOnClick(event)">인증요청</div>
			</div>
			<div class="findPw_email_send_msg_box findPw_check_msg"></div>
			<div class="findPw_code_box jcsb hidden">
				<input class="findPw_email_code_input" type="text">
				<div class="findPw_code_time_box"></div>
				<div class="findPw_code_check_button jcce aice" onclick="findPwCodeCheckOnClick(event)">인증확인</div>
			</div>
			<div class="findPw_code_msg_box findPw_check_msg"></div>
			<input class="findPw_find_button" type="submit" value="비밀번호 찾기" onclick="findPwOnClick(event)">
		</form>	
	</div>
</main>
<script>
	let timer = 0
	let time = 0
	let retimer = 0
</script>
<%@include file="../footer.jsp" %>
