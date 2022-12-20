<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<main>
	<div class="main_component">
		<div class="main_news">
			<div class="main_news_title">EVENT · 공지사항</div>
			<div class="main_news_box">
				<div class="main_news_buttonBox jcsb">
					<div class="event_button jcce aice">EVENT</div>
					<div class="notice_button jcce aice">공지사항</div>
				</div>
				<div class="main_news_content">
					<ul class="main_news_content_event">
						<li>[이벤트] 1 + 1 행사 할인</li>
						<li>[이벤트] 회원가입 이벤트 500적립금!!!!!!!!!!</li>
						<li>[이벤트] 한달 간 배송비 무료 이벤트</li>
					</ul>
					<ul class="main_news_content_notice hidden">
						<li>[공지] 개인정보처리방침 (ver.2.0) 18.04.12~19.10.28 </li>
						<li>[공지] 교환/반품 배송지 변경 안내 (2021.05 부터) </li>
					</ul>
				</div>
			</div>
		</div>
		<div class="best_product">
			<div class="best_product_title">아우터</div>
			<div class="best_product_item_box df">
			<c:forEach var="dto" items="${list }">
				<fmt:parseNumber var="sale" integerOnly="true" value="${((dto.product_price * (dto.product_sale) / 100) / 100 )}" />
				<fmt:parseNumber var="salePrice" integerOnly="true" value="${((dto.product_price * (100 - dto.product_sale) / 100) / 100 )}" />
				<c:if test="${dto.product_category eq '아우터'}">
					<div class="productList_item">
						<div class="productList_item_img">
							<a href="${cpath }/product/productDetail/${dto.product_name}">
								<img src="${dto.product_img }" width="300px">
							</a>
						</div>
						<div class="productList_item_name">
							<a href="${cpath }/product/productDetail/${dto.product_name}">${dto.product_name }</a>
						</div>
						<div class="productList_item_price">
							<fmt:formatNumber pattern="###,###" value="${dto.product_price}" />원
						</div>
						<div class="productList_item_sale">( ${dto.product_sale }% 할인 )</div>
						<div class="productList_item_salePrice">
							<fmt:formatNumber pattern="###,###" value="${salePrice * 100}" />원
						</div>
						<div class="productList_item_review">리뷰 : 0개</div>
						<div class="productList_item_like">❤ ${dto.product_like }</div>
					</div>
				</c:if>
			</c:forEach>
			</div>
			<a class="more_best_button jcce aice" href="">
				<span style="font-weight: 700; margin-right: 10px;">베스트</span> 
				<span style="font-size: 15px;">더보기</span>
			</a>
		</div>
		<div class="best_product">
			<div class="best_product_title">셔츠</div>
			<div class="best_product_item_box df">
			<c:forEach var="dto" items="${list }">
				<c:if test="${dto.product_category eq '셔츠'}">
					<div class="productList_item">
						<div class="productList_item_img">
							<a href="${cpath }/product/productDetail/${dto.product_name}">
								<img src="${dto.product_img }" width="300px">
							</a>
						</div>
						<div class="productList_item_name">${dto.product_name }</div>
						<div class="productList_item_price">
							<fmt:formatNumber pattern="###,###" value="${dto.product_price}" />원
						</div>
						<div class="productList_item_sale">( ${dto.product_sale }% 할인 )</div>
						<div class="productList_item_salePrice">
							<fmt:formatNumber pattern="###,###" value="${salePrice * 100}" />원
						</div>
						<div class="productList_item_review">리뷰 : 0개</div>
						<div class="productList_item_like">❤ ${dto.product_like }</div>
					</div>
				</c:if>
			</c:forEach>
			</div>
			<a class="more_best_button jcce aice" href="">
				<span style="font-weight: 700; margin-right: 10px;">SALE</span> 
				<span style="font-size: 15px;">더보기</span>
			</a>
		</div>
	</div>
</main>
<script>
	const main_news_buttonBox = document.querySelectorAll('.main_news_buttonBox > div')
	
	main_news_buttonBox.forEach(button => {
		button.addEventListener('click', mainNewsClick) 
	})
</script>

<%@ include file="footer.jsp" %>