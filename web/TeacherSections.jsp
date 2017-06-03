<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Mohammad
  Date: 03/06/2017
  Time: 09:44 م
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My sections</title>
    <link rel="shortcut icon" href="https://www.atypon.com/wp-content/themes/atypon/assets/favicon.ico">
    <script language="JavaScript" src="https://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
    <script language="JavaScript" src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script language="JavaScript" src="https://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.js" type="text/javascript"></script>
    <script language="JavaScript" src="table.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="all_in.css" type="text/css">
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/home.page">Atypon Registeration</a>
            </div>

            <ul class="nav navbar-nav">
                <li><a href="/home.page">Home</a></li>
                <li class = "active"><a href="/teacher.sections.page">My Sections </a></li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="/Logout"><span class="glyphicon glyphicon-log-out"></span>Log out</a></li>
            </ul>
        </div>
    </nav>

    <div class="table-div">
        <img src="https://www.trendmd.com/assets/new_landing/customers/atypon-38a9c282d1fbb5a5268d91759d9ed6de.png" class="users-img">
        <br><hr class="colorgraph"><br>
        <table id="datatable" class="table table-striped table-bordered" cellspacing="0" width="100%">
            <thead>
            <tr>
                <th>Section Id</th>
                <th>Course Name</th>
                <th>Time</th>
                <th>Section students</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.sections_list}" var="sections">
                <tr>
                    <td>${sections.id}</td>
                    <td>${sections.courseName}</td>
                    <td>${sections.time}</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Explore"><button onclick="window.location='/section.students?sectionId=${sections.id}'" class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-search"></span></button></p></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
