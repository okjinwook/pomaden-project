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
				<div class="cartList_sale jcce aice">할인율</div>
				<div class="cartList_count jcce aice">수량</div>
				<div class="cartList_totalPrice jcce aice">주문금액</div>
				<div class="cartList_delete jcce aice">주문관리</div>
			</div>
			<div class="cartList_item_box">
				<c:forEach var="dto" items="${list }">
					<div class="cartList_item aice">
						<div class="cartList_item_idx jcce aice">${dto.cart_idx }</div>
						<div class="cartList_item_checkBox jcce aice"><input class="cartList_item_check" type="checkbox"></div>
						<div class="cartList_item_img jcce aice"><img src="${dto.cart_img }" width="50px"></div>
						<div class="cartList_item_option aice">
							<div class="cartList_item_name">${dto.cart_name }</div>
							<div class="cartList_item_color">${dto.cart_color }</div>
							<div class="cartList_item_size">${dto.cart_size }</div>
						</div>
						<div class="cartList_item_price jcce aice">
							<fmt:formatNumber pattern="###,###" value="${dto.cart_price}" />원
						</div>
						<div class="cartList_item_sale jcce aice">( ${dto.cart_sale }% 할인 )</div>
						<div class="cartList_item_count jcce aice">
							<input type="number" class="cartList_buy_count" value="${dto.cart_count }" min="1">
							<div class="cartList_upDownBox">
								<img class="cartList_up_button" src="https://img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif" onclick="upOnClick(event, ${dto.cart_idx})">
								<img class="cartList_down_button" src="https://img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif" onclick="downOnClick(event, ${dto.cart_idx})">
							</div>
						</div>
						<div class="cartList_item_totalPrice jcce aice">
							<fmt:formatNumber pattern="###,###" value="${dto.cart_price * (100 - dto.cart_sale) / 100}" />원
						</div>
						<div class="cartList_item_delete jcce aice">
							<form action="${cpath }/cart/cartDelete" method="POST">
								<input type="number" value="${dto.cart_idx }" name="idx" hidden="">
								<input class="cartList_delete_button jcce aice" type="submit" value="삭제">
							</form>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</main>
<%@ include file="../footer.jsp" %>