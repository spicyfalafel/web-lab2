<%--
  Created by IntelliJ IDEA.
  User: svyat
  Date: 28.08.2020
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<svg id="graph" xmlns="http://www.w3.org/2000/svg" width="300" height="300"
     viewBox="0 0 300 300">
    <rect height="300" width="300" fill="skyblue" stroke="steelblue" stroke-width="5"></rect>
    <g style="fill:red;  stroke-width:1.5; fill-opacity: 0.75; stroke : rgb(0, 0, 0);
            font-size: 11px">

        <circle id="my-circle" cx="150" cy="150" r="70" clip-path="url(#left-fourth)"
                stroke="rgb(255, 236, 122)"></circle>

        <rect x="80" y="150" width="70" height="70" clip-path="url(#top-diagonal)"
              stroke="rgb(255, 236, 122)"></rect>

        <line x1="80" y1="150" x2="150" y2="220" stroke="rgb(255, 236, 122)"></line>
        <rect x="150" y="150" width="70" height="70" stroke="rgb(255, 236, 122)"></rect>
        <!-- X -->
        <line x1="150" y1="5" x2="150" y2="295"></line>
        <line x1="150" y1="5" x2="155" y2="15"></line>
        <line x1="150" y1="5" x2="145" y2="15"></line>
        <line x1="220" y1="146"
              x2="220" y2="154"></line>
        <line x1="80" y1="146"
              x2="80" y2="154"></line>
        <line x1="115" y1="146"
              x2="115" y2="154"></line>
        <line x1="185" y1="146"
              x2="185" y2="154"></line>


        <text x="70" y="166" fill="black">-R</text>
        <text x="215" y="166" fill="black">R</text>

        <text x="100" y="166" fill="black">-R/2</text>
        <text x="175" y="166" fill="black">R/2</text>

        <!-- Y -->
        <line x1="295" y1="150" x2="5" y2="150"></line>
        <line x1="295" y1="150" x2="285" y2="155"></line>
        <line x1="295" y1="150" x2="285" y2="145"></line>
        <line x1="146" y1="80"
              x2="154" y2="80"></line>
        <line x1="146" y1="220"
              x2="154" y2="220"></line>
        <line x1="146" y1="115"
              x2="154" y2="115"></line>
        <line x1="146" y1="185"
              x2="154" y2="185"></line>

        <text x="156" y="85" fill="black">R</text>
        <text x="156" y="224" fill="black">-R</text>

        <text x="156" y="120" fill="black">R/2</text>
        <text x="156" y="189" fill="black">-R/2</text>

        <circle id="point" r="5" cx="200" cy="200" fill="blue" stroke="blue" visibility="hidden"></circle>

        <defs>
            <clipPath id="left-fourth">
                <rect x="0" y="0" width="150" height="150"></rect>
            </clipPath>
            <clipPath id="top-diagonal">
                <polygon points="80,150,150,220,150,150"></polygon>
            </clipPath>
        </defs>
    </g>
</svg>