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
public interface TeacherAssignedToDAO {

    void assignTeacher(String teacherID, String subjectCode, String classCode);

    void assignTeacherUpdate(String teacherID, String subjectCode, String classCode);

    void assignTeacherRemove(String teacherID, String subjectCode, String classCode);
    
    List assignedTeacherList();
}
