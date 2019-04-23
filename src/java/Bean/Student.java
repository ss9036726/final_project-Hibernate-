package Bean;

import java.io.Serializable;
import java.util.*;
import javax.persistence.*;

@Entity
public class Student implements Serializable {
    
    public Student() {
    }
    
    @Id
    @GeneratedValue
    private long s_id;
    
    private String name,address;
    private double fees;
    private String admission_date,contact,course;
    
    @Column(unique=true,nullable = false)
    private String username;
    
    private String email;
    private String password;

    @Column(unique=false)
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<Subject> subjectList = new HashSet<Subject>(10);

    public Student(String name, String address, double fees, String admission_date, String contact, String course, String username, String email, String password) {
        this.name = name;
        this.address = address;
        this.fees = fees;
        this.admission_date = admission_date;
        this.contact = contact;
        this.course = course;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public long getS_id() {
        return s_id;
    }

    public void setS_id(long s_id) {
        this.s_id = s_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getFees() {
        return fees;
    }

    public void setFees(double fees) {
        this.fees = fees;
    }

    public String getAdmission_date() {
        return admission_date;
    }

    public void setAdmission_date(String admission_date) {
        this.admission_date = admission_date;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<Subject> getSubjectList() {
        return subjectList;
    }

    public void setSubjectList(Set<Subject> subjectList) {
        this.subjectList = subjectList;
    }
    
}
