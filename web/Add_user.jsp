<%--
  Created by IntelliJ IDEA.
  User: mdawwas
  Date: 5/31/17
  Time: 1:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add User</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="all_in.css">
</head>
<body>

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
                <li class="active"><a href="/add_user.page">Add User</a> </li>
                <li><a href="/add_course.page">Add Course</a> </li>
            </ul>
        </div>
    </nav>

    <div class="add-user-div">
        <img src="https://www.trendmd.com/assets/new_landing/customers/atypon-38a9c282d1fbb5a5268d91759d9ed6de.png" class="users-img">
    </div>

    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
                <form action="/users.add" method="post" role="form">
                    <hr class="colorgraph"> <br>

                    <div class="form-group">
                        <input type="text" name="name" class="form-control input-lg" placeholder="Name" tabindex="3" required>
                    </div> <br>
                    <div class="form-group">
                        <input type="text" name="username" class="form-control input-lg" placeholder="Username" tabindex="3" required>
                    </div> <br>

                    <div class="form-group">
                        <input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password" tabindex="3" required>
                    </div> <br>

                    <div class="container">
                        User type : &nbsp; &nbsp;
                        <label class="radio-inline">
                            <input type="radio" name="type" value ="0" required>Admin
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="type" value = "1">Teacher
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="type" value = "2">Student
                        </label>
                    </div> <br>

                    <hr class="colorgraph"><br>
                    <div class="row">
                        <div class="col-xs-12 col-md-6"><input type="submit" value="Add user" class="btn btn-primary btn-block btn-lg" tabindex="7"></div>
                    </div>


                </form>
            </div>
        </div>
    </div>

</body>
</html>
