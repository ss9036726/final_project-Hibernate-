package Controller;

import Bean.*;
import DAO.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddSubjectControl extends HttpServlet {

    /**
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SubjectOperation so = new SubjectOperation();
        StudentOperation sto = new StudentOperation();
        Student st = null;
        Subject sub; 
        long l = Long.parseLong(req.getParameter("id"));
        if(req.getParameter("addsub")!=null){
            Enumeration paramnames = req.getParameterNames();
            while(paramnames.hasMoreElements()){
                String spname = paramnames.nextElement().toString();
                if(!spname.equals("addsub")){
                    if(!spname.equals("id")){
                        resp.getWriter().print(spname+" : " + req.getParameter(spname));
                        long sub_id = Long.parseLong(req.getParameter(spname));
                        st = sto.selectStudent(l);
                        sub = so.selectSubject(sub_id);
                        st.getSubjectList().add(sub);
                    }
                }
            }
            long returnid=sto.upDate(l, st);
            if(returnid>0){
                resp.sendRedirect("AdminPanel/StudentControl/Update.jsp?id="+l);
            }
        }
    }

    
}
