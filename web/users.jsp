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
    <%--<script>--%>
        <%--<%--%>
            <%--if(session.isNew()){--%>
                <%--out.println("window.location.replace(\"/HomePage.jsp\");");--%>
            <%--}else{--%>
                <%--User user = (User) session.getAttribute("user");--%>
                <%--if(user == null){--%>
                    <%--response.sendRedirect("index.jsp");--%>
                <%--}else if( user.getType() != 0){--%>
                    <%--out.println("alert(\"You cant access this page\");");--%>
                    <%--out.println("window.location.replace(\"/HomePage.jsp\");");--%>
                <%--}--%>
            <%--}--%>
        <%--%>--%>
    <%--</script>--%>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/home.page">Atypon Registeration</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="/home.page">Home</a></li>
                <li class="active"><a href="/users.page">Users</a></li>
                <li><a href="/courses.page">Courses</a></li>
                <li><a href="#">Sections</a></li>
                <li><a href="/add_user.page">Add user</a> </li>
            </ul>
        </div>
    </nav>

    <div class="table-div">
        <img src="https://www.trendmd.com/assets/new_landing/customers/atypon-38a9c282d1fbb5a5268d91759d9ed6de.png" class="users-img">
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
                 <%
                     ArrayList <User> users  = (ArrayList<User>) session.getAttribute("users_list");
                     for(int i = 0 ; users!= null && i < users.size() ; ++i){
                         out.println("<tr>");
                         out.println("<td>"+users.get(i).getId()+"</td>");
                         out.println("<td>"+users.get(i).getName()+"</td>");
                         out.println("<td>"+users.get(i).getUserName()+"</td>");
                         out.println("<td>"+users.get(i).getPassword()+"</td>");
                         out.println("<td>"+users.get(i).getType()+"</td>");
                         out.println("<td><p data-placement=\"top\" data-toggle=\"tooltip\" title=\"Delete\"><button class=\"btn btn-danger btn-xs\" data-title=\"Delete\" data-toggle=\"modal\" data-target=\"#delete\" ><span class=\"glyphicon glyphicon-trash\"></span></button></p></td>");
                         out.println("</tr>");
                     }
                 %>
            </tbody>
        </table>
    </div>
</body>
</html>
