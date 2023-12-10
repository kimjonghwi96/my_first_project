<%@ page contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<html>
<head>
<title>Wtite_Phone</title>
</head>
<body>
	<div style="width: 100%;" align="center">
		<div style="width: 800px;" align="center">
			<div align="center">
				<h1>기기 등록</h1>
			</div>
			<form action="processWrite_Phone.jsp" method="post"
				enctype="multipart/form-data">
				<div align="left" style="width: 100%, float: left;">
					<p>
						<label for="P_NAME">기종 : </label> <input type="text" id="P_NAME"
							name="P_NAME" required>
					<p>
						<label for="P_PRICE">가격 : </label> <input type="text" id="P_PRICE"
							name="P_PRICE">
					<p>
						<label for="P_MANUFACTURER">제조사 : </label> <input type="text"
							id="P_MANUFACTURER" name="P_MANUFACTURER">
				</div>

				<div align="left" style="float: left;">
					<p>
					<div style="width: 100%">
						<label>이미지 등록</label> <input type="file" name="P_FILENAME">
					</div>
					<p>
						<label for="P_PROCESSOR">프로세서</label>
						<textarea id="P_PROCESSOR" name="P_PROCESSOR" rows="5" cols="110"></textarea>
					<p>
						<label for="P_MEMORY">메모리</label>
						<textarea id="P_MEMORY" name="P_MEMORY" rows="5" cols="110"></textarea>
					<p>
						<label for="P_DISPLAY">디스플레이</label>
						<textarea id="P_DISPLAY" name="P_DISPLAY" rows="5" cols="110"></textarea>
					<p>
						<label for="P_NETWORK">네트워크</label>
						<textarea id="P_NETWORK" name="P_NETWORK" rows="5" cols="110"></textarea>
					<p>
						<label for="P_PROXIMITY_COMMUNICATION">근접통신</label>
						<textarea id="P_PROXIMITY_COMMUNICATION"
							name="P_PROXIMITY_COMMUNICATION" rows="5" cols="110"></textarea>
					<p>
						<label for="P_SATELLITE_NAVIGATION">위성항법</label>
						<textarea id="P_SATELLITE_NAVIGATION"
							name="P_SATELLITE_NAVIGATION" rows="5" cols="110"></textarea>
					<p>
						<label for="P_CAMERA">카메라</label>
						<textarea id="P_CAMERA" name="P_CAMERA" rows="5" cols="110"></textarea>
					<p>
						<label for="P_BATTERY">배터리</label>
						<textarea id="P_BATTERY" name="P_BATTERY" rows="5" cols="110"></textarea>
					<p>
						<label for="P_OPERATOR">운영체제</label>
						<textarea id="P_OPERATOR" name="P_OPERATOR" rows="5" cols="110"></textarea>
					<p>
						<label for="P_STANDARD">규격</label>
						<textarea id="P_STANDARD" name="P_STANDARD" rows="5" cols="110"></textarea>
					<p>
						<label for="P_COLOR">색상</label>
						<textarea id="P_COLOR" name="P_COLOR" rows="5" cols="110"></textarea>
					<p>
						<label for="P_TERMINAL">단자정보</label>
						<textarea id="P_TERMINAL" name="P_TERMINAL" rows="5" cols="110"></textarea>
					<p>
						<label for="P_BIOSECURITY">생체인식</label>
						<textarea id="P_BIOSECURITY" name="P_BIOSECURITY" rows="5"
							cols="110"></textarea>
					<p>
						<label for="P_ETC">기타</label>
						<textarea id="P_ETC" name="P_ETC" rows="5" cols="110"></textarea>
				</div>

				<button type="submit">등록</button>
				<button type="reset">리셋</button>
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