<%@page import="java.sql.SQLException"%>
<%@page import="com.javabean.Message"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- import packages of database -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<!-- undentified Chinese code -->
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update op</title>
<script>
	var str = "update message successfully!"
</script>
</head>
<body>
	<%
		Connection con = null;
		PreparedStatement preStmt = null;
		int resultFlag = 0;
		try {
			//get driver class connected 
			Class.forName("com.mysql.cj.jdbc.Driver");
			System.out.println("get driver connected");
		} catch (Exception e) {
			System.out.println("can not get driver connected!");
			out.print("can not get driver connected!");
			e.printStackTrace();
		}

		try {
			//driver manager
			String url = "jdbc:mysql://localhost:3306/messageform?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone = GMT";
			String username = "root";
			String password = "";
			con = DriverManager.getConnection(url, username, password);
			System.out.println("get connected to database");
		} catch (Exception e) {
			System.out.println("fail to get connected to database!");
			out.print("fail to get connected to database!");
			e.printStackTrace();
		}

		int update_id = (int) session.getAttribute("update_id");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String topic = request.getParameter("topic");

		String updateStr = "update mform set mtopic=?,mcontent=?,mwriter=? where mid=?";

		try {
			preStmt = con.prepareStatement(updateStr);
			preStmt.setString(1, topic);
			preStmt.setString(2, content);
			preStmt.setString(3, writer);
			preStmt.setInt(4, update_id);

			resultFlag = preStmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("fail to execute the update operation!");
			out.print("fail to execute the update operation!");
			e.printStackTrace();
		}

		if (resultFlag > 0) {
			System.out.println("update message successfully !");
			out.print("<script>alert(str)</script>");
			response.sendRedirect("showByPages.jsp");
		}
		if (preStmt != null)
			preStmt.close();
		if (con != null)
			con.close();
	%>
</body>
</html>