<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="myPage_component">
		<div class="myPage_title">마이페이지</div>
		<div class="myPage_kinds_box aice jcsb">
			<a href="${cpath }/myPage/orderList" class="myPage_orderList myPage_kind jcce aice">주문내역</a>
			<a href="${cpath }/myPage/point" class="myPage_point myPage_kind jcce aice">포인트<span class="myPage_member_point">${login.member_point }</span></a>
			<a href="${cpath }/myPage/coupon" class="myPage_coupon myPage_kind jcce aice">쿠폰<span class="myPage_member_coupon">${login.member_coupon }</span></a>
			<a href="${cpath }/myPage/board" class="myPage_board myPage_kind jcce aice">게시글</a>
			<a href="${cpath }/myPage/like" class="myPage_like myPage_kind jcce aice">좋아요 상품</a>
			<a href="${cpath }/myPage/member_info" class="myPage_member_info myPage_kind jcce aice">회원정보 관리</a>
			<a href="${cpath }/myPage/myQuestion?page=0" class="myPage_myQuestion myPage_kind jcce aice">문의내역</a>
		</div>
		
		<div class="myPage_myQuestion_title">문의내역</div>
		<div class="myPage_myQuestion_box">
			<div class="myPage_myQuestion_info df">
				<div class="myPage_myQuestion_category jcce aice">카테고리</div>
				<div class="myPage_myQuestion_questionTitle jcce aice">제목</div>
				<div class="myPage_myQuestion_check jcce aice">답변여부</div>
				<div class="myPage_myQuestion_date jcce aice">작성일자</div>
			</div>
			<c:forEach var="dto" items="${list }">
				<div class="myPage_myQuestion_item df" onclick="questionOnClick(event)">
					<div class="myPage_myQuestion_category jcce aice">${dto.question_category }</div>
					<div class="myPage_myQuestion_questionTitle jcce aice">
						<c:if test="${fn:length(dto.question_title) > 50}">
							${fn:substring(dto.question_title , 0 , 50) }...
						</c:if> 
						<c:if test="${fn:length(dto.question_title) < 50}">
							${dto.question_title }
						</c:if> 
					</div>
					<div class="myPage_myQuestion_check jcce aice">${dto.question_check }</div>
					<div class="myPage_myQuestion_date jcce aice">${dto.question_date }</div>
				</div>
				<div class="myPage_myQuestion_detail_box hidden">
					<div class="myPage_myQuestion_content_box df">
						<div class="myPage_myQuestion_content_title aice jcce">내용</div>
						<div class="myPage_myQuestion_content">
							${dto.question_content }
						</div>
					</div>
					<div class="myPage_myQuestion_answer_box df">
						<div class="myPage_myQuestion_answer_title aice jcce">답변</div>
						<div class="myPage_myQuestion_answer">
							<c:if test="${dto.question_check == '미답변'}">
								미답변 문의글입니다
							</c:if>
							<c:if test="${dto.question_check == '답변완료'}">
								<c:forEach var="ansDto" items="${ansList }">
									<c:if test="${ansDto.answer_question_idx == dto.question_idx}">
										${ansDto.answer_content }
									</c:if>
								</c:forEach>
							</c:if>
						</div>
					</div>
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
		  		<a href="${cpath }/myPage/myQuestion?page=${i - 1}">${i }</a>
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
	const myPage_category = document.location.href.split('myPage/')[1].split('?')[0]
	const class_category = document.querySelector('.myPage_' + myPage_category)
	const pages = document.querySelectorAll('.question_paging_box > a')
	class_category.style.color = 'black'
	class_category.style.fontWeight = '700'
	
	pages.forEach(page => {
		if('${param.page}' == (page.innerText * 1) - 1) {
			page.style.fontWeight = '700'
			page.style.textDecoration = 'underline'
		}
	})
</script>
<%@ include file="../footer.jsp" %>