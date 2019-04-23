package Controller;

import Bean.Student;
import DAO.StudentDeclaration;
import DAO.StudentOperation;
import static java.awt.SystemColor.window;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudentRegistration extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
        StudentDeclaration sd = new StudentOperation();
        long id = sd.insertStudent(st);
        if (id > 0) {
            resp.sendRedirect("AdminPanel/ShowAllStudent.jsp");
        } else {
            resp.sendRedirect("registration.jsp");
        }
    }
}
