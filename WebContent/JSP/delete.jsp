<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.SQLException"%>
<!-- import packages of database -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>delete message</title>
<script>
	var str = "the message has been deleted from database"
</script>
</head>
<body>
	<%
		//get the id to delete
		int del_id = Integer.valueOf(request.getParameter("id"));
		System.out.println("the id to delete : " + del_id);

		Connection con = null;
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

		//delete operation
		String delStr = "delete from mform where mid=?";
		PreparedStatement preState = con.prepareStatement(delStr);
		preState.setInt(1, del_id);
		preState.executeUpdate();
		preState.close();
		con.close();

		out.print("<script>alert(str)</script>");
		response.sendRedirect("showByPages.jsp");
	%>
</body>
</html>