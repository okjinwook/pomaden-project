<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<main>
	<div class="main_component">
		<div class="best_product">
			<div class="best_product_title">아우터</div>
			<div class="best_product_item_box df">
			<c:forEach var="dto" items="${list }">
				<fmt:parseNumber var="sale" integerOnly="true" value="${((dto.product_price * (dto.product_sale) / 100) / 100 )}" />
				<fmt:parseNumber var="salePrice" integerOnly="true" value="${((dto.product_price * (100 - dto.product_sale) / 100) / 100 )}" />
				<c:if test="${dto.product_category eq '아우터'}">
					<div class="productList_item">
						<div class="productList_item_img">
							<a href="${cpath }/product/productDetail/${dto.product_name}/review_grade">
								<img src="${dto.product_img }" width="300px">
							</a>
						</div>
						<div class="productList_item_name">
							<a href="${cpath }/product/productDetail/${dto.product_name}/review_grade">${dto.product_name }</a>
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
			<a class="more_best_button jcce aice" href="${cpath }/product/productList?category=아우터&kind=전체">
				<span style="font-weight: 700; margin-right: 10px;">아우터</span> 
				<span style="font-size: 15px;">더보기</span>
			</a>
		</div>
		<div class="best_product">
			<div class="best_product_title">티셔츠</div>
			<div class="best_product_item_box df">
			<c:forEach var="dto" items="${list }">
				<c:if test="${dto.product_category eq '티셔츠'}">
					<div class="productList_item">
						<div class="productList_item_img">
							<a href="${cpath }/product/productDetail/${dto.product_name}/review_grade">
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
			<a class="more_best_button jcce aice" href="${cpath }/product/productList?category=티셔츠&kind=전체">
				<span style="font-weight: 700; margin-right: 10px;">티셔츠</span> 
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
							<a href="${cpath }/product/productDetail/${dto.product_name}/review_grade">
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
			<a class="more_best_button jcce aice" href="${cpath }/product/productList?category=셔츠&kind=전체">
				<span style="font-weight: 700; margin-right: 10px;">셔츠</span> 
				<span style="font-size: 15px;">더보기</span>
			</a>
		</div>
		<div class="best_product">
			<div class="best_product_title">팬츠</div>
			<div class="best_product_item_box df">
			<c:forEach var="dto" items="${list }">
				<c:if test="${dto.product_category eq '팬츠'}">
					<div class="productList_item">
						<div class="productList_item_img">
							<a href="${cpath }/product/productDetail/${dto.product_name}/review_grade">
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
			<a class="more_best_button jcce aice" href="${cpath }/product/productList?category=팬츠&kind=전체">
				<span style="font-weight: 700; margin-right: 10px;">팬츠</span> 
				<span style="font-size: 15px;">더보기</span>
			</a>
		</div>
		<div class="best_product">
			<div class="best_product_title">슈즈</div>
			<div class="best_product_item_box df">
			<c:forEach var="dto" items="${list }">
				<c:if test="${dto.product_category eq '슈즈'}">
					<div class="productList_item">
						<div class="productList_item_img">
							<a href="${cpath }/product/productDetail/${dto.product_name}/review_grade">
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
			<a class="more_best_button jcce aice" href="${cpath }/product/productList?category=슈즈&kind=전체">
				<span style="font-weight: 700; margin-right: 10px;">슈즈</span> 
				<span style="font-size: 15px;">더보기</span>
			</a>
		</div>
	</div>
</main>
<script>
</script>

<%@ include file="footer.jsp" %>