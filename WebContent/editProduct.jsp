<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Hansung Mart</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if(confirm("해당 상품을 삭제합니다.") == true)
			location.href = "./deleteProduct.jsp?id=" + id;
		else
			return;
	}
</script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<%
	String edit = request.getParameter("edit");
%>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 편집</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbConn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
			%>
			<div class="col-md-4">
				<img src="resources/images/<%=rs.getString("filename")%>" style="width: 200px; height: 180px">
				<h3><%=rs.getString("pname")%></h3>
				<p><%=rs.getString("description") %>
				<p><%=rs.getString("unitPrice") %>원
				<p><%
						if(edit.equals("update")) {
					%>
						<a href="./updateProduct.jsp?id=<%=rs.getString("productId") %>" class="btn btn-success" role="button"> 수정 &raquo;</a>
					<%
						} else if(edit.equals("delete")) {
					%>
						<a href="#" onclick="deleteConfirm('<%=rs.getString("productId")%>')" class="btn btn-danger" role="button"> 삭제 &raquo;</a>
					<%
						}
					%>
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
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>