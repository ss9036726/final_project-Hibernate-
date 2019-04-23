<%-- 
    Document   : SelectAllOptions
    Created on : Apr 8, 2019, 10:38:51 PM
    Author     : gshub
--%>

<%@page import="Bean.Admin"%>
<%@page import="Bean.Admin"%>
<%@page import="Bean.Questions"%>
<%@page import="DAO.QuestionOperation"%>
<%@page import="Bean.Questions_option"%>
<%@page import="jdk.nashorn.internal.runtime.options.Options"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.OptionsOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                    <li><a href="Add_Subject_Form.jsp">Add New Subject</a></li>
                    <li><a href="SelectAllQuestions.jsp">Show All Questions</a></li>
                    <li class="active"><a href="SelectAllOptions.jsp">Show All Options</a></li>
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
        <div class="container-fluid">
            <div class="jumbotron">
                <h2>Options Information Table</h2>
                <hr>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Option Id</th>
                            <th>Question Id</th>
                            <th>Subject Name</th>
                            <th>Option 1</th>
                            <th>Option 2</th>
                            <th>Option 3</th>
                            <th>Option 4</th>
                            <th>Option Action</th>
                        </tr>
                    </thead>
                    <%
                        OptionsOperation st = new OptionsOperation();
                        List li = st.selectAllOptions();
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Questions_option sub = (Questions_option) lit.next();
                    %>      
                    <tbody>
                        <tr>
                            <td><%= sub.getOption_id()%></td>
                            <td><%= sub.getQuestion_no().getQuestion_id() %></td>
                            <td><%= sub.getQuestion_no().getSubject().getSub_name() %></td>
                            <td><%= sub.getOption1()%></td>
                            <td><%= sub.getOption2()%></td>
                            <td><%= sub.getOption3()%></td>
                            <td><%= sub.getOption4()%></td>
                            <td><a href="OptionControl/Delete.jsp?id=<%= sub.getOption_id()%>" class="btn btn-md btn-danger">Delete</a></td>
                        </tr>
                    </tbody>
                    <% }%>
                </table>
            </div>
        </div>
    </body>
</html>
