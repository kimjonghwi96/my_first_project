<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp"%>

<%
request.setCharacterEncoding("utf-8");

String realFolder = getServletContext().getRealPath("/") + "upload";
System.out.println("경로확인---->"+realFolder);

String encType = "utf-8"; //인코딩 타입
int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

MultipartRequest multi = new MultipartRequest(request,
		realFolder,
		maxSize,
		encType,
		new DefaultFileRenamePolicy());

String P_NAME = multi.getParameter("P_NAME");
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

Integer P_PRICE1;

if (P_PRICE.isEmpty())
	P_PRICE1 = 0;
else
	P_PRICE1 = Integer.valueOf(P_PRICE);


Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String P_FILENAME = multi.getFilesystemName(fname);



PreparedStatement pstmt = null;

String sql = "INSERT INTO smartphone (P_NAME, P_PRICE, P_MANUFACTURER, P_PROCESSOR, P_MEMORY, P_DISPLAY, P_NETWORK, P_PROXIMITY_COMMUNICATION, P_SATELLITE_NAVIGATION, P_CAMERA, P_BATTERY,P_OPERATOR,P_STANDARD, P_COLOR,P_TERMINAL,P_BIOSECURITY,P_ETC,P_FILENAME) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

pstmt = conn.prepareStatement(sql);

pstmt.setString(1, P_NAME);
pstmt.setInt(2, P_PRICE1);
pstmt.setString(3, P_MANUFACTURER);
pstmt.setString(4, P_PROCESSOR);
pstmt.setString(5, P_MEMORY);
pstmt.setString(6, P_DISPLAY);
pstmt.setString(7, P_NETWORK);
pstmt.setString(8, P_PROXIMITY_COMMUNICATION);
pstmt.setString(9, P_SATELLITE_NAVIGATION);
pstmt.setString(10, P_CAMERA);
pstmt.setString(11, P_BATTERY);
pstmt.setString(12, P_OPERATOR);
pstmt.setString(13, P_STANDARD);
pstmt.setString(14, P_COLOR);
pstmt.setString(15, P_TERMINAL);
pstmt.setString(16, P_BIOSECURITY);
pstmt.setString(17, P_ETC);
pstmt.setString(18, P_FILENAME);

pstmt.executeUpdate();

if (pstmt != null)
pstmt.close();
if (conn != null)
conn.close();

response.sendRedirect("Compare.jsp");

%>