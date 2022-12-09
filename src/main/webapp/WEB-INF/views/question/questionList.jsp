<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="question_component">
		<div class="question_title">1:1 문의</div>
		<div class="question_filter_box jcsb">
			<select class="question_select_box">
				<option>배송문의</option>
				<option>입금문의</option>
				<option>재입고문의</option>
				<option>환불문의</option>
				<option>교환문의</option>
				<option>기타문의</option>
			</select>
			<div class="question_search_box aice">
				<select class="question_select_box">
					<option>전체</option>
					<option>미답변</option>
					<option>답변</option>
				</select>
				<select class="question_select_box" style="margin-left: 10px;">
					<option>제목</option>
					<option>작성자</option>
				</select>
				<input class="question_search_input" type="text" id="">
				<input class="question_search_button aice jcce" type="button" value="검색하기">
			</div>
		</div>
		<div class="question_info_box df">
			<div class="question_info_idx jcce aice">번호</div>
			<div class="question_info_title jcce aice">카테고리</div>
			<div class="question_info_content jcce aice">내용</div>
			<div class="question_info_writer jcce aice">작성자</div>
			<div class="question_info_date jcce aice">작성날짜</div>
		</div>
		<div class="question_list_box">
			<c:forEach var="i" begin="1" end="10">
				<div class="question_list_item df">
					<div class="question_item_idx jcce aice">${i }</div>
					<div class="question_item_title jcce aice">교환반품</div>
					<div class="question_item_content jcce aice">반품하기 위해서는 어떻게 하나요?</div>
					<div class="question_item_writer jcce aice">포마든</div>
					<div class="question_item_date jcce aice">2022.11.12</div>
				</div>
			</c:forEach>
		</div>
		<div class="question_write_button_box">
			<div class="question_write_button jcce aice" onclick="questionOnWrite()">작성하기</div>
		</div>
	</div>
</main>
<div class="question_modal_box modal hidden">
	<div class="question_modal_title jcce aice">1:1 문의</div>
	<div class="question_modal_component">
		<div class="question_modal_board_title">
			<div>제목</div>
			<input type="text">
		</div>
		<div class="question_modal_category">
			<div>카테고리</div>
			<select>
				<option>배송문의</option>
				<option>입금문의</option>
				<option>재입고문의</option>
				<option>환불문의</option>
				<option>교환문의</option>
				<option>기타문의</option>
			</select>
		</div>
		<div class="question_modal_content">
			<textarea rows="" cols="" placeholder="내용을 작성해주세요."></textarea>
		</div>
		<div class="question_modal_button_box jcsb">
			<input class="question_modal_write_button" type="submit" value="작성">
			<div class="question_modal_cancle_button jcce aice">취소</div>
		</div>
	</div>
</div>

<%@ include file="../footer.jsp" %>