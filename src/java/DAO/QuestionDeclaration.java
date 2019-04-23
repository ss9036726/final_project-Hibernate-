
package DAO;

import Bean.*;
import java.util.List;


public interface QuestionDeclaration {
    public long insertQuestion(Questions q);
    public long upDate(long id,Questions q);
    public boolean delete(long id);
    public Questions selectQuestion(long id);
    public List selectAllQuestions();
    public List searchByName(String name);
    public List selectBySubject(Subject sub);
    public List selectNotIn(Subject sub,Student st);
    public double SumOfMarks(Subject sub);
}
