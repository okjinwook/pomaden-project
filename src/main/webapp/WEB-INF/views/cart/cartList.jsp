<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="cartList_component">
		<div class="cartList_title">장바구니</div>
		<div class="cartList_sub_title">전체 상품</div>
		<div class="cartList_content">
			<div class="cartList_info aice">
				<div class="cartList_idx jcce aice">전체</div>
				<div class="cartList_checkBox jcce aice">
					<input type="checkbox" onclick="cartOnCheck(event)">
				</div>
				<div class="cartList_img jcce aice">이미지</div>
				<div class="cartList_option jcce aice">상품명(옵션)</div>
				<div class="cartList_price jcce aice">판매가</div>
				<div class="cartList_count jcce aice">수량</div>
				<div class="cartList_totalPrice jcce aice">합계</div>
				<div class="cartList_delete jcce aice">주문관리</div>
			</div>
			<div class="cartList_item_box">
				<c:if test="${empty list }">
					<div class="empty_msg jcce aice">장바구니에 담긴 상품이 없습니다.</div>
				</c:if>
				<c:forEach var="dto" items="${list }" varStatus="status">
					<div class="cartList_item aice" id="${dto.cart_idx }">
						<div class="cartList_item_idx jcce aice">${status.count }</div>
						<div class="cartList_item_checkBox jcce aice">
							<input class="cartList_item_check" type="checkbox" onclick="checkOnClick(event, ${dto.cart_total}, '${dto.cart_idx }')">
						</div>
						<div class="cartList_item_img jcce aice">
							<img src="${dto.cart_img }" width="50px">
						</div>
						<div class="cartList_item_option aice">
							<div class="cartList_item_name">
								<a href="${cpath }/product/productDetail/${dto.cart_name}">${dto.cart_name }</a>
							</div>
							<div class="cartList_item_color">색상[${dto.cart_color }]</div>
							<div class="cartList_item_size">사이즈[${dto.cart_size }]</div>
						</div>
						<div class="cartList_item_price jcce aice">
							<fmt:parseNumber var="salePrice" integerOnly="true" value="${((dto.cart_price * (100 - dto.cart_sale) / 100) / 100 )}" />
							<fmt:formatNumber pattern="###,###" value="${salePrice * 100}" />원
						</div>
						<div class="cartList_item_count jcce aice">
							<input type="number" class="cartList_buy_count" value="${dto.cart_count }" min="1" readonly="readonly">
							<div class="cartList_upDownBox">
								<img class="cartList_up_button" src="https://img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif" onclick="upOnClick(event, ${dto.cart_idx}, ${salePrice * 100})">
								<img class="cartList_down_button" src="https://img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif" onclick="downOnClick(event, ${dto.cart_idx}, ${salePrice * 100})">
							</div>
						</div>
						<div class="cartList_item_totalPrice jcce aice" >
							<fmt:formatNumber pattern="###,###" value="${dto.cart_total}" />원
						</div>
						<div class="cartList_item_delete jcce aice">
							<form action="${cpath }/cart/cartDelete" method="POST">
								<input type="number" value="${dto.cart_idx }" name="idx" hidden="">
								<input class="cartList_delete_button jcce aice" type="submit" value="삭제" onclick="cartOnDelete(event)">
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="cartList_select_content">
			<div class="cartList_select_info_box aice">
				<div class="cartList_select_total_info jcce aice">총 상품금액</div>
				<div class="cartList_select_delivery_info jcce aice">배송비</div>
				<div class="cartList_select_expected_info jcce aice">결제예정금액</div>
			</div>
			<div class="cartList_select_price_box aice">
				<div class="cartList_select_total_price jcce aice">0원</div>
				<div class="cartList_select_delivery_price jcce aice">0원</div>
				<div class="cartList_select_expected_price jcce aice">= 0원</div>
			</div>
		</div>
		<div class="cartList_payment_box">
			<div class="cartList_payment_button jcce aice" onclick="cartPaymentOnClick()">결제하기</div>
		</div>
	</div>
</main>
<script>
	const msg = '${param.msg}'
	let buy_product = []
	let buy_price = []
	if(msg != '') {
		alert(msg)
	}
</script>
<%@ include file="../footer.jsp" %>