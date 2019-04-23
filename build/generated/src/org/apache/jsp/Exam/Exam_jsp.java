package org.apache.jsp.Exam;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Bean.Student;
import DAO.StudentOperation;
import DAO.OptionsOperation;
import Bean.Questions_option;
import Bean.Questions;
import java.util.ListIterator;
import java.util.List;
import DAO.SubjectOperation;
import DAO.QuestionOperation;
import Bean.Subject;

public final class Exam_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/Exam/../CommonThings/CDN.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Exam Page</title>\n");
      out.write("        ");
      out.write("<link rel=\"stylesheet\" media=\"screen\" href=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js\"></script>");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/userexam.css\">\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-inverse\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <a class=\"navbar-brand\" href=\"#\">Online Test Portal</a>\n");
      out.write("                </div>\n");
      out.write("                <ul class=\"nav navbar-nav\">\n");
      out.write("                    <li ><a href=\"../userhome.jsp\">User Home</a></li>\n");
      out.write("                    <li class=\"active\"><a href=\"../Exams.jsp\">Exams</a></li>\n");
      out.write("                    <li>\n");
      out.write("                        ");

                            if (session.getAttribute("LogedIn") == null) {
                        
      out.write("\n");
      out.write("                        <a href=\"../UserLogin.jsp?pagename=");
      out.print( request.getRequestURI());
      out.write("\">Login</a>\n");
      out.write("                        ");
} else {
                            Student st = (Student) session.getAttribute("LogedIn");

                        
      out.write("\n");
      out.write("                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">\n");
      out.write("                            <span class=\"glyphicon glyphicon-user\"></span>");
      out.print( st.getUsername());
      out.write("\n");
      out.write("                            <i class=\"caret\"></i>\n");
      out.write("                        </a>\n");
      out.write("                        <ul id=\"userprofile\" class=\"dropdown-menu\">\n");
      out.write("                            <li><a href=\"../Profile.jsp\">Your Profile</a></li>\n");
      out.write("                            <li><a href=\"Logout\"><i class=\"fa fa-sign-out\" aria-hidden=\"true\"></i>Logout</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"jumbotron\">\n");
      out.write("\n");
      out.write("                ");

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

                
      out.write("\n");
      out.write("                <h1>Subject Id: ");
      out.print( sub.getSub_id() + " Subject Name: " + sub.getSub_name());
      out.write("</h1>\n");
      out.write("                ");

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
                
      out.write("\n");
      out.write("                <div class=\"well well-sm\">  \n");
      out.write("                    <form action=\"../Question_Check_Store\">\n");
      out.write("\n");
      out.write("                        <h2>Question Type: ");
      out.print( qtype);
      out.write("</h2>\n");
      out.write("                        <h3>(");
      out.print( qno);
      out.write(") : ");
      out.print( qo1.getQuestion_text());
      out.write(" <span class=\"badge badge-success\">For ");
      out.print( qo1.getMarks());
      out.write(" marks</span></h3>\n");
      out.write("                        <textarea name=\"answer\" id=\"\" cols=\"30\" rows=\"10\" class=\"form-control\"></textarea>\n");
      out.write("\n");
      out.write("                        <ul class=\"pager\">\n");
      out.write("                            <input type=\"hidden\" value=\"");
      out.print( qo1.getQuestion_id());
      out.write("\" name=\"qid\">\n");
      out.write("                            <input type=\"hidden\" value=\"");
      out.print( sub.getSub_id());
      out.write("\" name=\"subid\">\n");
      out.write("                            <input type=\"hidden\" value=\"");
      out.print( flag);
      out.write("\" name=\"flag\">\n");
      out.write("                            <button type=\"submit\" name=\"submit\" class=\"btn btn-primary btn-block btn-md\">Next</button>\n");
      out.write("                        </ul>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("                ");

                } else if (qtype.equals("optional")) {
                    Questions_option qoption;
                    OptionsOperation oo = new OptionsOperation();
                    List li2 = oo.searchByQuestions(qo1);
                    ListIterator lit2 = li2.listIterator();
                    while (lit2.hasNext()) {
                        qoption = (Questions_option) lit2.next();

                
      out.write("\n");
      out.write("                <div class=\"well well-sm\"> \n");
      out.write("                    <form action=\"../Question_Check_Store\">\n");
      out.write("                        <h2>Question Type: ");
      out.print( qtype);
      out.write("</h2>\n");
      out.write("                        <h3>(");
      out.print( qno);
      out.write(") : ");
      out.print( qo1.getQuestion_text());
      out.write(" <span class=\"badge badge-success\">For ");
      out.print( qo1.getMarks());
      out.write(" marks</span></h3>\n");
      out.write("\n");
      out.write("                        <ul class=\"list-group radio\">\n");
      out.write("                            <li class=\"list-group-item\">&nbsp;&nbsp;&nbsp;<input type=\"radio\" value=\"");
      out.print( qoption.getOption1());
      out.write("\" name=\"answer\">");
      out.print( qoption.getOption1());
      out.write("</li>\n");
      out.write("                            <li class=\"list-group-item\">&nbsp;&nbsp;&nbsp;<input type=\"radio\" value=\"");
      out.print( qoption.getOption2());
      out.write("\" name=\"answer\">");
      out.print( qoption.getOption2());
      out.write("</li>\n");
      out.write("                            <li class=\"list-group-item\">&nbsp;&nbsp;&nbsp;<input type=\"radio\" value=\"");
      out.print( qoption.getOption3());
      out.write("\" name=\"answer\">");
      out.print( qoption.getOption3());
      out.write("</li>\n");
      out.write("                            <li class=\"list-group-item\">&nbsp;&nbsp;&nbsp;<input type=\"radio\" value=\"");
      out.print( qoption.getOption4());
      out.write("\" name=\"answer\">");
      out.print( qoption.getOption4());
      out.write("</li>\n");
      out.write("                        </ul>\n");
      out.write("\n");
      out.write("                        <ul class=\"pager\">\n");
      out.write("                            <input type=\"hidden\" value=\"");
      out.print( qo1.getQuestion_id());
      out.write("\" name=\"qid\">\n");
      out.write("                            <input type=\"hidden\" value=\"");
      out.print( sub.getSub_id());
      out.write("\" name=\"subid\">\n");
      out.write("                            <input type=\"hidden\" value=\"");
      out.print( flag);
      out.write("\" name=\"flag\">\n");
      out.write("                            <button type=\"submit\" name=\"submit\" class=\"btn btn-primary btn-block btn-md\">Next</button>\n");
      out.write("                        </ul>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("                ");
      }

                        } else {
                            out.println("Follow The Exam Phase Don't Run this page Directly!");
                        }
                    }
                } else {
                    out.println("<h3>Looks like you have given the exam or No questions are their for this Subject</h3>");
                
      out.write("\n");
      out.write("                <br><h4>Check Your Previous Result for ");
      out.print( sub.getSub_name());
      out.write(" <a class=\"btn btn-md btn-success\" href=\"Result.jsp?sub=");
      out.print( sub.getSub_id() );
      out.write("\">See Result</a></h4> \n");
      out.write("                ");

                        }
                    } else {
                        out.println("Something Went Wrong");
                        response.sendRedirect("");
                    }
      out.write("\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
