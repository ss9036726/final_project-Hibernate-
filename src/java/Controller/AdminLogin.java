package Controller;

import Bean.Admin;
import Bean.Student;
import DAO.AdminDeclaration;
import DAO.AdminOperation;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AdminLogin extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uname = req.getParameter("username");
        String pass = req.getParameter("password");

        Admin st = new Admin();
        st.setUsername(uname);
        st.setPassword(pass);
        AdminDeclaration sd = new AdminOperation();

        Admin st2 = sd.signIn(st);
        if (st2 != null) {
            req.getSession().setAttribute("LogedIn", st2);
            resp.sendRedirect("AdminPanel/adminhome.jsp");
        } else {
            resp.sendRedirect("UserLogin.jsp");
        }
    }
}
