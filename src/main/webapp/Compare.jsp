<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp"%>

<html>
<head>
<title>Compare</title>
<%
request.setCharacterEncoding("utf-8");

String option0 = request.getParameter("option0");
String option1 = request.getParameter("option1");
String option2 = request.getParameter("option2");

String Id = (String) session.getAttribute("sessionId");
%>
</head>
<body>
	<input type="hidden" id="Id1" name="Id1" value="<%=Id%>" />
	<input type="hidden" id="option00" name="option00" value="<%=option0%>" />
	<input type="hidden" id="option01" name="option01" value="<%=option1%>" />
	<input type="hidden" id="option02" name="option02" value="<%=option2%>" />

	<!-- 왼쪽 첫파트(드롭박스3개+검색버튼) -->
	<div
		style="width: 25%; height: 100%; background-color: #ffffff; float: left;">
		<div style="width: 100%; height: 335px"></div>
		<div align="right" style="padding-right: 5px;">
			<form action="" method="post">

				<!-- 좌측 드롭박스(option1) -->
				<p>
					<label for="option1">좌측 : </label> <select id="option1"
						name="option1">
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
						var option1 = document.getElementById("option01").value;
						document.getElementById("option1").value = option1;
					</script>
				</p>

				<!-- 우측 드롭박스(option2) -->
				<p>
					<label for="option2">우측 : </label> <select id="option2"
						name="option2">
						<%
						PreparedStatement pstmt4 = null;
						ResultSet rs4 = null;
						String sql4 = "select * from smartphone order by p_id";
						pstmt4 = conn.prepareStatement(sql4);
						rs4 = pstmt4.executeQuery();
						while (rs4.next()) {
						%>
						<option value="<%=rs4.getString("p_name")%>"><%=rs4.getString("p_name")%></option>
						<%
						}
						%>
						<%
						if (rs4 != null)
							rs4.close();
						if (pstmt4 != null)
							pstmt4.close();
						%>
					</select>
					<script>
						var option2 = document.getElementById("option02").value;
						document.getElementById("option2").value = option2;
					</script>
				</p>

				<!-- 분류 드롭박스(option0) -->
				<p>
					<select id="option0" name="option0">
						<option value="P_PRICE">가격</option>
						<option value="P_MANUFACTURER">제조사</option>
						<option value="P_PROCESSOR">프로세서</option>
						<option value="P_MEMORY">메모리</option>
						<option value="P_DISPLAY">디스플레이</option>
						<option value="P_NETWORK">네트워크</option>
						<option value="P_PROXIMITY_COMMUNICATION">근접통신</option>
						<option value="P_SATELLITE_NAVIGATION">위성항법</option>
						<option value="P_CAMERA">카메라</option>
						<option value="P_BATTERY">배터리</option>
						<option value="P_OPERATOR">운영체제</option>
						<option value="P_STANDARD">규격</option>
						<option value="P_COLOR">색상</option>
						<option value="P_TERMINAL">단자정보</option>
						<option value="P_BIOSECURITY">생체인식</option>
						<option value="P_ETC">기타</option>
					</select>
					<script>
						var option0 = document.getElementById("option00").value;
						document.getElementById("option0").value = option0;
					</script>
				</p>
				<input type="submit" value="검색">
			</form>
		</div>
	</div>

	<!-- 좌측 폰 -->
	<div align="center"
		style="width: 25%; height: 100%; background-color: #eeeeee; float: left;">
		<div align="center" style="padding: 30px">
			<!-- 좌측 폰 이름 -->
			<p>
			<h2>
				<%
				if (option1 == null) {
					out.print("선택1");
				} else {
					out.print(option1);
				}
				%>
			</h2>

			<!-- 좌측 폰 수정 버튼-->
			<form action="Update_Phone.jsp" method="post">
				<input type="hidden" name="option00" value="<%=option0%>" /> <input
					type="hidden" name="option01" value="<%=option1%>" /> <input
					type="hidden" name="option02" value="<%=option2%>" />
				<button type="submit" id="update1" name="update1" value="update1">수정</button>
				<script>
					var button1 = document.getElementById("update1");
					var Id1Value = document.getElementById("Id1").value; // Id1 값을 가져옴

					if (Id1Value === 'admin') {
						button1.style.display = "block"; // 보이게 설정
					} else {
						button1.style.display = "none"; // 숨기게 설정
					}
				</script>
			</form>
		</div>

		<!-- 좌측 폰 사진 -->
		<div align="center" style="height: 300px;">
			<%
			try {
				String query5 = "SELECT * FROM smartphone where p_name = ?";
				PreparedStatement pstmt5 = conn.prepareStatement(query5);
				pstmt5.setString(1, option1);
				ResultSet rs5 = pstmt5.executeQuery();
				while (rs5.next()) {
			%>
			<img alt="smartphone" src="./upload/<%=rs5.getString("P_FILENAME")%>"
				style="height: 300px;">
			<%
			}

			rs5.close();
			pstmt5.close();
			} catch (SQLException e) {
			e.printStackTrace();
			}
			%>
		</div>

		<!-- 좌측 폰 설명 -->
		<div align="center"
			style="margin-top: 10px; width: 90%; height: 500px; background-color: #ffffff; float:">
			<%
			try {
				String query1 = "SELECT * FROM smartphone where p_name = ?";
				PreparedStatement pstmt1 = conn.prepareStatement(query1);
				pstmt1.setString(1, option1);
				ResultSet rs1 = pstmt1.executeQuery();
				while (rs1.next()) {
					out.print(rs1.getString(option0));
				}

				rs1.close();
				pstmt1.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			%>
		</div>
	</div>

	<!-- 우측 폰 -->
	<div align="center"
		style="width: 25%; height: 100%; background-color: #dddddd; float: left;">
		<div align="center" style="padding: 30px">
			<!-- 우측 폰 이름 -->
			<p>
			<h2>
				<%
				if (option2 == null) {
					out.print("선택2");
				} else {
					out.print(option2);
				}
				%>
			</h2>

			<!-- 우측 폰 수정 버튼 -->
			<form action="Update_Phone.jsp" method="post">
				<input type="hidden" name="option00" value="<%=option0%>" /> <input
					type="hidden" name="option01" value="<%=option1%>" /> <input
					type="hidden" name="option02" value="<%=option2%>" />
				<button type="submit" id="update2" name="update2" value="update2">수정</button>

				<script>
					var button2 = document.getElementById("update2");
					var Id1Value = document.getElementById("Id1").value; // Id1 값을 가져옴

					if (Id1Value === 'admin') {
						button2.style.display = "block"; // 보이게 설정
					} else {
						button2.style.display = "none"; // 숨기게 설정
					}
				</script>
			</form>

		</div>

		<!-- 우측 폰 사진 -->
		<div align="center" style="height: 300px;">
			<%
			try {
				String query6 = "SELECT * FROM smartphone where p_name = ?";
				PreparedStatement pstmt6 = conn.prepareStatement(query6);
				pstmt6.setString(1, option2);
				ResultSet rs6 = pstmt6.executeQuery();
				while (rs6.next()) {
			%>
			<img alt="smartphone" src="./upload/<%=rs6.getString("P_FILENAME")%>"
				style="height: 300px;">
			<%
			}

			rs6.close();
			pstmt6.close();
			} catch (SQLException e) {
			e.printStackTrace();
			}
			%>
		</div>

		<!-- 우측 폰 설명 -->
		<div align="center"
			style="margin-top: 10px; width: 90%; height: 500px; background-color: #ffffff;">

			<%
			try {
				String query2 = "SELECT * FROM smartphone where p_name = ?";
				PreparedStatement pstmt2 = conn.prepareStatement(query2);
				pstmt2.setString(1, option2);
				ResultSet rs2 = pstmt2.executeQuery();
				while (rs2.next()) {
					out.print(rs2.getString(option0));
				}
				rs2.close();
				pstmt2.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			%>

		</div>
	</div>

	<!-- 오른쪽 -->
	<div align="left"
		style="width: 25%; height: 100%; background-color: #ffffff; margin-top: 5px; float: left;">
		<div style="padding: 10px;">

			<div align="center"
				style="width: 90%; height: 140px; border: 1px solid gray;">
				<%
				String loginId = (String) session.getAttribute("sessionId");
				if (loginId != null) {
				%>

				<form action="Login.jsp">
					<h4 style="color: blue;"><%=loginId%></h4>
					<h4>로그인 중</h4>

					<button type="submit">로그아웃</button>
				</form>

				<%
				} else {
				%>
				<form action="Login.jsp">
					<h4>로그인 안됨</h4>
					<button type="submit">로그인</button>
				</form>
				<%
				}
				%>
			</div>

			<!-- 기기 등록 폼 가기 버튼 -->
			<div style="margin-top: 50px;">
				<form action="Write_Phone.jsp">

					<p>
						<button id="goWrite" type="submit">기기 등록</button>
					</p>
					<script>
						var button = document.getElementById("goWrite");
						var Id1Value = document.getElementById("Id1").value; // Id1 값을 가져옴

						if (Id1Value === 'admin') {
							button.style.display = "block"; // 보이게 설정
						} else {
							button.style.display = "none"; // 숨기게 설정
						}
					</script>
				</form>
			</div>

			<!-- 한 줄 평 게시판 가기 버튼 -->
			<p>
				<button id="goList">한 줄 평</button>
				<script>
					document.getElementById("goList").addEventListener("click",
							function() {
								location.href = "list.jsp";
							});
				</script>

				<!-- 한 줄 평 미리보기1 -->
		</div>
		<div align="center"
			style="width: 90%; height: 200px; background-color: #eeeeee; margin-left: 10px;">
			<div align="center">
				<!-- 한 줄 평 제목1 -->
				<p>
				<h2>
					<%
					if (option1 == null) {
						out.print("선택1");
					} else {
						out.print(option1);
					}
					%>
				</h2>
			</div>
			<div
				style="width: 90%; height: 135px; background-color: white; color: black;">

				<%
				try {
					String query7 = "SELECT * FROM board WHERE num = (SELECT MAX(num) FROM board where smartphone = ?)";
					PreparedStatement pstmt7 = conn.prepareStatement(query7);
					pstmt7.setString(1, option1);
					ResultSet rs7 = pstmt7.executeQuery();

					while (rs7.next()) {
						out.println("<h3>" + rs7.getString("score") + "점</h3>");
						out.println("<h3>" + rs7.getString("HJP") + "</h3>");
					}
					rs7.close();
					pstmt7.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				%>
			</div>
		</div>

		<!-- 한 줄 평 미리보기2 -->
		<p>
		<div align="center"
			style="width: 90%; height: 200px; background-color: #dddddd; margin-left: 10px;">
			<div align="center">
				<!-- 한 줄 평 제목2 -->
				<h2>
					<%
					if (option2 == null) {
						out.print("선택2");
					} else {
						out.print(option2);
					}
					%>
				</h2>
			</div>
			<div style="width: 90%; height: 135px; background-color: white;">
				<%
				try {
					String query8 = "SELECT * FROM board WHERE num = (SELECT MAX(num) FROM board where smartphone = ?)";
					PreparedStatement pstmt8 = conn.prepareStatement(query8);
					pstmt8.setString(1, option2);
					ResultSet rs8 = pstmt8.executeQuery();

					while (rs8.next()) {
						out.println("<h3>" + rs8.getString("score") + "점</h3>");
						out.println("<h3>" + rs8.getString("HJP") + "</h3>");
					}
					rs8.close();
					pstmt8.close();
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>