<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="DBconn.jsp"%>
<html>
<head>
<title>Update_Phone</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	String option0 = request.getParameter("option0");
	String option1 = request.getParameter("option1");
	String option2 = request.getParameter("option2");

	String P_NAME = "";
	String PRICE = "";
	String MANUFACTURER = "";
	String PROCESSOR = "";
	String MEMORY = "";
	String DISPLAY = "";
	String NETWORK = "";
	String PROXIMITY_COMMUNICATION = "";
	String SATELLITE_NAVIGATION = "";
	String CAMERA = "";
	String BATTERY = "";
	String OPERATOR = "";
	String STANDARD = "";
	String COLOR = "";
	String TERMINAL = "";
	String BIOSECURITY = "";
	String ETC = "";

	if (request.getParameter("update1") != null)
		P_NAME = request.getParameter("option01");
	else if (request.getParameter("update2") != null)
		P_NAME = request.getParameter("option02");

	try {
		String query1 = "SELECT * FROM smartphone where p_name = ?";
		PreparedStatement pstmt1 = conn.prepareStatement(query1);
		pstmt1.setString(1, P_NAME);
		ResultSet rs1 = pstmt1.executeQuery();
		while (rs1.next()) {
			PRICE = rs1.getString("P_PRICE");
			MANUFACTURER = rs1.getString("P_MANUFACTURER");
			PROCESSOR = rs1.getString("P_PROCESSOR");
			MEMORY = rs1.getString("P_MEMORY");
			DISPLAY = rs1.getString("P_DISPLAY");
			NETWORK = rs1.getString("P_NETWORK");
			PROXIMITY_COMMUNICATION = rs1.getString("P_PROXIMITY_COMMUNICATION");
			SATELLITE_NAVIGATION = rs1.getString("P_SATELLITE_NAVIGATION");
			CAMERA = rs1.getString("P_CAMERA");
			BATTERY = rs1.getString("P_BATTERY");
			OPERATOR = rs1.getString("P_OPERATOR");
			STANDARD = rs1.getString("P_STANDARD");
			COLOR = rs1.getString("P_COLOR");
			TERMINAL = rs1.getString("P_TERMINAL");
			BIOSECURITY = rs1.getString("P_BIOSECURITY");
			ETC = rs1.getString("P_ETC");

		}
		rs1.close();
		pstmt1.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	%>
	<div style="width: 100%;" align="center">
		<div style="width: 800px;" align="center">
			<div align="center">
				<h1>기기 수정</h1>
			</div>
			<form action="processUpdate_Phone.jsp" method="post"
				enctype="multipart/form-data">
				<div align="left" style="width: 100%, float: left;">
					<p>
						<label for="P_NAME">기종 : </label> <input type="text" id="P_NAME"
							name="P_NAME" value="<%=P_NAME%>" required>
					<p>
						<label for="P_PRICE">가격 : </label> <input type="text" id="P_PRICE"
							name="P_PRICE" value="<%=PRICE%>">
					<p>
						<label for="P_MANUFACTURER">제조사 : </label> <input type="text"
							id="P_MANUFACTURER" name="P_MANUFACTURER"
							value="<%=MANUFACTURER%>">
				</div>

				<div align="left" style="float: left;">
					<p>
					<div style="width: 100%">
						<label>이미지 등록</label> <input type="file" name="P_FILENAME">
					</div>
					<p>
						<label for="P_PROCESSOR">프로세서</label>
						<textarea id="P_PROCESSOR" name="P_PROCESSOR" rows="5" cols="110"><%=PROCESSOR%></textarea>
					<p>
						<label for="P_MEMORY">메모리</label>
						<textarea id="P_MEMORY" name="P_MEMORY" rows="5" cols="110"><%=MEMORY%></textarea>
					<p>
						<label for="P_DISPLAY">디스플레이</label>
						<textarea id="P_DISPLAY" name="P_DISPLAY" rows="5" cols="110"><%=DISPLAY%></textarea>
					<p>
						<label for="P_NETWORK">네트워크</label>
						<textarea id="P_NETWORK" name="P_NETWORK" rows="5" cols="110"><%=NETWORK%></textarea>
					<p>
						<label for="P_PROXIMITY_COMMUNICATION">근접통신</label>
						<textarea id="P_PROXIMITY_COMMUNICATION"
							name="P_PROXIMITY_COMMUNICATION" rows="5" cols="110"><%=PROXIMITY_COMMUNICATION%></textarea>
					<p>
						<label for="P_SATELLITE_NAVIGATION">위성항법</label>
						<textarea id="P_SATELLITE_NAVIGATION"
							name="P_SATELLITE_NAVIGATION" rows="5" cols="110"><%=SATELLITE_NAVIGATION%></textarea>
					<p>
						<label for="P_CAMERA">카메라</label>
						<textarea id="P_CAMERA" name="P_CAMERA" rows="5" cols="110"><%=CAMERA%></textarea>
					<p>
						<label for="P_BATTERY">배터리</label>
						<textarea id="P_BATTERY" name="P_BATTERY" rows="5" cols="110"><%=BATTERY%></textarea>
					<p>
						<label for="P_OPERATOR">운영체제</label>
						<textarea id="P_OPERATOR" name="P_OPERATOR" rows="5" cols="110"><%=OPERATOR%></textarea>
					<p>
						<label for="P_STANDARD">규격</label>
						<textarea id="P_STANDARD" name="P_STANDARD" rows="5" cols="110"><%=STANDARD%></textarea>
					<p>
						<label for="P_COLOR">색상</label>
						<textarea id="P_COLOR" name="P_COLOR" rows="5" cols="110"><%=COLOR%></textarea>
					<p>
						<label for="P_TERMINAL">단자정보</label>
						<textarea id="P_TERMINAL" name="P_TERMINAL" rows="5" cols="110"><%=TERMINAL%></textarea>
					<p>
						<label for="P_BIOSECURITY">생체인식</label>
						<textarea id="P_BIOSECURITY" name="P_BIOSECURITY" rows="5"
							cols="110"><%=BIOSECURITY%></textarea>
					<p>
						<label for="P_ETC">기타</label>
						<textarea id="P_ETC" name="P_ETC" rows="5" cols="110"><%=ETC%></textarea>
				</div>

				<button type="submit">수정</button>

				<button type="button" id="processDelete">삭제</button>
				<script>
					document
							.getElementById("processDelete")
							.addEventListener(
									"click",
									function() {
										let pname = document
												.getElementById("P_NAME").value;
										location.href = "processDelete.jsp?pname="
												+ pname;
									});
				</script>

				<button type="button" id="redirectButton">취소</button>
				<script>
					document.getElementById("redirectButton").addEventListener(
							"click", function() {
								location.href = "Compare.jsp";
							});
				</script>
			</form>
		</div>
	</div>
</body>
</html>