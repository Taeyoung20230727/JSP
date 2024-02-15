<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String addr = request.getParameter("addr");
	

	try {
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/shop");
		Connection conn = ds.getConnection();
		
		String sql = "UPDATE `Customer` SET ";
				sql += "`name`=?, ";
				sql += "`hp`=?, ";
				sql += "`addr`=? ";
				sql += "WHERE `Custid`=?";
		
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, name);
		psmt.setString(2, hp);
		psmt.setString(3, addr);
		psmt.setString(4, Custid);
		
		System.out.println(psmt);
		psmt.executeUpdate();
		
	
		psmt.close();
		conn.close();

	}catch(Exception e){
		e.printStackTrace();
	}
		
	response.sendRedirect("./list.jsp");

%>