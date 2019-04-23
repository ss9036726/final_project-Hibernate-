<%-- 
    Document   : ShowAllStudent
    Created on : Apr 4, 2019, 2:47:28 PM
    Author     : gshub
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="DAO.*" %>
<%@ page import="Bean.*" %>
<%@ page import="org.hibernate.*" %>
<%@ page import="org.hibernate.cfg.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="../CommonThings/CDN.jsp" %>
        <link rel="stylesheet" href="../css/signup.css">
    </head>
    <style>
        body{
            margin: 0;
            padding: 0;
        }
        .jumbotron h2{
            text-align: center;
        }
    </style>
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
                    <li class="active"><a href="ShowSubjects.jsp">Subject Details</a></li>
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
                <form class="navbar-form navbar-left" action="">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search" name="search">
                    </div>
                    <button type="submit" name="submit_search" class="btn btn-default"><i class="glyphicon glyphicon-search"></i></button>
                </form>
            </div>
        </nav>
        <%
            if (request.getParameter("submit_search") != null) {
                String targetString = request.getParameter("search");

        %>

        <div class="container-fluid">
            <div class="jumbotron">
                <h2>Subject Information Table</h2>
                <hr>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Subject Name</th>
                            <th>Max Marks</th>
                            <th>Passing Marks</th>
                            <th>Total Questions</th>
                            <th>Course Duration</th>
                            <th>Fees</th>
                            <th>Offers</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <%                        
                        SubjectOperation st = new SubjectOperation();
                        List li = st.searchByName(targetString);
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Subject sub = (Subject) lit.next();
                    %>      
                    <tbody>
                        <tr>
                            <td><%= sub.getSub_id()%></td>
                            <td><%= sub.getSub_name()%></td>
                            <td><%= sub.getSub_max_marks()%></td>
                            <td><%= sub.getSub_passing_marks()%></td>
                            <td><%= sub.getSub_total_questions()%></td>
                            <td><%= sub.getSub_duration()%></td>
                            <td><%= sub.getSub_fees()%></td>
                            <td><%= sub.getSub_offers()%></td>
                            <td><a href="SubjectControl/Update.jsp?id=<%= sub.getSub_id()%>" class="btn btn-md btn-success">Update</a></td>
                            <td><a href="SubjectControl/Delete.jsp?id=<%= sub.getSub_id()%>" class="btn btn-md btn-danger">Delete</a></td>
                        </tr>
                    </tbody>
                    <% }%>
                </table>
            </div>
        </div>
        <%
        } else if (request.getParameter("submit_search") == null) {
        %>

        <div class="container-fluid">
            <div class="jumbotron">
                <h2>Subject Information Table</h2>
                <hr>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Subject Name</th>
                            <th>Max Marks</th>
                            <th>Passing Marks</th>
                            <th>Total Questions</th>
                            <th>Course Duration</th>
                            <th>Fees</th>
                            <th>Offers</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <%
                        SubjectOperation st = new SubjectOperation();
                        List li = st.selectAllSubjects();
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Subject sub = (Subject) lit.next();
                    %>      
                    <tbody>
                        <tr>
                            <td><%= sub.getSub_id()%></td>
                            <td><%= sub.getSub_name()%></td>
                            <td><%= sub.getSub_max_marks()%></td>
                            <td><%= sub.getSub_passing_marks()%></td>
                            <td><%= sub.getSub_total_questions()%></td>
                            <td><%= sub.getSub_duration()%></td>
                            <td><%= sub.getSub_fees()%></td>
                            <td><%= sub.getSub_offers()%></td>
                            <td><a href="SubjectControl/Update.jsp?id=<%= sub.getSub_id() %>" class="btn btn-md btn-success">Update</a></td>
                            <td><a href="SubjectControl/Delete.jsp?id=<%= sub.getSub_id() %>" class="btn btn-md btn-danger">Delete</a></td>
                        </tr>
                    </tbody>
                    <% }%>
                </table>
            </div>
        </div>
        <% }%>
    </body>
</html>
