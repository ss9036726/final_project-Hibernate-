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
        <title>Profile Page</title>
        <%@include file="CommonThings/CDN.jsp" %>
        <link rel="stylesheet" href="css/profile.css">
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
                    <div class="col-md-4">
                        <img src="images/avatar.jpg" height="250px" width="300px" alt="Avtar">
                        <br><br>
                        <h3 class="well well-sm">Name: <%=st.getName()%></h3>
                        <br><br>
                        <!--<h3><a href="EditProfile.jsp?id=<%= st.getS_id()%>" class="btn btn-lg btn-block btn-danger">Edit Profile</a></h3>-->
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-12 well well-sm">
                                <h3>Student Id : <%= st.getS_id()%></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 well well-sm">
                                <h3>Email: <%= st.getEmail()%></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 well well-sm">
                                <h3>Course: <%= st.getCourse()%></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 well well-sm">
                                <h3>Contact: <%= st.getContact()%></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 well well-sm">
                                <h3>Address: <%= st.getAddress()%></h3>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-12 well well-sm">
                                <h3>Admission Date: <%= st.getAdmission_date()%></h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 well well-sm">
                                <h3>Fees: <%= st.getFees()%></h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
