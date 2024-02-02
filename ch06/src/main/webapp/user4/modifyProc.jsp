<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="dto.User4DTO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String uid = request.getParameter("uid");
	
	String host = "jdbc:mysql://127.0.0.1:3306/studydb";
	String user = "qksrm5546";
	String pass = "abc1234";
	
	User4DTO dto = null;
	
	
	try {
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		PreparedStatement psmt = conn.prepareStatement("SELECT * FROM `User4` WHERE `uid`=?");
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()) {
			dto = new User4DTO();
			dto.setUid(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setGender(rs.getString(3));
			dto.setAge(rs.getInt(4));
			dto.setHp(rs.getString(5));
			dto.setAddr(rs.getString(6));
		}
		
		rs.close();
		psmt.close();
		conn.close();	
		
		
	}catch(Exception e) {
		e.printStackTrace();
	}

%>