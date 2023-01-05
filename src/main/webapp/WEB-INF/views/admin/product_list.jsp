<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_nav.jsp" %>
<div class="admin_content">
	<div class="admin_title aice">상품 목록</div>
	<div class="admin_category_box df">
		<a href="${cpath }/admin/product_list" class="admin_category_button jcce aice">상품 목록</a>
		<a href="${cpath }/admin/product_insert" class="admin_category_button jcce aice">상품 등록</a>
	</div>
	<div class="admin_product_list">
		<div class="admin_product_info df">
			<div class="admin_product_img jcce aice">상품사진</div>
			<div class="admin_product_name jcce aice">상품명</div>
			<div class="admin_product_price jcce aice">가격</div>
			<div class="admin_product_sale jcce aice">할인율</div>
			<div class="admin_product_category jcce aice">카테고리</div>
			<div class="admin_product_kind jcce aice">종류</div>
			<div class="admin_product_like jcce aice">좋아요</div>
			<div class="admin_product_update jcce aice">금액 수정</div>
			<div class="admin_product_delete jcce aice">상품 삭제</div>
		</div>
		<div class="admin_product_item_box">
			<c:forEach var="dto" items="${list }">
				<div class="admin_product_item df">
					<div class="admin_product_img jcce aice"><img src="${dto.product_img }" width="50px"></div>
					<div class="admin_product_name jcce aice">${dto.product_name }</div>
					<div class="admin_product_price jcce aice"><input class="admin_product_price_input" value="${dto.product_price }"> 원</div>
					<div class="admin_product_sale jcce aice"><input class="admin_product_sale_input" value="${dto.product_sale }"> %</div>
					<div class="admin_product_category jcce aice">${dto.product_category }</div>
					<div class="admin_product_kind jcce aice">${dto.product_kind }</div>
					<div class="admin_product_like jcce aice">${dto.product_like }개</div>
					<div class="admin_product_update jcce aice">
						<button class="admin_product_update_button" onclick="adminProductUpdate(event, '${dto.product_name}')">수정</button>
					</div>
					<div class="admin_product_delete jcce aice">
						<button class="admin_product_delete_button" onclick="adminProductDelete('${dto.product_name}')">삭제</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
		
</body>
</html>