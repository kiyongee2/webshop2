<%@page import="java.util.ArrayList"%>
<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	if(id==null || id.trim().equals("")){
		response.sendRedirect("cart.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
	
	Product goodsQnt = new Product(); //품목 객체
	
	for(int i=0; i<cartList.size(); i++){
		goodsQnt = cartList.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cartList.remove(goodsQnt);  //해당 품목 삭제
		}
	}
	
	response.sendRedirect("cart.jsp");
%>
