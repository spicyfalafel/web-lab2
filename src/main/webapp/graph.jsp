<%--
  Created by IntelliJ IDEA.
  User: svyat
  Date: 28.08.2020
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int xc = 149;
    int yc = 149;
    int w=300;
    int h=300;
    int R_IN_PIXELS = w/4;
%>
<svg id="graph" xmlns="http://www.w3.org/2000/svg" width="<%= w %>" height="<%=h%>"
     viewBox="0 0 300 300">
    <rect height="<%= h%>" width="<%= w %>" fill="skyblue" stroke="steelblue" stroke-width="5"></rect>
    <g style="fill:red;  stroke-width:1.5; fill-opacity: 0.75; stroke : rgb(0, 0, 0);
            font-size: 11px">

        <circle id="my-circle" cx="<%= xc %>" cy="<%= yc %>" r="<%= R_IN_PIXELS %>" clip-path="url(#left-fourth)"
                stroke="rgb(255, 236, 122)"></circle>

        <rect x="<%= xc - R_IN_PIXELS%>" y="<%= yc %>" width="<%= R_IN_PIXELS %>" height="<%= R_IN_PIXELS %>" clip-path="url(#top-diagonal)"
              stroke="rgb(255, 236, 122)"></rect>

        <line x1="<%= xc - R_IN_PIXELS%>" y1="<%= yc %>" x2="<%= xc %>" y2="<%= yc + R_IN_PIXELS%>" stroke="rgb(255, 236, 122)"></line>
        <rect x="<%= xc %>" y="<%= yc %>" width="<%= R_IN_PIXELS %>" height="<%= R_IN_PIXELS %>" stroke="rgb(255, 236, 122)"></rect>


        <!--Y-->
        <line x1="<%= xc %>" y1="5" x2="<%= xc %>" y2="295"></line>
        <line x1="<%= xc %>" y1="5" x2="154" y2="15"></line>
        <line x1="<%= xc %>" y1="5" x2="144" y2="15"></line>

        <!-- черточки X -->
        <!-- R -->
        <line x1="<%= xc + R_IN_PIXELS %>" y1="<%= yc - 4%>"
              x2="<%= xc + R_IN_PIXELS %>" y2="<%= yc + 4%>"></line>
        <!-- -R -->
        <line x1="<%= xc - R_IN_PIXELS %>" y1="<%= yc - 4%>"
              x2="<%= xc - R_IN_PIXELS %>" y2="<%= yc + 4%>"></line>
        <!-- -R/2 -->
        <line x1="<%= xc - R_IN_PIXELS/2%>" y1="<%= yc - 4%>"
              x2="<%= xc - R_IN_PIXELS/2%>" y2="<%= yc + 4%>"></line>
        <!-- R/2 -->
        <line x1="<%= xc + R_IN_PIXELS/2%>" y1="<%= yc - 4%>"
              x2="<%= xc + R_IN_PIXELS/2%>" y2="<%= yc + 4%>"></line>

        <!-- R TEXT X -->
        <text x="<%= xc - R_IN_PIXELS - 4 %>" y="<%= yc + 15 %>" fill="black">-R</text>
        <text x="<%= xc + R_IN_PIXELS - 3 %>" y="<%= yc + 15 %>" fill="black">R</text>

        <text x="<%= xc - R_IN_PIXELS/2 - 5%>" y="<%= yc + 15 %>" fill="black">-R/2</text>
        <text x="<%= xc + R_IN_PIXELS/2 - 5 %>" y="<%= yc + 15 %>" fill="black">R/2</text>

        <!-- Y -->
        <line x1="295" y1="<%= yc %>" x2="5" y2="<%= yc %>"></line>
        <line x1="295" y1="<%= yc %>" x2="285" y2="155"></line>
        <line x1="295" y1="<%= yc %>" x2="285" y2="145"></line>
        <!-- черточки по Y -->
        <!-- -R -->
        <line x1="<%= xc - 4 %>" y1="<%= yc - R_IN_PIXELS %>"
              x2="<%= xc + 4 %>" y2="<%= yc - R_IN_PIXELS %>"></line>
        <!-- R -->
        <line x1="<%= xc - 4 %>" y1="<%= yc + R_IN_PIXELS %>"
              x2="<%= xc + 4 %>" y2="<%= yc + R_IN_PIXELS %>"></line>
        <!-- -R/2 -->
        <line x1="<%= xc - 4 %>" y1="<%= yc - R_IN_PIXELS/2 %>"
              x2="<%= xc + 4 %>" y2="<%= yc - R_IN_PIXELS/2 %>"></line>
        <!-- R/2 -->
        <line x1="<%= xc - 4 %>" y1="<%= yc + R_IN_PIXELS/2 %>"
              x2="<%= xc + 4 %>" y2="<%= yc + R_IN_PIXELS/2 %>"></line>


        <!-- R TEXT Y -->
        <text x="<%= xc + 5%>" y="<%= yc - R_IN_PIXELS + 3 %>" fill="black">R</text>
        <text x="<%= xc + 5%>" y="<%= yc + R_IN_PIXELS + 3 %>" fill="black">-R</text>

        <text x="<%= xc + 5%>" y="<%= yc - R_IN_PIXELS/2 + 3 %>" fill="black">R/2</text>
        <text x="<%= xc + 5%>" y="<%= yc + R_IN_PIXELS/2 + 3 %>" fill="black">-R/2</text>

        <circle id="point" r="5" cx="200" cy="200" fill="blue" stroke="blue" visibility="hidden"></circle>

        <defs>
            <clipPath id="left-fourth">
                <rect x="0" y="0" width="149" height="149"></rect>
            </clipPath>
            <clipPath id="top-diagonal">

                <polygon points="<%= xc-R_IN_PIXELS %>,<%= yc %>,
                                 <%= xc %>,<%= yc + R_IN_PIXELS %>,
                                 <%= xc %>,<%= yc %>"></polygon>
            </clipPath>
        </defs>
    </g>
</svg>
