<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <c:url var="buttonUrl" value="list.jsp">
        <c:param name="buttonText" value="Click me!" /> <!-- ��ư �ؽ�Ʈ�� �Ķ���ͷ� �߰��մϴ� -->
    </c:url>

    <!-- ��ư�� Ŭ���ϸ� �ٸ� �������� �̵��մϴ� -->
    <a href="${buttonUrl}">Go to Another Page</a>
</body>
</html>