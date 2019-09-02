<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbConn.jsp" %>
<%
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
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from product where productId = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		if(fileName != null) {
			sql = "update product set pname=?, unitPrice=?, description=?, manufacturer=?, category=?, unitsInStock=?, fileName=? where productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, manufacturer);
			pstmt.setString(5, category);
			pstmt.setInt(6, stock);
			pstmt.setString(7, fileName);
			pstmt.setString(8, productId);
			pstmt.executeUpdate();
		} else {
			sql = "update product set pname=?, unitPrice=?, description=?, manufacturer=?, category=?, unitsInStock=? where productId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, description);
			pstmt.setString(4, manufacturer);
			pstmt.setString(5, category);
			pstmt.setInt(6, stock);
			pstmt.setString(7, productId);
			pstmt.executeUpdate();
		}
	}
	if(rs != null)
		rs.close();
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("editProduct.jsp?edit=update");
%>