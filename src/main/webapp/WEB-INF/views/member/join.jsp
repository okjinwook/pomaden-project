<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<main>
	<div class="join_component">
		<div class="join_title">회원가입</div>
		<div class="join_info jcsb">
			<div class="join_info_left">기본정보</div>
			<div class="join_info_right">개인회원</div>		
		</div>
		<form action="${cpath }/member/join" method="POST" class="join_form">
			<div class="join_input_id_box df join_box">
				<div class="join_info_box"><span>아이디</span></div>
				<div class="join_id_input join_input_box jcce">
					<div class="df">
						<input type="text" required="required" name="member_id" onkeyup="idOnKeyUp(this)">
						<div class="join_id_check join_check_msg aice jcce"></div>
					</div>
					<span>(영문소문자/숫자, 4 ~ 16자)</span>
				</div>
			</div>
			<div class="join_input_pw_box df join_box">
				<div class="join_info_box"><span>비밀번호</span></div>
				<div class="join_input_box jcce">
					<div class="df">
						<input class="join_pw_input" type="password" required="required" name="member_pw" onkeyup="pwOnKeyUp(this)">
						<div class="join_pw_check join_check_msg aice jcce"></div>
					</div>
					<span>(영문 대소문자/숫자 중 2가지 이상 조합, 8자~16자)</span>
				</div>
			</div>
			<div class="join_input_pw_check_box  df join_box">
				<div class="join_info_box"><span>비밀번호 확인</span></div>
				<div class="join_pwCheck_input join_input_box jcce aice">
					<input type="password" onkeyup="pwcheckOnKeyUp(this)" required="required">
					<div class="join_pwCheck_check join_check_msg aice jcce"></div>
				</div>
			</div>
			<div class="join_input_name_box df join_box">
				<div class="join_info_box"><span>이름</span></div>
				<div class="join_input_box jcce aice">
					<input type="text" required="required" name="member_name">
				</div>
			</div>
			<div class="join_input_address_box df join_box">
				<div class="join_info_box"><span>배송지 주소</span></div>
				<div class="join_address_input join_input_box jcce">
					<div class="join_address_number jcce">
						<input type="text" id="join_postcode" required="required" readonly="readonly" placeholder="우편번호">
						<div class="join_address_button jcce aice" onclick="postcodeOnClcik()">우편번호</div>
					</div>
					<input class="join_address_load" id="join_loadAddress" type="text" name="member_address" required="required" readonly="readonly" placeholder="도로명 주소" >
					<input class="join_address_detail" id="join_detailAddress" type="text" placeholder="상세 주소">
				</div>
			</div>
			<div class="join_input_phone_box df join_box">
				<div class="join_info_box"><span>휴대전화</span></div>
				<div class="join_input_box jcce">
					<div class="join_select_number aice">
						<select class="join_phone_select_value jcce" onchange="phoneOnSelect(this)" required="required">
							<option>-</option>
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>
						<input class="join_phone_result_value" type="text" name="member_phone" hidden="hidden">
						<input class="join_phone_start_value" type="text" required="required" maxlength="4" onkeyup="phoneStartOnkeyUp(this)">
						<input class="join_phone_end_value" type="text" required="required" maxlength="4" onkeyup="phoneEndOnkeyUp(this)">
					</div>
				</div>
			</div>
			<div class="join_input_email_box df join_box">
				<div class="join_info_box"><span>이메일</span></div>
				<div class="join_input_box jcce">
					<input class="join_input_email" type="email" required="required" name="member_email">
				</div>
			</div>
			<div class="join_button jcce">
				<input class="" type="submit" value="회원가입">
			</div>
		</form>
	</div>
</main>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	let join_phone_select_number = ''
	let join_phone_start_number= ''
	let join_phone_end_number = ''
	
	
	function postcodeOnClcik() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('join_postcode').value = data.zonecode;
                document.getElementById("join_loadAddress").value = roadAddr;
            }
        }).open();
    }
	
	
</script>
<%@ include file="../footer.jsp" %>