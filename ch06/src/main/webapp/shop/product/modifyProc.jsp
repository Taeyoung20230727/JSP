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
	String ProdName = request.getParameter("ProdName");
	String stock = request.getParameter("stock");
	String price = request.getParameter("price");
	String company = request.getParameter("company");


	try {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		String sql = "UPDATE `product` SET ";
					sql += "`ProdName`=?, ";
					sql += "`stock`=?, ";
					sql += "`price`=?, ";
					sql += "`company`=? ";
					sql += " WHERE `ProdNo`=?";
					
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, ProdName);
		psmt.setString(2, stock);
		psmt.setString(3, price);
		psmt.setString(4, company);
		psmt.setString(5, ProdNo);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");



%>