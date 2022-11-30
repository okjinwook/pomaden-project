<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포마든 - 관리자페이지</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/admin.css">
</head>
<body>
	<main>
		<div class="admin_component">
			<form action="${cpath }/admin/login" method="POST">
				<div class="admin_login_box jcce aice">
					<div class="admin_login_title aice jcce">포마든 관리자 페이지</div>
					<input class="admin_id_input" type="text" name="admin_id" placeholder="관리자 ID">
					<input class="admin_pw_input" type="password" name="admin_pw" placeholder="관리자 PW">
					<input class="admin_submit_button" type="submit" value="로그인">
				</div>
			</form>
		</div>
	</main>
</body>
</html>