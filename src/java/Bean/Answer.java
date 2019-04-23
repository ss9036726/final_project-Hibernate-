/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Bean;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class Answer implements Serializable {
    @Id
    @GeneratedValue
    private long id;
    
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Subject subjectid;
    
    @ManyToOne(cascade = CascadeType.PERSIST)
    private Student student;
    
    @OneToOne(cascade = CascadeType.ALL)
    private Questions question;
    
    
    private String WrongorRight,answer_date,answer_text;

    public Answer() {
    }

    public Answer(Subject subjectid, Student student, Questions question, String WrongorRight, String answer_date, String answer_text) {
        this.subjectid = subjectid;
        this.student = student;
        this.question = question;
        this.WrongorRight = WrongorRight;
        this.answer_date = answer_date;
        this.answer_text = answer_text;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Subject getSubjectid() {
        return subjectid;
    }

    public void setSubjectid(Subject subjectid) {
        this.subjectid = subjectid;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Questions getQuestion() {
        return question;
    }

    public void setQuestion(Questions question) {
        this.question = question;
    }

    public String getWrongorRight() {
        return WrongorRight;
    }

    public void setWrongorRight(String WrongorRight) {
        this.WrongorRight = WrongorRight;
    }

    public String getAnswer_date() {
        return answer_date;
    }

    public void setAnswer_date(String answer_date) {
        this.answer_date = answer_date;
    }

    public String getAnswer_text() {
        return answer_text;
    }

    public void setAnswer_text(String answer_text) {
        this.answer_text = answer_text;
    }
    
    

}
