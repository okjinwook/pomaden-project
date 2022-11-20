<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<main>
	<div class="findPw_component">
		<div class="findPw_title">비밀번호 찾기</div>	
		<form class="findId_form">
			<input class="findPw_id_input" type="text" placeholder="ID">
			<input class="findPw_name_input" type="text" placeholder="이름">
			<div class="findPw_email_box jcsb">
				<input class="findPw_email_input" type="email" placeholder="이메일">
				<div class="findPw_email_check_button jcce aice">인증요청</div>
			</div>
			<input class="findPw_find_button" type="button" value="비밀번호 찾기">
		</form>	
	</div>
</main>
<%@include file="../footer.jsp" %>