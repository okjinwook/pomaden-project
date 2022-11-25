<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="cartList_component">
		<div class="cartList_title">장바구니</div>
		<div class="cartList_content">
			<div class="cartList_info aice">
				<div class="cartList_idx jcce aice">전체</div>
				<div class="cartList_checkBox jcce aice"><input type="checkbox" checked="checked"></div>
				<div class="cartList_img jcce aice">이미지</div>
				<div class="cartList_option jcce aice">상품명(옵션)</div>
				<div class="cartList_price jcce aice">판매가</div>
				<div class="cartList_sale jcce aice">할인율</div>
				<div class="cartList_count jcce aice">수량</div>
				<div class="cartList_totalPrice jcce aice">주문금액</div>
				<div class="cartList_delete jcce aice">주문관리</div>
			</div>
			<div class="cartList_item_box">
				<div class="cartList_item aice">
					<div class="cartList_itme_idx jcce aice"></div>
					<div class="cartList_itme_checkBox jcce aice"><input type="checkbox" checked="checked"></div>
					<div class="cartList_itme_img jcce aice"></div>
					<div class="cartList_itme_option jcce aice"></div>
					<div class="cartList_itme_price jcce aice"></div>
					<div class="cartList_itme_sale jcce aice"></div>
					<div class="cartList_itme_count jcce aice"></div>
					<div class="cartList_itme_totalPrice jcce aice"></div>
					<div class="cartList_itme_delete jcce aice"></div>
				</div>
			</div>
		</div>
	</div>
</main>
<%@ include file="../footer.jsp" %>