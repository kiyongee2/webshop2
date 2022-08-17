<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@page import="vo.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<div class = "jumbotron">
		<div class = "container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	
	<div class="container">
		<div class="row" align="center">
			<%
				ProductRepository dao = ProductRepository.getInstance();
				ArrayList<Product> productList = dao.getAllProducts();
				for(int i=0; i<productList.size(); i++){
					Product product = productList.get(i);
			%>
			<div class="col-md-4">
				<img src="./upload/<%=product.getProductImage() %>" alt="image" 
				     style="width: 100%">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %></p>
				<p><%=product.getUnitPrice() %>원</p>
				<p><a href="./product.jsp?id=<%=product.getProductId() %>" 
				      class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
			</div>
			<% } %>
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>