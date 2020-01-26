<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="history" class="history.HistoryBean" scope="session"/>

<c:set var="contextPath" value="${pageContext.request.contextPath}/"/>

<html>
<head>
    <title>Результаты</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}grey.css">
    <link rel="shortcut icon" href="${contextPath}prikol.ico">
</head>
<body>
    <table class="result label centered"><caption>Результаты</caption>
        <%String x = request.getParameter("X");
        String y = request.getParameter("Y");
        String r = request.getParameter("R");
        %>
        <tr><td>X</td><td>Y</td><td>R</td></tr>
        <tr><td><%=x%></td><td><%=y%></td><td><%=r%></td></tr>
        <tr><td colspan=3><%=history.getNodeList().get(history.getNodeList().size()-1).isHit()? "Точка входит в область." : "Точка не входит в область." %></td></tr>
    </table>
    <div class="centered">
        <input type="button" class="button" value="Вернуться" onclick="location.href='${contextPath}';">
    </div>
</body>
</html>
