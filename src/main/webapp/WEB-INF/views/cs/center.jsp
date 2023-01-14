<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="cs_component">
		<div class="cs_title">고객센터</div>
		<div class="cs_kind_button df">
			<div class="cs_notice_button cs_buttons jcce aice">공지사항</div>
			<div class="cs_oftenQeution_button cs_buttons jcce aice">자주 묻는 질문</div>
		</div>
		<div class="cs_content_box">
			<div class="cs_notice_content_box">
				<c:forEach var="dto" items="${list }" varStatus="status">
					<div class="cs_notice_item df">
						<div class="cs_notice_index jcce aice">${status.count}</div>				
						<a class="cs_notice_title aice" href="${cpath }/cs/notice_detail?notice_idx=${dto.notice_idx}">${dto.notice_title } </a>
						<div class="cs_notice_date jcce aice">${dto.notice_date }</div>				
					</div>
				</c:forEach>
			</div>
			<div class="cs_oftenQeution_content_box hidden">
				<div class="cs_oftenQeution_item df">
					<div class="cs_oftenQeution_index jcce aice">[ 자주 묻는 질문 ]</div>				
					<div class="cs_oftenQeution_content jcce aice">상품 교환 / 반품은 어떻게 하나요?</div>				
				</div>
				<div class="cs_oftenQeution_item df">
					<div class="cs_oftenQeution_index jcce aice">[ 자주 묻는 질문 ]</div>				
					<div class="cs_oftenQeution_content jcce aice">회원 ID / PW 분실 시 어떻게 해야 하나요?</div>				
				</div>
				<div class="cs_oftenQeution_item df">
					<div class="cs_oftenQeution_index jcce aice">[ 자주 묻는 질문 ]</div>				
					<div class="cs_oftenQeution_content jcce aice">주문건 취소 / 변경 하고 싶을 때 어떻게 해야 하나요?</div>				
				</div>
			</div>
		</div>
	</div>
</main>
<script>
	const cs_buttons = document.querySelectorAll('.cs_buttons')
	cs_buttons.forEach(button => {
		button.addEventListener('click', csButtonClick)
	})
	
</script>
<%@ include file="../footer.jsp" %>




