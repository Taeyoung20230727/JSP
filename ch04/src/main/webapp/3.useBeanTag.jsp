<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3.useBeanTag</title>
		<!-- 
			날짜 : 2024/01/30
			이름 : 정태영
			내용 : JSP 액션태그 forward 실습
			-->
	</head>
	<body>
		
		<h3>3.useBean 액션태그</h3>
		
		<form action="./proc/userProc.jsp" method="get">
			<input type="text" name="uid"/><br>		
			<input type="text" name="name"/><br>		
			<input type="number" name="age"/><br>		
			<input type="text" name="addr"/><br>		
			<input type="submit" name="전송"/><br>		
		
		</form>
	</body>
</html>