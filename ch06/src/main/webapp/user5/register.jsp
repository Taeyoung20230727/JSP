<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user5::register</title>
	</head>
	<body>
		<h3>user5 등록</h3>
		
		<a href="../1.jdbc.jsp">처음으로</a>
		<a href="./lest.jsp">목록으로</a>
		<form action="./registerProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>이름</td>
					<td><input type="text" name="name"></td> 
				</tr>		
				<tr>
					<td>성별</td>
					<td><input type="text" name="gender"></td> 
				</tr>		
				<tr>
					<td>나이</td>
					<td><input type="text" name="age"></td> 
				</tr>		
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr"></td> 
				</tr>		
				<tr>
					<td colspan="2" align="right"><input type="submit" value="등록하기"></td>
				</tr>		
			</table>
		</form>		
	</body>
</html>