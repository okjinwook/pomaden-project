<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="question_component">
		<div class="question_title">1:1 문의</div>
		<form action="${cpath }/question/questionList">
			<div class="question_filter_box jcsb">
				<select name="category" class="question_select_box" onchange="location.href='${cpath }/question/questionList?page=0&check=${param.check }&kind=${param.kind }&search=${param.search }&category=' + (this.value)" >
					<option value="전체">전체</option>
					<option value="배송문의">배송문의</option>
					<option value="입금문의">입금문의</option>
					<option value="재입고문의">재입고문의</option>
					<option value="환불문의">환불문의</option>
					<option value="교환문의">교환문의</option>
					<option value="기타문의">기타문의</option>
				</select>
				<div class="question_search_box aice">
					<select name="check" class="question_check_box question_select_box">
						<option value="전체">전체</option>
						<option value="미답변">미답변</option>
						<option value="답변">답변</option>
					</select>
					<select name="kind" class="question_kind_box question_select_box" style="margin-left: 10px;">
						<option value="전체">전체</option>
						<option value="제목">제목</option>
						<option value="작성자">작성자</option>
					</select>
					<input type="text" name="page" value="0" hidden="">
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
		<div class="question_paging_box jcce">
			<fmt:parseNumber var="section" value="${(param.page - 1) / 5 }" integerOnly="true" />
			<c:set var="begin" value="${section * 5 + 1}"/>
			<c:set var="end" value="${count < begin + 4 ? count : begin + 4}"/>
			<c:set var="prev" value="${section != 0}"/>
			<c:set var="next" value="${count / 5 != end / 5}"/>
			
			<c:if test="${prev == true }">
				<div class="question_prev_button">◀</div>
			</c:if>
			<c:forEach var="i" begin="${begin }" end="${end}">
		  		<a href="${cpath }/question/questionList?check=${param.check }&kind=${param.kind }&search=${param.search }&category=${param.category }&page=${i - 1}" class="cartList_paging_page">${i }</a>
			</c:forEach>
			<c:if test="${next == true }">
				<div class="question_next_button aice">▶</div>
			</c:if>
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
			<div class="question_modal_writer aice">
				<div>작성자</div>
				<input name="question_member_id" value="${login.member_id }" readonly="readonly">
			</div>
			<div class="question_modal_write_title aice">
				<div>제목</div>
				<input name="question_title">
			</div>
			<div class="question_modal_category aice">
				<div>카테고리</div>
				<select name="question_category">
					<option value="배송문의">배송문의</option>
					<option value="입금문의">입금문의</option>
					<option value="재입고문의">재입고문의</option>
					<option value="환불문의">환불문의</option>
					<option value="교환문의">교환문의</option>
					<option value="기타문의">기타문의</option>
				</select>
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
	const kind = document.querySelectorAll('.question_kind_box > option')
	const search = document.querySelector('.question_search_input')
	const pages = document.querySelectorAll('.question_paging_box > a')
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
	kind.forEach(ob => {
		if('${param.kind}' == ob.value) {
			ob.selected = true
		}
	})
	search.value = '${param.search}'
	
	pages.forEach(page => {
		if('${param.page}' == (page.innerText * 1) - 1) {
			page.style.fontWeight = '700'
			page.style.textDecoration = 'underline'
		}
	})
	
</script>
<%@ include file="../footer.jsp" %>