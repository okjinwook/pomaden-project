<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰조회/적용</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/product/couponList.css">
</head>
<body>
	<div class="couponList_title jcce aice">COUPON</div>
	<div class="couponList_coupon_info aice">
		<div class="couponList_coupon_name jcce aice">쿠폰명</div>
		<div class="couponList_coupon_count jcce aice">적용 가능 수량</div>
		<div class="couponList_coupon_date jcce aice">유효기간</div>
		<div class="couponList_coupon_sale jcce aice">할인율</div>
		<div class="couponList_coupon_apply jcce aice">적용하기</div>
	</div>
	<c:forEach var="dto" items="${couponList }">
		<div class="couponList_coupon_item aice">
			<div class="couponList_coupon_name jcce aice">${dto.coupon_name }</div>
			<div class="couponList_coupon_count jcce aice">1개</div>
			<div class="couponList_coupon_date jcce aice">~ ${dto.coupon_date }</div>
			<div class="couponList_coupon_sale jcce aice">${dto.coupon_sale} %</div>
			<div class="couponList_coupon_apply jcce aice">
				<div class="couponList_apply_button jcce aice" onclick="sendCoupon('${dto.coupon_name }',${dto.coupon_sale})">쿠폰선택</div>
			</div>
		</div>
	</c:forEach>
	<script>
		// 부모창 값 넘겨주기 (opener <= 부모창 객체(?))
		function sendCoupon(coupon_name, coupon_sale){
			opener.sendCoupon(coupon_name, coupon_sale);
			window.close();
		}
	</script>
</body>
</html>