<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_nav.jsp" %>
<div class="admin_content">
	<div class="admin_title aice">문의 목록</div>
	<div class="admin_category_box df">
		<a href="${cpath }/admin/question_list?" class="admin_category_button jcce aice">문의 목록</a>
	</div>
	<div class="admin_question_select_box aice">
		<select class="admin_question_select_category aice" name="check" onchange="location.href='${cpath }/admin/question_list?check=${param.check }&category=' + (this.value)">
			<option value="전체">카테고리</option>
			<option value="배송문의">배송문의</option>
			<option value="입금문의">입금문의</option>
			<option value="재입고문의">재입고문의</option>
			<option value="환불문의">환불문의</option>
			<option value="교환문의">교환문의</option>
			<option value="기타문의">기타문의</option>
		</select>
		<select class="admin_question_select_check aice" name="kind" onchange="location.href='${cpath }/admin/question_list?check=' + (this.value) + '&category=${param.category }'">
			<option value="전체">답변여부</option>
			<option value="미답변">미답변</option>
			<option value="답변완료">답변완료</option>
		</select>
	</div>
	<div class="admin_question_list">
		<div class="admin_question_info df">
			<div class="admin_question_writer jcce aice">작성자</div>
			<div class="admin_question_title jcce aice">제목</div>
			<div class="admin_question_content jcce aice">내용</div>
			<div class="admin_question_category jcce aice">답변여부</div>
			<div class="admin_question_check jcce aice">카테고리</div>
			<div class="admin_question_answer jcce aice">답변</div>
			<div class="admin_question_date jcce aice">작성일자</div>
		</div>
		<div class="admin_question_item_box">
			<c:forEach var="dto" items="${list }">
				<c:set var="content" value="${fn:replace(dto.question_content, '<br>', ' ')}"/>
				<c:set var="param_content" value="${fn:replace(dto.question_content, '<br>', newLine)}"/>
				<div class="admin_question_item df">
					<div class="admin_question_writer jcce aice">${dto.question_member_id }</div>
					<div class="admin_question_title aice">
						<c:if test="${fn:length(dto.question_title ) > 20}">
							${fn:substring(dto.question_title  , 0 , 20) }...
						</c:if> 
						<c:if test="${fn:length(dto.question_title ) < 20}">
							${dto.question_title  }
						</c:if>
					</div>
					<div class="admin_question_content aice">
						<c:if test="${fn:length(content) > 40}">
							${fn:substring(content , 0 , 40) }...
						</c:if> 
						<c:if test="${fn:length(content) < 40}">
							${content }
						</c:if> 
					</div>
					<div class="admin_question_check jcce aice">${dto.question_check }</div>
					<div class="admin_question_category jcce aice">${dto.question_category }</div>
					<div class="admin_question_answer jcce aice">
						<c:if test="${dto.question_check == '미답변' }">
							<div class="admin_question_answer_button" onclick="answerOnClick(${dto.question_idx },'${dto.question_member_id }', '${dto.question_title }', '${param_content}')">답변</div>
						</c:if>
					</div>
					<div class="admin_question_date jcce aice">${dto.question_date }</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="admin_question_answer_box">
		<div class="admin_question_answer_item">
			<div class="admin_question_answer_writer_box aice">
				<div class="admin_question_answer_info aice">작성자</div>
				<div class="admin_question_answer_writer"></div>
			</div>
			<div class="admin_question_answer_title_box aice">
				<div class="admin_question_answer_info aice">제목</div>
				<div class="admin_question_answer_title"></div>
			</div>
			<div class="admin_question_answer_content_box aice">
				<div class="admin_question_answer_info admin_question_answer_content_info aice">내용</div>
				<div class="admin_question_answer_content"></div>
			</div>
		</div>
		<form action="${cpath }/admin/answer_insert" method="POST">
			<input name="answer_question_idx" hidden="">
			<textarea name="answer_content" placeholder="답변할 내용을 작성하세요."></textarea>
			<div class="admin_answer_button_box df">
				<input type="submit" class="admin_answer_button" value="답변완료" onclick="answerOnSubmit(event)">
			</div>
		</form>
	</div>
</div>
<script>
	const category = document.querySelectorAll('.admin_question_select_category > option')
	const check = document.querySelectorAll('.admin_question_select_check > option')
	const msg = '${param.msg}'
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
	if(msg != '') {
		alert(msg)
	}
</script>
</body>
</html>