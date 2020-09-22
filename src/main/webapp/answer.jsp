<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Results</title>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/graphics.css">
    <link rel="stylesheet" href="css/table.css">
    <link rel="stylesheet" href="css/home_button.css">
    <link rel="icon" href="img/favicon.jpg" type="img/jpg">
</head>
<body>

<jsp:include page="partial/header.jsp"/>

<div id="content">
    <jsp:include page="partial/graphics.jsp"/>

    <div class="table">
        <div class="table-header">
            <div>X</div>
            <div>Y</div>
            <div>R</div>
            <div>Current time</div>
            <div>Result</div>
        </div>
        <div class="table-content">
            <jsp:useBean id="qss" scope="session" class="ru.itmo.angry_beavers.models.QueryStorageService"/>
            <c:forEach var="query" items="${qss.freshQueries}">
                <div class="table-row">
                    <div>${query.x}</div>
                    <div>${query.y}</div>
                    <div>${query.r}</div>
                    <div>${qss.dateFormat.format(query.queryTime)}</div>
                        ${query.result ? "<div style=\"color: green\">In the area</div>" :
                                "<div style=\"color: red\">Outside the area</div>"}
                </div>
            </c:forEach>
        </div>
    </div>

    <div id="home-button">
        <a href="index.jsp">To Home Page</a>
    </div>
</div>

<script src="js/jquery.js"></script>
<script src="js/validate.js"></script>
<script src="js/graphics.js"></script>
<script src="js/table.js"></script>
</body>
</html>
