<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="question_component">
		<div class="question_title">1:1 문의</div>
		<form action="${cpath }/question/questionList">
			<div class="question_filter_box jcsb">
				<select name="category" class="question_select_box" onchange="location.href='${cpath }/question/questionList?check=${param.check }&category=' + (this.value)" >
					<option>전체</option>
					<option value="배송문의">배송문의</option>
					<option value="입금문의">입금문의</option>
					<option value="재입고문의">재입고문의</option>
					<option value="환불문의">환불문의</option>
					<option value="교환문의">교환문의</option>
					<option value="기타문의">기타문의</option>
				</select>
				<div class="question_search_box aice">
					<select name="check" class="question_check_box question_select_box">
						<option>전체</option>
						<option value="미답변">미답변</option>
						<option value="답변">답변</option>
					</select>
					<select name="kind" class="question_select_box" style="margin-left: 10px;">
						<option value="제목">제목</option>
						<option value="작성자">작성자</option>
					</select>
					<input class="question_search_input" type="text" name="search">
					<input class="question_search_button aice jcce" type="submit" value="검색하기">
				</div>
			</div>
		</form>
		<div class="question_info_box df">
			<div class="question_info_idx jcce aice">번호</div>
			<div class="question_info_category jcce aice">카테고리</div>
			<div class="question_info_title jcce aice">제목</div>
			<div class="question_info_writer jcce aice">작성자</div>
			<div class="question_info_check jcce aice">답변여부</div>
			<div class="question_info_date jcce aice">작성날짜</div>
		</div>
		<div class="question_list_box">
			<c:forEach var="dto" items="${list }" varStatus="status">
				<div class="question_list_item df">
					<div class="question_item_idx jcce aice">${status.count }</div>
					<div class="question_item_category jcce aice">${dto.question_category }</div>
					<div class="question_item_title jcce aice">${dto.question_title }</div>
					<div class="question_item_writer jcce aice">${dto.question_member_id }</div>
					<div class="question_item_check jcce aice">${dto.question_check }</div>
					<div class="question_item_date jcce aice">${dto.question_date }</div>
				</div>
			</c:forEach>
		</div>
		<div class="question_write_button_box">
			<div class="question_write_button jcce aice" onclick="questionOnWrite()">작성하기</div>
		</div>
	</div>
</main>
<div class="question_modal_box modal hidden">
	<form action="${cpath }/question/insert" method="POST">
		<div class="question_modal_title jcce aice">1:1 문의</div>
		<div class="question_modal_component">
			<div class="">
				<div>작성자</div>
				<input name="question_member_id" value="${login.member_id }">
			</div>
			<div class="question_modal_category">
				<div>카테고리</div>
				<select name="question_category" onchange="">
					<option value="배송문의">배송문의</option>
					<option value="입금문의">입금문의</option>
					<option value="재입고문의">재입고문의</option>
					<option value="환불문의">환불문의</option>
					<option value="교환문의">교환문의</option>
					<option value="기타문의">기타문의</option>
				</select>
			</div>
			<div class="">
				<div>제목</div>
				<input name="question_title">
			</div>
			<div class="question_modal_content">
				<textarea name="question_content" placeholder="내용을 작성해주세요."></textarea>
			</div>
			<div class="question_modal_button_box jcsb">
				<input class="question_modal_write_button" type="submit" value="작성">
				<div class="question_modal_cancle_button jcce aice" onclick="modalCancleClick()">취소</div>
			</div>
		</div>
	</form>
</div>
<script>
	const category = document.querySelectorAll('.question_filter_box > select > option')
	const check = document.querySelectorAll('.question_check_box > option')
	if('${msg}' != '') {
		alert('${msg}')
	}
	category.forEach(ob => {
		if('${param.category}' == ob.value) {
			ob.selected = true
		}
	})
	check.forEach(ob => {
		if('${param.check}' == ob.value) {
			ob.selected = true
		}
	})
	
</script>
<%@ include file="../footer.jsp" %>