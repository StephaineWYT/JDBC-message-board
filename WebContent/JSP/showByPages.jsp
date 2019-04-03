<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!-- undentified Chinese code -->
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="ISO-8859-1">
<title>comments</title>
<style type="text/css">
table {
	border-collapse: collapse;
	border: solid 1px Black;
}

table td {
	width: 50px;
	height: 20px;
	border: solid 1px Black;
	padding: 5px;
}
</style>
</head>
<body>
	<table>
		<tr>
			<td>writer</td>
			<td style="width : 120px">topic</td>
			<td style="width : 200px">content</td>
			<td style="width : 120px">time</td>
			<td>operation</td>
		</tr>
		<%
			int pageSize = 4;
			int rowCount; //total count
			int pageCount; //total pages
			int pageNo; //the current page
			String strPage = request.getParameter("page");
			if (strPage == null)
				pageNo = 1;
			else {
				pageNo = Integer.parseInt(strPage);
				if (pageNo < 1)
					pageNo = 1;
			}
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/messageform?useUnicode=true&characterEncoding=utf-8&useSSL=true&serverTimezone = GMT",
					"root", "");
			Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet rs = stmt.executeQuery("select * from mform");

			rs.last();
			rowCount = rs.getRow();

			pageCount = (int) Math.ceil((double) rowCount / (double) pageSize);
			rs.absolute((pageNo - 1) * pageSize + 1);
			int i = 0;
			do {
		%>
		<tr>
			<td><%=rs.getString("mwriter")%></td>
			<td><%=rs.getString("mtopic")%></td>
			<td><%=rs.getString("mcontent")%></td>
			<td><%=rs.getString("mtime")%></td>
			<td><a href="/JSP_4_2/JSP/delete.jsp?id=<%=rs.getString("mid")%>">delete</a>
				<a href="/JSP_4_2/JSP/edit.jsp?id=<%=rs.getString("mid")%>">edit</a></td>
		</tr>
		<%
			i++;
			} while (i < pageSize && rs.next());
		%>

		</tbody>
	</table>
	<br>
	<br>page :
	<%=pageNo%>
	&nbsp; &nbsp;<%=pageCount%>
	in total
	<%
 	if (pageNo < pageCount) {
 %>
	<a href="/JSP_4_2/JSP/showByPages.jsp?page=<%=pageNo + 1%>">&nbsp;
		&nbsp;next page</a>
	<%
		}
	%>
	<%
		if (pageNo > 1) {
	%>
	<a href="/JSP_4_2/JSP/showByPages.jsp?page=<%=pageNo - 1%>">&nbsp;
		&nbsp;previous page</a>
	<%
		}
		rs.close();
		stmt.close();
		con.close();
	%>
</body>
</html>