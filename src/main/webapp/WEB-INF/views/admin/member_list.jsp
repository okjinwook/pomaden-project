<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_nav.jsp" %>
<div class="admin_content">
	<div class="admin_title aice">사용자 목록</div>
	<div class="admin_category_box df">
		<a href="${cpath }/admin/member_list" class="admin_category_button jcce aice">사용자 목록</a>
	</div>
	<div class="admin_member_list">
		<div class="admin_member_info df">
			<div class="admin_member_email jcce aice">이메일</div>
			<div class="admin_member_id jcce aice">아이디</div>
			<div class="admin_member_name jcce aice">이름</div>
			<div class="admin_member_phone jcce aice">휴대전화</div>
			<div class="admin_member_point jcce aice">포인트</div>
			<div class="admin_member_coupon jcce aice">쿠폰</div>
		</div>
		<div class="admin_member_item_box">
			<c:forEach var="dto" items="${list }">
				<div class="admin_member_item df">
					<div class="admin_member_email jcce aice">${dto.member_email }</div>
					<div class="admin_member_id jcce aice">${dto.member_id }</div>
					<div class="admin_member_name jcce aice">${dto.member_name }</div>
					<div class="admin_member_phone jcce aice">${dto.member_phone }</div>
					<div class="admin_member_point jcce aice">${dto.member_point }</div>
					<div class="admin_member_coupon jcce aice">${dto.member_coupon }</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
		
</body>
</html>