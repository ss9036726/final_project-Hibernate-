<%-- 
    Document   : selectLanguage
    Created on : Apr 9, 2019, 9:39:02 AM
    Author     : gshub
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="Bean.*"%>
<%@page import="DAO.StudentOperation"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Language Page</title>
        <%@include file="../CommonThings/CDN.jsp" %>
        <link rel="stylesheet" href="../css/userexam.css"/>
    </head>
    <style>
        body{
            color: blue;
        }
        .jumbotron{
            margin: 120px auto;
        }
    </style>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Online Test Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li ><a href="#">User Home</a></li>
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
                <h1>Examination Process -> Phase 1</h1>
                <form action="Exam.jsp">
                    <div class="form-group">
                        <label for="sel1">Select your subject</label>
                        <select class="form-control" name="subject">
                            <%
                                long sid = Long.parseLong(session.getAttribute("id").toString());
                                StudentOperation sto = new StudentOperation();
                                if (sto.selectStudent(sid) != null) {
                                    Student st = sto.selectStudent(sid);
                                    Set subjectlist = st.getSubjectList();
                                    Iterator ite = subjectlist.iterator();
                                    while (ite.hasNext()) {
                                        Subject sub = (Subject) ite.next();
                            %>
                            <option value="<%=sub.getSub_id()%>"><%= sub.getSub_name()%></option>
                            <% }
                                }
                            %>
                        </select>
                    </div>
                    <input type="submit" class="btn btn-md btn-success" name="submit" value="Go And Take the Exam">
                </form>
            </div>
        </div>
    </body>
</html>
