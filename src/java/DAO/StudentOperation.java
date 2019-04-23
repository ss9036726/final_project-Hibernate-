package DAO;

import Bean.Student;
import java.util.*;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

public class StudentOperation implements StudentDeclaration {

    SessionFactory sf;
    Session session;
    Transaction tr;

    public StudentOperation() {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
    }

    @Override
    public long insertStudent(Student st) {
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
    public long upDate(long id, Student st) {
        tr = session.beginTransaction();
        st.setS_id(id);
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
        Student st = new Student();
        st.setS_id(id);
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
    public Student selectStudent(long id) {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
        Student st = (Student) session.get(Student.class, id);
        if (st != null) {
            return st;
        }
        return null;
    }

    @Override
    public List selectAllStudents() {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
        tr = session.beginTransaction();
        String hql = "from Bean.Student";
        Query query = session.createQuery(hql);
        List<Student> li = query.list();
        if (li.size() > 0) {
            return li;
        }

        return null;
    }

    @Override
    public List searchByName(String name) {
        Criteria criteria = session.createCriteria(Student.class);
        criteria.add(Restrictions.like("name", "%" + name + "%"));
        List li = criteria.list();
        if (li.size() > 0) {
            return li;
        }
        return null;
    }

    @Override
    public Student signIn(Student st) {
        try{
            Criteria criteria = session.createCriteria(Student.class);
            criteria.add(Restrictions.eq("username", st.getUsername()));
            criteria.add(Restrictions.eq("password", st.getPassword()));
            Student st2 = (Student) criteria.uniqueResult();
            return st2;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
