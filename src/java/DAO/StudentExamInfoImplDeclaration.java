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
public interface StudentExamInfoImplDeclaration {
    public long insert(StudentExamInfo st);
    public List selectAllStudentExamInformation();
}