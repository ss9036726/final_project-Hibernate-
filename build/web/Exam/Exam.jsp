<%-- 
    Document   : Exam
    Created on : Apr 9, 2019, 10:24:14 AM
    Author     : gshub
--%>

<%@page import="Bean.Student"%>
<%@page import="DAO.StudentOperation"%>
<%@page import="DAO.OptionsOperation"%>
<%@page import="Bean.Questions_option"%>
<%@page import="Bean.Questions"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="DAO.QuestionOperation"%>
<%@page import="Bean.Subject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Page</title>
        <%@include file="../CommonThings/CDN.jsp" %>
        <link rel="stylesheet" href="../css/userexam.css">
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Online Test Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li ><a href="../userhome.jsp">User Home</a></li>
                    <li class="active"><a href="../Exams.jsp">Exams</a></li>
                    <li>
                        <%
                            if (session.getAttribute("LogedIn") == null) {
                        %>
                        <a href="../UserLogin.jsp?pagename=<%= request.getRequestURI()%>">Login</a>
                        <%} else {
                            Student st = (Student) session.getAttribute("LogedIn");

                        %>
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <span class="glyphicon glyphicon-user"></span><%= st.getUsername()%>
                            <i class="caret"></i>
                        </a>
                        <ul id="userprofile" class="dropdown-menu">
                            <li><a href="../Profile.jsp">Your Profile</a></li>
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
                    StudentOperation so = new StudentOperation();
                    SubjectOperation sb = new SubjectOperation();
                    Student student;
                    Subject sub;
                    long id = Long.parseLong(session.getAttribute("id").toString());
                    student = so.selectStudent(id);
                    long qno = 0;
                    boolean flag = false;
                    if (request.getParameter("submit") != null) {
                        long subid = Long.parseLong(request.getParameter("subject"));
                        QuestionOperation qo = new QuestionOperation();
                        sub = sb.selectSubject(subid);

                %>
                <h1>Subject Id: <%= sub.getSub_id() + " Subject Name: " + sub.getSub_name()%></h1>
                <%
                    if (qo.selectNotIn(sub, student) != null) {
                        List li = qo.selectNotIn(sub, student);
                        int size = li.size();
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            qno++;
                            Questions qo1 = (Questions) lit.next();
                            String qtype = qo1.getQuestion_type();
                            if (qno == size) {
                                flag = true;
                            }
                            if (qtype.equals("written")) {
                %>
                <div class="well well-sm">  
                    <form action="../Question_Check_Store">

                        <h2>Question Type: <%= qtype%></h2>
                        <h3>(<%= qno%>) : <%= qo1.getQuestion_text()%> <span class="badge badge-success">For <%= qo1.getMarks()%> marks</span></h3>
                        <textarea name="answer" id="" cols="30" rows="10" class="form-control"></textarea>

                        <ul class="pager">
                            <input type="hidden" value="<%= qo1.getQuestion_id()%>" name="qid">
                            <input type="hidden" value="<%= sub.getSub_id()%>" name="subid">
                            <input type="hidden" value="<%= flag%>" name="flag">
                            <button type="submit" name="submit" class="btn btn-primary btn-block btn-md">Next</button>
                        </ul>
                    </form>
                </div>
                <%
                } else if (qtype.equals("optional")) {
                    Questions_option qoption;
                    OptionsOperation oo = new OptionsOperation();
                    List li2 = oo.searchByQuestions(qo1);
                    ListIterator lit2 = li2.listIterator();
                    while (lit2.hasNext()) {
                        qoption = (Questions_option) lit2.next();

                %>
                <div class="well well-sm"> 
                    <form action="../Question_Check_Store">
                        <h2>Question Type: <%= qtype%></h2>
                        <h3>(<%= qno%>) : <%= qo1.getQuestion_text()%> <span class="badge badge-success">For <%= qo1.getMarks()%> marks</span></h3>

                        <ul class="list-group radio">
                            <li class="list-group-item">&nbsp;&nbsp;&nbsp;<input type="radio" value="<%= qoption.getOption1()%>" name="answer"><%= qoption.getOption1()%></li>
                            <li class="list-group-item">&nbsp;&nbsp;&nbsp;<input type="radio" value="<%= qoption.getOption2()%>" name="answer"><%= qoption.getOption2()%></li>
                            <li class="list-group-item">&nbsp;&nbsp;&nbsp;<input type="radio" value="<%= qoption.getOption3()%>" name="answer"><%= qoption.getOption3()%></li>
                            <li class="list-group-item">&nbsp;&nbsp;&nbsp;<input type="radio" value="<%= qoption.getOption4()%>" name="answer"><%= qoption.getOption4()%></li>
                        </ul>

                        <ul class="pager">
                            <input type="hidden" value="<%= qo1.getQuestion_id()%>" name="qid">
                            <input type="hidden" value="<%= sub.getSub_id()%>" name="subid">
                            <input type="hidden" value="<%= flag%>" name="flag">
                            <button type="submit" name="submit" class="btn btn-primary btn-block btn-md">Next</button>
                        </ul>
                    </form>
                </div>
                <%      }

                        } else {
                            out.println("Follow The Exam Phase Don't Run this page Directly!");
                        }
                    }
                } else {
                    out.println("<h3>Looks like you have given the exam or No questions are their for this Subject</h3>");
                %>
                <br><h4>Check Your Previous Result for <%= sub.getSub_name()%> <a class="btn btn-md btn-success" href="Result.jsp?sub=<%= sub.getSub_id() %>">See Result</a></h4> 
                <%
                        }
                    } else {
                        out.println("Something Went Wrong");
                        response.sendRedirect("");
                    }%>
                </form>
            </div>
        </div>
    </body>
</html>
