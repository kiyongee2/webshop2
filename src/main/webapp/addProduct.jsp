<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="./resources/js/validation.js"></script>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<jsp:include page="./menu.jsp" />
	<div class = "jumbotron">
		<div class = "container">
			<h1 class="display-3"><fmt:message key="title" /></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right">
			<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
		</div>
		<form name="newProduct" action="./processAddProduct.jsp" 
			  class="form-horizontal" method="post" enctype="multipart/form-data">
			  <div class="form-group row">
			  	<label class="col-sm-2"><fmt:message key="productId" /></label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control">
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2"><fmt:message key="pname" /></label>
				<div class="col-sm-3">
					<input type="text" id="pname" name="pname" class="form-control">
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2"><fmt:message key="title" /></label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control">
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2"><fmt:message key="description" /></label>
				<div class="col-sm-5">
					<textarea id="description" name="description" cols="50" rows="2" 
					 class="form-control"></textarea>
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2"><fmt:message key="manufacturer" /></label>
				<div class="col-sm-3">
					<input type="text" id="manufacturer" name="manufacturer" class="form-control">
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2"><fmt:message key="category" /></label>
				<div class="col-sm-3">
					<input type="text" id="category" name="category" class="form-control">
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control">
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2"></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New "> <fmt:message key="condition_New" />
					<input type="radio" name="condition" value="Old "> <fmt:message key="condition_Old" />
					<input type="radio" name="condition" value="Refurbished "><fmt:message key="condition_Refurbished" />
				</div>
			  </div>
			  <div class="form-group row">
			  	<label class="col-sm-2"><fmt:message key="productImage" /></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			  </div>
			  <div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="<fmt:message key="button" />"
							onclick="checkAddProduct()">
				</div>
			  </div>
		</form>
	</div>
	</fmt:bundle>
	<jsp:include page="./footer.jsp" />
</body>
</html>