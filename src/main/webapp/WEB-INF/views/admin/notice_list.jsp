<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="admin_nav.jsp" %>
<div class="admin_content">
	<div class="admin_title aice">공지 목록</div>
	<div class="admin_category_box df">
		<a href="${cpath }/admin/notice_list" class="admin_category_button jcce aice">공지 목록</a>
		<a href="${cpath }/admin/notice_insert" class="admin_category_button jcce aice">공지 등록</a>
	</div>
	<div class="admin_notice_list">
		<div class="admin_notice_info df">
			<div class="admin_notice_admin jcce aice">관리자</div>
			<div class="admin_notice_title jcce aice">제목</div>
			<div class="admin_notice_content jcce aice">내용</div>
			<div class="admin_notice_date jcce aice">작성일자</div>
			<div class="admin_notice_delete jcce aice">공지 삭제</div>
		</div>
		<div class="admin_notice_item_box">
			<c:forEach var="dto" items="${list }">
				<c:set var="content" value="${fn:replace(dto.notice_content, '<br>', ' ')}"/>
				<div class="admin_notice_item df" onclick="itemOnClick('${dto.notice_title}','${fn:replace(dto.notice_content, '<br>' , newLine)}')">
					<div class="admin_notice_admin jcce aice">${dto.notice_admin }</div>
					<div class="admin_notice_title jcce aice">
						<c:if test="${fn:length(dto.notice_title ) > 30}">
							${fn:substring(dto.notice_title  , 0 , 30) }...
						</c:if> 
						<c:if test="${fn:length(dto.notice_title ) < 30}">
							${dto.notice_title  }
						</c:if>
					</div>
					<div class="admin_notice_content jcce aice">
						<c:if test="${fn:length(content) > 50}">
							${fn:substring(content , 0 , 50) }...
						</c:if> 
						<c:if test="${fn:length(content) < 50}">
							${content }
						</c:if> 
					</div>
					<div class="admin_notice_date jcce aice">${dto.notice_date }</div>
					<div class="admin_notice_delete jcce aice">
						<div class="admin_notice_delete_button" onclick="adminNoticeDelete(${dto.notice_idx})">삭제</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="admin_notice_detail_box">
		<div class="admin_notice_detail_item">
			<div class="admin_notice_detail_title_box aice">
				<div class="admin_notice_detail_info aice">제목</div>
				<div class="admin_notice_detail_title"></div>
			</div>
			<div class="admin_notice_detail_content_box aice">
				<div class="admin_notice_detail_info admin_notice_detail_content_info aice">내용</div>
				<div class="admin_notice_detail_content"></div>
			</div>
		</div>
	</div>
</div>
		
</body>
</html>