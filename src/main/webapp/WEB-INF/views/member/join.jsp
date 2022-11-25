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
						<input type="text" required="required" name="member_id">
						<div class="join_id_same_check jcce aice" onclick="idOnClick(event)">중복확인</div>
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
				<div class="join_pwCheck_input_box join_input_box jcce aice">
					<input class="join_pwCheck_input" type="password" onkeyup="pwcheckOnKeyUp(this)" required="required">
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
						<input class="join_address_postcode" type="text" id="join_postcode" name="member_code_add" required="required" readonly="readonly" placeholder="우편번호">
						<div class="join_address_button jcce aice" onclick="postcodeOnClick()">우편번호</div>
					</div>
					<input class="join_address_load" id="join_loadAddress" name="member_load_add" type="text" required="required" readonly="readonly" placeholder="도로명 주소" >
					<input class="join_address_detail" id="join_detailAddress" name="member_detail_add" type="text" placeholder="상세 주소" readonly="readonly">
				</div>
			</div>
			<div class="join_input_phone_box df join_box">
				<div class="join_info_box"><span>휴대전화</span></div>
				<div class="join_input_box jcce">
					<div class="join_select_number aice">
						<select class="join_phone_select_value jcce" onchange="phoneOnSelect(this)" required="required">
							<option>--</option>
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>
						<input class="join_phone_result_value" type="text" name="member_phone" hidden="hidden">
						<input class="join_phone_start_value" type="text" required="required" min="4" maxlength="4" onkeyup="phoneStartOnkeyUp(this)">
						<input class="join_phone_end_value" type="text" required="required" min="4" maxlength="4" onkeyup="phoneEndOnkeyUp(this)">
					</div>
				</div>
			</div>
			<div class="join_input_email_box df join_box">
				<div class="join_info_box"><span>이메일</span></div>
				<div class="join_email_input join_input_box jcce">
					<div class="aice">
						<input class="join_input_email" type="email" required="required" name="member_email" placeholder="ex@naver.com">
						<div class="join_email_check_button jcce aice" onclick="joinEmailOnClick(event)">인증요청</div>
						<div class="join_email_send_msg jcce aice"></div>
					</div>
					<div class="join_email_code_box aice hidden">
						<input class="join_email_code_input" type="text"></input>
						<div class="join_code_check_button aice jcce" onclick="joinCodeCheckOnClick(event)">인증확인</div>
						<div class="join_code_time_box aice jcce"></div>
					</div>
					<div class="join_code_msg_box aice join_check_msg jcce"></div>
				</div>
			</div>
			<div class="join_button jcce">
				<input class="join_submit_button" type="submit" value="회원가입" onclick="joinSubmitOnClick(event)">
			</div>
		</form>
	</div>
</main>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	let join_phone_select_number = ''
	let join_phone_start_number= ''
	let join_phone_end_number = ''
	let time = 180
	let timer
	
	
	
</script>
<%@ include file="../footer.jsp" %>