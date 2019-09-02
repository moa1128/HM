<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Hansung Mart</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">BEAUTY</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbConn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from product where category='BEAUTY'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
			%>
			<div class="col-md-4" style="vertical-align: middle">
			<img src="resources/images/<%=rs.getString("filename")%>" style="width: 200px; height: 180px">
				<h3><%=rs.getString("pname")%></h3>
				<p><%=rs.getString("description")%></p>
				<p><%=rs.getInt("unitPrice")%>원</p>
				<p><a href="./product.jsp?id=<%=rs.getString("productId")%>&num=4" class="btn btn-secondary" role="button">상세정보 &raquo;</a></p>
			</div>
			<%
				}
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>