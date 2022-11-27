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
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/admin/product.css">
</head>
<body>
	<div class="admin_component df">
		<div class="admin_nav_box">
			<div class="admin_logo jcce aice">포마든 관리자 페이지</div>
			<div class="admin_member_mamager">
				<div class="admin_nav_title aice">회원 관리</div>
				<ul>
					<li class="jcce aice">회원 목록</li>
				</ul>
			</div>
			<div class="admin_product_mamager">
				<div class="admin_nav_title aice">상품 관리</div>
				<ul>
					<li class="admin_product_regist_button jcce aice">상품 등록</li>
					<li class="jcce aice">상품 목록</li>
				</ul>
			</div>
			<div class="admin_board_mamager">
				<div class="admin_nav_title aice">게시글 관리</div>
				<ul>
					<li class="jcce aice">게시글 목록</li>
				</ul>
			</div>
		</div>
		<div class="admin_product_content">
			<div class="admin_product_title aice">상품 등록</div>
			<div class="admin_product_add df">
				<div class="">
					<div class="admin_product_box aice">
						<div class="admin_info_box">상품명</div>
						<input type="text" name="">
					</div>
					<div class="admin_product_box aice">
						<div class="admin_info_box">상품가격</div>
						<input type="text">
					</div>
					<div class="admin_product_box aice">
						<div class="admin_info_box">할인율</div>
						<input type="text">
					</div>
					<div class="admin_product_box aice">
						<div class="admin_info_box">카테고리</div>
						<select>
							<option>아우터</option>
							<option>셔츠</option>
							<option>티셔츠</option>
							<option>팬츠</option>
							<option>슈즈</option>
						</select>
					</div>
					<div class="admin_product_box aice">
						<div class="admin_info_box">서브 카테고리</div>
						<select class="admin_sub_outer">
							<option>가디건</option>
							<option>코치자켓</option>
							<option>폴리스</option>
							<option>집업</option>
							<option>코트</option>
							<option>패딩</option>
						</select>
						
						<select class="admin_sub_shirts hidden">
							<option>맨투맨</option>
							<option>니트/스웨터</option>
							<option>후드</option>
							<option>폴라넥</option>
							<option>남방</option>
						</select>
						
						<select class="admin_sub_Tshirts hidden">
							<option>긴팔티</option>
							<option>반팔티</option>
							<option>7부티셔츠</option>
							<option>스트라이프</option>
						</select>
						
						<select class="admin_sub_pants hidden">
							<option>청바지</option>
							<option>슬랙스</option>
							<option>트레이닝</option>
							<option>와이드 팬츠</option>
						</select>
						
						<select class="admin_sub_shoose hidden">
							<option>스니커즈</option>
							<option>구두</option>
							<option>로퍼</option>
							<option>부츠</option>
							<option>샌들</option>
							<option>슬리퍼</option>
						</select>
					</div>
					<div class="admin_product_box aice">
						<div class="admin_info_box">사이즈</div>
						<select class="admin_size">
							<option>2XL</option>
							<option>XL</option>
							<option>L</option>
							<option>M</option>
						</select>
					</div>
					<div class="admin_product_box aice">
						<div class="admin_info_box">컬러</div>
						<select class="admin_color">
							<option>Black</option>
							<option>White</option>
						</select>
					</div>
					<div class="admin_product_box aice">
						<div class="admin_info_box">수량</div>
						<input type="text">
					</div>
				</div>
				<div class="admin_img_component">
					<div class="admin_product_box aice">
						<div class="admin_info_box">상품이미지</div>
						<input type="file">
					</div>
					<div class="admin_img_box"><img src="https://www.smallman.co.kr/web/product/medium/202208/770d79f1fa1212186d103da49e7bf8b8.jpg" width="300px"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>