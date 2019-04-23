<%-- 
    Document   : Profile
    Created on : Apr 9, 2019, 9:38:36 AM
    Author     : gshub
--%>

<%@page import="Bean.Subject"%>
<%@page import="Bean.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exams Page</title>
        <%@include file="CommonThings/CDN.jsp" %>
        <link rel="stylesheet" href="css/userexam.css"/>
    </head>
    
    <style>
        .jumbotron{
            margin: 150px auto;
        }
        body{
            color: white;
        }
        </style>
    <body>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Online Test Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li ><a href="userhome.jsp">User Home</a></li>
                    <li class="active"><a href="Exams.jsp">Exams</a></li>
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
                <h1>Select Your Language to take the test</h1>
                <h1><a href="Exam/selectLanguage.jsp" class="btn btn-block btn-warning btn-lg">Select Language</a></h1>
                <%  
                    Student st = (Student) session.getAttribute("LogedIn");
                    session.setAttribute("id",st.getS_id());
                %>
            </div>
        </div>
    </body>
</html>
