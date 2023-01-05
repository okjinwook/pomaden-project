<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_nav.jsp" %>
<div class="admin_content">
	<div class="admin_title aice">리뷰 목록</div>
	<div class="admin_category_box df">
		<a href="${cpath }/admin/review_list" class="admin_category_button jcce aice">리뷰 목록</a>
	</div>
	<div class="admin_review_list">
		<div class="admin_review_info df">
			<div class="admin_review_img jcce aice">이미지</div>
			<div class="admin_review_writer jcce aice">작성자</div>
			<div class="admin_review_product jcce aice">상품</div>
			<div class="admin_review_content jcce aice">내용</div>
			<div class="admin_review_grade jcce aice">평점</div>
			<div class="admin_review_date jcce aice">작성일자</div>
		</div>
		<div class="admin_review_item_box">
			<c:forEach var="dto" items="${list }">
				<div class="admin_review_item df">
					<div class="admin_review_img jcce aice"><img src="${dto.review_img }" width="50px"></div>
					<div class="admin_review_writer jcce aice">${dto.review_member_id }</div>
					<div class="admin_review_product jcce aice">${dto.review_product }</div>
					<div class="admin_review_content jcce aice">${dto.review_content }</div>
					<div class="admin_review_grade jcce aice">${dto.review_grade }</div>
					<div class="admin_review_date jcce aice">${dto.review_date }</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
		
</body>
</html>