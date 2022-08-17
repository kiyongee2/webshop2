<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script type="text/javascript">
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="./menu.jsp" />
	<div class = "jumbotron">
		<div class = "container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		String productId = request.getParameter("id");
	
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(productId);
		
	%>
	<div class="container">
		<div class="row" align="center">
			<div class="col-md-5">
				<img src="./upload/<%=product.getProductImage() %>" alt="image" 
				     style="width: 100%">
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %></p>
				<p><b>상품 코드</b>: <span class="badge badge-danger">
					<%=product.getProductId() %></span>
				<p><b>제조사</b>: <%=product.getManufacturer() %>
				<p><b>분류</b>: <%=product.getCategory() %>
				<p><b>재고 수</b>: <%=product.getUnitsInStock() %>
				<h4><%=product.getUnitPrice() %>원</h4>
				<p><form name="addForm" action="./addCart.jsp?id=<%=product.getProductId() %>" 
						 method="post">
						<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
						<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
						<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
					</form>
			</div>
		</div>
	</div>
	<jsp:include page="./footer.jsp" />
</body>
</html>