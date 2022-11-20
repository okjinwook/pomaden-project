<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>남성룩 - 포마든POMADEN</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/main.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/member/login.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/member/join.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/member/find_id.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/member/find_pw.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage/orderList.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage/point.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage/coupon.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage/board.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage/like.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage/member_info.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage/myQuestion.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/cs/center.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/question/questionList.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/product/productList.css">



<link rel="icon" type="icon/png" href="">
<script src="${cpath }/resources/js/header.js"></script>
<script src="${cpath }/resources/js/main.js"></script>
<script src="${cpath }/resources/js/cs/center.js"></script>
<script src="${cpath }/resources/js/product/productList.js"></script>
<script src="${cpath }/resources/js/member/join.js"></script>
</head>
<body>
	<header>
		<div class="header_info_component">
			<div class="header_info jcsb aice">
				<div class="header_left">
					<div class="logo">
						<a href="${cpath }"><img src="${cpath }/resources/img/logo.png" width="200px"></a>
					</div>
				</div>
				<div class="header_right df">
					<c:if test="${empty login }">
						<a href="${cpath }/member/login">로그인</a>
					</c:if>
					<c:if test="${not empty login }">
						<a href="${cpath }/member/logout">로그아웃</a>
					</c:if>
					<c:if test="${empty login }">
						<a href="${cpath }/member/join">회원가입</a>
					</c:if>
					<c:if test="${not empty login }">
						<a href="${cpath }/cart/cartList">장바구니</a>
					</c:if>
					<a href="${cpath }/myPage?category=orderList">마이페이지</a>
					<a href="${cpath }/cs/center">고객센터</a>
				</div>
			</div>
		</div>
		<div class="header_menubar_component jcsb">
			<div class="header_menubar aice jcsb">
				<div class="menuAll aice">
					<div class="menuAll_button">전체보기</div>
					<div class="dropbox_menuAll hidden df">
						<div class="menuAll_component">
							<div class="menuAll_menu_best">
								<div class="menuAll_kinds">베스트</div>
								<ul>
									<li>아우터 30</li>
									<li>셔츠 30</li>
									<li>티셔츠 30</li>
									<li>팬츠 30</li>
									<li>슈즈 30</li>
								</ul>
							</div>
							<div class="menuAll_menu_outer">
								<div class="menuAll_kinds">아우터</div>
								<ul>
									<li>가디건</li>
									<li>코치자켓</li>
									<li>폴리스</li>
									<li>집업</li>
									<li>코트</li>
									<li>패딩</li>
								</ul>
							</div>
						</div>
						<div class="menuAll_component">
							<div class="menuAll_menu_shirts">
								<div class="menuAll_kinds">셔츠</div>
								<ul>
									<li>맨투맨</li>
									<li>니트/스웨터</li>
									<li>후드</li>
									<li>폴라넥</li>
									<li>남방</li>
								</ul>
							</div>
							<div class="menuAll_menu_Tshirts">
								<div class="menuAll_kinds">티셔츠</div>
								<ul>
									<li>긴팔티</li>
									<li>반팔티</li>
									<li>7부셔츠</li>
									<li>스트라이프</li>
								</ul>
							</div>
						</div>
						<div class="menuAll_component">
							<div class="menuAll_menu_pants">
								<div class="menuAll_kinds">팬츠</div>
								<ul>
									<li>청바지</li>
									<li>슬랙스</li>
									<li>트래이닝</li>
									<li>와이드 팬츠</li>
								</ul>
							</div>
							<div class="menuAll_menu_shoose">
								<div class="menuAll_kinds">슈즈</div>
								<ul>
									<li>스니커즈</li>
									<li>구두</li>
									<li>로퍼</li>
									<li>부츠</li>
									<li>샌들</li>
									<li>슬리퍼</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="menu_kind aice jcsb">
					<div class="menu_home">
						<a href="">홈</a>
					</div>
					<div class="menu_best">
						<a href="${cpath }/product/productList?category=베스트" class="menu_kind_button aice">베스트</a>
						<ul class="header_menubar_drop hidden">
							<li>아우터 30</li>
							<li>셔츠 30</li>
							<li>티셔츠 30</li>
							<li>팬츠 30</li>
							<li>슈즈 30</li>
						</ul>
					</div>
					<div class="menu_outer">
						<a href="${cpath }/product/productList?category=아우터" class="menu_kind_button aice">아우터</a>
						<ul class="header_menubar_drop hidden">
							<li>가디건</li>
							<li>코치자켓</li>
							<li>폴리스</li>
							<li>집업</li>
							<li>코트</li>
							<li>패딩</li>
						</ul>
					</div>
					<div class="menu_shirts">
						<a href="${cpath }/product/productList?category=셔츠" class="menu_kind_button aice">셔츠</a>
						<ul class="header_menubar_drop hidden">
							<li>맨투맨</li>
							<li>니트/스웨터</li>
							<li>후드</li>
							<li>폴라넥</li>
							<li>남방</li>
						</ul>
					</div>
					<div class="menu_T-shirts">
						<a href="${cpath }/product/productList?category=티셔츠" class="menu_kind_button aice">티셔츠</a>
						<ul class="header_menubar_drop hidden">
							<li>긴팔티</li>
							<li>반팔티</li>
							<li>7부셔츠</li>
							<li>스트라이프</li>
						</ul>
					</div>
					<div class="menu_pants">
						<a href="${cpath }/product/productList?category=팬츠" class="menu_kind_button aice">팬츠</a>
						<ul class="header_menubar_drop hidden">
							<li>청바지</li>
							<li>슬랙스</li>
							<li>트래이닝</li>
							<li>와이드 팬츠</li>
						</ul>
					</div>
					<div class="menu_shoose">
						<a href="${cpath }/product/productList?category=슈즈" class="menu_kind_button aice">슈즈</a>
						<ul class="header_menubar_drop hidden">
							<li>스니커즈</li>
							<li>구두</li>
							<li>로퍼</li>
							<li>부츠</li>
							<li>샌들</li>
							<li>슬리퍼</li>
						</ul>
					</div>
				</div>
				<div class="menu_question">
					<a href="${cpath }/question/questionList">1:1문의</a>
				</div>
			</div>
		</div>
	</header>
	
	<script>
		const menuAll_button = document.querySelector('.menuAll_button')
		const cpath = '${cpath}'
		// 전체메뉴 클릭 이벤트
		menuAll_button.addEventListener('click', menuAllClick)
			
		
	</script>