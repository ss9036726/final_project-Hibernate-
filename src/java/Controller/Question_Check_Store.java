package Controller;

import DAO.*;
import Bean.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Question_Check_Store", urlPatterns = {"/Question_Check_Store"})
public class Question_Check_Store extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(true);
        try {
            long sid = Long.parseLong(session.getAttribute("id").toString());
            long question_no = Long.parseLong(req.getParameter("qid"));
            long sub_id = Long.parseLong(req.getParameter("subid"));
            String anstext = req.getParameter("answer");
            String WrongorRight = "Wrong";
            boolean lastAnswer = Boolean.parseBoolean(req.getParameter("flag"));

            StudentOperation so = new StudentOperation();
            SubjectOperation subo = new SubjectOperation();
            QuestionOperation qo = new QuestionOperation();
            AnswerOperation ao = new AnswerOperation();

            Student student;
            Subject subject;
            Answer answer;
            Questions question;

            String adate = new Date().toString();

            student = so.selectStudent(sid);
            question = qo.selectQuestion(question_no);
            subject = subo.selectSubject(sub_id);

            // comparing answer here 
            if (anstext.equals(question.getAnswer_text())) {
                WrongorRight = "Right";
            }

            answer = new Answer(subject, student, question, WrongorRight, adate, anstext);

            long l = ao.insertAnswer(answer);

            if (l > 0 && !lastAnswer) {
                resp.sendRedirect("Exam/Exam.jsp?subject=" + sub_id + "&submit=Check+status");
            } else {
                StudentExamInfoImpl examInfoImpl = new StudentExamInfoImpl();
                List li = ao.searchByStudent$language(student, subject);
                ListIterator lit = li.listIterator();

                double totalRightAnswerMarks = 0;
                if (ao.WrongorRight("Right", student, subject) != null) {
                    List right_ans = ao.WrongorRight("Right", student, subject);
                    ListIterator lir = right_ans.listIterator();
                    while (lir.hasNext()) {
                        Answer ans = (Answer) lir.next();
                        totalRightAnswerMarks += ans.getQuestion().getMarks();
                    }
                }

                StudentExamInfo examInfo = new StudentExamInfo();
                examInfo.setSt(student);
                examInfo.setSub(subject);
                examInfo.setExamstatus(((totalRightAnswerMarks * 100) / qo.SumOfMarks(subject)) < 40 ? "Fail" : "Passed");
                examInfo.setDate(new Date().toString());
                long status = examInfoImpl.insert(examInfo);
                if (status > 0) {
                    resp.sendRedirect("Exam/Result.jsp?sub=" + sub_id);
                }
            }
        } catch (Exception e) {
            System.out.println(e);

        }
    }

}
