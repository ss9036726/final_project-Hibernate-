package DAO;

import Bean.Subject;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class SubjectOperation implements SubjectDeclaration {

    SessionFactory sf;
    Session session;
    Transaction tr;
    
    public SubjectOperation() {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
    }

    @Override
    public long insertSubjects(Subject st) {
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
    public long upDate(long id, Subject st) {
        tr = session.beginTransaction();
        st.setSub_id(id);
        try {
            session.update(st);
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
        Subject st = new Subject();
        st.setSub_id(id);
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
    public Subject selectSubject(long id) {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
        Subject st = (Subject) session.get(Subject.class, id);
        if (st != null) {
            return st;
        }
        return null;
    }

    @Override
    public List selectAllSubjects() {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
        tr = session.beginTransaction();
        String hql = "from Bean.Subject";
        Query query = session.createQuery(hql);
        List<Subject> li = query.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
        
    }

    @Override
    public List searchByName(String name) {
        Criteria criteria = session.createCriteria(Subject.class);
        criteria.add(Restrictions.like("sub_name", "%" + name + "%"));
        List li = criteria.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
    }
    
    
    
}
