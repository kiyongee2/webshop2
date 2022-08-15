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
	<%@ include file="dbconn.jsp" %>
	<%
		String id = request.getParameter("id");
	
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM product WHERE p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()){
		
	%>
	<div class="container">
		<div class="row" align="center">
			<div class="col-md-5">
				<img src="./upload/<%=rs.getString("p_productImage") %>" alt="image" 
				     style="width: 100%">
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("p_name") %></h3>
				<p><%=rs.getString("p_description") %></p>
				<p><b>상품 코드</b>: <span class="badge badge-danger">
					<%=rs.getString("p_id") %></span>
				<p><b>제조사</b>: <%=rs.getString("p_manufacturer") %>
				<p><b>분류</b>: <%=rs.getString("p_category") %>
				<p><b>재고 수</b>: <%=rs.getLong("p_unitsInStock") %>
				<h4><%=rs.getInt("p_unitPrice") %>원</h4>
				<p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id") %>" 
						 method="post">
						<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
						<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
						<a href="./products.jsp" class="btn btn-secondary">상품 목록 &raquo;</a>
					</form>
			</div>
		</div>
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
	<jsp:include page="./footer.jsp" />
</body>
</html>