package Controller;

import Bean.Student;
import DAO.StudentOperation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class EditProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("id") != null) {
            Long id = Long.parseLong(req.getParameter("id"));

            PrintWriter out = resp.getWriter();
            String name, username, email, address, admission_date, contact, course, password;
            double fees;

            // Taking input from the registration form
            name = req.getParameter("name");
            address = req.getParameter("address");
            fees = Double.parseDouble(req.getParameter("fees"));
            admission_date = req.getParameter("admission_date");
            contact = req.getParameter("contact");
            course = req.getParameter("course");
            username = req.getParameter("username");
            email = req.getParameter("email");
            password = req.getParameter("password");

            Student st = new Student(name, address, fees, admission_date, contact, course, username, email, password);

            StudentOperation sd = new StudentOperation();
            st.setSubjectList(sd.selectStudent(id).getSubjectList());
            long l = sd.upDate(id, st);

            if (l > 0) {
                resp.sendRedirect("Profile.jsp");
            } else {
                out.print("There is something wrong so try to contact to admin");
            }
        }

    }
}
