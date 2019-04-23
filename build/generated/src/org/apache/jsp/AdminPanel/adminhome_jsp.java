package org.apache.jsp.AdminPanel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import Bean.Admin;
import Bean.Student;

public final class adminhome_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n");
      out.write("        <title>Admin Page</title>\r\n");
      out.write("        ");
      out.write("<link rel=\"stylesheet\" media=\"screen\" href=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/css/bootstrap.min.css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.3/jquery.min.js\"></script>\n");
      out.write("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.5/js/bootstrap.min.js\"></script>");
      out.write("\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/user.css\">\r\n");
      out.write("    </head>\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("        <nav class=\"navbar navbar-inverse\">\r\n");
      out.write("            <div class=\"container-fluid\">\r\n");
      out.write("                <div class=\"navbar-header\">\r\n");
      out.write("                    <a class=\"navbar-brand\" href=\"#\">Online Test Portal</a>\r\n");
      out.write("                </div>\r\n");
      out.write("                <ul class=\"nav navbar-nav\">\r\n");
      out.write("                    <li class=\"active\"><a href=\"adminhome.jsp\">Admin Home</a></li>\r\n");
      out.write("                    <li><a href=\"ShowAllStudent.jsp\">Student Details</a></li>\r\n");
      out.write("                    <li><a href=\"../registration.jsp\">Add Student Details</a></li>\r\n");
      out.write("                    <li><a href=\"ShowSubjects.jsp\">Subject Details</a></li>\r\n");
      out.write("                    <li><a href=\"Add_Subject_Form.jsp\">Add New Subject</a></li>\r\n");
      out.write("                    <li><a href=\"SelectAllQuestions.jsp\">Show All Questions</a></li>\r\n");
      out.write("                    <li><a href=\"SelectAllOptions.jsp\">Show All Options</a></li>\r\n");
      out.write("                    <li><a href=\"showanswer.jsp\">Show Answers</a></li>\r\n");
      out.write("                    <li>\r\n");
      out.write("                        ");

                            if (session.getAttribute("LogedIn") == null) {
                        
      out.write("\r\n");
      out.write("                        <a href=\"UserLogin.jsp?pagename=");
      out.print( request.getRequestURI());
      out.write("\">Login</a>\r\n");
      out.write("                        ");
} else {
                            Admin st = (Admin) session.getAttribute("LogedIn");

                        
      out.write("\r\n");
      out.write("                        <a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">\r\n");
      out.write("                            <span class=\"glyphicon glyphicon-user\"></span>");
      out.print( st.getUsername());
      out.write("\r\n");
      out.write("                            <i class=\"caret\"></i>\r\n");
      out.write("                        </a>\r\n");
      out.write("                        <ul id=\"userprofile\" class=\"dropdown-menu\">\r\n");
      out.write("                            <li><a href=\"../AdminLogout\"><i class=\"fa fa-sign-out\" aria-hidden=\"true\"></i>Logout</a></li>\r\n");
      out.write("                        </ul>\r\n");
      out.write("                        ");

                            }
                        
      out.write("\r\n");
      out.write("                    </li>\r\n");
      out.write("                </ul>\r\n");
      out.write("            </div>\r\n");
      out.write("        </nav>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"container\">\r\n");
      out.write("            <div class=\"jumbotron\">\r\n");
      out.write("                ");

                    Admin st = (Admin) session.getAttribute("LogedIn");
                
      out.write("\r\n");
      out.write("                <div class=\"row\">\r\n");
      out.write("                    <div class=\"col-md-12 header\">\r\n");
      out.write("                        <h2>Welcome ");
      out.print(st.getUsername());
      out.write("</h2>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <img src=\"../images/user.jpg\" alt=\"Main-Image\" width=\"100%\" height=\"100%\">\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("    </body>\r\n");
      out.write("</html>\r\n");
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
