package DAO;

import Bean.Admin;
import org.hibernate.*;
import org.hibernate.criterion.Restrictions;

public class AdminOperation implements AdminDeclaration {
    
    SessionFactory sf;
    Session session;
    Transaction tr;

    public AdminOperation() {
        sf = HelpingClasses.SessionFact.getSessionFact();
        session = sf.openSession();
    }

    @Override
    public Admin signIn(Admin ad) {
        try {
            Criteria criteria = session.createCriteria(Admin.class);
            criteria.add(Restrictions.eq("username", ad.getUsername()));
            criteria.add(Restrictions.eq("password", ad.getPassword()));
            Admin st2 = (Admin) criteria.uniqueResult();
            return st2;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

