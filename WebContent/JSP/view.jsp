<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>message board</title>
</head>
<body>
	<form action="checkInfo.jsp" method="post">
		<h3>topic :</h3>
		<input name="topic" type="text" /> <br>
		<h3>leave your message here :</h3>
		<textarea name="content" cols="40" rows="4" style="OVERFLOW: hidden">
		</textarea>
		<br> 
		<h3>your name :</h3>
		<input name="writer" type="text" /> <br>
		<br> <input type="submit" value="OK">
	</form><br>
	<a href="showByPages.jsp">show all</a>
</body>
</html>