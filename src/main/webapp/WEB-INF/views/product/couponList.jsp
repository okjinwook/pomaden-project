<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰조회/적용</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/product/couponList.css">
<script src="${cpath }/resources/js/product/couponList.js"></script>
</head>
<body>
	<div class="couponList_title aice">COUPON</div>
	<div class="couponItemList_component">
		<div class="couponItemList_item_info aice">
			<div class="couponItemList_item_img jcce aice"></div>
			<div class="couponItemList_item_name jcce aice">상품명</div>
			<div class="couponItemList_item_price jcce aice">판매가</div>
			<div class="couponItemList_item_select_button_box jcce aice">쿠폰선택</div>
			<div class="couponItemList_item_salePrice jcce aice">할인금액</div>
		</div>
		<c:forEach var="dto" items="${paymentItemList }">
			<div class="couponItemList_item_box aice">
				<div class="couponItemList_item_img jcce aice">
					<img src="${dto.cart_img }" width="50px">
				</div>
				<div class="couponItemList_item_name jcce aice">
					<div>${dto.cart_name } [ ${dto.cart_color } ] [ ${dto.cart_size } ]</div>
					<div class="couponItemList_coupon_name_box"></div>
				</div>
				<div class="couponItemList_item_price jcce aice">
					<fmt:parseNumber var="salePrice" integerOnly="true" value="${((dto.cart_price * (100 - dto.cart_sale) / 100) / 100 )}" />
					<fmt:formatNumber pattern="###,###" value="${salePrice * 100}" />원
					 X 
					 ${dto.cart_count }개 
					 = 
					 <fmt:formatNumber pattern="###,###" value="${dto.cart_total }" />원
				</div>
				<div class="couponItemList_item_select_button_box jcce aice">
					<div class="couponItemList_item_select_button jcce aice" onclick="selectCouponList(event, ${dto.cart_total},${dto.cart_idx })">쿠폰 선택</div>
				</div>
				<div class="couponItemList_item_salePrice jcce aice">0원</div>
			</div>
		</c:forEach>
	</div>
	<div class="couponList_select_button jcce aice" onclick="sendCoupon()">쿠폰 적용</div>
	
	<div class="couponList_modal_box modal hidden">
		<div class="couponList_coupon_info aice">
			<div class="couponList_coupon_name jcce aice">쿠폰명</div>
			<div class="couponList_coupon_count jcce aice">적용 가능 수량</div>
			<div class="couponList_coupon_date jcce aice">유효기간</div>
			<div class="couponList_coupon_sale jcce aice">할인율</div>
			<div class="couponList_coupon_apply jcce aice">적용하기</div>
		</div>
		<div class="couponList_coupon_item_component">
			<c:forEach var="dto" items="${couponList }">
				<c:if test="${dto.coupon_use == 0 }">
					<div class="couponList_coupon_item aice">
						<input class="couponList_coupon_idx" value="${dto.coupon_idx }" hidden="">
						<div class="couponList_coupon_name jcce aice">${dto.coupon_name }</div>
						<div class="couponList_coupon_count jcce aice">1개</div>
						<div class="couponList_coupon_date jcce aice">~ ${dto.coupon_date }</div>
						<div class="couponList_coupon_sale jcce aice">${dto.coupon_sale} %</div>
						<div class="couponList_coupon_apply jcce aice">
							<div class="couponList_apply_button jcce aice" onclick="selectCoupon('${dto.coupon_name }',${dto.coupon_sale},${dto.coupon_idx })">쿠폰선택</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		<div class="couponList_modal_cancle_button jcce aice" onclick="cancleOnClick()">취소</div>
	</div>
	<div class="overlay hidden"></div>
	<script>
		const modal = document.querySelector('.modal')
		const overlay = document.querySelector('.overlay')
		let item_arr = []				// 쿠폰 적용된 상품 배열 (map)
		let coupon_arr = []				// 사용한 쿠폰 배열
		let cart_idx = 0
		let total_sale_price = 0 		// 세일 받은 가격 합계
		let selectPrice = 0			// 쿠폰적용을 위한 선택한 상품 가격
		let selectCouponName = ''		// 쿠폰적용을 위한 선택한 상품 쿠폰 이름 div
		let selectSalePrice = ''		// 쿠폰적용을 위한 선택한 상품 가격 div
	</script>
</body>
</html>