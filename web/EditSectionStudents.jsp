<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Mohammad
  Date: 03/06/2017
  Time: 05:26 م
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Section Students</title>
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
                <li><a href="/users.page">Users</a></li>
                <li><a href="/courses.page">Courses</a></li>
                <li><a href="/sections.page">Sections</a></li>
                <li><a href="/add_user.page">Add User</a> </li>
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
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.section_students_list}" var="students">
                    <tr>
                        <td>${students.id}</td>
                        <td>${students.name}</td>
                        <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button onclick="window.location='/section.student.delete?id=${students.id}&sec=${param.id}'" class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="container" style="margin-bottom: 5%">
        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                <form action="/section.students.add" method="post" role="form">
                    <h3>Add Student to the section</h3>
                    <hr class="colorgraph"> <br>

                    <div class="row form-group">
                        <label class="col-md-3 control-label" for="student">Select Student :</label>
                        <div class="col-md-9">
                            <select id="student" name="student" class="form-control input-md" required>
                                <c:forEach items="${requestScope.students_list}" var = "students" >
                                    <option value="${students.id}">${students.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <input type="hidden" name="sectionId" value = "${param.id}" />
                    <br>
                    <div class="row">
                        <div class="col-xs-12 col-md-6"><input type="submit" value="Add Section" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
                    </div>


                </form>
            </div>
        </div>
    </div>

</body>
</html>
