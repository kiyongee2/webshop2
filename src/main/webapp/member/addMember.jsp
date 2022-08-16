<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
	  integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script>
	function checkForm(){
		let form = document.newMember;
		let id = form.id.value;
		let pw1 = form.password.value;
		let pw2 = form.password_confirm.value;
		
		if(id==""){
			alert("아이디를 입력하세요");
			form.id.focus();
			return false;
		}
		if(pw1==""){
			alert("비밀번호를 입력하세요");
			form.password.focus();
			return false;
		}
		if(pw1 != pw2){
			alert("비밀번호를 동일하게 입력하세요");
			form.password_confirm.select();
			return false;
		}
		if(form.name.value==""){
			alert("이름을 입력하세요");
			form.name.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<div class = "jumbotron">
		<div class = "container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>
	<div class="container">
		<form action="./processAddMember.jsp" method="post" name="newMember"
		      onsubmit="return checkForm()">
			<div class="form-group row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" placeholder="id" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input type="password" name="password" placeholder="password" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input type="password" name="password_confirm" placeholder="password_confirm" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성명</label>
				<div class="col-sm-3">
					<input type="text" name="name" placeholder="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-3">
					<input type="radio" name="gender" value="남" checked>남 
					<input type="radio" name="gender" value="여" >여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-3">
					<input type="text" name="birthyy" placeholder="년(4자)" maxlength="4" size="6">
					<select name="birthmm">
						<option>월</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
					<input type="text" name="birthdd" placeholder="일" maxlength="2" size="4">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-4">
					<input type="text" name="mail1" maxlength="30">@ 
					<select name="mail2">
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="gmail.com">gmail.com</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input type="text" name="phone" class="form-control" placeholder="phone"> 
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-3">
					<input type="text" name="address" class="form-control" placeholder="address"> 
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-3">
					<input type="submit" class="btn btn-primary" value="등록"> 
					<input type="reset" class="btn btn-primary" value="취소"> 
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="/footer.jsp" />
</body>
</html>