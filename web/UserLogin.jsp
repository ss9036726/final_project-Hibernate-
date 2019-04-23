<%-- 
    Document   : UserLogin
    Created on : Apr 11, 2019, 9:47:09 PM
    Author     : gshub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <a href="Exams.jsp"></a>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login Page</title>
        <link rel="stylesheet" href="css/login.css">
        <%@include file="CommonThings/CDN.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="box">
                <form action="LogServlet" method="POST" class="form">
                    <h2 class="text-center">Log-In Form</h2>
                    <div class="form-group">
                        <input type="hidden" value="user" name="type">
                        <label for="username">Username</label>
                        <input type="text" name="username" placeholder="Enter Your Username" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" placeholder="Enter Your Password" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-lg btn-success">User Login</button>
                    <a href="Admin.jsp" type="submit" class="btn btn-lg btn-success">Admin Login</a>
                </form>
            </div>
        </div>
    </body>
</html>
