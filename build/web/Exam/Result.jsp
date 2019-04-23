<%-- 
    Document   : Result
    Created on : Apr 9, 2019, 5:08:25 PM
    Author     : gshub
--%>

<%@page import="DAO.QuestionOperation"%>
<%@page import="java.util.Collections.*"%>
<%@page import="Bean.Answer"%>
<%@page import="java.util.*"%>
<%@page import="Bean.Subject"%>
<%@page import="Bean.Student"%>
<%@page import="DAO.AnswerOperation"%>
<%@page import="DAO.SubjectOperation"%>
<%@page import="DAO.SubjectDeclaration"%>
<%@page import="DAO.StudentOperation"%>
<%@page import="DAO.StudentDeclaration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Page</title>
        <%@include file="../CommonThings/CDN.jsp" %>
        <link rel="stylesheet" href="../css/signup.css"/>
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
                            <li><a href="../Logout"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
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
                <%
                    if (session.getAttribute("id") != null) {
                        long id = Long.parseLong(session.getAttribute("id").toString());
                        long subid = Long.parseLong(request.getParameter("sub"));

                        StudentDeclaration sd = new StudentOperation();
                        SubjectDeclaration sdo = new SubjectOperation();
                        AnswerOperation ao = new AnswerOperation();
                        QuestionOperation qo = new QuestionOperation();

                        Student st = sd.selectStudent(id);
                        Subject sub = sdo.selectSubject(subid);
                        List li = ao.searchByStudent$language(st, sub);
                        ListIterator lt = li.listIterator();

                        long totalQuestions = qo.selectBySubject(sub).size();
                        long attemptQuestions = li.size();
                        
                        double totalmarksofsubject = qo.SumOfMarks(sub);
                        double totalmarksofstudent = 0.0;
                        ListIterator lit = li.listIterator();
                        long qno = 0;

                        double totalRightAnswerMarks = 0;
                        if (ao.WrongorRight("Right", st, sub) != null) {
                            List right = ao.WrongorRight("Right", st, sub);
                            ListIterator lir = right.listIterator();
                            while (lir.hasNext()) {
                                Answer ans = (Answer) lir.next();
                                totalRightAnswerMarks += ans.getQuestion().getMarks();
                            }
                        }
                %>
                <div class="row profile-name page-header">
                    <div class="col-sm-2 left-details">
                        <img src="../images/avatar.jpg" height="130px" width="150px" alt="Avtar">
                        <br><br>
                        <h4>Name: <%=st.getName()%></h4>
                    </div>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h5>Contact: <%= st.getContact()%></h5>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h5>Address: <%= st.getAddress()%></h5>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h5>Email: <%= st.getEmail()%></h5>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h5>Course: <%= st.getCourse()%></h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5>Total Subjects: <%= st.getSubjectList().size()%></h5>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5>Total Question: <%= totalQuestions%></h5>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5>Total attempted Question: <%= attemptQuestions%></h5>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5>Total Marks For <%= sub.getSub_name() + " " + qo.SumOfMarks(sub)%></h5>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h5>Total Marks For Right Answer<%= totalRightAnswerMarks%></h5>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12" style="color:#990000; font-weight: bold;">
                                            <h4>
                                                You Are <%= ((totalRightAnswerMarks * 100) / qo.SumOfMarks(sub)) < 40 ? "Fail" : "Passed"%><br>
                                                You Got <%= ((totalRightAnswerMarks * 100) / qo.SumOfMarks(sub)) + "% required 40% minimum"%>
                                            </h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-sm-12">
                                <div class="progress">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: <%= ((totalRightAnswerMarks * 100) / qo.SumOfMarks(sub)) + "%"%>;">
                                        <%= ((totalRightAnswerMarks * 100) / qo.SumOfMarks(sub)) + "%"%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <h3><a href="#" class="btn btn-md btn-warning">Check Your Grade Card</a></h3>
                        <h4 style="color: red;font-weight: bold;">No Grade Card available at this moment please contact to admin for Grade Card.</h4>
                        <hr style="border:thin dashed Black">
                        <h3><a href="#" class="btn btn-md btn-warning">Request for Certificate</a></h3>
                    </div>
                </div>
                <%
                    while (lt.hasNext()) {
                        qno++;
                        Answer ans = (Answer) lt.next();
                        
                %>
                <div class="row answers">
                    <div class="col-sm-2">
                        <div class="row">
                            <div class="col-sm-12 well well-sm">
                                Question: <%=qno%>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 well well-sm">
                                Your Answer
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 well well-sm">
                                Right Answer
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-sm-12 well well-sm"><%= ans.getQuestion().getQuestion_text()%></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 well well-sm"><%= ans.getAnswer_text()%></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12 well well-sm"><%= ans.getQuestion().getAnswer_text()%></div>
                        </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-sm-12 well well-sm"><%= ans.getWrongorRight()%></div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-sm-12 well well-sm">Try Again</div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-sm-12 well well-sm">Not Satisfied</div>
                            </div>
                        </div>
                    </div>
                    <%}
                        }%>
                </div>
                <br>
            </div>
        </div>
    </body>
</html>
