<%-- 
    Document   : Profile
    Created on : Apr 9, 2019, 9:38:36 AM
    Author     : gshub
--%>

<%@page import="Bean.Admin"%>
<%@page import="Bean.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="../CommonThings/CDN.jsp" %>
        <link rel="stylesheet" href="../css/user.css">
    </head>
    <body>

        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Online Test Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="adminhome.jsp">Admin Home</a></li>
                    <li><a href="ShowAllStudent.jsp">Student Details</a></li>
                    <li><a href="../registration.jsp">Add Student Details</a></li>
                    <li><a href="ShowSubjects.jsp">Subject Details</a></li>
                    <li><a href="Add_Subject_Form.jsp">Add New Subject</a></li>
                    <li><a href="SelectAllQuestions.jsp">Show All Questions</a></li>
                    <li><a href="SelectAllOptions.jsp">Show All Options</a></li>
                    <li><a href="showanswer.jsp">Show Answers</a></li>
                    <li>
                        <%
                            if (session.getAttribute("LogedIn") == null) {
                        %>
                        <a href="../Admin.jsp?pagename=<%= request.getRequestURI()%>">Login</a>
                        <%} else {
                            Admin st = (Admin) session.getAttribute("LogedIn");

                        %>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user"></span><%= st.getUsername()%>
                            <i class="caret"></i>
                        </a>
                        <ul id="userprofile" class="dropdown-menu">
                            <li><a href="../AdminLogout"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
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
                    Admin st = (Admin) session.getAttribute("LogedIn");
                %>
                <div class="row">
                    <div class="col-md-12 header">
                        <h1>Welcome <%=st.getUsername()%></h1>
                    </div>
                </div>
                <img src="../images/user.jpg" alt="Main-Image" width="100%" height="100%">
            </div>
        </div>
    </body>
</html>
