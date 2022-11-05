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
</head>
<body>
	<header>
		<div class="header_info_component">
			<div class="header_info jcsb aice">
				<div class="header_left">
					<div class="logo">POMADEN</div>
				</div>
				<div class="header_right df">
					<a href=""><div class="header_login">로그인</div></a>
					<a href=""><div class="">회원가입</div></a>
					<a href=""><div class="">마이페이지</div></a>
					<a href=""><div class="">고객센터</div></a>
				</div>
			</div>
		</div>
		<div class="header_menubar_component jcsb">
			<div class="header_menubar aice jcsb">
				<div class="menuAll">
					<div>전체보기</div>
					<div class="dropbox_menuAll hidden"></div>
				</div>
				<div class="menu_kind aice jcsb">
					<div class="menu_home">
						<a href="">홈</a>
					</div>
					<div class="menu_best">
						<a href="">베스트</a>
						<div class="header_menubar_drop hidden">
							<ul>
								<li>아우터 30</li>
								<li>셔츠 30</li>
								<li>티셔츠 30</li>
								<li>팬츠 30</li>
								<li>슈즈 30</li>
							</ul>
						</div>
					</div>
					<div class="menu_sale">
						<a href="">SALE</a>
						<div class="header_menubar_drop hidden">
						
						</div>
					</div>
					<div class="menu_outer">
						<a href="">아우터</a>
						<div class="header_menubar_drop hidden">
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
					<div class="menu_shirts">
						<a href="">셔츠</a>
						<div class="header_menubar_drop hidden">
							<ul>
								<li>맨투맨</li>
								<li>니트/스웨터</li>
								<li>후드</li>
								<li>폴라넥</li>
								<li>남방</li>
							</ul>
						</div>
					</div>
					<div class="menu_T-shirts">
						<a href="">티셔츠</a>
						<div class="header_menubar_drop hidden">
							<ul>
								<li>긴팔티</li>
								<li>반팔티</li>
								<li>7부셔츠</li>
								<li>스트라이프</li>
							</ul>
						</div>
					</div>
					<div class="menu_pants">
						<a href="">팬츠</a>
						<div class="header_menubar_drop hidden">
							<ul>
								<li>청바지</li>
								<li>슬랙스</li>
								<li>트래이닝</li>
								<li>와이드 팬츠</li>
							</ul>
						</div>
					</div>
					<div class="menu_shoose">
						<a href="">슈즈</a>
						<div class="header_menubar_drop hidden">
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
				<div class="menu_question">
					<a href="">1:1문의</a>
				</div>
			</div>
		</div>
	</header>
	
	<script>
		const menuAll = document.querySelector('.menuAll')
		
		// 전체메뉴 클릭 이벤트
		menuAll.addEventListener('click', menuAllClick)
			
		function menuAllClick(event) {
			const dropbox_menuAll = document.querySelector('.dropbox_menuAll')
			if(dropbox_menuAll.classList.contains('hidden')) {
				dropbox_menuAll.classList.remove('hidden')
			}
			else {
				dropbox_menuAll.classList.add('hidden')
			}
		}
	</script>