package Bean;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class Subject implements Serializable {

    @Id
    @GeneratedValue
    private long sub_id;

    @Column(unique = true, nullable = false)
    private String sub_name;

    private int sub_max_marks, sub_passing_marks, sub_total_questions, sub_duration, sub_fees, sub_offers;

    public Subject() {
    }

    public Subject(String sub_name, int sub_max_marks, int sub_passing_marks, int sub_total_questions, int sub_duration, int sub_fees, int sub_offers) {
        this.sub_name = sub_name;
        this.sub_max_marks = sub_max_marks;
        this.sub_passing_marks = sub_passing_marks;
        this.sub_total_questions = sub_total_questions;
        this.sub_duration = sub_duration;
        this.sub_fees = sub_fees;
        this.sub_offers = sub_offers;
    }

    public long getSub_id() {
        return sub_id;
    }

    public void setSub_id(long sub_id) {
        this.sub_id = sub_id;
    }

    public String getSub_name() {
        return sub_name;
    }

    public void setSub_name(String sub_name) {
        this.sub_name = sub_name;
    }

    public int getSub_max_marks() {
        return sub_max_marks;
    }

    public void setSub_max_marks(int sub_max_marks) {
        this.sub_max_marks = sub_max_marks;
    }

    public int getSub_passing_marks() {
        return sub_passing_marks;
    }

    public void setSub_passing_marks(int sub_passing_marks) {
        this.sub_passing_marks = sub_passing_marks;
    }

    public int getSub_total_questions() {
        return sub_total_questions;
    }

    public void setSub_total_questions(int sub_total_questions) {
        this.sub_total_questions = sub_total_questions;
    }

    public int getSub_duration() {
        return sub_duration;
    }

    public void setSub_duration(int sub_duration) {
        this.sub_duration = sub_duration;
    }

    public int getSub_fees() {
        return sub_fees;
    }

    public void setSub_fees(int sub_fees) {
        this.sub_fees = sub_fees;
    }

    public int getSub_offers() {
        return sub_offers;
    }

    public void setSub_offers(int sub_offers) {
        this.sub_offers = sub_offers;
    }

}
