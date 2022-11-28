<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포마든 - 관리자페이지</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/admin.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/product_add.css">
<script src="${cpath }/resources/js/admin/product_add.js"></script>
</head>
<body>
	<div class="admin_component df">
		<div class="admin_nav_box">
			<div class="admin_logo jcce aice">포마든 관리자 페이지</div>
			<div class="admin_member_mamager">
				<div class="admin_nav_title jcce aice">회원 관리</div>
			</div>
			<div class="admin_product_mamager">
				<div class="admin_nav_title jcce aice">상품 관리</div>
			</div>
			<div class="admin_board_mamager">
				<div class="admin_nav_title jcce aice">게시글 관리</div>
			</div>
		</div>
		
		
		<div class="admin_product_content">
			<div class="admin_product_title aice">상품 등록</div>
			<div class="admin_category_box df">
				<div class="admin_product_list_button admin_category_button jcce aice">상품 목록</div>
				<div class="admin_product_add_button admin_category_button jcce aice">상품 등록</div>
			</div>
			<div class="admin_product_add df">
				<form class="df" action="${cpath }/admin/product_add" method="POST" enctype="multipart/form-data">
					<div class="admin_img_component">
						<div class="admin_img_box aice">
							<label class="admin_img_label jcce aice">
								<input class="admin_file_input" type="file" name="product_upload" hidden="" onchange="adminUpload(event)">
								<span class="">상품 이미지 등록</span>
							</label>
						</div>
					</div>
					<div class="admin_product_component jcsb">
						<div class="admin_product_box aice">
							<div class="admin_info_box">상품명</div>
							<input type="text" name="product_name">
						</div>
						<div class="admin_product_box aice">
							<div class="admin_info_box">상품가격</div>
							<input type="number" name="product_price">
							<span>원</span>
						</div>
						<div class="admin_product_box aice">
							<div class="admin_info_box">할인율</div>
							<input type="number" name="product_sale">
							<span>%</span>
						</div>
						<div class="admin_product_box aice">
							<div class="admin_info_box">카테고리</div>
							<select name="product_category">
								<option>--선택--</option>
								<option>아우터</option>
								<option>셔츠</option>
								<option>티셔츠</option>
								<option>팬츠</option>
								<option>슈즈</option>
							</select>
						</div>
						<div class="admin_product_box aice">
							<div class="admin_info_box">서브 카테고리</div>
							<select class="admin_sub_outer" name="product_kind">
								<option>--선택--</option>
								<option>가디건</option>
								<option>코치자켓</option>
								<option>폴리스</option>
								<option>집업</option>
								<option>코트</option>
								<option>패딩</option>
							</select>
							
							<select class="admin_sub_shirts hidden" name="product_kind">
								<option>--선택--</option>
								<option>맨투맨</option>
								<option>니트/스웨터</option>
								<option>후드</option>
								<option>폴라넥</option>
								<option>남방</option>
							</select>
							
							<select class="admin_sub_Tshirts hidden" name="product_kind">
								<option>--선택--</option>
								<option>긴팔티</option>
								<option>반팔티</option>
								<option>7부티셔츠</option>
								<option>스트라이프</option>
							</select>
							
							<select class="admin_sub_pants hidden" name="product_kind">
								<option>--선택--</option>
								<option>청바지</option>
								<option>슬랙스</option>
								<option>트레이닝</option>
								<option>와이드 팬츠</option>
							</select>
							
							<select class="admin_sub_shoose hidden" name="product_kind">
								<option>--선택--</option>
								<option>스니커즈</option>
								<option>구두</option>
								<option>로퍼</option>
								<option>부츠</option>
								<option>샌들</option>
								<option>슬리퍼</option>
							</select>
						</div>
						<input type="submit" class="admin_add_button" value="상품 등록">
					</div>
				</form>
				<form action="${cpath }/admin/item_add" enctype="multipart/form-data">
					<div class="admin_item_component jcsb">
						<div class="admin_product_box aice">
							<div class="admin_info_box">상품명</div>
							<input type="text" name="item_name">
						</div>
						<div class="admin_product_box aice">
							<div class="admin_info_box">컬러</div>
							<select class="admin_color" name="item_color">
								<option>--선택--</option>
								<option>Black</option>
								<option>White</option>
							</select>
						</div>
						<div class="admin_product_box aice">
							<div class="admin_info_box">사이즈</div>
							<select class="admin_size" name="item_size">
								<option>--선택--</option>
								<option>2XL</option>
								<option>XL</option>
								<option>L</option>
								<option>M</option>
							</select>
						</div>
						<div class="admin_product_box aice">
							<div class="admin_info_box">수량</div>
							<input type="number" name="item_count">
							<span>개</span>
						</div>
						<input type="submit" class="admin_add_button" value="아이템 등록">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>