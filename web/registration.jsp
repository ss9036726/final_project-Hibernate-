<%-- 
    Document   : registration.jsp
    Created on : Apr 4, 2019, 11:03:51 AM
    Author     : gshub
--%>

<%@page import="Bean.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Online Test Plateform</title>
        <%@include file="CommonThings/CDN.jsp" %>
        <link rel="stylesheet" href="css/signup.css">
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Online Test Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li ><a href="#">Admin Home</a></li>
                    <li><a href="AdminPanel/ShowAllStudent.jsp">Student Details</a></li>
                    <li class="active"><a href="registration.jsp">Add Student Details</a></li>
                    <li ><a href="AdminPanel/ShowSubjects.jsp">Subject Details</a></li>
                    <li><a href="AdminPanel/Add_Subject_Form.jsp">Add New Subject</a></li>
                    <li><a href="AdminPanel/SelectAllQuestions.jsp">Show All Questions</a></li>
                    <li><a href="AdminPanel/SelectAllOptions.jsp">Show All Options</a></li>
                    <li><a href="AdminPanel/showanswer.jsp">Show Answers</a></li>
                    <li>
                        <%
                            if (session.getAttribute("LogedIn") == null) {
                        %>
                        <a href="UserLogin.jsp?pagename=<%= request.getRequestURI()%>">Login</a>
                        <%} else {
                            Admin st = (Admin) session.getAttribute("LogedIn");

                        %>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user"></span><%= st.getUsername()%>
                            <i class="caret"></i>
                        </a>
                        <ul id="userprofile" class="dropdown-menu">
                            <li><a href="AdminLogout"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
                        </ul>
                        <%
                            }
                        %>
                    </li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <h1>Student Registration Form</h1>
            <div class="jumbotron">
                <form action="StudentRegistration" method="POST">
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" name="name" class="form-control" placeholder="Enter Your Name">
                    </div>
                    <div class="form-group">
                        <label for="address">Address</label>
                        <input type="text" name="address" class="form-control" placeholder="Enter Your Address">
                    </div>
                    <div class="form-group">
                        <label for="fees">Fees</label>
                        <input type="number" name="fees" class="form-control" placeholder="Enter Fees">
                    </div>
                    <div class="form-group">
                        <label for="admission_date">Admission Date</label>
                        <input type="date" name="admission_date" class="form-control" placeholder="Enter Admission Date">
                    </div>
                    <div class="form-group">
                        <label for="contact">Contact No.</label>
                        <input type="text" name="contact" class="form-control" placeholder="Enter Contact Number">
                    </div>
                    <div class="form-group">
                        <label for="course">Course</label>
                        <input type="text" name="course" class="form-control" placeholder="Enter Course">
                    </div>
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" name="username" class="form-control" placeholder="Enter your Username">
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" name="email" class="form-control" placeholder="Enter your Email">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" class="form-control" placeholder="Enter password">
                    </div>

                    <input type="submit" class="btn btn-success btn-block btn-lg" value="Register">
                </form>
            </div>
        </div>
    </body>
</html>
