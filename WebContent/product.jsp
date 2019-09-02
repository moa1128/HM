<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%@ page errorPage="exceptionNoProductId.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>Hansung Mart</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<script type="text/javascript">
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbConn.jsp" %>s
			<%
				String productId = request.getParameter("id");
				String N = request.getParameter("num");
				int num = Integer.parseInt(N);
				String url = null;
				if(num == 1)
					url = "./product_health.jsp";
				else if(num == 2)
					url = "./product_food.jsp";
				else if(num == 3)
					url = "./product_living.jsp";
				else if(num == 4)
					url = "./product_beauty.jsp";
				else if(num == 5)
					url = "./product_style.jsp";
				else
					url ="./product.jsp";
			
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from product where productId = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, productId);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
			%>
			<div class="col-md-5">
				<img src="resources/images/<%=rs.getString("filename")%>" style="width: 300px; height: 350px">
			</div>
				<div class="col-md-6">
					<h3><%=rs.getString("pname")%></h3>
					<p><%=rs.getString("description")%>
					<p><b>상품 코드</b> : <span class="badge badge-danger">
					<%=rs.getString("productId")%></span>
					<p><b>제조사</b> : <%=rs.getString("manufacturer")%>
					<p><b>분류</b> : <%=rs.getString("category")%>
					<p><b>재고 수</b> : <%=rs.getInt("unitsInStock")%>
					<h4><%=rs.getInt("unitPrice")%>원</h4>
					<p><br><a href="<%=url %>" class="btn btn-secondary">상품 목록 &raquo;</a>
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