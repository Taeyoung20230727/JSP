<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="dto.Customer1DTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String Custid = request.getParameter("Custid");
	
	
	Customer1DTO dto = null;
	
	try {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		
		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `Customer` WHERE `Custid`=?");
		psmt.setString(1, Custid);
		
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			dto = new Customer1DTO();
			
			dto.setCustid(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setHp(rs.getString(3));
			dto.setAddr(rs.getString(4));		

		}
		
		rs.close();
		psmt.close();
		conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Customer::modify</title>
	</head>
	<body>
		<h3>customer 수정</h3>
		
		<a href="../2.DBCP.jsp">처음으로</a>
		<a href="./list.jsp">목록보기</a>
		<form action ="./modifyProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="Custid" readonly value="<%=dto.getCustid() %>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%=dto.getName() %>"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="hp" value="<%=dto.getHp() %>"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" value="<%=dto.getAddr() %>"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit"value="수정하기"></td>
				</tr>		
			</table>
		</form>
	</body>
</html>