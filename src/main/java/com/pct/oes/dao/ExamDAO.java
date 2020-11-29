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
public interface ExamDAO {

    String generateExam(Map<String, String> mapInfo);

    List getGeneratedExamHeader(int examID);

    List getGeneratedExamQuestions(int examID);
    
    List getReadyExams(String teacherID);
    
    void removeExam(int examID);
}
