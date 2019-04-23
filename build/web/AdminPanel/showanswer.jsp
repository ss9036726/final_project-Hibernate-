<%-- 
    Document   : SelectAllOptions
    Created on : Apr 8, 2019, 10:38:51 PM
    Author     : gshub
--%>

<%@page import="Bean.Admin"%>
<%@page import="Bean.Answer"%>
<%@page import="DAO.AnswerOperation"%>
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
                    <li ><a href="SelectAllQuestions.jsp">Show All Questions</a></li>
                    <li><a href="SelectAllOptions.jsp">Show All Options</a></li>
                    <li><a href="AddQuestion.jsp">Add Questions</a></li>
                    <li class="active"><a href="showanswer.jsp">Show Answers</a></li>
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
                <h2>Student Answers Information Table</h2>
                <hr>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Answer Id</th>
                            <th>Subject Name</th>
                            <th>Student Name</th>
                            <th>Question Id</th>
                            <th>Question Marks</th>
                            <th>Question Type</th>
                            <th>Question Text</th>
                            <th>Actual Answer Text</th>
                            <th>Student Answer Text</th>
                            <th>Answer Date</th>
                            <th>Right Or Wrong</th>
                            <th></th>
                        </tr>
                    </thead>
                    <%  
                        AnswerOperation st = new AnswerOperation();
                        List li = st.selectAllAnswers();
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Answer sub = (Answer) lit.next();
                    %>      
                    <tbody>
                        <tr>
                            <td><%= sub.getId() %></td>
                            <td><%= sub.getSubjectid().getSub_name() %></td>
                            <td><%= sub.getStudent().getUsername() %></td>
                            <td><%= sub.getQuestion().getQuestion_id() %></td>
                            <td><%= sub.getQuestion().getMarks() %></td>
                            <td><%= sub.getQuestion().getQuestion_type() %></td>
                            <td><%= sub.getQuestion().getQuestion_text() %></td>
                            <td><%= sub.getQuestion().getAnswer_text() %></td>
                            <td><%= sub.getAnswer_text() %></td>
                            <td><%= sub.getAnswer_date() %></td>
                            <td><%= sub.getWrongorRight() %></td>
                            <td><a href="AnswerControl/Delete.jsp?id=<%= sub.getId() %>" class="btn btn-md btn-danger">Delete</a></td>
                        </tr>
                    </tbody>
                    <% }%>
                </table>
            </div>
        </div>
    </body>
</html>
