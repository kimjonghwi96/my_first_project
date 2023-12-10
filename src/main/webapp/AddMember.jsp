<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<title>회원 가입</title>
</head>
<body>
<p>
	<%-- 	<jsp:include page="/menu.jsp" /> --%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">회원 가입</h1>
		</div>
	</div>

	<div class="container">
		<form action="processAddMember.jsp" name="newMember" class="form-horizontal" method="post">
			<div>
				<p>
				<div class="form-group  row">
					<label class="col-sm-2">아이디</label>
					<div class="col-sm-3">
						<input name="id" type="text" class="form-control" placeholder="id">
					</div>
					<!-- 중복확인 -->
<!-- 					<div> -->
<!-- 						<button type="button" id="DoubleCheck"></button> -->
<!-- 					</div> -->
<!-- 				<script> -->
<!-- 					document.getElementById("DoubleCheck").addEventListener( -->
<!-- 						"click",function() { -->
<!-- 						var id = document.getElementById("id").value; -->										
<!-- 				</script>	 -->
							
				
					
				</div>
				<p>
				<div class="form-group row">
					<label class="col-sm-2">비밀번호</label>
					<div class="col-sm-3">
						<input name="password" type="text" class="form-control"
							placeholder="password">
					</div>
				</div>
<!-- 				<p> -->
<!-- 				<div class="form-group  row"> -->
<!-- 					<label class="col-sm-2">비밀번호확인</label> -->
<!-- 					<div class="col-sm-3"> -->
<!-- 						<input name="password_confirm" type="text" class="form-control" -->
<!-- 							placeholder="password confirm"> -->
<!-- 					</div> -->
<!-- 				</div> -->
				<p>
				<div class="form-group  row">
					<label class="col-sm-2">성명</label>
					<div class="col-sm-3">
						<input name="name" type="text" class="form-control"
							placeholder="name">
					</div>
				</div>
				<p>
				<div class="form-group  row">
					<label class="col-sm-2">성별</label>
					<div class="col-sm-10">
						<input name="gender" type="radio" value="남" /> 남 <input
							name="gender" type="radio" value="여" /> 여
					</div>
				</div>
				<p>
				<div class="form-group row">
					<label class="col-sm-2">생일</label>
					<div class="col-sm-4  ">
						<input type="text" name="birthyy" maxlength="4"
							placeholder="년(4자)" size="6"> <select name="birthmm">
							<option value="">월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select> <input type="text" name="birthdd" maxlength="2" placeholder="일"
							size="4">
					</div>
				</div>
				<p>
				<div class="form-group  row ">
					<label class="col-sm-2">이메일</label>
					<div class="col-sm-10">
						<input type="text" name="mail1" maxlength="50"> @ <select
							name="mail2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>
						</select>
					</div>
				</div>
				<p>
				<div class="form-group  row">
					<label class="col-sm-2">전화번호</label>
					<div class="col-sm-3">
						<input name="phone" type="text" class="form-control"
							placeholder="phone">

					</div>
				</div>
				<p>
				<div class="form-group  row">
					<label class="col-sm-2 ">주소</label>
					<div class="col-sm-5">
						<input name="address" type="text" class="form-control"
							placeholder="address">
					</div>
				</div>
				<p>
			</div>
			<p>
			<div class="form-group  row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록">
					<input type="reset" class="btn btn-secondary " value="리셋"
						onclick="reset()">
						<input type="reset" class="btn btn-secondary " id="exit" value="취소"
						onclick="reset()">
						<script>
					document.getElementById("exit").addEventListener(
							"click", function() {
								location.href = "Login.jsp";
							});
				</script>
				</div>
			</div>
		</form>
	</div>
</body>
</html>