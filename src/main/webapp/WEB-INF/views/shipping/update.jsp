<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배송지 수정</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/shipping/update.css">
</head>
<body>	
	${dto.shipping_name }
	${dto.shipping_member_id }
	${dto.shipping_phone }
	${dto.shipping_load_add }
	${dto.shipping_code_add }
	${dto.shipping_detail_add }
	${dto.shipping_msg }
	

</body>
</html>