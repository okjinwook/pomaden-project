<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포마든 - 관리자페이지</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/admin_nav.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/product_add.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/product_list.css">
<script src="${cpath }/resources/js/admin/product_add.js"></script>
</head>
<body>
	<nav class="admin_nav_component df">
		<div class="admin_nav_box">
			<div class="admin_logo jcce aice">포마든 관리자 페이지</div>
			<div class="admin_member_mamager">
				<div class="admin_nav_title jcce aice">회원 관리</div>
			</div>
			<div class="admin_product_mamager">
				<div class="admin_nav_title jcce aice">상품 관리</div>
			</div>
			<div class="admin_board_mamager">
				<div class="admin_nav_title jcce aice">게시글 관리</div>
			</div>
		</div>
	</nav>
