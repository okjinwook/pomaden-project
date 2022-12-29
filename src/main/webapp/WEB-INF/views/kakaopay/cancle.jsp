<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../header.jsp" %>
<main>
	<div class="cancle_component">
		<div class="cancle_title jcce">결제에 실패하였습니다</div>
		<div class="cancle_button_box jcsb">
			<div class="jcce aice" onclick="historyBack()">돌아가기</div>
		</div>
	</div>
	<script>
		function historyBack() {
			history.go(-1)
		}
	</script>
</main>
<%@ include file="../footer.jsp" %>