<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="payment_component">
		<div class="payment_title">결제</div>
		<div class="payment_delivery_title">배송 정보</div>
		<div class="payment_delivery_box">
			<div class="aice">
				<div class="payment_delivery_info">받으시는 분</div>
				<input value="${login.member_name }">
			</div>
			<div class="aice">
				<div class="payment_delivery_info">배송지 주소</div>
				<div>
					<input value="${login.member_code_add }">
					<input value="${login.member_load_add }">
					<input value="${login.member_detail_add }">
				</div>
			</div>
			<div class="aice">
				<div class="payment_delivery_info">휴대전화</div>
				<input value="${login.member_phone }">
			</div>
			<div class="aice">
				<div class="payment_delivery_info">배송메시지</div>
				<select>
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
				<div class="payment_orderList_name jcce aice">${prodDto.product_name }</div>
				<div class="payment_orderList_count jcce aice">${param.buy_count }</div>
				<div class="payment_orderList_point jcce aice">적립금</div>
				<div class="payment_orderList_sale jcce aice">상품할인</div>
				<div class="payment_orderList_price jcce aice">주문금액</div>
			</div>
		</div>
		<div class="payment_discount_title">할인 및 적립금</div>
		<div class="payment_discount_box">
		</div>
		<div class="payment_orderPrice_title">주문금액</div>
		<div class="payment_orderPrice_box">
			<div class="payment_orderPrice_info aice">
				<div class="payment_orderPrice_common aice jcce">주문 금액</div>
				<div class="payment_orderPrice_discount aice jcce">총 할인</div>
				<div class="payment_orderPrice_total aice jcce">총 주문 금액</div>
			</div>
			<div class="payment_orderPrice_price aice">
				<div class="payment_orderPrice_common aice jcce">20000</div>
				<div class="payment_orderPrice_discount aice jcce">-500</div>
				<div class="payment_orderPrice_total aice jcce">19500</div>
			</div>
		</div>
		<div class="payment_paymentWay_title">결제수단</div>
		<div class="payment_paymentWay_box">
		</div>
		
	</div>
</main>
<%@ include file="../footer.jsp" %>
