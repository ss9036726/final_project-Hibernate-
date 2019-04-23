<%-- 
    Document   : registration.jsp
    Created on : Apr 4, 2019, 11:03:51 AM
    Author     : gshub
--%>

<%@page import="java.util.*"%>
<%@page import="Bean.*"%>
<%@page import="DAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Admin Page</title>
        <%@include file="../../CommonThings/CDN.jsp" %>
        <link rel="stylesheet" href="../../css/signup.css">
    </head>
    <%!
        long id;
        StudentOperation st = new StudentOperation();
        Student st1;
        Subject sub;
    %>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Online Test Portal</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="#">Admin Home</a></li>
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
                        <a href="UserLogin.jsp?pagename=<%= request.getRequestURI()%>">Login</a>
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
                id = Long.parseLong(request.getParameter("id"));
                st1 = st.selectStudent(id);
                if (st1 != null) {
        %>
        <div class="container-fluid">
            <h1>Update Data</h1>
            <div class="row">
                <div class="col-sm-6">
                    <div class="jumbotron">
                        <form action="../../FinalUpdate" method="POST">
                            <input type="hidden" value="<%= st1.getS_id()%>" name="id">
                            <div class="form-group">
                                <label for="name">Name</label>
                                <input type="text" name="name" value="<%= st1.getName()%>" class="form-control" placeholder="Enter Your Name">
                            </div>
                            <div class="form-group">
                                <label for="address">Address</label>
                                <input type="text" name="address" value="<%= st1.getAddress()%>" class="form-control" placeholder="Enter Your Address">
                            </div>
                            <div class="form-group">
                                <label for="fees">Fees</label>
                                <input type="number" name="fees" value="<%= st1.getFees()%>" class="form-control" placeholder="Enter Fees">
                            </div>
                            <div class="form-group">
                                <label for="admission_date">Admission Date</label>
                                <input type="date" name="admission_date" value="<%= st1.getAdmission_date()%>" class="form-control" placeholder="Enter Admission Date">
                            </div>
                            <div class="form-group">
                                <label for="contact">Contact No.</label>
                                <input type="text" name="contact" value="<%= st1.getContact()%>" class="form-control" placeholder="Enter Contact Number">
                            </div>
                            <div class="form-group">
                                <label for="course">Course</label>
                                <input type="text" name="course" value="<%= st1.getCourse()%>" class="form-control" placeholder="Enter Course">
                            </div>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" name="username" value="<%= st1.getUsername()%>" class="form-control" placeholder="Enter your Username">
                            </div>
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="email" name="email" value="<%= st1.getEmail()%>" class="form-control" placeholder="Enter your Email">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" value="<%= st1.getPassword()%>" class="form-control" placeholder="Enter password">
                            </div>

                            <button type="submit" class="btn btn-success btn-block btn-lg" value="Update">Update</button>
                        </form>
                        <%}
                            } else {
                                out.print("Select any record cause ID is null");
                            }%>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <h3>Taken By Student</h3>
                                <ul>
                                    <form action="../../RemoveSubjectFormStudent" method="GET">
                                        <%
                                            StudentOperation st2 = new StudentOperation();
                                            Student stud = st2.selectStudent(id);
                                            Set s = stud.getSubjectList();
                                            Iterator ite = s.iterator();
                                            int i = 0;
                                            while (ite.hasNext()) {
                                                i++;
                                                Subject sub2 = (Subject) ite.next();

                                        %>

                                        <li class="list-group-item">
                                            <input type="checkbox" name="<%= sub2.getSub_name()%>" value="<%= sub2.getSub_id()%>">&nbsp;&nbsp;&nbsp;&nbsp;<%= sub2.getSub_name()%>
                                        </li>
                                        <%}%>
                                        <input type="hidden" name="id" value="<%= id%>"><br><br>
                                        <button type="submit" name="removesub" class="btn btn-md btn-success" value="Add">Remove Subject From Student</button>
                                    </form>
                                </ul>

                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <h3>All Available Subjects</h3>
                                <ul class="list-group">
                                    <form action="../../AddSubjectControl">
                                        <%
                                            SubjectOperation su = new SubjectOperation();
                                            List li = su.selectAllSubjects();
                                            Iterator itr = li.iterator();
                                            while (itr.hasNext()) {
                                                sub = (Subject) itr.next();
                                        %>

                                        <li class="list-group-item">
                                            <input type="checkbox" name="<%= sub.getSub_name()%>" value="<%= sub.getSub_id()%>">&nbsp;&nbsp;&nbsp;&nbsp;<%= sub.getSub_name()%>
                                        </li>
                                        <%}%>
                                        <input type="hidden" name="id" value="<%= id%>"><br><br>
                                        <button type="submit" name="addsub" class="btn btn-md btn-success" value="Add">Add Subject To Student</button>
                                    </form>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
