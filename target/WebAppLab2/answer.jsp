<%@ page import="java.util.ArrayList" %>
<%@ page import="ru.itmo.my.models.PointRequest" %>
<%@ page import="ru.itmo.my.models.ReqHolder" %>

<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%request.setCharacterEncoding("UTF-8");%>

<html>
<head>
    <title>Web lab 2</title>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="icon" href="${pageContext.request.contextPath}/res/ukraine.png" type="image/png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/input.css" type="text/css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="header.jsp"/>
<div class="d-flex flex-row bd-highlight mb-3">

    <div class="d-flex flex-column bd-highlight m-3" style="">
        <jsp:include page="graph.jsp"/>
        <br> <!-- kek -->
        <a href="index.jsp" type="button" class="btn btn-secondary btn-lg" id="back-to-index-button">GO BACK</a>
    </div>

    <table id="result-table" class="result-table">
        <tr class="result-table-row">
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>RESULT</th>
            <th>TIME</th>
        </tr>
        <%
            ReqHolder holder = (ReqHolder) session.getAttribute("reqHolder");
            if (holder != null) {
                out.println(holder.toTable());
            }
        %>
    </table>
</div>
</body>
</html>
