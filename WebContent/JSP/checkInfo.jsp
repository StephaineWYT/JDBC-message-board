<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error Report</title>
<script>
	var str = "incomplete information !"
</script>
</head>
<body>
	<%
		//check the completeness
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String topic = request.getParameter("topic");

		if (writer == "" || content == "" || topic == "") {
			System.out.print("incomplete information !");
			out.print("<script>alert(str)</script>");
			out.print("your comment is not complete, back to finish?");
		} else {
			session.setAttribute("writer", writer);
			session.setAttribute("content", content);
			session.setAttribute("topic", topic);
			response.sendRedirect("insertMessage.jsp");
		}
	%>
	<br>
	<a href="view.jsp">back</a>
</body>
</html>