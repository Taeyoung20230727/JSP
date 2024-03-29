<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<ProductDTO> proD = new ArrayList<>();

	try {
	Context ctx = (Context) new InitialContext().lookup("java:comp/env");
	DataSource ds = (DataSource) ctx.lookup("jdbc/shop");	
	Connection conn = ds.getConnection();
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery("SELECT * FROM `Product`");
	while(rs.next()) {
		ProductDTO dto = new ProductDTO();
		
		dto.setProdNo(rs.getString(1));
		dto.setProdName(rs.getString(2));
		dto.setStock(rs.getString(3));
		dto.setPrice(rs.getString(4));
		dto.setCompany(rs.getString(5));
		
		proD.add(dto);
	}
	
	rs.close();
	stmt.close();
	conn.close();
	
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Product::list</title>
	</head>
	<body>
		<h3>Product 목록</h3>
		<a href="../../2.DBCP.jsp">처음으로</a>
		<a href="./.list.jsp">등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>재고량</th>
				<th>가격</th>
				<th>회사</th>
				<th>관리</th>
			</tr>
			<% for(ProductDTO dto : proD) { %>
			<tr>
				<td><%=dto.getProdNo() %></td>
				<td><%=dto.getProdName() %></td>
				<td><%=dto.getStock() %></td>
				<td><%=dto.getPrice() %></td>
				<td><%=dto.getCompany() %></td>
				
				<td>
				<a href="./modify.jsp?ProdNo=<%= dto.getProdNo() %>">수정</a>
				<a href="./delete.jsp?ProdNo=<%= dto.getProdNo() %>">삭제</a>
				</td>	
			</tr>
			<% } %>
		</table>
	</body>
</html>











