<%-- 
    Document   : Delete
    Created on : Apr 4, 2019, 3:33:36 PM
    Author     : gshub
--%>

<%@page import="DAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Test Portal</title>
    </head>
    <body>
        <%
            long id = Long.parseLong(request.getParameter("id"));
            AnswerOperation st = new AnswerOperation();
            boolean flag = st.delete(id);
            if(flag){
                response.sendRedirect("../showanswer.jsp");
            } else {
                out.print("There is Something Wrong so try again otherwise contact to admin");
            }
        %>
    </body>
</html>
