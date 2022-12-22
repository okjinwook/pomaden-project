<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_nav.jsp" %>
	<div class="admin_content">
		<div class="admin_title aice">상품 등록</div>
		<div class="admin_category_box df">
			<a href="${cpath }/admin/product_list" class="admin_product_list_button admin_category_button jcce aice">상품 목록</a>
			<a href="${cpath }/admin/product_add" class="admin_product_add_button admin_category_button jcce aice">상품 등록</a>
		</div>
		<div class="admin_product_add df">
			<form class="df" action="${cpath }/admin/product_add" method="POST" enctype="multipart/form-data">
				<div class="admin_img_component">
					<div class="admin_img_box aice">
						<label class="admin_img_label jcce aice">
							<input class="admin_file_input" type="file" name="product_upload" hidden="" onchange="adminUpload(event)">
							<span>상품 이미지 등록</span>
							<span>클릭</span>
						</label>
					</div>
				</div>
				<div class="admin_product_component jcsb">
					<div class="admin_product_box aice">
						<div class="admin_info_box">상품명</div>
						<input type="text" name="product_name" required="required">
					</div>
					<div class="admin_product_box aice">
						<div class="admin_info_box">상품가격</div>
						<input type="number" name="product_price" required="required">
						<span>원</span>
					</div>
					<div class="admin_product_box aice">
						<div class="admin_info_box">할인율</div>
						<input type="number" name="product_sale" required="required">
						<span>%</span>
					</div>
					<div class="admin_product_box aice">
						<div class="admin_info_box">카테고리</div>
						<select name="product_category" onChange="adminCegoryOnChange(event)" required="required">
							<option>--선택--</option>
							<option>아우터</option>
							<option>셔츠</option>
							<option>티셔츠</option>
							<option>팬츠</option>
							<option>슈즈</option>
						</select>
					</div>
					<div class="admin_sub_category_box admin_product_box aice">
					</div>
					<input type="submit" class="admin_add_button" value="상품 등록">
				</div>
			</form>
			<form action="${cpath }/admin/item_add" enctype="multipart/form-data" method="POST">
				<div class="admin_item_component jcsb">
					<div class="admin_product_box aice">
						<div class="admin_info_box">상품명</div>
						<input type="text" name="item_name" value="${dto.product_name }" required="required">
					</div>
					<div class="admin_product_box aice">
						<div class="admin_info_box">컬러</div>
						<select class="admin_color" name="item_color" required="required">
							<option>--선택--</option>
							<option>블랙</option>
							<option>화이트</option>
							<option>그레이</option>
							<option>베이지</option>
							<option>옐로우</option>
							<option>블루</option>
						</select>
					</div>
					<div class="admin_product_box aice">
						<div class="admin_info_box">사이즈</div>
						<select class="admin_size" name="item_size" required="required">
							<option>--선택--</option>
							<option>2XL</option>
							<option>XL</option>
							<option>L</option>
							<option>M</option>
						</select>
					</div>
					<div class="admin_product_box aice">
						<div class="admin_info_box">수량</div>
						<input type="number" name="item_count" required="required" value="50">
						<span>개</span>
					</div>
					<input type="submit" class="admin_add_button" value="아이템 등록">
				</div>
			</form>
		</div>
	</div>
		
	<script>
		if('${msg}' != '') {
			alert('${msg}')
		}
	</script>
</body>
</html>