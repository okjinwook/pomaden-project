<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<main>
	<div class="notice_dt_component">
		<div class="notice_dt_title">공지사항</div>
		<div class="notice_dt_content_box">
			<div class="notice_dt_title_box aice">
				<div class="notice_dt_title_info aice">제목</div>
				<div class="notice_dt_title_item">${dto.notice_title }</div>
			</div>
			<div class="notice_dt_content">${dto.notice_content }</div>
		</div>
	</div>
</main>
	
<%@ include file="../footer.jsp" %>