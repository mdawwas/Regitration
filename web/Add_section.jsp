<%@ page import="java.util.ArrayList" %>
<%@ page import="com.atypon.utility.Course" %>
<%@ page import="com.atypon.utility.User" %><%--
  Created by IntelliJ IDEA.
  User: mdawwas
  Date: 6/1/17
  Time: 11:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Section</title>

    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="all_in.css">
</head>
<body>
    <%
        ArrayList <Course> courses = (ArrayList<Course>) request.getAttribute("courses_list");
        ArrayList <User> teachers = (ArrayList<User>) request.getAttribute("teachers_list");
    %>
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
                <li class="active"><a href="/add_section.page">Add Section</a> </li>
            </ul>
        </div>
        </div>
    </nav>

    <%--Add section div--%>
    <div class="add-user-div">
        <img src="https://www.trendmd.com/assets/new_landing/customers/atypon-38a9c282d1fbb5a5268d91759d9ed6de.png" class="users-img">
    </div>

    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                <form action="/sections.add" method="post" role="form">
                    <hr class="colorgraph"> <br>

                    <div class="row form-group">
                        <label class="col-md-3 control-label" for="course">Select Course :</label>
                        <div class="col-md-9">
                            <select id="course" name="course" class="form-control input-md" required>
                                <%
                                    for (int i = 0 ; courses != null && i < courses.size() ; ++i){
                                        out.print("<option value = " + courses.get(i).getId() + " >" + courses.get(i).getCourseName() + "</option>");
                                    }
                                %>
                            </select>
                        </div>
                    </div>

                    <div class="row form-group">
                        <label class="col-md-3 control-label" for="teacher">Select Teacher :</label>
                        <div class="col-md-9">
                            <select id="teacher" name="teacher" class="form-control input-md" required>
                                <%
                                    for (int i = 0 ; teachers != null && i < teachers.size() ; ++i){
                                        out.print("<option value = " + teachers.get(i).getId() + " >" + teachers.get(i).getName() + "</option>");
                                    }
                                %>
                            </select>
                        </div>
                    </div>

                    <!-- insert time -->
                    <div class="row form-group">
                        <label for="time" class="col-sm-3 control-label">Select time : </label>
                        <div class="col-sm-9">
                            <input type="time" id="time" name="time" placeholder="Course time" class="form-control" autofocus required>
                        </div>
                    </div>
                    <!-- end insert time -->

                    <hr class="colorgraph"><br>
                    <div class="row">
                        <div class="col-xs-12 col-md-6"><input type="submit" value="Add Section" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
                    </div>


                </form>
            </div>
        </div>
    </div>

</body>
</html>
