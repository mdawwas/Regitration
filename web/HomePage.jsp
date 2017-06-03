<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.atypon.utility.User" %><%--
  Created by IntelliJ IDEA.
  User: mdawwas
  Date: 5/29/17
  Time: 12:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HomePage</title>
    <link rel="shortcut icon" href="https://www.atypon.com/wp-content/themes/atypon/assets/favicon.ico">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="all_in.css">
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/home.page">Atypon Registeration</a>
            </div>
            <ul class="nav navbar-nav">
                <c:if test="${sessionScope.user == null}">
                    <c:redirect url = "/index.jsp"/>
                </c:if>
                <li class="active"><a href="/home.page">Home</a></li>
                <c:choose>
                    <c:when test="${sessionScope.user.type == 0}">
                        <li><a href = "/users.page" > Users </a ></li >
                        <li ><a href = "/courses.page" > Courses </a ></li >
                        <li ><a href = "/sections.page" > Sections </a ></li >
                        <li><a href="/add_user.page">Add user</a> </li>
                        <li><a href="/add_course.page">Add Course</a> </li>
                        <li><a href="/add_section.page">Add Section</a></li>
                    </c:when>
                    <c:when test="${sessionScope.user.type == 2}">
                        <li><a href = "/mysections.page" > My Sections </a ></li >
                    </c:when>
                </c:choose>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/Logout"><span class="glyphicon glyphicon-log-out"></span>Log out</a></li>
            </ul>
        </div>

    </nav>

    <div class = "mid-div">
        <br><br>
        <img src="https://www.trendmd.com/assets/new_landing/customers/atypon-38a9c282d1fbb5a5268d91759d9ed6de.png">
        <br><br><br>
        <h1 class = "odd"> Welcome to Atypon registration system</h1>
        <br>
        <h3>Atypon registration system is a system developed my Mohammad Abu Dawwas</h3>
        <br><br>
        <p class = "odd" style="font-size: 17px">Atypon registration system allow students to view their courses and grades, allow teachers to view their courses and edit students grades and registerers to add students, teachers, courses and sections</p>
    </div>

</body>
</html>
