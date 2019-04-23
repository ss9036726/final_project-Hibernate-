package Controller;

import Bean.Subject;
import DAO.SubjectDeclaration;
import DAO.SubjectOperation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class AddSubjects extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String sub_name;
        int sub_max_marks, sub_passing_marks, sub_total_questions, sub_duration, sub_fees, sub_offers;
        
        sub_name = req.getParameter("sub_name");
        sub_max_marks = Integer.parseInt(req.getParameter("sub_max_marks"));
        sub_passing_marks = Integer.parseInt(req.getParameter("sub_passing_marks"));
        sub_total_questions = Integer.parseInt(req.getParameter("sub_total_questions"));
        sub_duration = Integer.parseInt(req.getParameter("sub_duration"));
        sub_fees = Integer.parseInt(req.getParameter("sub_fees"));
        sub_offers = Integer.parseInt(req.getParameter("sub_offers"));
        
        Subject sub = new Subject(sub_name,sub_max_marks, sub_passing_marks, sub_total_questions, sub_duration, sub_fees, sub_offers);
        SubjectDeclaration sd = new SubjectOperation();
        long id = sd.insertSubjects(sub);
        
        if(id > 0){
            resp.sendRedirect("AdminPanel/ShowSubjects.jsp");
        } else {
            resp.sendRedirect("AddSubjects.jsp");
        }
    }

    
    
}
