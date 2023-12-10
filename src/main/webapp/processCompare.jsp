<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@ include file="DBconn.jsp"%>

<%
request.setCharacterEncoding("UTF-8");

String option0 = request.getParameter("option0");
String option1 = request.getParameter("option1");
String option2 = request.getParameter("option2");

try {
	String query = "SELECT * FROM smartphone where p_name = ?";
	PreparedStatement pstmt = conn.prepareStatement(query);
	pstmt.setString(1, option1);
	ResultSet rs = pstmt.executeQuery();
	while (rs.next()) { // 결과를 처리하는 코드 // 예: rs.getString("column_name");
// 		out.print(rs.getString(option2));
	}
	rs.close();
	pstmt.close();
} catch (SQLException e) {
	e.printStackTrace();
}
try {
	if (conn != null) {
		conn.close();
	}
} catch (SQLException e) {
	e.printStackTrace();
}

String destinationURL = "Compare.jsp";
response.sendRedirect(destinationURL);
%>
