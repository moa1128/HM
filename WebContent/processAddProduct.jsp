<%@ page language="java" contentType="text/html; charset=utf-8"%>

<%@ page import="com.oreilly.servlet.*" %>

<%@ page import="com.oreilly.servlet.multipart.*" %>

<%@ page import="java.util.*" %>

<%@ page import="dto.Product" %>

<%@ page import="dao.ProductRepository" %>

<%@ page import="java.lang.*" %>

<%@ include file="dbConn.jsp" %>

<%

	request.setCharacterEncoding("UTF-8");

 

	String filename = "";

	String realFolder = "C:\\upload";	//웹 애플리케이션상의 절대 경로

	int maxSize = 5 * 1024 *1024;	//최대 업로드될 파일의 크기 5KB

	String encType = "utf-8";	//인코딩 유형

	

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

	

	String productId = multi.getParameter("productId");

	String name = multi.getParameter("name");

	String unitPrice = multi.getParameter("unitPrice");

	String description = multi.getParameter("description");

	String manufacturer = multi.getParameter("manufacturer");

	String category = multi.getParameter("category");

	String unitsInStock = multi.getParameter("unitsInStock");

	

	Integer price;

	

	if(unitPrice.isEmpty())

		price = 0;

	else

		price = Integer.valueOf(unitPrice);

	

	int stock;

	

	if(unitsInStock.isEmpty())

		stock = 0;

	else

		stock = Integer.valueOf(unitsInStock);

	

	//DB 넣는 코드 시이작!

	try {

		String sql = "insert into product (productId, pname, unitPrice, description, manufacturer, category, unitsInStock, filename, quantity) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, productId);

		pstmt.setString(2, name);

		pstmt.setInt(3, price);

		pstmt.setString(4, description);

		pstmt.setString(5, manufacturer);

		pstmt.setString(6, category);

		pstmt.setInt(7, stock);

		//pstmt.setBlob(8, productId + ".PNG");

		//blob객체 더 공부해서 넣기

		pstmt.setInt(9, 0);

	} catch(SQLException e) {

		out.println("product 테이블 삽입이 성공했습니다.");

		out.println("SQLException : " + e.getMessage());

	} finally {

		if(pstmt != null)

			pstmt.close();

		if(conn != null)

			conn.close();

	}

	

	//

	

	Enumeration files = multi.getFileNames();

	String fname = (String) files.nextElement();

	String fileName = multi.getFilesystemName(fname);

	

	ProductRepository dao = ProductRepository.getInstance();

	

	Product newProduct = new Product();

	newProduct.setProductId(productId);

	newProduct.setPname(name);

	newProduct.setUnitPrice(price);

	newProduct.setDescription(description);

	newProduct.setManufacturer(manufacturer);

	newProduct.setUnitsInStock(stock);

	newProduct.setFilename(fileName);

	

	dao.addProduct(newProduct);

	

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