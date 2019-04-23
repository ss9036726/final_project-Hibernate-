/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Bean.*;
import java.util.List;

/**
 *
 * @author gshub
 */
public interface AnswerDeclaration {
    public long insertAnswer(Answer answer);
    public long upDate(long id,Answer answer);
    public boolean delete(long id);
    public Answer selectAnswer(long id);
    public List selectAllAnswers();
    public Answer searchByQuestions(Questions questions);
    public List searchByStudent(Student student);
    public List WrongorRight(String WrongorRight);
    public List WrongorRight(String WrongorRight,Student student);
    public List WrongorRight(String WrongorRight,Student student,Subject sub);
    public List searchByStudent$language(Student student,Subject sub);
}
