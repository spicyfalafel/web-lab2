<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <link href="${pageContext.request.contextPath}/res/vzlom.jpg" type="image/jpg">

</head>
<body>
<div id="demo" class="carousel slide" data-ride="carousel">

    <!-- Indicators -->
    <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
    </ul>

    <!-- The slideshow -->

    <div class="carousel-inner container p-3 bg-dark d-flex">
        <div class="carousel-item active" style="width: 600px; height: 600px; margin: 0 auto">
            <img alt="vzlom" src="${pageContext.request.contextPath}/res/vzlom.jpg">
            <div class="carousel-caption">
                <h3>I DID IT</h3>
            </div>
        </div>
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/res/anonimus.jpg" alt="anonimus">
        </div>
        <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/res/jir.jpg" alt="jir">
        </div>
    </div>


    <!-- Left and right controls -->
    <a class="carousel-control-prev" href="#demo" data-slide="prev">
        <span class="carousel-control-prev-icon"></span>
    </a>
    <a class="carousel-control-next" href="#demo" data-slide="next">
        <span class="carousel-control-next-icon"></span>
    </a>

</div>
</body>
</html>
