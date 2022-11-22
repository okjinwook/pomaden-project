<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="pwResult_component">
		<form action="${cpath }/member/change_pw">
			<div class="pwResult_title">비밀번호 재설정</div>
			<div class="pwResult_content">
				<div class="pwResult_new_pw aice">
					<div class="pwResult_info">새 비밀번호</div>
					<input class="pwResult_pw_input" type="password" name="member_pw" onkeyup="findPwOnKeyUp(this)" required="required">
					<div class="pwResult_pw_msg"></div>
				</div>
				<div class="pwResult_new_checkPw aice">
					<div class="pwResult_info">새 비밀번호 확인</div>
					<input class="pwResult_pwCheck_input" type="password" onkeyup="findPwCheckOnKeyUp(this)" required="required">
					<div class="pwResult_pwCheck_msg"></div>
				</div>
			</div>
			<div class="pwResult_button_box jcce">
				<input type="submit" value="비밀번호 변경">
			</div>
		</form>
	</div>
</main>
<%@ include file="../footer.jsp" %>