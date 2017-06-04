<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.atypon.utility.User" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: mdawwas
  Date: 5/29/17
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Users</title>
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
    <c:if test = "${not empty requestScope.Message}">
        <script>
            alert("${requestScope.Message}");
        </script>
    </c:if>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/home.page">Atypon Registeration</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="/home.page">Home</a></li>
                <li class="active"><a href="/users.page">Users</a></li>
                <li><a href="/courses.page">Courses</a></li>
                <li><a href="/sections.page">Sections</a></li>
                <li><a href="/add_user.page">Add user</a> </li>
                <li><a href="/add_course.page">Add Course</a> </li>
                <li><a href="/add_section.page">Add Section</a> </li>
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
                    <th>id</th>
                    <th>Name</th>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Type</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items = "${requestScope.users_list}" var = "users">
                    <tr>
                        <td>${users.id}</td>
                        <td>${users.name}</td>
                        <td>${users.userName}</td>
                        <td>${users.password}</td>
                        <td>${users.type}</td>
                        <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button onclick="window.location = 'user.delete?id=${users.id}'" class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                    </tr>

                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
