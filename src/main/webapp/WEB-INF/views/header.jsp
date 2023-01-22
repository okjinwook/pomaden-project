<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<c:set var="newLine" value="\n"></c:set>
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
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/member/findId_result.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/member/findPw_result.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage/orderList.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage/point.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage/coupon.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage/board.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage/like.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage/member_info.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/myPage/myQuestion.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/cs/center.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/cs/notice_detail.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/question/questionList.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/product/productList.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/product/productDetail.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/product/payment.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/cart/cartList.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/kakaopay/success.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/kakaopay/fail.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/kakaopay/cancle.css">



<link rel="icon" type="icon/png" href="">
<script src="${cpath }/resources/js/header.js"></script>
<script src="${cpath }/resources/js/main.js"></script>
<script src="${cpath }/resources/js/cs/center.js"></script>
<script src="${cpath }/resources/js/product/productList.js"></script>
<script src="${cpath }/resources/js/product/productDetail.js"></script>
<script src="${cpath }/resources/js/product/payment.js"></script>
<script src="${cpath }/resources/js/member/join.js"></script>
<script src="${cpath }/resources/js/member/find_pw.js"></script>
<script src="${cpath }/resources/js/member/findPw_result.js"></script>
<script src="${cpath }/resources/js/myPage/member_info.js"></script>
<script src="${cpath }/resources/js/myPage/myQuestion.js"></script>
<script src="${cpath }/resources/js/myPage/orderList.js"></script>
<script src="${cpath }/resources/js/cart/cartList.js"></script>
<script src="${cpath }/resources/js/question/questionList.js"></script>
<script src="${cpath }/resources/js/shipping/shippingList.js"></script>
</head>
<body>
<div class="overlay hidden"></div>
	<header>
		<div class="header_info_component">
			<div class="header_info jcsb aice">
				<div class="header_left">
					<div class="logo">
						<a href="${cpath }">POMADEN</a>
					</div>
				</div>
				<div class="header_right aice">
					<c:if test="${empty login }">
						<a href="${cpath }/member/login">로그인</a>
					</c:if>
					<c:if test="${not empty login }">
						<a>${login.member_name }님</a>
					</c:if>
					<c:if test="${not empty login }">
						<a href="${cpath }/member/logout">로그아웃</a>
					</c:if>
					<c:if test="${empty login }">
						<a href="${cpath }/member/join">회원가입</a>
					</c:if>
					<a href="${cpath }/cart/cartList">
						<img src="${cpath }/resources/img/cart.png" width="30px">
					</a>
					<a href="${cpath }/myPage/orderList">
						<img src="${cpath }/resources/img/profile.png" width="30px">
					</a>
				</div>
			</div>
		</div>
		<div class="header_menubar_component jcsb">
			<div class="header_menubar aice jcsb">
				<div class="menuAll aice">
					<div class="dropbox_menuAll hidden df">
						<div class="menuAll_component">
							<div class="menuAll_menu_best">
								<div class="menuAll_kinds">베스트</div>
								<ul>
									<li><a href="${cpath }/product/productList?category=아우터&kind=전체&top=1">아우터 30</a></li>
									<li><a href="${cpath }/product/productList?category=셔츠&kind=전체&top=1">셔츠 30</a></li>
									<li><a href="${cpath }/product/productList?category=티셔츠&kind=전체&top=1">티셔츠 30</a></li>
									<li><a href="${cpath }/product/productList?category=팬츠&kind=전체&top=1">팬츠 30</a></li>
									<li><a href="${cpath }/product/productList?category=슈즈&kind=전체&top=1">슈즈 30</a></li>
								</ul>
							</div>
							<div class="menuAll_menu_outer">
								<div class="menuAll_kinds">아우터</div>
								<ul>
									<li><a href="${cpath }/product/productList?category=아우터&kind=가디건">가디건</a></li>
									<li><a href="${cpath }/product/productList?category=아우터&kind=코치자켓">코치자켓</a></li>
									<li><a href="${cpath }/product/productList?category=아우터&kind=폴리스">폴리스</a></li>
									<li><a href="${cpath }/product/productList?category=아우터&kind=코트">코트</a></li>
									<li><a href="${cpath }/product/productList?category=아우터&kind=패딩">패딩</a></li>
								</ul>
							</div>
						</div>
						<div class="menuAll_component">
							<div class="menuAll_menu_Tshirts">
								<div class="menuAll_kinds">티셔츠</div>
								<ul>
									<li><a href="${cpath }/product/productList?category=티셔츠&kind=맨투맨">맨투맨</a></li>
									<li><a href="${cpath }/product/productList?category=티셔츠&kind=니트/스웨터">니트/스웨터</a></li>
									<li><a href="${cpath }/product/productList?category=티셔츠&kind=후드">후드</a></li>
									<li><a href="${cpath }/product/productList?category=티셔츠&kind=폴라넥">폴라넥</a></li>
								</ul>
							</div>
							<div class="menuAll_menu_shirts">
								<div class="menuAll_kinds">셔츠</div>
								<ul>
									<li><a href="${cpath }/product/productList?category=셔츠&kind=긴팔셔츠">긴팔셔츠</a></li>
									<li><a href="${cpath }/product/productList?category=셔츠&kind=반팔셔츠">반팔셔츠</a></li>
									<li><a href="${cpath }/product/productList?category=셔츠&kind=스트라이프">스트라이프</a></li>
								</ul>
							</div>
						</div>
						<div class="menuAll_component">
							<div class="menuAll_menu_pants">
								<div class="menuAll_kinds">팬츠</div>
								<ul>
									<li><a href="${cpath }/product/productList?category=팬츠&kind=청바지">청바지</a></li>
									<li><a href="${cpath }/product/productList?category=팬츠&kind=슬랙스">슬랙스</a></li>
									<li><a href="${cpath }/product/productList?category=팬츠&kind=트레이닝">트레이닝</a></li>
								</ul>
							</div>
							<div class="menuAll_menu_shoose">
								<div class="menuAll_kinds">슈즈</div>
								<ul>
									<li><a href="${cpath }/product/productList?category=슈즈&kind=스니커즈">스니커즈</a></li>
									<li><a href="${cpath }/product/productList?category=슈즈&kind=구두">구두</a></li>
									<li><a href="${cpath }/product/productList?category=슈즈&kind=부츠">부츠</a></li>
									<li><a href="${cpath }/product/productList?category=슈즈&kind=슬리퍼">슬리퍼</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="menu_kind aice jcsb">
					<div class="menuAll_button jcce">전체보기</div>
					<div class="menu_best">
						<a href="${cpath }/product/productList?top=1" class="menu_kind_button aice">베스트</a>
						<ul class="header_menubar_drop hidden">
							<li><a href="${cpath }/product/productList?category=아우터&kind=전체&top=1">아우터 30</a></li>
							<li><a href="${cpath }/product/productList?category=셔츠&kind=전체&top=1">셔츠 30</a></li>
							<li><a href="${cpath }/product/productList?category=티셔츠&kind=전체&top=1">티셔츠 30</a></li>
							<li><a href="${cpath }/product/productList?category=팬츠&kind=전체&top=1">팬츠 30</a></li>
							<li><a href="${cpath }/product/productList?category=슈즈&kind=전체&top=1">슈즈 30</a></li>
						</ul>
					</div>
					<div class="menu_outer">
						<a href="${cpath }/product/productList?category=아우터&kind=전체" class="menu_kind_button aice">아우터</a>
						<ul class="header_menubar_drop hidden">
							<li><a href="${cpath }/product/productList?category=아우터&kind=가디건">가디건</a></li>
							<li><a href="${cpath }/product/productList?category=아우터&kind=코치자켓">코치자켓</a></li>
							<li><a href="${cpath }/product/productList?category=아우터&kind=폴리스">폴리스</a></li>
							<li><a href="${cpath }/product/productList?category=아우터&kind=코트">코트</a></li>
							<li><a href="${cpath }/product/productList?category=아우터&kind=패딩">패딩</a></li>
						</ul>
					</div>
					<div class="menu_shirts">
						<a href="${cpath }/product/productList?category=티셔츠&kind=전체" class="menu_kind_button aice">티셔츠</a>
						<ul class="header_menubar_drop hidden">
							<li><a href="${cpath }/product/productList?category=티셔츠&kind=맨투맨">맨투맨</a></li>
							<li><a href="${cpath }/product/productList?category=티셔츠&kind=니트/스웨터">니트/스웨터</a></li>
							<li><a href="${cpath }/product/productList?category=티셔츠&kind=후드">후드</a></li>
							<li><a href="${cpath }/product/productList?category=티셔츠&kind=폴라넥">폴라넥</a></li>
						</ul>
					</div>
					<div class="menu_T-shirts">
						<a href="${cpath }/product/productList?category=셔츠&kind=전체" class="menu_kind_button aice">셔츠</a>
						<ul class="header_menubar_drop hidden">
							<li><a href="${cpath }/product/productList?category=셔츠&kind=긴팔셔츠">긴팔셔츠</a></li>
							<li><a href="${cpath }/product/productList?category=셔츠&kind=반팔셔츠">반팔셔츠</a></li>
							<li><a href="${cpath }/product/productList?category=셔츠&kind=스트라이프">스트라이프</a></li>
						</ul>
					</div>
					<div class="menu_pants">
						<a href="${cpath }/product/productList?category=팬츠&kind=전체" class="menu_kind_button aice">팬츠</a>
						<ul class="header_menubar_drop hidden">
							<li><a href="${cpath }/product/productList?category=팬츠&kind=청바지">청바지</a></li>
							<li><a href="${cpath }/product/productList?category=팬츠&kind=슬랙스">슬랙스</a></li>
							<li><a href="${cpath }/product/productList?category=팬츠&kind=트레이닝">트레이닝</a></li>
						</ul>
					</div>
					<div class="menu_shoose">
						<a href="${cpath }/product/productList?category=슈즈&kind=전체" class="menu_kind_button aice">슈즈</a>
						<ul class="header_menubar_drop hidden">
							<li><a href="${cpath }/product/productList?category=슈즈&kind=스니커즈">스니커즈</a></li>
							<li><a href="${cpath }/product/productList?category=슈즈&kind=구두">구두</a></li>
							<li><a href="${cpath }/product/productList?category=슈즈&kind=부츠">부츠</a></li>
							<li><a href="${cpath }/product/productList?category=슈즈&kind=슬리퍼">슬리퍼</a></li>
						</ul>
					</div>
					<div class="menu_question">
						<a href="${cpath }/question/questionList?page=0">1:1문의</a>
					</div>
						<div class="menu_center">
							<a href="${cpath }/cs/center">고객센터</a>
						</div>
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