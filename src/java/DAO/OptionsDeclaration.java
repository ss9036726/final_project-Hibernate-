package DAO;

import Bean.*;
import java.util.List;


public interface OptionsDeclaration {
    public long insertQptions(Questions_option q);
    public long upDate(long id,Questions_option q);
    public boolean delete(long id);
    public Questions_option selectOptions(long id);
    public List selectAllOptions();
    public List searchByName(String name);
    public List searchByQuestions(Questions question);
}
