<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_nav.jsp" %>
<div class="admin_content">
	<div class="admin_title aice">공지 목록</div>
	<div class="admin_category_box df">
		<a href="${cpath }/admin/notice_list" class="admin_category_button jcce aice">공지 목록</a>
		<a href="${cpath }/admin/notice_insert" class="admin_category_button jcce aice">공지 등록</a>
	</div>
	<div class="admin_notice_list">
		<div class="admin_notice_info df">
			<div class="admin_notice_admin jcce aice">관리자</div>
			<div class="admin_notice_title jcce aice">제목</div>
			<div class="admin_notice_content jcce aice">내용</div>
			<div class="admin_notice_date jcce aice">작성일자</div>
		</div>
		<div class="admin_notice_item_box">
			<c:forEach var="dto" items="${list }">
				<div class="admin_notice_item df">
					<div class="admin_notice_admin jcce aice">${dto.notice_admin }</div>
					<div class="admin_notice_title jcce aice">${dto.notice_title }</div>
					<div class="admin_notice_content jcce aice">${dto.notice_content }</div>
					<div class="admin_notice_date jcce aice">${dto.notice_date }</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
		
</body>
</html>