<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./dbconn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");  //한글 인코딩 요청
	
	String realFolder="C:/Dev/jspworks/WebMarket3/src/main/webapp/upload/";
	int maxSize = 5*1024*1024;  //최대 업로드 파일 크기: 5MB
	String encType = "utf-8";   //인코딩 유형
	
	MultipartRequest multi = new MultipartRequest(request, realFolder,
	maxSize, encType, new DefaultFileRenamePolicy());

	//폼 입력값 받아 오기
	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	if(unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);  //정수형으로 변환
	
	long stock;
	if(unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);  //long형으로 변환
		
	Enumeration<?> files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String productImage = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	if(productImage != null){
		String sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_category=?, "
					 + "p_manufacturer=?, p_unitsInStock=?, p_condition=?, p_productImage=? WHERE p_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pname);
		pstmt.setInt(2, price);
		pstmt.setString(3, description);
		pstmt.setString(4, category);
		pstmt.setString(5, manufacturer);
		pstmt.setLong(6, stock);
		pstmt.setString(7, condition);
		pstmt.setString(8, productImage);
		pstmt.setString(9, productId);
		pstmt.executeUpdate();  // 실행
	}else{
		String sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_category=?, "
				 + "p_manufacturer=?, p_unitsInStock=?, p_condition=? WHERE p_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pname);
		pstmt.setInt(2, price);
		pstmt.setString(3, description);
		pstmt.setString(4, category);
		pstmt.setString(5, manufacturer);
		pstmt.setLong(6, stock);
		pstmt.setString(7, condition);
		pstmt.setString(8, productId);
		pstmt.executeUpdate();  // 실행
	}
	
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("editProduct.jsp?edit=update");
%>