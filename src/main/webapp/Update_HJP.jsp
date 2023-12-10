<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="DBconn.jsp"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");

String review_num = request.getParameter("review_num");
String review_hjp = request.getParameter("review_hjp");
String review_score = request.getParameter("review_score");
String review_id = request.getParameter("review_id");
String review_regist_day = request.getParameter("review_regist_day");

String smartphone_search4 = request.getParameter("smartphone_search4");
%>

<input type="text" id="review_score" name="review_score"
	value="<%=review_score%>" />

<!-- <input type="hidden" id="smartphone_search3" name="smartphone_search3" -->
<%-- 	value="<%=smartphone_search4%>" /> --%>
<html>
<head>
<title>Wtite_HJP</title>
</head>
<body>
	<div style="width: 100%;" align="center">
		<div style="width: 800px;" align="center">
			<div align="center">
				<h1>한 줄 평 작성</h1>
			</div>
			<form action="processWirte_HJP.jsp" method="post">

				<div>
					<div align="left" style="float: left;">
						<p>
							<label for="phone_name">기종 : </label> <select id="phone_name"
								name="phone_name">
								<option value="<%=smartphone_search4%>"><%=smartphone_search4%></option>
							</select>

					</div>
					<div align="right" style="float: right;">
						<div align="center">
							<p>
								<label for="options">별점</label>
							<p>
								<select name="score" id="score" >
									<option value="5.0">5.0</option>
									<option value="4.5">4.5</option>
									<option value="4">4</option>
									<option value="3.5">3.5</option>
									<option value="3">3</option>
									<option value="2.5">2.5</option>
									<option value="2">2</option>
									<option value="1.5">1.5</option>
									<option value="1">1</option>
									<option value="0.5">0.5</option>
									<option value="0">0</option>
								</select>
								
								
								<script>
 								var review_score = document
 										.getElementById("review_score").value;
 								document.getElementById("score").value = review_score;
							</script>
								
								
						</div>
					</div>
				</div>
				<div>
					<textarea name="HJP" id="HJP" rows="15" cols="110"></textarea>
				</div>
				<p>
				<div align="center">
					<button type="submit">등록</button>
					<button id="exit" type="button">나가기</button>
					<script>
						document.getElementById("exit").addEventListener(
								"click", function() {
									location.href = "list.jsp";
								});
					</script>

				</div>
			</form>
		</div>
	</div>
</body>
</html>