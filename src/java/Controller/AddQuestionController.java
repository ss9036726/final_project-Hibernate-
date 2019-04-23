package Controller;

import Bean.Questions;
import Bean.Questions_option;
import DAO.OptionsOperation;
import DAO.QuestionOperation;
import DAO.SubjectOperation;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name="AddQuestionController", urlPatterns = {"/AddQuestionController"} )
public class AddQuestionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        byte marks;
        String question_type, question_text, answer_text, option1, option2, option3, option4;
        long subject_id = Long.parseLong(req.getParameter("sub_id"));

        marks = Byte.parseByte(req.getParameter("question_marks"));
        question_type = req.getParameter("question_type");
        question_text = req.getParameter("question_text");
        answer_text = req.getParameter("answer_text");
        
        Questions questions = new Questions(marks,question_type,question_text,answer_text);
        SubjectOperation so = new SubjectOperation();
        QuestionOperation qo = new QuestionOperation();
        questions.setSubject(so.selectSubject(subject_id));
        long id = qo.insertQuestion(questions);
        if(id>0){
            if(question_type.equals("optional")){
                option1 = req.getParameter("qoption1");
                option2 = req.getParameter("qoption2");
                option3 = req.getParameter("qoption3");
                option4 = req.getParameter("qoption4");
                
                Questions_option qo2 = new Questions_option(option1,option2,option3,option4);
                qo2.setQuestion_no(qo.selectQuestion(id));
                OptionsOperation oo = new OptionsOperation();
                long a = oo.insertQptions(qo2);
                resp.sendRedirect("AdminPanel/AddQuestion.jsp?result=Added Successfully!");
            } else {
                resp.sendRedirect("AdminPanel/AddQuestion.jsp?result=Added Successfully!");
            }
        }else {
            resp.sendRedirect("AdminPanel/AddQuestion.jsp?result=Not Added!");
        }
        
    }

}
