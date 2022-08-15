<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");

%>
<body>
	<sql:setDataSource var="dataSource" 
		driver = "com.mysql.cj.jdbc.Driver"
		url = "jdbc:mysql://localhost:3306/jspdb?useUnicode=true&serverTimezone=Asia/Seoul"
		user = "root"
		password = "12345"
	/>

	<sql:query dataSource="${dataSource}" var="resultSet">
		SELECT * FROM member WHERE id=? and password=?
		<sql:param value="<%=id %>" />
		<sql:param value="<%=password %>" />
	</sql:query>
	
	<c:forEach items="${resultSet.rows}" var="row">
		<% session.setAttribute("sessionId", id); %>
		<c:redirect url="resultMember.jsp?msg=2" />
	</c:forEach>
	
	<c:redirect url="loginMember.jsp?error=1" />
</body>
</html>