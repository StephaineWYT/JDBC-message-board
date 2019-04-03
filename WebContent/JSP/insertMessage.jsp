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

<!-- get the instance of message -->
<jsp:useBean id="message" class="com.javabean.Message"></jsp:useBean>

<!-- auto match -->
<jsp:setProperty property="*" name="message" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>insert op</title>

</head>
<body>
	<%
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

		String writer = (String) session.getAttribute("writer");
		String content = (String) session.getAttribute("content");
		String topic = (String) session.getAttribute("topic");

		//insert operation 
		String insertSql = "insert into mform(mwriter,mcontent,mtopic) values(?,?,?)";
		PreparedStatement preState = con.prepareStatement(insertSql);
		preState.setString(1, writer);
		preState.setString(2, content);
		preState.setString(3,topic);
		
		int rows = preState.executeUpdate();
		if (rows > 0) {
			out.print("insert " + rows + " set(s) of information succesfully !");
		}
		preState.close();
		con.close();
	%>
	<a href="showByPages.jsp">show all</a>
</body>
</html>