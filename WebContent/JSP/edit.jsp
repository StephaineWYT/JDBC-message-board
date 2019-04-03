<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
<title>the edit page</title>
</head>
<body>
	<h3>edit the following message :</h3>
	<%
		/* 	get connected to the database */
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

		/* 	put the query information into a Resultset */
		int update_id = Integer.valueOf(request.getParameter("id"));
		System.out.println("the id to update : " + update_id);
		session.setAttribute("update_id", update_id);

		String queryStr = "select * from mform where mid=" + String.valueOf(update_id);
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(queryStr);
		while (rs.next()) {
	%>
	<!-- show out the information to a from -->
	<form action="update.jsp" method="post">
		<h3>topic :</h3>
		<input name="topic" type="text" value="<%=rs.getString("mtopic")%>" />
		<br>
		<h3>message content :</h3>
		<textarea name="content" cols="40" rows="4" style="OVERFLOW: hidden">
		"<%=rs.getString("mcontent")%>"
		</textarea>
		<br>
		<h3>writer :</h3>
		<input name="writer" type="text" value="<%=rs.getString("mwriter")%>" />
		<br> <br> <input type="submit" value="OK">
	</form>
	<%
		}
		if (rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (con != null)
			con.close();
	%>

</body>
</html>