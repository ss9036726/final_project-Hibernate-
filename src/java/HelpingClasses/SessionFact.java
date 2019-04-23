package HelpingClasses;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;


public class SessionFact {
    static SessionFactory sf;
    private static ServiceRegistry serviceRegistry;
    public static SessionFactory getSessionFact(){
        Configuration cf = new Configuration();
        cf.configure("/Resourses/hibernate.cfg.xml");
        serviceRegistry = new StandardServiceRegistryBuilder().applySettings(cf.getProperties()).build();
        sf = cf.buildSessionFactory(serviceRegistry);
        System.out.println("Session Build Sucessfully");
        return sf;
    }
}
