<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%
request.setCharacterEncoding("UTF-8");

if(session.getAttribute("sessionId") == null){%>

<%
	response.sendRedirect("pleaseLogin.jsp");
}
else{

String id = (String) session.getAttribute("sessionId");
String HJP = request.getParameter("HJP");

java.util.Date currentDate = new java.util.Date();
java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
String formattedDate = dateFormat.format(currentDate);

String phone_name = request.getParameter("phone_name");
String score = request.getParameter("score");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:oracle:thin:@localhost:1521:xe"
	driver="oracle.jdbc.OracleDriver" user="kjh" password="kjh1234" />

<sql:update dataSource="${dataSource}" var="resultSet">
   INSERT INTO board (id, hjp, REGIST_DAY, SMARTPHONE, score) VALUES(?,?,?,?,?)
   <sql:param value="<%=id%>" />
	<sql:param value="<%=HJP%>" />
	<sql:param value="<%=formattedDate%>" />
	<sql:param value="<%=phone_name%>" />
	<sql:param value="<%=score%>" />
</sql:update>

<c:if test="${resultSet>=1}">
	<c:set var="phone_name" value="<%= phone_name %>" />
	<c:redirect url="list.jsp"  >
		<c:param name="phone_name" value="${phone_name}"/>
	</c:redirect>
</c:if>
<%}%>