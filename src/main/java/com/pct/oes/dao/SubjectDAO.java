/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao;

import java.util.List;

/**
 *
 * @author looper
 */
public interface SubjectDAO {

    void addSubject(String subjectCode, String subjectDescription, String subjectCollege);

    void updateSubject(String subjectCode, String subjectDescription, String subjectCollege);

    void removeSubject(String subjectCode);

    List showSubjects();

    List showCollegeSubjects(String teacherID);

    List showTeacherSubjects(String teacherID);

}
