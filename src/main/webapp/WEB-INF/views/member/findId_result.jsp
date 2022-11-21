<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="idResult_component">
		<div class="idResult_title">아이디 찾기완료</div>
		<div class="idResult_content">
			<div class="idResult_name aice"><div class="idResult_info">이름</div>${dto.member_name}</div>
			<div class="idResult_email aice"><div class="idResult_info">이메일</div>${dto.member_email}</div>
			<div class="idResult_id aice"><div class="idResult_info">아이디</div>${dto.member_id}</div>
		</div>
		<div class="idResult_button_box jcce">
			<a href="${cpath }/member/login">로그인</a>&nbsp;
			<span style="font-size: 12px;">/</span>&nbsp;
			<a href="${cpath }/member/find_pw">비밀번호 찾기</a>&nbsp;
		</div>
	</div>
</main>
<%@ include file="../footer.jsp" %>