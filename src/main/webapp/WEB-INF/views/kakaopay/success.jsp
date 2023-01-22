<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<main>
	<c:set var="success_order_name" value=""></c:set>
	<c:set var="success_order_count" value="0"></c:set>
	<c:set var="success_order_price" value="0"></c:set>
	<c:forEach var="dto" items="${successList }" varStatus="status">
		<c:set var="success_order_number" value="${dto.orderList_order_number }"></c:set>
		<c:if test="${status.index == 0}">
			<c:set var="success_order_name" value="${dto.orderList_name }"></c:set>
		</c:if>
		<c:if test="${status.index != 0}">
			<c:set var="success_order_name" value="${dto.orderList_name } 외 ${status.index }"></c:set>
		</c:if>
		<c:set var="success_order_count" value="${success_order_count + dto.orderList_count }"></c:set>
		<c:set var="success_order_price" value="${success_order_price + dto.orderList_price }"></c:set>
	</c:forEach>
	
	<div class="success_component">
		<div class="success_title jcce">정상적으로 상품이 구매되었습니다.</div>
		<div class="success_orderList_info">
			<div class="success_orderList_order_number aice">
				<div class="success_orderList_info_order_number jcce aice">주문번호</div>
				<div class="success_orderList_item_order_number jcce aice">${success_order_number }</div>
			</div>
			<div class="success_orderList_name aice">
				<div class="success_orderList_info_name jcce aice">상품명</div>
				<div class="success_orderList_item_name jcce aice">${success_order_name }</div>
			</div>
			<div class="success_orderList_count aice">
				<div class="success_orderList_info_count jcce aice">수량</div>
				<div class="success_orderList_item_count jcce aice">${success_order_count }</div>
			</div>
			<div class="success_orderList_price aice">
				<div class="success_orderList_info_price jcce aice">가격</div>
				<div class="success_orderList_item_price jcce aice">
					<fmt:formatNumber pattern="###,###" value="${success_order_price}" />원
				</div>
			</div>
		</div>
		<div class="success_button_box jcsb">
			<a href="${cpath }" class="success_home_button jcce aice">홈</a>
			<a href="${cpath }/myPage/orderList" class="success_orderList_button jcce aice">주문내역</a>
		</div>
	</div>
</main>
<%@ include file="../footer.jsp" %>