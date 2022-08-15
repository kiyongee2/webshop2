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
	<jsp:include page="/menu.jsp" />
	<div class = "jumbotron">
		<div class = "container">
			<h1 class="display-3">로그인</h1>
		</div>
	</div>
	<div class="container" align="center">
		<div class="col-md-4">
			<h3>Please sign in</h3>
			<%
				String error = request.getParameter("error");
				if(error != null){
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해주세요");
					out.println("</div>");
				}
			%>
			<form action="./processLoginMember.jsp" method="post">
				<div class="form-group">
					<label for="id" class="sr-only">User Name</label>
					<input type="text" class="form-control" placeholder="ID"
					       name="id" required autofocus>
				</div>
				<div class="form-group">
					<label for="password" class="sr-only">Password</label>
					<input type="password" class="form-control" placeholder="Password"
					       name="password" required>
				</div>
				<button type="submit" class="btn btn btn-lg btn-success btn-block" >로그인</button>
			</form>
		</div>
	</div>
</body>
</html>