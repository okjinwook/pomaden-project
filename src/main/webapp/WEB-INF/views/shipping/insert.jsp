<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 신규 등록</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/shipping/insert.css">
<script type="text/javascript" src="${cpath }/resources/js/shipping/insert.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="shipping_insert_title aice">배송지 추가</div>
	<form action="${cpath }/shipping/insert" method="POST">
		<div class="shipping_insert_component">
			<input name="shipping_rep" value="0" hidden="">
			<input name="shipping_member_id" value="${login.member_id }" hidden="">
			<div class="shipping_insert_name_box aice">
				<div class="shipping_insert_info">수령자명</div>
				<input type="text" name="shipping_name" required="required">
			</div>
			<div class="shipping_insert_phone_box aice">
				<div class="shipping_insert_info">휴대폰 번호</div>
				<div class="shipping_insert_phone_input_box aice">
					<select class="shipping_phone_select jcce" onchange="phoneOnSelect(this)" required="required">
						<option>--</option>
						<option>010</option>
						<option>011</option>
						<option>016</option>
						<option>017</option>
						<option>018</option>
						<option>019</option>
					</select>
					<input class="shipping_phone_result" type="text" name="shipping_phone" hidden="hidden">
					<input class="shipping_phone_start" type="text" required="required" min="4" maxlength="4" onkeyup="phoneStartOnkeyUp(this)">
					<input class="shipping_phone_end" type="text" required="required" min="4" maxlength="4" onkeyup="phoneEndOnkeyUp(this)">
				</div>
			</div>
			<div class="shipping_insert_address_box aice">
				<div class="shipping_insert_info">배송지 주소</div>
				<div class="shipping_insert_address">
					<div class="shipping_insert_code_box aice">
						<input type="text" id="shipping_postcode" name="shipping_code_add" placeholder="우편번호"  readonly="readonly" required="required">
						<div class="shipping_insert_code_button jcce aice" onclick="postcodeOnClick()">우편번호</div>
					</div>
					<input type="text" id="shipping_loadAddress" name="shipping_load_add" placeholder="도로명 주소"  readonly="readonly" required="required">
					<input type="text" class="shipping_address_detail" name="shipping_detail_add" placeholder="상세 주소" readonly="readonly" required="required">
				</div>
			</div>
			<div class="shipping_insert_msg_box aice">
				<div class="shipping_insert_info">배송지 메모</div>
				<select class="shipping_insert_msg" name="shipping_msg">
					<option>부재 시 집 앞에 놔주세요.</option>
					<option>부재 시 경비실에 맡겨주세요.</option>
					<option>부재 시 택배함에 넣어주세요.</option>
					<option>배송 전 연락 바랍니다.</option>
				</select>
			</div>
		</div>
		<div class="shipping_insert_button_box jcce aice">
			<input type="submit" class="shipping_insert_button" value="등록하기">
			<div class="shipping_cancle_button aice jcce" onclick="shippingCancleOnClick()">취소</div>
		</div>
	</form>
	<script>
		let msg = '${param.msg}'
		if(msg != '') {
			alert(msg)
			opener.setReload()
			window.close()
		}
		let phone_select_number = ''
		let phone_start_number = ''
		let phone_end_number = ''
	</script>
</body>
</html>