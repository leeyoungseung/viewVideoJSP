<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css"><!-- 외부적으로 만들어진 css파일의 디자인을 사용하겠다고 선언하는 코드  -->
	<link rel="stylesheet" type="text/css" href="bootstrap/css/codingBooster.css">
</head>
<body>
<div class="container">
	<c:choose>
	<c:when test="${empty vList }">
		<div>
		何もありません
		</div>
	</c:when>
	<c:otherwise>
		<c:forEach var="dto" items="${vList }">
			<div class="row">
   			<div class="embed-responsive embed-responsive-16by9">
    		<iframe class="embed-responsive-item" src="${dto.getVidAddr() }"></iframe>
   			</div>
  			</div>
		</c:forEach>
	</c:otherwise>
	</c:choose>
	</div>
</body>
</html>