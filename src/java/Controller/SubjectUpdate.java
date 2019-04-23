/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Bean.Subject;
import DAO.SubjectOperation;
import java.io.IOException;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static org.hibernate.criterion.Projections.id;

public class SubjectUpdate extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("id") != null) {
            long id = Long.parseLong(req.getParameter("id"));
            String sub_name;
            int sub_max_marks, sub_passing_marks, sub_total_questions, sub_duration, sub_fees, sub_offers;

            sub_name = req.getParameter("sub_name");
            sub_max_marks = Integer.parseInt(req.getParameter("sub_max_marks"));
            sub_passing_marks = Integer.parseInt(req.getParameter("sub_passing_marks"));
            sub_total_questions = Integer.parseInt(req.getParameter("sub_total_questions"));
            sub_duration = Integer.parseInt(req.getParameter("sub_duration"));
            sub_fees = Integer.parseInt(req.getParameter("sub_fees"));
            sub_offers = Integer.parseInt(req.getParameter("sub_offers"));

            Subject sub = new Subject(sub_name, sub_max_marks, sub_passing_marks, sub_total_questions, sub_duration, sub_fees, sub_offers);
            
            SubjectOperation sd = new SubjectOperation();
            long l = sd.upDate(id, sub);
            
            if(l>0){
                resp.sendRedirect("AdminPanel/ShowSubjects.jsp");
            } else {
                out.print("There is something wrong so try to contact to admin");
            }
        }
    }

}
