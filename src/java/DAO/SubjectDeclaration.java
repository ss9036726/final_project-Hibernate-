package DAO;

import Bean.*;
import java.util.*;


public interface SubjectDeclaration {
    public long insertSubjects(Subject st);
    public long upDate(long id,Subject st);
    public boolean delete(long id);
    public Subject selectSubject(long id);
    public List selectAllSubjects();
    public List searchByName(String name);
}
