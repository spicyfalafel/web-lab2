<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="ru.itmo.angry_beavers.models.QueryStorageService" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>First web laboratory work</title>
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/graphics.css">
    <link rel="stylesheet" href="css/form.css">
    <link rel="stylesheet" href="css/table.css">
    <link rel="icon" href="img/favicon.jpg" type="img/jpg">
</head>
<body>

<jsp:include page="partial/header.jsp"/>

<div id="content">
    <div class="graphics-and-form">
        <jsp:include page="partial/graphics.jsp"/>

        <div class="data-form">
            <form id="data-form" action="controller" method="post" name="dataForm">
                <div class="for-y element-of-form">
                    <div class="label">
                        <label for="y-value">Y value:</label>
                    </div>
                    <div>
                        <input id="y-value" type="text" name="y-value" placeholder="value from -3 to 5" maxlength="20">
                    </div>
                </div>
                <div class="for-x element-of-form">
                    <div class="label">
                        <label>X value:</label>
                    </div>
                    <div class="radio-row">
                        <div class="radio">
                            <div class="inner-label">-5</div>
                            <input type="radio" name="x-value" value="-5">
                        </div>
                        <div class="radio">
                            <div class="inner-label">-4</div>
                            <input type="radio" name="x-value" value="-4">
                        </div>
                        <div class="radio">
                            <div class="inner-label">-3</div>
                            <input type="radio" name="x-value" value="-3">
                        </div>
                    </div>
                    <div class="radio-row">
                        <div class="radio">
                            <div class="inner-label">-2</div>
                            <input type="radio" name="x-value" value="-2">
                        </div>
                        <div class="radio">
                            <div class="inner-label">-1</div>
                            <input type="radio" name="x-value" value="-1">
                        </div>
                        <div class="radio">
                            <div class="inner-label">0</div>
                            <input type="radio" name="x-value" value="0">
                        </div>
                    </div>
                    <div class="radio-row">
                        <div class="radio">
                            <div class="inner-label">1</div>
                            <input type="radio" name="x-value" value="1">
                        </div>
                        <div class="radio">
                            <div class="inner-label">2</div>
                            <input type="radio" name="x-value" value="2">
                        </div>
                        <div class="radio">
                            <div class="inner-label">3</div>
                            <input type="radio" name="x-value" value="3">
                        </div>
                    </div>
                </div>
                <div class="for-r element-of-form">
                    <div class="label">
                        <label>R value:</label>
                    </div>
                    <div id="r-value-select">
                        <select name="r-value" id="r-value" >
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>
                </div>
                <div class="control-buttons element-of-form">
                    <div class="form-buttons">
                        <div>
                            <button class="control-button" type="submit" name="btn-submit">Submit</button>
                        </div>
                        <div>
                            <button class="control-button" type="reset" name="reset">Reset</button>
                        </div>
                    </div>
                </div>
                <div id="error-log"></div>
            </form>
        </div>
    </div>
    <div class="table">
        <div class="table-header">
            <div>X</div>
            <div>Y</div>
            <div>R</div>
            <div>Current time</div>
            <div>Result</div>
        </div>
        <div class="table-content">
            <!--TODO new queries in the top -->
            <jsp:useBean id="qss" scope="session" class="ru.itmo.angry_beavers.models.QueryStorageService"/>
            ${qss.updateStatuses()}
            <c:forEach var="query" items="${qss.queries}">
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
</div>
<script src="js/jquery.js"></script>
<script src="js/validate.js"></script>
<script src="js/home_page.js"></script>
<script src="js/graphics.js"></script>
<script src="js/table.js"></script>
</body>
</html>