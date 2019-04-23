/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.StudentExamInfo;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author gshub
 */
public class StudentExamInfoImpl implements StudentExamInfoImplDeclaration{

    SessionFactory sf;
    Session session;
    Transaction tr;

    public StudentExamInfoImpl() {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
    }
    
    @Override
    public long insert(StudentExamInfo st) {
        tr = session.beginTransaction();
        long l = (Long) session.save(st);
        tr.commit();
        if (l > 0) {
            return l;
        } else {
            return 0;
        }
    }

    @Override
    public List selectAllStudentExamInformation() {
        String hql= "from Bean.StudentExamInfo";
        Query query = session.createQuery(hql);
        List<StudentExamInfo> li = query.list();
        if(li.size() > 0){
            return li;
        }
        
        return null;
        
    }
    
}
