package Controller;

import Bean.Student;
import DAO.StudentDeclaration;
import DAO.StudentOperation;
import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname = req.getParameter("username");
        String pass = req.getParameter("password");

        Student st = new Student();
        st.setUsername(uname);
        st.setPassword(pass);
        StudentDeclaration sd = new StudentOperation();

        Student st2 = sd.signIn(st);
        if (st2 != null) {
            req.getSession().setAttribute("LogedIn", st2);
            resp.sendRedirect("userhome.jsp");

        } else {
            resp.sendRedirect("UserLogin.jsp");
        }
    }

}
