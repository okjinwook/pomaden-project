<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<fmt:parseNumber var="sale" integerOnly="true" value="${((prodDto.product_price * (prodDto.product_sale) / 100) * param.buy_count / 100 ) }" />
<fmt:parseNumber var="salePrice" integerOnly="true" value="${((prodDto.product_price * (100 - prodDto.product_sale) / 100) * param.buy_count / 100 )}" />
<main>
	<div class="payment_component">
		<div class="payment_title">결제</div>
		<div class="payment_delivery_title">배송 정보</div>
		<div class="payment_delivery_box">
			<div class="payment_delivery_name_box aice">
				<div class="payment_delivery_info">받으시는 분</div>
				<div class="payment_delivery_name">${login.member_name }</div>
			</div>
			<div class="payment_delivery_phone_box aice">
				<div class="payment_delivery_info">휴대전화</div>
				<div class="payment_delivery_phone">${login.member_phone }</div>
			</div>
			<div class="payment_delivery_address_box aice">
				<div class="payment_delivery_info">배송지 주소</div>
				<div>(${login.member_code_add }) ${login.member_load_add } ${login.member_detail_add }</div>
			</div>
			<div class="payment_delivery_msg_box aice">
				<div class="payment_delivery_info">배송메시지</div>
				<select class="payment_delivery_msg">
					<option>배송 시 요청사항을 선택해주세요.</option>
					<option>부재 시 집 앞에 놔주세요.</option>
					<option>부재 시 경비실에 맡겨주세요.</option>
					<option>부재 시 택배함에 넣어주세요.</option>
					<option>배송 전 연락 바랍니다.</option>
				</select>
			</div>
		</div>
		<div class="payment_orderList_title">상품 정보</div>
		<div class="payment_orderList_box">
			<div class="payment_orderList_info aice">
				<div class="payment_orderList_img jcce aice">이미지</div>
				<div class="payment_orderList_name jcce aice">상품명(옵션)</div>
				<div class="payment_orderList_count jcce aice">수량</div>
				<div class="payment_orderList_point jcce aice">적립금</div>
				<div class="payment_orderList_sale jcce aice">상품할인</div>
				<div class="payment_orderList_price jcce aice">주문금액</div>
			</div>
			<div class="payment_orderList_item aice">
				<div class="payment_orderList_img jcce aice"><img src="${prodDto.product_img }" width="80px"></div>
				<div class="payment_orderList_name jcce aice">
					<div>${prodDto.product_name }</div>
					<div>[${param.item_color }]</div>
					<div>[${param.item_size }]</div>
				</div>
				<div class="payment_orderList_count jcce aice">${param.buy_count }</div>
				<div class="payment_orderList_point jcce aice">
					<fmt:formatNumber pattern="###,###" value="${((prodDto.product_price * (100 - prodDto.product_sale) / 100) * param.buy_count) * 0.01}" /> P
				</div>
				<div class="payment_orderList_sale jcce aice">
					- <fmt:formatNumber pattern="###,###" value="${sale * 100 + 100}" />원
				</div>
				<div class="payment_orderList_price jcce aice">
					<span class="payment_orderList_original_price">
						<fmt:formatNumber pattern="###,###" value="${prodDto.product_price * param.buy_count}" />원
					</span>
					<fmt:formatNumber pattern="###,###" value="${salePrice * 100}" />원
				</div>
			</div>
		</div>
		<div class="payment_discount_title">할인 및 적립금</div>
		<div class="payment_discount_box">
			<div class="payment_discount_price_box aice">
				<div class="payment_discount_info">상품 금액</div>
				<div class="payment_discount_price">
					<fmt:formatNumber pattern="###,###" value="${prodDto.product_price * param.buy_count}" />원
				</div>
			</div>
			<div class="payment_discount_sale_box aice">
				<div class="payment_discount_info">상품 할인</div>
				<div class="payment_discount_price">
					- <fmt:formatNumber pattern="###,###" value="${sale * 100 + 100}" />원
				</div>
			</div>
			<div class="payment_discount_coupon_box aice">
				<div class="payment_discount_info">쿠폰 할인</div>
				<div class="payment_coupon_box payment_discount_price">적용된 쿠폰 없음</div>
				<div class="payment_coupon_button" onclick="window.open('${cpath }/product/couponList','쿠폰조회/적용','width=900px, height=500px')">쿠폰조회/적용</div>
			</div>
			<div class="payment_discount_point_box aice">
				<div class="payment_discount_info">적립금 사용</div>
				<input class="payment_discount_point_input" type="number" placeholder="p">
				<div class="payment_discount_point_button" onclick="pointOnClick()">적용</div>
				<div class="payment_discount_point_msg">( 최대 사용 가능한 적립금 ${point.point_total }P )</div>
			</div>
		</div>
		<div class="payment_orderPrice_title">주문금액</div>
		<div class="payment_orderPrice_box">
			<div class="payment_orderPrice_info aice">
				<div class="payment_orderPrice_common aice jcce">주문 금액</div>
				<div class="payment_orderPrice_discount aice jcce">총 할인</div>
				<div class="payment_orderPrice_total aice jcce">총 주문 금액</div>
			</div>
			<div class="payment_orderPrice_price aice">
				<div class="payment_orderPrice_common aice jcce">
					<fmt:formatNumber pattern="###,###" value="${prodDto.product_price * param.buy_count}" />원
				</div>
				<div class="payment_orderPrice_discount aice jcce">
					- <fmt:formatNumber pattern="###,###" value="${sale * 100 + 100}" />원
				</div>
				<div class="payment_orderPrice_total aice jcce">
					<fmt:formatNumber pattern="###,###" value="${salePrice * 100}" />원
				</div>
			</div>
		</div>
		<div class="payment_paymentWay_title">결제수단</div>
		<div class="payment_paymentWay_box">
			<label>
				<input type="radio" name="paymentWay" value="kakaopay" onclick="paymentWayOnClick('payment_paymentWay_kakaopay')">카카오페이
			</label>
			<label>
				<input type="radio" name="paymentWay" value="deposit" onclick="paymentWayOnClick('payment_paymentWay_deposit')">무통장 입금
			</label>
			<div class="payment_paymentWay_kakaopay hidden payment_paymentWay"></div>
			<div class="payment_paymentWay_deposit hidden payment_paymentWay">
				<div class="payment_deposit_bank_box aice">
					<div class="payment_deposit_bank_info jcce aice">은행</div>
					<div class="payment_deposit_bank_name aice">카카오뱅크</div>
				</div>
				<div class="payment_deposit_number_box aice">
					<div class="payment_deposit_number_info jcce aice">계좌번호</div>
					<div class="payment_deposit_number_name aice">3333-1223-92986</div>
				</div>
			</div>
		</div>
		<div class="payment_pay_button jcce aice">결제하기</div>
	</div>
</main>
<script>
	let totalPrice = ${salePrice * 100}
	let totalSale = ${sale * 100 + 100}
	
</script>
<%@ include file="../footer.jsp" %>
