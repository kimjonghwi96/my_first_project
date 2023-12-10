<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> --%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
request.setCharacterEncoding("utf-8");

// String filename = "";

String realFolder = getServletContext().getRealPath("/") + "upload";
System.out.println("경로확인---->" + realFolder);

String encType = "utf-8"; //인코딩 타입
int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

String P_PRICE = multi.getParameter("P_PRICE");
String P_MANUFACTURER = multi.getParameter("P_MANUFACTURER");
String P_PROCESSOR = multi.getParameter("P_PROCESSOR");
String P_MEMORY = multi.getParameter("P_MEMORY");
String P_DISPLAY = multi.getParameter("P_DISPLAY");
String P_NETWORK = multi.getParameter("P_NETWORK");
String P_PROXIMITY_COMMUNICATION = multi.getParameter("P_PROXIMITY_COMMUNICATION");
String P_SATELLITE_NAVIGATION = multi.getParameter("P_SATELLITE_NAVIGATION");
String P_CAMERA = multi.getParameter("P_CAMERA");
String P_BATTERY = multi.getParameter("P_BATTERY");
String P_OPERATOR = multi.getParameter("P_OPERATOR");
String P_STANDARD = multi.getParameter("P_STANDARD");
String P_COLOR = multi.getParameter("P_COLOR");
String P_TERMINAL = multi.getParameter("P_TERMINAL");
String P_BIOSECURITY = multi.getParameter("P_BIOSECURITY");
String P_ETC = multi.getParameter("P_ETC");
String P_NAME = multi.getParameter("P_NAME");


Integer P_PRICE1;

if (P_PRICE.isEmpty())
	P_PRICE1 = 0;
else
	P_PRICE1 = Integer.valueOf(P_PRICE);

Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String P_FILENAME = multi.getFilesystemName(fname);
%>

<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.OracleDriver" user="kjh" password="kjh1234" />
	
<sql:update dataSource="${dataSource}" var="resultSet">
UPDATE smartphone SET P_PRICE=?, P_MANUFACTURER=?, P_PROCESSOR=?, 
					  P_MEMORY=?, P_DISPLAY=?, P_NETWORK=?, 
					  P_PROXIMITY_COMMUNICATION=?, P_SATELLITE_NAVIGATION=?, 
					  P_CAMERA=?, P_BATTERY=?, P_OPERATOR=?, 
					  P_STANDARD=?, P_COLOR=?, P_TERMINAL=?, 
					  P_BIOSECURITY=?, P_ETC=?, P_FILENAME=? 
WHERE P_NAME=?

	<sql:param value="<%=P_PRICE%>" />
	<sql:param value="<%=P_MANUFACTURER%>" />
	<sql:param value="<%=P_PROCESSOR%>" />
	<sql:param value="<%=P_MEMORY%>" />
	<sql:param value="<%=P_DISPLAY%>" />
	<sql:param value="<%=P_NETWORK%>" />
	<sql:param value="<%=P_PROXIMITY_COMMUNICATION%>" />
	<sql:param value="<%=P_SATELLITE_NAVIGATION%>" />
	<sql:param value="<%=P_CAMERA%>" />
	<sql:param value="<%=P_BATTERY%>" />
	<sql:param value="<%=P_OPERATOR%>" />
	<sql:param value="<%=P_STANDARD%>" />
	<sql:param value="<%=P_COLOR%>" />
	<sql:param value="<%=P_TERMINAL%>" />
	<sql:param value="<%=P_BIOSECURITY%>" />
	<sql:param value="<%=P_ETC%>" />
	<sql:param value="<%=P_FILENAME%>" />
	<sql:param value="<%=P_NAME%>" />
</sql:update>


<%
response.sendRedirect("Compare.jsp");
%>