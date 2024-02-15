<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String ProdNo = request.getParameter("ProdNo");
	String ProdName = request.getParameter("ProdName");
	String Stock = request.getParameter("stock");
	String Price  = request.getParameter("price");
	String Company = request.getParameter("company");

	try{
		Context initctx = new InitialContext();
		Context ctx = (Context) initctx.lookup("java:comp/env");
		
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		String sql = "INSERT INTO `Product` VALUES (?, ?, ?, ?, ?)"; 
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, ProdNo);
		psmt.setString(2, ProdName);
		psmt.setString(3, Stock);
		psmt.setString(4, Price);
		psmt.setString(5, Company);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");


%>








