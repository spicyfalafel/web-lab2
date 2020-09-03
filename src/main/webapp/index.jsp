<!-- формирующая HTML-страницу с веб-формой.
Должна обрабатывать все запросы, не содержащие
сведений о координатах точки и радиусе области.-->
<!doctype html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%request.setCharacterEncoding("UTF-8");%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="icon" href="${pageContext.request.contextPath}/res/ukraine.png" type="image/png">


    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/input.css" type="text/css">
    <title>Web Lab2</title>
</head>
<body>
<jsp:include page="header.jsp"/>


<div class="d-sm-flex justify-content-around m-3">
    <div class="align-content-sm-center">
        <jsp:include page="graph.jsp"/>
    </div>
    <form action="${pageContext.request.contextPath}/controller" method="get" class="p-3" style="background-color: #87CEFA"
          id="coordinates-form">
        <div class="X-radios">

            <h4>X:</h4>
            <label class="x-element-label">-3
                <input class="x_radio" type="radio" name="x" value="-3">
            </label>
            <label class="x-element-label">-2
                <input class="x_radio" type="radio" name="x" value="-2">
            </label>
            <label class="x-element-label">-1
                <input class="x_radio" type="radio" name="x" value="-1">
            </label>
            <label class="x-element-label">0
                <input class="x_radio" type="radio" name="x" value="0">
            </label>
            <label class="x-element-label">1
                <input class="x_radio" type="radio" name="x" value="1">
            </label>
            <label class="x-element-label">2
                <input class="x_radio" type="radio" name="x" value="2">
            </label>
            <label class="x-element-label">3
                <input class="x_radio" type="radio" name="x" value="3">
            </label>
            <label class="x-element-label">4
                <input class="x_radio" type="radio" name="x" value="4">
            </label>
            <label class="x-element-label">5
                <input class="x_radio" type="radio" name="x" value="5">
            </label>
        </div>
        <div>
            <h4>Y:</h4>
                <input id="y-text" class="form-control" type="text" name="y" placeholder="y value"
                       maxlength="14" required/>
            </div>
            <span id="value-validate-text"></span>
        <div class="R-checkboxes" id="R">
            <h4>R:</h4>
            <label class="r-element-label">1
                <input class="r-checkbox" type="checkbox" name="r" value="1" checked>
            </label>
            <label class="r-element-label">1.5
                <input class="r-checkbox" type="checkbox" name="r" value="1.5">
            </label>
            <label class="r-element-label">2
                <input class="r-checkbox" type="checkbox" name="r" value="2">
            </label>
            <label class="r-element-label">2.5
                <input class="r-checkbox" type="checkbox" name="r" value="2.5">
            </label>
            <label class="r-element-label">3
                <input class="r-checkbox" type="checkbox" name="r" value="3">
            </label>
        </div>
        <button id="submit-button" class="btn btn-light" type="submit">Отправить</button>
        <button id="clear-button" class="btn btn-light" type="reset">Очистить</button>
    </form>
</div>


<script src="${pageContext.request.contextPath}/res/jquery.js"></script>
<script src="${pageContext.request.contextPath}/my_script.js"></script>
</body>
</html>