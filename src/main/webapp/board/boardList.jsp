<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
	  integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class = "jumbotron">
		<div class = "container">
			<h1 class="display-3">게시판 목록</h1>
		</div>
	</div>
	<div class="container">
		<div>
			<table class="table table-hover">
				<tr>
					<th>번호</th><th>제목</th><th>글쓴이</th><th>작성일</th><th>조회수</th>
				</tr>
				<c:forEach items="${boardList}" var="board">
				<tr>
					<td><c:out value="${board.num}" /></td>
					<td><a href="/boardView.do?num=<c:out value="${board.num}" />">
						<c:out value="${board.subject}" /></a></td>
					<td><c:out value="${board.name}" /></td>
					<td><c:out value="${board.writeDate}" /></td>
					<td><c:out value="${board.hit}" /></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div align="right">
			<a href="/boardWriteForm.do" class="btn btn-success">글쓰기</a>
		</div>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>