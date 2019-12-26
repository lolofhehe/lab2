<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<jsp:useBean id="history" class="history.HistoryBean" scope="session"/>

<c:set var="contextPath" value="${pageContext.request.contextPath}/"/>

<html>
<head>
    <title>Priweb 2</title>
    <link rel="stylesheet" type="text/css" href="${contextPath}grey.css" id="csslink">
    <link rel="shortcut icon" href="${contextPath}prikol.ico">
    <script src="${contextPath}jquery-3.4.1.min.js"></script>
    <script src="${contextPath}valscript.js"></script>
    <script src="${contextPath}canvas.js"></script>
</head>

<body>
<table class="centered">
    <tr style="width:100%">
        <div class="header centered">
            Лабораторная работа №2 <br>
            Вариант 461204<br>
            Выполнил Юров Максим Алексеевич, группа P321
        </div>
        <div class="label centered">
            <canvas id="canvas" height="400" width="400">Zdes canvas</canvas>
            <div id="message"></div>
        </div>
        <form method="POST" id="main-form" action="area-check">
            <table class="label centered">
                <tr>
                    <td colspan="3">Значение X:</td>
                </tr>
                <tr>
                    <td><input type="radio" name="X r" checked value="-2">-2</td>
                    <td><input type="radio" name="X r" value="-1.5">-1.5</td>
                    <td><input type="radio" name="X r" value="-1">-1</td>
                </tr>
                <tr>
                    <td><input type="radio" name="X r" value="-0.5">-0.5</td>
                    <td><input type="radio" name="X r" value="0">0</td>
                    <td><input type="radio" name="X r" value="0.5">0.5</td>
                </tr>
                <tr>
                    <td><input type="radio" name="X r" checked value="1">1</td>
                    <td><input type="radio" name="X r" value="1.5">1.5</td>
                    <td><input type="radio" name="X r" value="2">2</td>
                </tr>
                <tr>
                    <td colspan="3"><label for="Ytextfield">Значение Y:</label></td>
                </tr>
                <tr>
                    <td colspan="3"><input id="Ytextfield" name="Y" autocomplete="off" placeholder="(-5; 3)"></td>
                </tr>

                <tr>
                    <td colspan="3"><label for="Rtextfield">Значение R:</label></td>
                </tr>
                <tr>
                    <td colspan="3"><input id="Rtextfield" name="R" autocomplete="off" placeholder="(1; 4)"></td>
                </tr>

                <tr>
                    <td colspan="3"><p><input type="submit" class="button" value="Проверить точку"></p></td>
                </tr>
            </table>
            <input type="hidden" id="X_field" name="X" value="0">
        </form>
    </tr>
    <tr style="width:100%">
        <c:if test="${not empty history.nodeList}">
            <table class="result centered label">
                <caption>История запросов:</caption>
                <tr>
                    <th>X</th>
                    <th>Y</th>
                    <th>R</th>
                    <th>Результат</th>
                </tr>

                <c:forEach items="${history.nodeList}" var="node">
                    <tr>
                        <td class="history-x">${node.x}</td>
                        <td class="history-y">${node.y}</td>
                        <td class="history-r">${node.r}</td>
                        <td>${node.hit ? "Точка входит в область." : "Точка не входит в область."}</td>
                    </tr>
                </c:forEach>
            </table>

        </c:if>
    </tr>
</table>
<div id="timer" class="label centered"></div>
</body>
</html>
