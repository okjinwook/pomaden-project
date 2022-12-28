<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/kakaopay/success.css">
<%-- <script src="${cpath }/resources/js/kakaopay/success.js"></script> --%>
</head>
<body>
	<div class="success_title">상품 구매 완료 !!</div>
	<div class="success_orderList_info aice">
		<div class="success_orderList_order_number jcce aice">${dto.orderList_order_number }</div>
		<div class="success_orderList_img jcce aice">${dto.orderList_img }</div>
		<div class="success_orderList_name jcce aice">${dto.orderList_name }</div>
		<div class="success_orderList_color jcce aice">${dto.orderList_color }</div>
		<div class="success_orderList_size jcce aice">${dto.orderList_size }</div>
		<div class="success_orderList_count jcce aice">${dto.orderList_count }</div>
		<div class="success_orderList_price jcce aice">${dto.orderList_price }</div>
	</div>
	<c:forEach var="dto" items="${list }">
		<div class="success_orderList_item aice">
			<div class="success_orderList_order_number jcce aice">${dto.orderList_order_number }</div>
			<div class="success_orderList_img jcce aice">${dto.orderList_img }</div>
			<div class="success_orderList_name jcce aice">${dto.orderList_name }</div>
			<div class="success_orderList_color jcce aice">${dto.orderList_color }</div>
			<div class="success_orderList_size jcce aice">${dto.orderList_size }</div>
			<div class="success_orderList_count jcce aice">${dto.orderList_count }</div>
			<div class="success_orderList_price jcce aice">${dto.orderList_price }</div>
		</div>
	</c:forEach>
</body>
</html>