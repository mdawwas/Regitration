<%--
  Created by IntelliJ IDEA.
  User: mdawwas
  Date: 5/29/17
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
                <a class="navbar-brand" href="/HomePage.jsp">Atypon Registeration</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="HomePage.jsp">Home</a></li>
                <li class="active"><a href="users.jsp">Users</a></li>
                <li><a href="#">Courses</a></li>
                <li><a href="#">Sections</a></li>
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
                <tr>
                    <td>1</td>
                    <td>Mohammad Abu Dawwas</td>
                    <td>mdawwas</td>
                    <td>111</td>
                    <td>0</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Samer Raed</td>
                    <td>sraed</td>
                    <td>111</td>
                    <td>2</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>mousa Abu Dawwas</td>
                    <td>mousa_dawwas</td>
                    <td>111</td>
                    <td>1</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Ibrahim Q Al-Bzour</td>
                    <td>ibzour</td>
                    <td>111</td>
                    <td>2</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Mohammad Abu Dawwas</td>
                    <td>mdawwas</td>
                    <td>111</td>
                    <td>0</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Samer Raed</td>
                    <td>sraed</td>
                    <td>111</td>
                    <td>2</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>mousa Abu Dawwas</td>
                    <td>mousa_dawwas</td>
                    <td>111</td>
                    <td>1</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Ibrahim Q Al-Bzour</td>
                    <td>ibzour</td>
                    <td>111</td>
                    <td>2</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr><tr>
                    <td>1</td>
                    <td>Mohammad Abu Dawwas</td>
                    <td>mdawwas</td>
                    <td>111</td>
                    <td>0</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Samer Raed</td>
                    <td>sraed</td>
                    <td>111</td>
                    <td>2</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>mousa Abu Dawwas</td>
                    <td>mousa_dawwas</td>
                    <td>111</td>
                    <td>1</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Ibrahim Q Al-Bzour</td>
                    <td>ibzour</td>
                    <td>111</td>
                    <td>2</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr><tr>
                    <td>1</td>
                    <td>Mohammad Abu Dawwas</td>
                    <td>mdawwas</td>
                    <td>111</td>
                    <td>0</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Samer Raed</td>
                    <td>sraed</td>
                    <td>111</td>
                    <td>2</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>mousa Abu Dawwas</td>
                    <td>mousa_dawwas</td>
                    <td>111</td>
                    <td>1</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>Ibrahim Q Al-Bzour</td>
                    <td>ibzour</td>
                    <td>111</td>
                    <td>2</td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
