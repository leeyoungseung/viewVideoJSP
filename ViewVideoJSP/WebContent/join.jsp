<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>動画登録</h2>
	<form action="join.video">
	<input type="hidden" name="memNo" value="${user.getMemNo() }">
	<table>
	<tr>
		<td>youTube アドレスを入力してください</td>
		<td><input type="text" name="vidAddr"></td>
	</tr>
	<tr>
		<td><a href="myPage.jsp">戻る</a></td>
		<td><input type="submit" value="登録"></td>
	</tr>
	</table>
	</form>
</body>
</html>