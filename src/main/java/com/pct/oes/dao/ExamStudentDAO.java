/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao;

import java.util.List;
import java.util.Map;

/**
 *
 * @author looper
 */
public interface ExamStudentDAO {

    void enrollStudentInExam(String studentID, int examID);

    void removeStudentFromExam(String studentID, int examID);

    List getAllEnrolledStudents(String teacherID);

    List getStudentExams(String studentID);

    void examCorrection(Map<String, String> mapInfo);

    List studentResults(String studentID);

    List allStudentsResults(int examID);
    
    List studentExamAssessment(String studentID, int examID);
    

}
