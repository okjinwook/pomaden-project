<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<main>
	<div class="findId_component">
		<div class="findId_title">아이디 찾기</div>		
		<form class="findId_form" action="${cpath }/member/find_id" method="POST">
			<input class="findId_name_input" name="member_name" type="text" placeholder="이름" required="required">
			<input class="findId_email_input" name="member_email" type="email" placeholder="이메일" required="required">
			<input class="findId_find_button" type="submit" value="아이디 찾기">
		</form>
	</div>
</main>
<%@include file="../footer.jsp" %>