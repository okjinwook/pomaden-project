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
		<form action="" class="join_form">
			<div class="join_input_id_box df join_box">
				<div class="join_info_box"><span>아이디</span></div>
				<div class="join_input_box jcce">
					<input type="text" required="required">
					<span>(영문소문자/숫자, 4 ~ 16자)</span>
				</div>
			</div>
			<div class="join_input_pw_box df join_box">
				<div class="join_info_box"><span>비밀번호</span></div>
				<div class="join_input_box jcce">
					<input type="password" required="required">
					<span>(영문 대소문자/숫자 중 2가지 이상 조합, 8자~16자)</span>
				</div>
			</div>
			<div class="join_input_pw_check_box df join_box">
				<div class="join_info_box"><span>비밀번호 확인</span></div>
				<div class="join_input_box jcce">
					<input type="password" required="required">
				</div>
			</div>
			<div class="join_input_address_box df join_box">
				<div class="join_info_box"><span>배송지 주소</span></div>
				<div class="join_address_input join_input_box jcce">
					<div class="join_address_number jcce">
						<input type="text" required="required">
						<div class="join_address_button jcce aice">우편번호</div>
					</div>
					<input class="join_address_info" type="text">
					<input class="join_address_detail" type="text">
				</div>
			</div>
			<div class="join_input_phone_box df join_box">
				<div class="join_info_box"><span>휴대전화</span></div>
				<div class="join_input_box jcce">
					<div class="join_select_number jcce">
						<select>
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>
						<input type="text" required="required" maxlength="4">
						<input type="text" required="required" maxlength="4">
					</div>
				</div>
			</div>
			<div class="join_input_email_box df join_box">
				<div class="join_info_box"><span>이메일</span></div>
				<div class="join_input_box jcce">
					<input class="join_input_email" type="email" required="required">
				</div>
			</div>
			<div class="join_button jcce">
				<input class="" type="submit" value="회원가입">
			</div>
		</form>
	</div>
</main>
<%@ include file="../footer.jsp" %>