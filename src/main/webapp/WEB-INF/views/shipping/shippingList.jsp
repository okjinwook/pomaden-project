<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 변경</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/shipping/shippingList.css">
<script type="text/javascript" src="${cpath }/resources/js/shipping/shippingList.js"></script>
</head>
<body>
	<div class="shipping_header aice jcsb">
		<div class="shipping_title">배송지 변경</div>
		<div class="shipping_insert_button jcce aice" onclick="shippingInsertOnClick('${login.member_id}')">배송지 추가</div>
	</div>
	<div class="shipping_item_component">
		<c:forEach var="dto" items="${list }">
			<div class="shipping_item aice">
				<div class="shipping_item_info_box">
					<div class="shipping_item_box">
						<div class="shipping_item_name_box aice">
							<div class="shipping_item_info aice">수령자</div>
							<div class="shipping_item_name shipping_item">${dto.shipping_name }</div>
						</div>		
						<div class="shipping_item_phone_box aice">
							<div class="shipping_item_info aice">전화번호</div>
							<div class="shipping_item_phone shipping_item">${dto.shipping_phone }</div>
						</div>		
						<div class="shipping_item_address_box aice">
							<div class="shipping_item_info aice">배송지 주소</div>
							<div class="shipping_item_name shipping_item">(${dto.shipping_code_add }) ${dto.shipping_load_add } <br>${dto.shipping_detail_add }</div>
						</div>		
						<div class="shipping_item_msg_box aice">
							<div class="shipping_item_info aice">배송지 메모</div>
							<div class="shipping_item_name shipping_item">${dto.shipping_msg }</div>
						</div>		
					</div>
					<div class="shipping_update_button_box aice">
						<div class="shipping_update_button jcce aice" onclick="shippingUpdateOnClick(${dto.shipping_idx})">수정</div>
						<div class="shipping_delete_button jcce aice" onclick="shippingDeleteOnClick(${dto.shipping_idx})">삭제</div>
					</div>
				</div>
				<label>
					<c:if test="${dto.shipping_rep == 1 }">
						<input class="" type="radio" name="shipping_select" checked="checked" value="${dto.shipping_idx }" onclick="repOnclick(this)">
					</c:if>
					<c:if test="${dto.shipping_rep == 0 }">
						<input class="" type="radio" name="shipping_select" value="${dto.shipping_idx }" onclick="repOnclick(this)">
					</c:if>
					
				</label>
			</div>
		</c:forEach>
	</div>
		
	<div class="shipping_result_button jcce aice" onclick="repChangeOnClick()">확인</div>
	<script type="text/javascript">
		const cpath = '${cpath}'
		const shipping_radio = document.querySelectorAll('input[name="shipping_select"]')
		let unRep = ''	// 배송지 대표로 지정해놓은 shipping 객체 ( 값 : idx )
		let rep = ''	// 배송지 대표로 지정할 shipping 객체 ( 값 : idx )
		shipping_radio.forEach(radio => {
			if(radio.checked == true) {
				unRep = radio.value
			}
		})
	</script>
</body>
</html>