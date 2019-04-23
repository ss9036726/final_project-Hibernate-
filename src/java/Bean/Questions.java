package Bean;

import java.io.Serializable;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
public class Questions implements Serializable {
    
    @Id
    @GeneratedValue
    private long question_id;
    
    @ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER,targetEntity = Subject.class)
    private Subject subject;
    
    private byte marks;
    private String question_type;

    public Questions(byte marks, String question_type, String question_text, String answer_text) {
        this.marks = marks;
        this.question_type = question_type;
        this.question_text = question_text;
        this.answer_text = answer_text;
    }
   
    @NotNull
    @Column(columnDefinition = "TEXT")
    private String question_text;
    
    @NotNull
    @Column(columnDefinition = "TEXT")
    private String answer_text;

    public Questions() {
        
    }

    public long getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(long question_id) {
        this.question_id = question_id;
    }

    public Subject getSubject() {
        return subject;
    }

    public void setSubject(Subject subject) {
        this.subject = subject;
    }

    public byte getMarks() {
        return marks;
    }

    public void setMarks(byte marks) {
        this.marks = marks;
    }

    public String getQuestion_type() {
        return question_type;
    }

    public void setQuestion_type(String question_type) {
        this.question_type = question_type;
    }

    public String getQuestion_text() {
        return question_text;
    }

    public void setQuestion_text(String question_text) {
        this.question_text = question_text;
    }

    public String getAnswer_text() {
        return answer_text;
    }

    public void setAnswer_text(String answer_text) {
        this.answer_text = answer_text;
    }
    
    
    
}
