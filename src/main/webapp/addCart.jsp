
<%@page import="vo.Product"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	ProductRepository dao = ProductRepository.getInstance();

	//해당 아이디와 일치하는 목록에 있는 상품 객체
	ArrayList<Product> goodList = dao.getAllProducts();
	Product goods = new Product();
	for(int i=0; i<goodList.size(); i++){
		goods = goodList.get(i);
		if(goods.getProductId().equals(id)){ //저장된 상품 아이디와 넘어온(전달) 아이디가 같으면
			break;
		}
	}
	
	//장바구니에 저장할 리스트 생성하고 세션 발급
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
	if(list==null){
		list = new ArrayList<>();
		session.setAttribute("cartlist", list);  //세션 발급
	}
	
	int cnt = 0;  //장바구니 품목의 개수
	Product goodsQnt = new Product(); //품목 객체 생성
	
	for(int i=0; i<list.size(); i++){
		goodsQnt = list.get(i);
		if(goodsQnt.getProductId().equals(id)){ //아이디가 일치하면
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1; //주문 수량 합계
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	if(cnt == 0){ //추가 수량이 없으면
		goods.setQuantity(1);
		list.add(goods);
	}
	
	//현재 상세 페이지로 이동
	response.sendRedirect("./product.jsp?id=" + id);
%>








