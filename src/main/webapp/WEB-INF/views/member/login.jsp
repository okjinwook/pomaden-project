<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../header.jsp" %>

<main>
	<div class="login_component">
		<div class="login_title">로그인</div>
		<form class="login_form" action="">
			<div class="login_input df">
				<input type="text" id="login_id" placeholder="아이디를 입력해주세요." required="required">
				<input type="password" id="login_pw" placeholder="비밀번호를 입력해주세요." required="required">
			</div>
			<input class="login_button" type="submit" value="로그인">
		</form>
		<div class="find_box jcce">
			<a href="${cpath }/member/find_id">아이디 찾기</a>&nbsp;
			<span style="font-size: 12px;">/</span>&nbsp;
			<a href="${cpath }/member/find_pw">비밀번호 찾기</a>&nbsp;
			<span style="font-size: 12px;">/</span>&nbsp;
			<a href="${cpath }/member/join">회원가입</a>
		</div>
	</div>
</main>
<%@ include file="../footer.jsp" %>
