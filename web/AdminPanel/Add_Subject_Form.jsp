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
        <title>Admin Page</title>
        <%@include file="../CommonThings/CDN.jsp" %>
        <link rel="stylesheet" href="../css/signup.css">
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Online Test Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="adminhome.jsp">Admin Home</a></li>
                    <li><a href="ShowAllStudent.jsp">Student Details</a></li>
                    <li><a href="../registration.jsp">Add Student Details</a></li>
                    <li><a href="ShowSubjects.jsp">Subject Details</a></li>
                    <li class="active"><a href="Add_Subject_Form.jsp">Add New Subject</a></li>
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
            <h1>Add Subject Form</h1>
            <div class="jumbotron">
                <form action="../AddSubjects" method="POST">
                    <div class="form-group">
                        <label for="sub_name">Subject Name</label>
                        <input type="text" name="sub_name" class="form-control" placeholder="Enter Subject Name">
                    </div>
                    <div class="form-group">
                        <label for="sub_max_marks">Subject Max Marks</label>
                        <input type="text" name="sub_max_marks" class="form-control" placeholder="Enter Max Marks">
                    </div>
                    <div class="form-group">
                        <label for="sub_passing_marks">Subject Passing Marks</label>
                        <input type="text" name="sub_passing_marks" class="form-control" placeholder="Enter Passing Marks">
                    </div>
                    <div class="form-group">
                        <label for="sub_total_questions">Subject Total Questions</label>
                        <input type="text" name="sub_total_questions" class="form-control" placeholder="Enter Total Questions">
                    </div>
                    <div class="form-group">
                        <label for="sub_duration">Subject Duration</label>
                        <input type="text" name="sub_duration" class="form-control" placeholder="Enter Subject Duration">
                    </div>
                    <div class="form-group">
                        <label for="sub_fees">Subject Fees</label>
                        <input type="text" name="sub_fees" class="form-control" placeholder="Enter Subject Fees">
                    </div>
                    <div class="form-group">
                        <label for="sub_offers">Subject Offers</label>
                        <input type="text" name="sub_offers" class="form-control" placeholder="Enter Subject Offers">
                    </div>
                    <input type="submit" class="btn btn-success btn-block btn-lg" value="Add Subjects">
                </form>
            </div>
        </div>
    </body>
</html>
