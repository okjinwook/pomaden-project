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
				<c:forEach var="i" begin="1" end="5">
					<div class="cartList_item aice">
						<div class="cartList_item_idx jcce aice">${i }</div>
						<div class="cartList_item_checkBox jcce aice"><input class="cartList_item_check" type="checkbox"></div>
						<div class="cartList_item_img jcce aice"><img src="https://www.smallman.co.kr/web/product/medium/202208/770d79f1fa1212186d103da49e7bf8b8.jpg" width="50px"></div>
						<div class="cartList_item_option aice">
							<div class="cartList_item_name">라운드 넥 티셔츠</div>
							<div class="cartList_item_color">white</div>
							<div class="cartList_item_size">XL</div>
						</div>
						<div class="cartList_item_price jcce aice">32000 원</div>
						<div class="cartList_item_sale jcce aice">( 20% 할인 )</div>
						<div class="cartList_item_count jcce aice">
							<button class="cartList_minus_button" onclick="cartMinusOnClick(event)">-</button>
							<div class="cartList_buy_count">1</div>
							<button class="cartList_plus_button" onclick="cartPlusOnClick(event)">+</button>
						</div>
						<div class="cartList_item_totalPrice jcce aice">25400 원</div>
						<div class="cartList_item_delete jcce aice"><div class="cartList_delete_button jcce aice">삭제</div></div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</main>
<%@ include file="../footer.jsp" %>