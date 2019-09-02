<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Hansung Mart</title>
</head>
<body>
<%
	Connection conn = null;
	
	try {
		String url = "jdbc:mysql://localhost:3306/hansung_mart?characterEncoding=UTF-8&serverTimezone=UTC";
		String user = "root";
		String password ="1234";

		Class.forName("org.gjt.mm.mysql.Driver");
		conn = DriverManager.getConnection(url, user, password);
	} catch(SQLException e) {
		out.println("SQLException: " + e.getMessage());
	}
%>
</body>
</html>