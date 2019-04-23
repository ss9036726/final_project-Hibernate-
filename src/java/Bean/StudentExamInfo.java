package Bean;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Date;

@Entity
public class StudentExamInfo implements Serializable {
    @Id
    @GeneratedValue
    private long id;
    @OneToOne
    private Student st;
    @OneToOne
    private Subject sub;
    private String examstatus;
    private String date;

    public StudentExamInfo() {
    }

    public StudentExamInfo(Student st, Subject sub, String examstatus, String date) {
        this.st = st;
        this.sub = sub;
        this.examstatus = examstatus;
        this.date = date;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Student getSt() {
        return st;
    }

    public void setSt(Student st) {
        this.st = st;
    }

    public Subject getSub() {
        return sub;
    }

    public void setSub(Subject sub) {
        this.sub = sub;
    }

    public String getExamstatus() {
        return examstatus;
    }

    public void setExamstatus(String examstatus) {
        this.examstatus = examstatus;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
}
