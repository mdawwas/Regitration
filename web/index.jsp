<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.atypon.utility.User" %><%--
  Created by IntelliJ IDEA.
  User: mdawwas
  Date: 5/24/17
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Login page</title>
    <link rel="shortcut icon" href="https://www.atypon.com/wp-content/themes/atypon/assets/favicon.ico">
    <link rel="stylesheet" type="text/css" href="login.css">
    <link rel="stylesheet" type="text/css" href="all_in.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  </head>
  <body>
    <%--<c:if test = "${not empty requestScope.message}">--%>
      <%--<script type="javascript">--%>
        <%--alert(${requestScope.error});--%>
      <%--</script>--%>
    <%--</c:if>--%>
    <c:if test = "${not empty sessionScope.user}">
      <c:redirect url = "/home.page"/>
    </c:if>
    <div class="container">
      <img src="https://www.trendmd.com/assets/new_landing/customers/atypon-38a9c282d1fbb5a5268d91759d9ed6de.png" class = "login-img">
      <div class="login-container">
        <div id="output"></div>
        <div class="avatar"></div>
        <div class="form-box">
          <form action="/login.do" method="post">
            <input name="username" type="text" placeholder="username">
            <input name ="password" type="password" placeholder="password">
            <button class="btn btn-info btn-block login" type="submit">Login</button>
          </form>
        </div>
      </div>

    </div>
  </body>
</html>
