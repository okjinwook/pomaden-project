<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 수정</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/shipping/update.css">
<script type="text/javascript" src="${cpath }/resources/js/shipping/insert.js"></script>
<script type="text/javascript" src="${cpath }/resources/js/shipping/update.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="shipping_update_title aice">배송지 수정</div>
	<form action="${cpath }/shipping/update" method="POST">
		<div class="shipping_update_component">
			<input type="number" name="shipping_idx" value="${dto.shipping_idx}" hidden="">
			<div class="shipping_update_name_box aice">
				<div class="shipping_update_info">수령자명</div>
				<input type="text" name="shipping_name" value="${dto.shipping_name }" required="required">
			</div>
			<div class="shipping_update_phone_box aice">
				<c:set var="phone" value="${dto.shipping_phone }"/>
				<div class="shipping_update_info">휴대폰 번호</div>
				<div class="shipping_update_phone_input_box aice">
					<select class="shipping_phone_select jcce" onchange="phoneOnSelect(this)" required="required">
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select>
					<input class="shipping_phone_result" type="text" name="shipping_phone" hidden="hidden" value="${phone }">
					<input class="shipping_phone_start" type="text" required="required" min="4" maxlength="4" onkeyup="phoneStartOnkeyUp(this)" value="${fn:substring(phone, 3, 7) }">
					<input class="shipping_phone_end" type="text" required="required" min="4" maxlength="4" onkeyup="phoneEndOnkeyUp(this)" value="${fn:substring(phone, 7, 12) }">
				</div>
			</div>
			<div class="shipping_update_address_box aice">
				<div class="shipping_update_info">배송지 주소</div>
				<div class="shipping_update_address">
					<div class="shipping_update_code_box aice">
						<input type="text" id="shipping_postcode" value="${dto.shipping_code_add }" name="shipping_code_add" placeholder="우편번호"  readonly="readonly" required="required">
						<div class="shipping_update_code_button jcce aice" onclick="postcodeOnClick()">우편번호</div>
					</div>
					<input type="text" id="shipping_loadAddress"  value="${dto.shipping_load_add }" name="shipping_load_add" placeholder="도로명 주소" readonly="readonly" required="required">
					<input type="text" class="shipping_address_detail"  value="${dto.shipping_detail_add }" name="shipping_detail_add" placeholder="상세 주소" required="required">
				</div>
			</div>
			<div class="shipping_update_msg_box aice">
				<div class="shipping_update_info">배송지 메모</div>
				<select class="shipping_update_msg" name="shipping_msg">
					<option>부재 시 집 앞에 놔주세요.</option>
					<option>부재 시 경비실에 맡겨주세요.</option>
					<option>부재 시 택배함에 넣어주세요.</option>
					<option>배송 전 연락 바랍니다.</option>
				</select>
			</div>
		</div>
		<div class="shipping_update_button_box jcce aice">
			<input type="submit" class="shipping_update_button" value="수정하기">
			<div class="shipping_cancle_button aice jcce" onclick="shippingCancleOnClick()">취소</div>
		</div>
	</form>
	<script>
		let msg = '${param.msg}'
		if(msg != '') {
			alert(msg)
			opener.setReload()		// 배송지 리스트 리로드 ( 부모창 )
			window.close()
		}
		const phone = '${dto.shipping_phone}'
		const addMsg = '${dto.shipping_msg}'
		const phone_option = document.querySelectorAll('.shipping_phone_select > option')
		const msg_option = document.querySelectorAll('.shipping_update_msg > option')
		const phone_select = phone.substring(0,3) // ex) 010
		// 휴대폰 번호 select박스 일치하는 값 선택
		phone_option.forEach(option => {
			if(option.value == phone_select) {
				option.selected = true
			}
		})
		// 배송지메모 select박스 일치하는 값 선택
		msg_option.forEach(option => {
			if(option.value == addMsg) {
				console.log('d')
				option.selected = true
			}
		})
		let phone_select_number = phone.substring(0,3)
		let phone_start_number = phone.substring(3,7)
		let phone_end_number = phone.substring(7,12)
	</script>
</body>
</html>