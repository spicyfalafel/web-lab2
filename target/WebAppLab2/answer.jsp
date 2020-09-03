<%--
  Created by IntelliJ IDEA.
  User: svyat
  Date: 28.08.2020
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Web lab 2</title>
    <link rel="icon" href="${pageContext.request.contextPath}/res/ukraine.png" type="image/png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/input.css" type="text/css">
</head>
<body>
<jsp:include page="header.jsp"/>
<jsp:include page="graph.jsp"/>
<table id="result-table" class="result-table">
    <tr class="result-table-row">
        <th>X</th>
        <th>Y</th>
        <th>R</th>
        <th>RESULT</th>
        <th>TIME</th>
        <th>EXECUTION TIME</th>
    </tr>
</table>
</body>
</html>
