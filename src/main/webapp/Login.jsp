<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
session.invalidate();
%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.84.0">
<title>Login</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<!-- Bootstrap core CSS -->
<link href="./css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="signin.css" rel="stylesheet">




<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}
</style>

</head>
<body class="text-center">

	<main class="form-signin">
		<%
		String error = request.getParameter("error");
		if (error != null) {
			out.println("<div class='alert alert-danger'>");
			out.println("아이디와 비밀번호를 확인해 주세요");
			out.println("</div>");
		}
		%>
		<form action="processLogin.jsp" method="post">
			<h1 class="h3 mb-3 fw-normal">로그인</h1>
			<div class="form-floating">
				<input type="text" class="form-control" id="id" name="id"
					placeholder="Id"> <label for="floatingInput">Id</label>
			</div>
			<div class="form-floating">
				<input type="password" class="form-control" id="Password"
					name="password" placeholder="Password"> <label
					for="floatingPassword">Password</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
		</form>
			<div style="padding: 10px;">
				<p>
					<button class="w-50 btn btn-secondary" type="button" id="AddMember">회원가입</button>
					<script>
						document.getElementById("AddMember").addEventListener(
								"click", function() {
									location.href = "AddMember.jsp";
								});
					</script>
				<p>
					<button type="button" id="notMember"
						style="border: none; background-color: #999999; color: white;">비회원으로
						이용하기</button>
					<script>
						document.getElementById("notMember").addEventListener(
								"click", function() {
									location.href = "Compare.jsp";
								});
					</script>
			</div>
			<p class="mt-5 mb-3 text-muted">&copy; 2023</p>
	</main>
</body>
</html>