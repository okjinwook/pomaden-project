<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="newLine" value="\n"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포마든 - 관리자페이지</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/admin_nav.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/product_insert.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/product_list.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/member_list.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/review_list.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/notice_list.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/notice_insert.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/question_list.css">
<script src="${cpath }/resources/js/admin/product_insert.js"></script>
<script src="${cpath }/resources/js/admin/product_list.js"></script>
<script src="${cpath }/resources/js/admin/question_list.js"></script>
<script src="${cpath }/resources/js/admin/notice_list.js"></script>
</head>
<body>
	<nav class="admin_nav_component df">
		<div class="admin_nav_box">
			<div class="admin_logo jcce aice">포마든 관리자 페이지</div>
			<div class="admin_member_mamager">
				<a href="${cpath }/admin/member_list" class="admin_nav_title jcce aice">회원 관리</a>
			</div>
			<div class="admin_product_mamager">
				<a href="${cpath }/admin/product_list" class="admin_nav_title jcce aice">상품 관리</a>
			</div>
			<div class="admin_board_mamager">
				<a href="${cpath }/admin/review_list" class="admin_nav_title jcce aice">리뷰 관리</a>
			</div>
			<div class="admin_question_mamager">
				<a href="${cpath }/admin/question_list" class="admin_nav_title jcce aice">문의 관리</a>
			</div>
			<div class="admin_notice_mamager">
				<a href="${cpath }/admin/notice_list" class="admin_nav_title jcce aice">공지 관리</a>
			</div>
		</div>
	</nav>
	<script>
		const cpath = '${cpath}'
	</script>
