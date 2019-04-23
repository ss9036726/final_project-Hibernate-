<%-- 
    Document   : Profile
    Created on : Apr 9, 2019, 9:38:36 AM
    Author     : gshub
--%>

<%@page import="Bean.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User-Dashboard</title>
        <%@include file="CommonThings/CDN.jsp" %>
        <link rel="stylesheet" href="css/user.css">
    </head>
    <body>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Online Test Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li ><a href="userhome.jsp">User Home</a></li>
                    <li><a href="Exams.jsp">Exams</a></li>
                    <li>
                        <%
                            if (session.getAttribute("LogedIn") == null) {
                        %>
                        <a href="UserLogin.jsp?pagename=<%= request.getRequestURI()%>">Login</a>
                        <%} else {
                            Student st = (Student) session.getAttribute("LogedIn");

                        %>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user"></span><%= st.getUsername()%>
                            <i class="caret"></i>
                        </a>
                        <ul id="userprofile" class="dropdown-menu">
                            <li><a href="Profile.jsp">Your Profile</a></li>
                            <li><a href="Logout"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
                        </ul>
                        <%
                            }
                        %>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <div class="jumbotron">
                <%
                    Student st = (Student) session.getAttribute("LogedIn");
                %>
                <div class="row">
                    <div class="col-md-12 header">
                        <h1>Welcome <%=st.getName()%></h1>
                    </div>
                </div>
                <img src="images/user.jpg" alt="Main-Image" width="100%" height="100%">

                <div class="row">
                    <div class="col-md-6">
                        <h1><i class="fa fa-user"></i> Profile</h1>
                        <p>You Can See Your Profile from here.</p>
                        <p><a href="Profile.jsp" class="btn btn-lg btn-primary">See your Profile</a></p>
                    </div>
                    <div class="col-md-6">
                        <h1><i class="fa fa-clock-o"></i> Exam</h1>
                        <p>You can your exam from here.</p>
                        <p><a href="Exams.jsp" class="btn btn-lg btn-primary">Test Your Skills</a></p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
