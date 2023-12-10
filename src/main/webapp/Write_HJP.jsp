<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp"%>

<%
request.setCharacterEncoding("utf-8");

String smartphone_search2 = request.getParameter("smartphone_search2");
%>
<input type="hidden" id="smartphone_search3" name="smartphone_search3"
	value="<%=smartphone_search2%>" />
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
								<%
								PreparedStatement pstmt3 = null;
								ResultSet rs3 = null;
								String sql3 = "select * from smartphone order by p_id";
								pstmt3 = conn.prepareStatement(sql3);
								rs3 = pstmt3.executeQuery();
								while (rs3.next()) {
								%>
								<option value="<%=rs3.getString("p_name")%>"><%=rs3.getString("p_name")%></option>
								<%
								}
								%>
								<%
								if (rs3 != null)
									rs3.close();
								if (pstmt3 != null)
									pstmt3.close();
								%>
							</select>
							<script>
								var smartphone_search3 = document
										.getElementById("smartphone_search3").value;
								document.getElementById("phone_name").value = smartphone_search3;
							</script>
					</div>
					<div align="right" style="float: right;">
						<div align="center">
							<p>
								<label for="options">별점</label>
							<p>
								<select name="score" id="score">
									<option value="5.0" selected>5.0</option>
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