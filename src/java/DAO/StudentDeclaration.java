package DAO;

import Bean.Student;
import java.util.*;


public interface StudentDeclaration {
    public long insertStudent(Student st);
    public long upDate(long id,Student st);
    public boolean delete(long id);
    public Student selectStudent(long id);
    public List selectAllStudents();
    public List searchByName(String name);
    public Student signIn(Student st);
}
