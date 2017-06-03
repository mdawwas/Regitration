<%--
  Created by IntelliJ IDEA.
  User: Mohammad
  Date: 31/05/2017
  Time: 06:38 م
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Course</title>
    <link rel="shortcut icon" href="https://www.atypon.com/wp-content/themes/atypon/assets/favicon.ico">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="all_in.css">
</head>
<body>
    <%--Navigator--%>
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
                    <li class="active"><a href="/add_course.page">Add Course</a> </li>
                    <li><a href="/add_section.page">Add Section</a> </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/Logout"><span class="glyphicon glyphicon-log-out"></span>Log out</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <%--Add course div--%>
    <div class="add-user-div">
        <img src="https://www.trendmd.com/assets/new_landing/customers/atypon-38a9c282d1fbb5a5268d91759d9ed6de.png" class="users-img">
    </div>

    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                <form action="/courses.add" method="post" role="form">
                    <hr class="colorgraph"> <br>

                    <div class="form-group">
                        <input type="text" name="course_name" class="form-control input-lg" placeholder="Course Name" tabindex="3" required>
                    </div>
                    <br>
                    <div class="form-group">
                        <input type="text" name="course_description" class="form-control input-lg" placeholder="Course Description" tabindex="3" required>
                    </div>
                    <br>
                    <hr class="colorgraph"><br>
                    <div class="row">
                        <div class="col-xs-12 col-md-6"><input type="submit" value="Add Course" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
                    </div>


                </form>
            </div>
        </div>
    </div>

</body>
</html>
