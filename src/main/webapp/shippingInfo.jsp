<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
	  integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="./resources/js/validation.js"></script>
</head>
<body>
	<%@ include file = "menu.jsp" %>
	<div class = "jumbotron">
		<div class = "container">
			<h1 class="display-3">배송 정보</h1>
		</div>
	</div>
	<div class="container">
		<form action="./processShippingInfo.jsp" method="post" >
		  <input type="hidden" name="cartId" value="<%=request.getParameter("cartId") %>">
		  <div class="form-group row">
		  	<label class="col-sm-2">성명</label>
			<div class="col-sm-3">
				<input type="text" name="name" class="form-control">
			</div>
		  </div>
		  <div class="form-group row">
		  	<label class="col-sm-2">배송일</label>
			<div class="col-sm-3">
				<input type="text" name="shippingDate" class="form-control">(yyyy/mm/dd)
			</div>
		  </div>
		  <div class="form-group row">
		  	<label class="col-sm-2">국가명</label>
			<div class="col-sm-3">
				<input type="text" name="country" class="form-control">
			</div>
		  </div>
		  <div class="form-group row">
		  	<label class="col-sm-2">우편번호</label>
			<div class="col-sm-3">
				<input type="text" name="zipCode" class="form-control">
			</div>
		  </div>
		  <div class="form-group row">
		  	<label class="col-sm-2">주소</label>
			<div class="col-sm-3">
				<input type="text" name="addressName" class="form-control">
			</div>
		  </div>
		  <div class="form-group row">
		  	<div class="col-sm-offset-2 col-sm-10">
		  		<a href="./cart.jsp?cartid=<%=request.getParameter("cartId") %>"
		  		   class="btn btn-secondary" role="button">이전</a>
		  		<input type="submit" class="btn btn-primary" value="등록">
		  		<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
		  	</div>
		  </div>
		</form>
	</div>
</body>
</html>