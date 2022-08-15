<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); //한글 인코딩

	//쿠키 발행
	Cookie cartId = new Cookie("Shipping_cartId", 						 //주문번호 - 쿠키 이름
			URLEncoder.encode(request.getParameter("cartId"), "utf-8")); //쿠키 값(한글 처리-인코드)
	Cookie name = new Cookie("Shipping_name", 							 //주문자 이름
			URLEncoder.encode(request.getParameter("name"), "utf-8"));   
	Cookie shippingDate = new Cookie("Shipping_shippingDate", 			 //배송일
			URLEncoder.encode(request.getParameter("shippingDate"), "utf-8")); 
	Cookie country = new Cookie("Shipping_country",                      //국가
			URLEncoder.encode(request.getParameter("country"), "utf-8")); 
	Cookie zipCode = new Cookie("Shipping_zipCode", 					  //우편 번호
			URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
	Cookie addressName = new Cookie("Shipping_addressName",               //배송 주소
			URLEncoder.encode(request.getParameter("addressName"), "utf-8"));
	
	//쿠키 유효기간 1일
	cartId.setMaxAge(24*60*60);
	name.setMaxAge(24*60*60);
	shippingDate.setMaxAge(24*60*60);
	country.setMaxAge(24*60*60);
	zipCode.setMaxAge(24*60*60);
	addressName.setMaxAge(24*60*60);
	
	//클라이언트 컴으로 쿠키 보내기
	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName);
	
	response.sendRedirect("orderConfirmation.jsp");
%>
