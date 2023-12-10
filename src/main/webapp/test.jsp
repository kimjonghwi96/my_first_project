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
        <c:param name="buttonText" value="Click me!" /> <!-- 버튼 텍스트를 파라미터로 추가합니다 -->
    </c:url>

    <!-- 버튼을 클릭하면 다른 페이지로 이동합니다 -->
    <a href="${buttonUrl}">Go to Another Page</a>
</body>
</html>