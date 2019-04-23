package Bean;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Entity
public class Questions_option {
    @Id
    @GeneratedValue
    private long option_id;
    
    @NotNull
    @Column(columnDefinition = "TEXT")
    private String option1,option2,option3,option4;
    
    @NotNull
    @ManyToOne(cascade = CascadeType.REFRESH,fetch = FetchType.EAGER)
    private Questions question_no;

    public Questions getQuestion_no() {
        return question_no;
    }

    public void setQuestion_no(Questions question_no) {
        this.question_no = question_no;
    }
    
    

    public Questions_option() {
    }

    public Questions_option(String option1, String option2, String option3, String option4) {
        this.option1 = option1;
        this.option2 = option2;
        this.option3 = option3;
        this.option4 = option4;
    }

    public long getOption_id() {
        return option_id;
    }

    public void setOption_id(long option_id) {
        this.option_id = option_id;
    }

    public String getOption1() {
        return option1;
    }

    public void setOption1(String option1) {
        this.option1 = option1;
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String option2) {
        this.option2 = option2;
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String option3) {
        this.option3 = option3;
    }

    public String getOption4() {
        return option4;
    }

    public void setOption4(String option4) {
        this.option4 = option4;
    }
    
}
