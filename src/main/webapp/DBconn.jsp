<%@ page import="java.sql.*"%>
<%
Connection conn = null;
Connection conn1 = null;
Connection conn2 = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "kjh";
String password = "kjh1234";

Class.forName("oracle.jdbc.OracleDriver");
conn = DriverManager.getConnection(url, user, password);
conn1 = DriverManager.getConnection(url, user, password);
conn2 = DriverManager.getConnection(url, user, password);
%>