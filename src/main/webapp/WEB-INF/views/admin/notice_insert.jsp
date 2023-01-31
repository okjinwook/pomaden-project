<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_nav.jsp" %>
	<div class="admin_content">
		<div class="admin_title aice">공지 등록</div>
		<div class="admin_category_box df">
			<a href="${cpath }/admin/notice_list" class="admin_category_button jcce aice">공지 목록</a>
			<a href="${cpath }/admin/notice_insert" class="admin_category_button jcce aice">공지 등록</a>
		</div>
		<form action="${cpath }/admin/notice_insert" method="POST">
			<div class="admin_notice_component">
				<div class="admin_notice_title_box aice">
					<div class="admin_notice_insert_info">제목</div>
					<input class="admin_notice_title" name="notice_title" placeholder="공지 제목을 입력해주세요.">
				</div>
				<div class="admin_notice_content_box df">
					<div class="admin_notice_insert_info">내용</div>
					<textarea name="notice_content" placeholder="공지 내용을 입력해주세요."></textarea>
				</div>
				<input type="submit" class="admin_notice_insert_button" onclick="noticeOnSubmit(event)" value="등록">
			</div>
		</form>
	</div>
	<script>
		const msg = '${param.msg}'
		if(msg != '') {
			alert(msg)
		}
	</script>
		
</body>
</html>