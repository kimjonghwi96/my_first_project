<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
request.setCharacterEncoding("utf-8");

String encType = "utf-8"; //인코딩 타입

String P_NAME = request.getParameter("pname");
%>

<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.OracleDriver" user="kjh" password="kjh1234" />
	
<sql:update dataSource="${dataSource}" var="resultSet">
DELETE FROM smartphone
WHERE P_NAME = ?

	<sql:param value="<%=P_NAME%>" />
</sql:update>

<%
response.sendRedirect("Compare.jsp");
%>