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

	Statement stmt = null;

	PreparedStatement pstmt = null;

	ResultSet rs = null;

	

	try {

		String url = "jdbc:mysql://localhost:3306/hansung_mart?characterEncoding=UTF-8&serverTimezone=UTC";

		String user = "root";

		String password ="1234";

		

		Class.forName("org.gjt.mm.mysql.Driver");

		conn = DriverManager.getConnection(url, user, password);

		out.println("데이터베이스 연결 성공");

	} catch(SQLException e) {

		out.println("데이터베이스 연결 실패");

		out.println("SQLException: " + e.getMessage());

	}

	stmt = conn.createStatement();

%>

</body>

</html>