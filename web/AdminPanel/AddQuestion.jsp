<%-- 
    Document   : AddQuestion
    Created on : Apr 6, 2019, 5:03:29 PM
    Author     : gshub
--%>

<%@page import="Bean.*"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <%@include file="../CommonThings/CDN.jsp" %>
        <link rel="stylesheet" href="../css/signup.css"/>
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
                    <li><a href="SelectAllOptions.jsp">Show All Options</a></li>
                    <li class="active"><a href="AddQuestion.jsp">Add Questions</a></li>
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
                <h2>Add Questions Form</h2>
                <form action="../AddQuestionController" method="GET">
                    <div class="form-group">
                        <label for="question_marks">Select Any Subject to add Questions</label>
                        <select name="sub_id" class="form-control">
                            <%
                                SubjectOperation st = new SubjectOperation();

                                if (st.selectAllSubjects() != null) {
                                    List li = st.selectAllSubjects();
                                    ListIterator lit = li.listIterator();
                                    while (lit.hasNext()) {
                                        Subject sub = (Subject) lit.next();

                            %>
                            <option value="<%= sub.getSub_id()%>"><%= sub.getSub_name()%></option>
                            <%}%>

                        </select>
                    </div>
                    <div class="form-group">
                        <label for="question_marks">Question Marks:</label>
                        <input type="text" class="form-control" id="questions_marks" placeholder="Questions Marks" name="question_marks">
                    </div>
                    <div class="form-group" id="q_option">
                        <label for="question_type">Question Type:</label>
                        <select name="question_type" id="question_type" class="form-control">
                            <option value="written" selected>Written</option>
                            <option value="optional">Optional</option>
                            
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="question_text">Question Text</label>
                        <input type="text" class="form-control" id="question_text" placeholder="Question Text" name="question_text">
                    </div>
                    <div class="form-group" id="qoptions" style="display: none;">
                        <label for="options">Add Options For this Question:</label>
                        &nbsp;<input type="text" class="form-control" placeholder="Option 1" id="option1" name="qoption1">
                        &nbsp;<input type="text" class="form-control" placeholder="Option 2" id="option2" name="qoption2">
                        &nbsp;<input type="text" class="form-control" placeholder="Option 3" id="option3" name="qoption3">
                        &nbsp;<input type="text" class="form-control" placeholder="Option 4" id="option4" name="qoption4">
                    </div>
                    <div class="form-group">
                        <label for="answer_text">Answer Text</label>
                        <input type="text" class="form-control" id="answer_text" placeholder="Answer Text" name="answer_text">
                    </div>
                    <button type="submit" class="btn btn-lg btn-success">Add Question</button>
                </form>
                <%} else {
                        out.println("No Subject Available");
                    }%>
                <h1 style="color:red;"><%= request.getParameter("result") != null ? request.getParameter("result") : ""%></h1>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#q_option').change(function () {
                    var optionSelected = $(this).find("option:selected");
                    var textSelected = optionSelected.text();
                    if (textSelected == "Optional") {
                        $('#qoptions').slideDown(1000);
                    } else if (textSelected == "Written") {
                        $('#qoptions').slideUp(1000);
                    }
                });
            });
        </script>
    </body>
</html>
