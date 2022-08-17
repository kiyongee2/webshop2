<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
	  integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script>
	function checkForm(){
		let form = document.newWrite;
		
		if(!form.subject.value){
			alert("제목을 입력하세요");
			form.id.focus();
			return false;
		}
		if(!form.content.value){
			alert("내용을 입력하세요");
			form.id.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<c:if test="${empty sessionId}">
		<script>
			alert("로그인 해주세요");
			location.href="/member/loginMember.jsp";
		</script>
	</c:if>
	<jsp:include page="/menu.jsp" />
	<div class = "jumbotron">
		<div class = "container">
			<h1 class="display-3">글쓰기</h1>
		</div>
	</div>
	<div class="container">
		<form action="/boardWriteAction.do" method="post" name="newWrite"
		      onsubmit="return checkForm()">
		      <input type="hidden" name="id" value="${sessionId}">
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-5">
					<input type="text" name="name" value="${name}" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제목</label>
				<div class="col-sm-5">
					<input type="text" name="subject" placeholder="subject" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">내용</label>
				<div class="col-sm-8">
					<textarea name="content" rows="5" cols="50" placeholder="content"
					          class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-3">
					<input type="submit" value="등록" class="btn btn-primary">
					<input type="reset" value="취소" class="btn btn-primary">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>