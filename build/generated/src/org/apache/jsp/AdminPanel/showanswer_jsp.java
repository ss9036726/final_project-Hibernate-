package org.apache.jsp.AdminPanel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Bean.Admin;
import Bean.Answer;
import DAO.AnswerOperation;
import Bean.Questions;
import DAO.QuestionOperation;
import Bean.Questions_option;
import jdk.nashorn.internal.runtime.options.Options;
import java.util.ListIterator;
import java.util.List;
import DAO.OptionsOperation;

public final class showanswer_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/AdminPanel/../CommonThings/CDN.jsp");
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
      out.write("        <title>JSP Page</title>\n");
      out.write("        ");
      out.write("<link rel=\"stylesheet\" media=\"screen\" href=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js\"></script>");
      out.write("\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/signup.css\">\n");
      out.write("\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav class=\"navbar navbar-inverse\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                    <a class=\"navbar-brand\" href=\"#\">Online Test Portal</a>\n");
      out.write("                </div>\n");
      out.write("                <ul class=\"nav navbar-nav\">\n");
      out.write("                    <li><a href=\"adminhome.jsp\">Admin Home</a></li>\n");
      out.write("                    <li><a href=\"ShowAllStudent.jsp\">Student Details</a></li>\n");
      out.write("                    <li><a href=\"../registration.jsp\">Add Student Details</a></li>\n");
      out.write("                    <li><a href=\"ShowSubjects.jsp\">Subject Details</a></li>\n");
      out.write("                    <li><a href=\"Add_Subject_Form.jsp\">Add New Subject</a></li>\n");
      out.write("                    <li ><a href=\"SelectAllQuestions.jsp\">Show All Questions</a></li>\n");
      out.write("                    <li><a href=\"SelectAllOptions.jsp\">Show All Options</a></li>\n");
      out.write("                    <li><a href=\"AddQuestion.jsp\">Add Questions</a></li>\n");
      out.write("                    <li class=\"active\"><a href=\"showanswer.jsp\">Show Answers</a></li>\n");
      out.write("                    <li>\n");
      out.write("                        ");

                            if (session.getAttribute("LogedIn") == null) {
                        
      out.write("\n");
      out.write("                        <a href=\"UserLogin.jsp?pagename=");
      out.print( request.getRequestURI());
      out.write("\">Login</a>\n");
      out.write("                        ");
} else {
                            Admin st = (Admin) session.getAttribute("LogedIn");

                        
      out.write("\n");
      out.write("                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">\n");
      out.write("                            <span class=\"glyphicon glyphicon-user\"></span>");
      out.print( st.getUsername());
      out.write("\n");
      out.write("                            <i class=\"caret\"></i>\n");
      out.write("                        </a>\n");
      out.write("                        <ul id=\"userprofile\" class=\"dropdown-menu\">\n");
      out.write("                            <li><a href=\"../AdminLogout\"><i class=\"fa fa-sign-out\" aria-hidden=\"true\"></i>Logout</a></li>\n");
      out.write("                        </ul>\n");
      out.write("                        ");

                            }
                        
      out.write("\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <div class=\"container-fluid\">\n");
      out.write("            <div class=\"jumbotron\">\n");
      out.write("                <h2>Questions Information Table</h2>\n");
      out.write("                <hr>\n");
      out.write("                <table class=\"table table-hover\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>Answer Id</th>\n");
      out.write("                            <th>Subject Name</th>\n");
      out.write("                            <th>Student Name</th>\n");
      out.write("                            <th>Question Id</th>\n");
      out.write("                            <th>Question Marks</th>\n");
      out.write("                            <th>Question Type</th>\n");
      out.write("                            <th>Question Text</th>\n");
      out.write("                            <th>Actual Answer Text</th>\n");
      out.write("                            <th>Student Answer Text</th>\n");
      out.write("                            <th>Answer Date</th>\n");
      out.write("                            <th>Right Or Wrong</th>\n");
      out.write("                            <th></th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    ");
  
                        AnswerOperation st = new AnswerOperation();
                        List li = st.selectAllAnswers();
                        ListIterator lit = li.listIterator();
                        while (lit.hasNext()) {
                            Answer sub = (Answer) lit.next();
                    
      out.write("      \n");
      out.write("                    <tbody>\n");
      out.write("                        <tr>\n");
      out.write("                            <td>");
      out.print( sub.getId() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( sub.getSubjectid().getSub_name() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( sub.getStudent().getUsername() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( sub.getQuestion().getQuestion_id() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( sub.getQuestion().getMarks() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( sub.getQuestion().getQuestion_type() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( sub.getQuestion().getQuestion_text() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( sub.getQuestion().getAnswer_text() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( sub.getAnswer_text() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( sub.getAnswer_date() );
      out.write("</td>\n");
      out.write("                            <td>");
      out.print( sub.getWrongorRight() );
      out.write("</td>\n");
      out.write("                            <td><a href=\"AnswerControl/Delete.jsp?id=");
      out.print( sub.getId() );
      out.write("\" class=\"btn btn-md btn-danger\">Delete</a></td>\n");
      out.write("                        </tr>\n");
      out.write("                    </tbody>\n");
      out.write("                    ");
 }
      out.write("\n");
      out.write("                </table>\n");
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
