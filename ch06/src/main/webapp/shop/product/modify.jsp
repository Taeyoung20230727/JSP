<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="dto.ProductDTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String ProdNo = request.getParameter("ProdNo");
	
	ProductDTO dto = null;
	
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `product` WHERE `ProdNo`=?");
		psmt.setString(1, ProdNo);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()) {
			dto = new ProductDTO();
			
			dto.setProdNo(rs.getString(1));
			dto.setProdName(rs.getString(2));
			dto.setStock(rs.getString(3));
			dto.setPrice(rs.getString(4));
			dto.setCompany(rs.getString(5));
			
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
		<title>Product::modify</title>
	</head>
	<body>
		<h3>Product 수정</h3>
		
		<a href="../../2.DBCP.jsp">처음으로</a>
		<a href="./.list.jsp">등록하기</a>
		<form action="./modifyProc.jsp" method="post">
		<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="ProdNo" readonly value="<%=dto.getProdNo() %>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="ProdName" value="<%=dto.getProdName() %>"></td>
				</tr>
				<tr>
					<td>재고량</td>
					<td><input type="text" name="stock" value="<%=dto.getStock() %>"></td>
				</tr>
				<tr>
					<td>가격</td>
					<td><input type="text" name="price" value="<%=dto.getPrice() %>"></td>
				</tr>
				<tr>
					<td>회사</td>
					<td><input type="text" name="company" value="<%=dto.getCompany() %>"></td>
				</tr>
				<tr>
					
					<td colspan="2" ailgn="right"><input type="submit" value="수정하기"></td>
				</tr>
			</table>
		</form>
	</body>
</html>