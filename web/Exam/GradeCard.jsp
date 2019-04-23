<%-- 
    Document   : GradeCard
    Created on : Apr 11, 2019, 6:08:00 PM
    Author     : gshub
--%>

<%@page import="Bean.*"%>
<%@page import="DAO.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="../CommonThings/CDN.jsp" %>
        <link rel="stylesheet" href="../css/profile.css"/>
    </head>
    <style>

        .answers{
            width: 100%;
            height: 100%;
            padding: 10px;
            margin-top: 50px;
        }

        .left-details{
            text-align: center;
        }

        .row{
            padding: 2px;
            margin: 1px;
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
                    <li><a href="GradeCard.jsp.jsp">Grade Card</a></li>
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
                <%!
                    Subject sub;
                %>
                <%
                    if (session.getAttribute("id") != null) {
                        long id = Long.parseLong(session.getAttribute("id").toString());
                        StudentOperation stu = new StudentOperation();
                        SubjectOperation sub1 = new SubjectOperation();
                        AnswerOperation ao = new AnswerOperation();
                        QuestionOperation qo = new QuestionOperation();
                        Student student = stu.selectStudent(id);
                        StudentExamInfoImplDeclaration studentexam = new StudentExamInfoImpl();
                        List li = studentexam.selectAllStudentExamInformation();
                        ListIterator lit = li.listIterator();
                        double totalRightAnswerMarks = 0;
                        if (ao.WrongorRight("Right", student, sub) != null) {
                            List right = ao.WrongorRight("Right", student, sub);
                            ListIterator lir = right.listIterator();
                            while (lir.hasNext()) {
                                Answer ans = (Answer) lir.next();
                                totalRightAnswerMarks += ans.getQuestion().getMarks();
                            }
                        }
                %>
                <div class="row profile-name page-header">
                    <div class="col-md-4 left-details">
                        <img src="../images/avatar.jpg" height="200px" width="200px" alt="Avtar">
                        <br><br>
                        <h4 class="well well-sm">Name: <%=student.getName()%></h4>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="row">
                                <div class="col-sm-12 well well-sm">
                                    <h5>Contact: <%= student.getContact()%></h5>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 well well-sm">
                                    <h5>Address: <%= student.getAddress()%></h5>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 well well-sm">
                                    <h5>Email: <%= student.getEmail()%></h5>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 well well-sm">
                                    <h5>Course: <%= student.getCourse()%></h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th>Subject Name</th>
                                    <th>Actual Subject Marks</th>
                                    <th>Your Marks</th>
                                    <th>Percentage</th>
                                    <th>Pass Or Fail</th>
                                    <th>Exam Date</th>
                                </tr>
                            </thead>
                            <%
                                while (lit.hasNext()) {
                                    StudentExamInfo stud = (StudentExamInfo) lit.next();
                            %>
                            <tbody>
                                <tr>
                                    <td><%= stud.getSub().getSub_name() %></td>
                                    <td><%= stud.getSub().getSub_max_marks() %></td>
                                    <td><%= totalRightAnswerMarks %></td>
                                    <td><%= ((totalRightAnswerMarks * 100) / qo.SumOfMarks(sub)) + "%"%></td>
                                    <td><%= stud.getExamstatus() %></td>
                                    <td><%= stud.getDate() %></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%
                        }
                    }
                %>
            </div>
        </div>
    </body>
</html>
