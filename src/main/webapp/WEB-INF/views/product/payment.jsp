<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="payment_component">
		<div class="payment_title">결제</div>
		<div class="payment_shipping_title_box aice">
			<div class="payment_shipping_title">배송지 정보</div>
			<div class="payment_shipping_change_button jcce aice">배송지 변경</div>
		</div>
		<div class="payment_shipping_box">
			<div class="payment_shipping_name_box aice">
				<div class="payment_shipping_info aice">받으시는 분</div>
				<div class="payment_shipping_name">${login.member_name }</div>
			</div>
			<div class="payment_shipping_phone_box aice">
				<div class="payment_shipping_info aice">휴대전화</div>
				<div class="payment_shipping_phone">${login.member_phone }</div>
			</div>
			<div class="payment_shipping_address_box aice">
				<div class="payment_shipping_info aice">배송지 주소</div>
				<div class="payment_shipping_address">(${login.member_code_add }) ${login.member_load_add } ${login.member_detail_add }</div>
			</div>
			<div class="payment_shipping_msg_box aice">
				<div class="payment_shipping_info aice">배송메시지</div>
				<select class="payment_shipping_msg">
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
				<div class="payment_orderList_name_box jcce aice">상품명(옵션)</div>
				<div class="payment_orderList_count jcce aice">수량</div>
				<div class="payment_orderList_point jcce aice">적립금</div>
				<div class="payment_orderList_sale jcce aice">상품할인</div>
				<div class="payment_orderList_price jcce aice">주문금액</div>
			</div>
			<c:if test="${not empty couponItemlist}">
				<c:forEach var="dto" items="${couponItemlist }">
					<c:set var="totalOriginalPrice" value="${totalOriginalPrice + dto.cart_price * dto.cart_count}"></c:set>
					<c:set var="totalSalePrice" value="${totalSalePrice + dto.cart_price * (dto.cart_sale / 100) * dto.cart_count}"></c:set>
					<c:set var="totalResultPrice" value="${totalResultPrice + dto.cart_total}"></c:set>
					
					<div class="payment_orderList_item aice">
						<input class="order_orderList_idx" value="${dto.cart_idx }" hidden="">
						<div class="payment_orderList_img jcce aice order_orderList_img" id="${dto.cart_img }"><img src="${dto.cart_img }" width="80px"></div>
						<div class="payment_orderList_name_box jcce aice">
							<div class="payment_orderList_name order_orderList_name" id="${dto.cart_name }">${dto.cart_name }</div>
							<div class="payment_orderList_color order_orderList_color" id="${dto.cart_color }">[ ${dto.cart_color } ]</div>
							<div class="payment_orderList_size order_orderList_size" id="${dto.cart_size }">[ ${dto.cart_size } ]</div>
						</div>
						<div class="payment_orderList_count jcce aice order_orderList_count" id="${dto.cart_count }">${dto.cart_count }</div>
						<div class="payment_orderList_point jcce aice">
							<fmt:formatNumber pattern="###,###" value="${dto.cart_total * 0.01}" /> P
						</div>
						<div class="payment_orderList_sale jcce aice">
							<div class="" style="font-size: 12px;">${dto.cart_sale }% SALE</div>
							<div class="payment_orderList_sale_price" id="${dto.cart_price * (dto.cart_sale / 100) * dto.cart_count  }">
								- <fmt:formatNumber pattern="###,###" value="${dto.cart_price * (dto.cart_sale / 100) * dto.cart_count  }" />원
							</div>
						</div>
						<div class="payment_orderList_price jcce aice">
							<span class="payment_orderList_original_price">
								<fmt:formatNumber pattern="###,###" value="${dto.cart_price * dto.cart_count}" />원
							</span>
							<span class="order_orderList_price" id="${dto.cart_total}">
								<fmt:formatNumber pattern="###,###" value="${dto.cart_total}" />원
							</span>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
		<div class="payment_discount_title">할인 및 적립금</div>
		<div class="payment_discount_box">
			<div class="payment_discount_price_box aice">
				<div class="payment_discount_info aice">상품 금액</div>
				<div class="payment_discount_price">
					<fmt:formatNumber pattern="###,###" value="${totalOriginalPrice}" />원
				</div>
			</div>
			<div class="payment_discount_sale_box aice">
				<div class="payment_discount_info aice">상품 할인</div>
				<div class="payment_discount_price">
					<span class="sale_span">
						-<fmt:formatNumber pattern="###,###" value="${totalSalePrice}" />원
					</span>
				</div>
			</div>
			<div class="payment_discount_coupon_box aice">
				<div class="payment_discount_info aice">쿠폰 할인</div>
				<div class="payment_coupon_box payment_discount_price">적용된 쿠폰 없음</div>
				<div class="payment_coupon_button" onclick="window.open('${cpath }/product/couponList','쿠폰조회/적용','width=900px, height=500px')">쿠폰조회/적용</div>	
			</div>
			<div class="payment_discount_point_box aice">
				<div class="payment_discount_info aice">적립금 사용</div>
				<input class="payment_discount_point_input" type="number" onkeyup="PointOnKeyUp(this, ${point })">
				<div class="payment_discount_point_button" onclick="pointOnClick()">적용</div>
				<div class="payment_discount_point_msg">( 최대 사용 가능한 적립금 ${point }P )</div>
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
					<fmt:formatNumber pattern="###,###" value="${totalOriginalPrice}" />원
				</div>
				<div class="payment_orderPrice_discount aice jcce">
					<span class="sale_span">- <fmt:formatNumber pattern="###,###" value="${totalSalePrice}" />원</span>
				</div>
				<div class="payment_orderPrice_total payment_orderPrice_resultPrice aice jcce">
					<fmt:formatNumber pattern="###,###" value="${totalResultPrice}" />원
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
			<div class="payment_paymentWay_kakaopay hidden payment_paymentWay">
				<div class="payment_paymentWay_kakaopay_icon jcce aice">KAKAOPAY</div>
			</div>
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
		<div class="payment_pay_button jcce aice" onclick="ResultPaymentOnClick()">결제하기</div>
	</div>
</main>
<script>
	let totalResultPrice = ${totalResultPrice}	// 총 결제할 가격
	let totalSalePrice = ${totalSalePrice}		// 총 세일 된 가격
	let coupon = []								// 사용한 쿠폰 배열 
	let point = 0
	
</script>
<%@ include file="../footer.jsp" %>
