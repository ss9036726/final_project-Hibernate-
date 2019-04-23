package DAO;

import Bean.*;
import java.util.*;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

public class QuestionOperation implements QuestionDeclaration {

    SessionFactory sf;
    Session session;
    Transaction tr;

    public QuestionOperation() {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
    }

    @Override
    public long insertQuestion(Questions q) {
        tr = session.beginTransaction();
        long l = (Long) session.save(q);
        tr.commit();
        if (l > 0) {
            return l;
        } else {
            return 0;
        }
    }

    @Override
    public long upDate(long id, Questions q) {
        tr = session.beginTransaction();
        q.getQuestion_id();
        try {
            session.update(q);
            tr.commit();
            return id;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean delete(long id) {
        tr = session.beginTransaction();
        Questions st = new Questions();
        st.setQuestion_id(id);
        try {
            session.delete(st);
            tr.commit();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Questions selectQuestion(long id) {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
        Questions st = (Questions) session.get(Questions.class, id);
        if (st != null) {
            return st;
        }
        return null;
    }

    @Override
    public List selectAllQuestions() {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
        tr = session.beginTransaction();
        String hql = "from Bean.Questions";
        Query query = session.createQuery(hql);
        List<Questions> li = query.list();
        if (li.size() > 0) {
            return li;
        }

        return null;
    }

    @Override
    public List searchByName(String name) {
        Criteria criteria = session.createCriteria(Questions.class);
        criteria.add(Restrictions.like("name", "%" + name + "%"));
        List li = criteria.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
    }

    @Override
    public List selectBySubject(Subject sub) {
        Criteria criteria = session.createCriteria(Questions.class);
        criteria.add(Restrictions.eq("subject", sub));
        List li = criteria.list();
        if (li != null) {
            return li;
        }
        return null;
    }

    @Override
    public List selectNotIn(Subject sub, Student st) {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
        String hql;
        hql = "from Questions where question_id not in(select question from Answer where student="+st.getS_id()+" and subjectid="+sub.getSub_id()+") and subject="+sub.getSub_id()+"";
        Query query = session.createQuery(hql);
        List<Questions> li = query.list();
        if(li.size() > 0){
            return li;
        }
        return null;
    }

    @Override
    public double SumOfMarks(Subject sub) {
        String hql = "select sum(marks) from Questions where subject="+sub.getSub_id();
        Query query = session.createQuery(hql);
        long total_marks = (Long) query.uniqueResult();
        System.err.println("-----------------"+total_marks+"-----------------"+sub.getSub_id());
        if(total_marks>0){
            return total_marks;
        }
        return 0.0;
    }

}
