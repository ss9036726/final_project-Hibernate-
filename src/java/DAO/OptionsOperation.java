package DAO;

import Bean.Answer;
import Bean.Questions;
import Bean.Questions_option;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;


public class OptionsOperation implements OptionsDeclaration {
    
    SessionFactory sf;
    Session session;
    Transaction tr;

    public OptionsOperation() {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
    }

    @Override
    public long insertQptions(Questions_option q) {
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
    public long upDate(long id, Questions_option q) {
        tr = session.beginTransaction();
        q.getOption_id();
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
        Questions_option st = new Questions_option();
        st.setOption_id(id);
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
    public Questions_option selectOptions(long id) {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
        Questions_option st = (Questions_option) session.get(Questions_option.class, id);
        if (st != null) {
            return st;
        }
        return null;
    }

    @Override
    public List selectAllOptions() {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
        tr = session.beginTransaction();
        String hql = "from Bean.Questions_option";
        Query query = session.createQuery(hql);
        List<Questions_option> li = query.list();
        if (li.size() > 0) {
            return li;
        }

        return null;
    }

    @Override
    public List searchByName(String name) {
        Criteria criteria = session.createCriteria(Questions_option.class);
        criteria.add(Restrictions.like("name", "%" + name + "%"));
        List li = criteria.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
    }
    
    @Override
    public List searchByQuestions(Questions question) {
        Criteria criteria = session.createCriteria(Questions_option.class);
        criteria.add(Restrictions.eq("question_no", question));
        List li = criteria.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
    }
    
}
