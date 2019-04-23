/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.Answer;
import Bean.Questions;
import Bean.Student;
import Bean.Subject;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author gshub
 */
public class AnswerOperation implements AnswerDeclaration{
    
     SessionFactory sf;
    Session session;
    Transaction tr;

    public AnswerOperation() {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
    }

    @Override
    public long insertAnswer(Answer answer) {
        tr = session.beginTransaction();
        long l = (Long) session.save(answer);
        tr.commit();
        if (l > 0) {
            return l;
        } else {
            return 0;
        }
    }

    @Override
    public long upDate(long id, Answer answer) {
        tr = session.beginTransaction();
        answer.setId(id);
        try {
            session.update(answer);
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
        Answer st = new Answer();
        st.setId(id);
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
    public Answer selectAnswer(long id) {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
        String hql = "from Bean.Questions_option where option_id= " + id;
        Query query = session.createQuery(hql);
        Answer a = (Answer) query.uniqueResult();
        if (a!=null) {
            return a;
        }
        return null;
    }

    @Override
    public List selectAllAnswers() {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
        tr = session.beginTransaction();
        String hql = "from Bean.Answer";
        Query query = session.createQuery(hql);
        List<Answer> li = query.list();
        if (li.size() > 0) {
            return li;
        }

        return null;
    }

    @Override
    public Answer searchByQuestions(Questions questions) {
        Criteria criteria = session.createCriteria(Answer.class);
        criteria.add(Restrictions.eq("question", questions));
        Answer a = (Answer) criteria.uniqueResult();
        if (a!=null) {
            return a;
        }
        return null;
    }

    @Override
    public List searchByStudent(Student student) {
        Criteria criteria = session.createCriteria(Answer.class);
        criteria.add(Restrictions.eq("student", student));
        List li = criteria.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
    }

    @Override
    public List WrongorRight(String WrongorRight) {
        Criteria criteria = session.createCriteria(Answer.class);
        criteria.add(Restrictions.eq("WrongorRight", WrongorRight));
        List li = criteria.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
    }

    @Override
    public List WrongorRight(String WrongorRight, Student student) {
        Criteria criteria = session.createCriteria(Answer.class);
        criteria.add(Restrictions.eq("WrongorRight", WrongorRight));
        criteria.add(Restrictions.and(Restrictions.eq("student", student)));
        List li = criteria.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
    }

    @Override
    public List searchByStudent$language(Student student, Subject sub) {
        Criteria criteria = session.createCriteria(Answer.class);
        criteria.add(Restrictions.eq("student", student));
        criteria.add(Restrictions.and(Restrictions.eq("subjectid", sub)));
        List li = criteria.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
    }

    @Override
    public List WrongorRight(String WrongorRight, Student student, Subject sub) {
        Criteria criteria = session.createCriteria(Answer.class);
        criteria.add(Restrictions.eq("WrongorRight", WrongorRight));
        criteria.add(Restrictions.and(Restrictions.eq("student", student)));
        criteria.add(Restrictions.and(Restrictions.eq("subjectid", sub)));
        List li = criteria.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
    }
    
}
