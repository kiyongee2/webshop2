<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
	  integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class = "jumbotron">
		<div class = "container">
			<h1 class="display-3">게시글 상세 보기</h1>
		</div>
	</div>
	<div class="container">
		<form action="/boardUpdateAction.do" method="post">
			<input type="hidden" name="num" value="${board.num}"> 
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" name="id" value="${board.name}" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제목</label>
				<div class="col-sm-5">
					<input type="text" name="subject" value="${board.subject}" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">내용</label>
				<div class="col-sm-8">
					<textarea name="content" rows="5" cols="50" 
					        class="form-control">${board.content}</textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-3">
					<a href="/boardListAction.do" class="btn btn-primary">목록</a>
					<c:set var="userId" value="${board.id}" />
					<c:if test="${sessionId == userId}">
						<button type="submit" class="btn btn-success">수정</button>
						<a href="/boardDeleteAction.do?num=<c:out value='${board.num}' />" 
						   onclick="return confirm('정말로 삭제하시겠습니까?')" class="btn btn-danger">삭제</a>
				   </c:if>
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>