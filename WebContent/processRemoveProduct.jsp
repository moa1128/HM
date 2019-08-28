<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<%@ page import="java.lang.*" %>
<%
	request.setCharacterEncoding("UTF-8");

	String filename = "";
	String realFolder = "D:\\upload";	//웹 애플리케이션상의 절대 경로
	int maxSize = 5 * 1024 *1024;	//최대 업로드될 파일의 크기 5KB
	String encType = "utf-8";	//인코딩 유형
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String productId = multi.getParameter("productId");
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product oldProduct = new Product();
	oldProduct = dao.getProductById(productId);
	
	dao.removeProduct(oldProduct);
	
	response.sendRedirect("products.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<title>Hansung Mart</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

</body>
</html>