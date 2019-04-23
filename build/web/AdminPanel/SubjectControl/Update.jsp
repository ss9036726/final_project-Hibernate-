<%-- 
    Document   : registration.jsp
    Created on : Apr 4, 2019, 11:03:51 AM
    Author     : gshub
--%>

<%@page import="DAO.SubjectOperation"%>
<%@page import="Bean.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Admin Page</title>
        
        <%@include file="../../CommonThings/CDN.jsp" %>
        <link rel="stylesheet" href="../../css/signup.css">
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Online Test Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li ><a href="#">Admin Home</a></li>
                    <li><a href="../ShowAllStudent.jsp">Student Details</a></li>
                    <li><a href="../../registration.jsp">Add Student Details</a></li>
                    <li ><a href="../ShowSubjects.jsp">Subject Details</a></li>
                    <li><a href="../Add_Subject_Form.jsp">Add New Subject</a></li>
                    <li><a href="../SelectAllQuestions.jsp">Show All Questions</a></li>
                    <li><a href="../SelectAllOptions.jsp">Show All Options</a></li>
                    <li>
                        <%
                            if (session.getAttribute("LogedIn") == null) {
                        %>
                        <a href="../../Admin.jsp?pagename=<%= request.getRequestURI()%>">Login</a>
                        <%} else {
                            Admin st = (Admin) session.getAttribute("LogedIn");

                        %>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user"></span><%= st.getUsername()%>
                            <i class="caret"></i>
                        </a>
                        <ul id="userprofile" class="dropdown-menu">
                            <li><a href="../../AdminLogout"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
                        </ul>
                        <%
                            }
                        %>
                    </li>
                </ul>
            </div>
        </nav>

        <%
            if (request.getParameter("id") != null) {
                int id = Integer.parseInt(request.getParameter("id"));
                SubjectOperation st = new SubjectOperation();
                Subject st1 = st.selectSubject(id);
                if (st1 != null) {
        %>

        <div class="container">
            <h1>Update Subject Form</h1>
            <div class="jumbotron">
                <form action="../../SubjectUpdate" method="POST">
                    <input type="hidden" value="<%= st1.getSub_id()%>" name="id">
                    <div class="form-group">
                        <label for="sub_name">Subject Name</label>
                        <input type="text" value="<%= st1.getSub_name()%>" name="sub_name" class="form-control" placeholder="Enter Subject Name">
                    </div>
                    <div class="form-group">
                        <label for="sub_max_marks">Subject Max Marks</label>
                        <input type="text" value="<%= st1.getSub_max_marks()%>" name="sub_max_marks" class="form-control" placeholder="Enter Max Marks">
                    </div>
                    <div class="form-group">
                        <label for="sub_passing_marks">Subject Passing Marks</label>
                        <input type="text" value="<%= st1.getSub_passing_marks()%>" name="sub_passing_marks" class="form-control" placeholder="Enter Passing Marks">
                    </div>
                    <div class="form-group">
                        <label for="sub_total_questions">Subject Total Questions</label>
                        <input type="text" value="<%= st1.getSub_total_questions()%>" name="sub_total_questions" class="form-control" placeholder="Enter Total Questions">
                    </div>
                    <div class="form-group">
                        <label for="sub_duration">Subject Duration</label>
                        <input type="text" value="<%= st1.getSub_duration()%>" name="sub_duration" class="form-control" placeholder="Enter Subject Duration">
                    </div>
                    <div class="form-group">
                        <label for="sub_fees">Subject Fees</label>
                        <input type="text" value="<%= st1.getSub_fees()%>" name="sub_fees" class="form-control" placeholder="Enter Subject Fees">
                    </div>
                    <div class="form-group">
                        <label for="sub_offers">Subject Offers</label>
                        <input type="text" value="<%= st1.getSub_offers()%>" name="sub_offers" class="form-control" placeholder="Enter Subject Offers">
                    </div>
                    <input type="submit" class="btn btn-success btn-block btn-lg" value="Update Subject">
                </form>
            </div>
            <%
                } else {
                    out.print("Select any record cause ID is null");
                }}%>
        </div>
    </body>
</html>
