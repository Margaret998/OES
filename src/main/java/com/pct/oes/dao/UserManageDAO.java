/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao;

import java.util.Map;

/**
 *
 * @author looper
 */
public interface UserManageDAO {

    void addStudent(String fullName, String userID, String password, String classCode, String collegeName);

    void addTeacher(String fullName, String userID, String password, String teacherCollege);

    void updateStudent(String fullName,String userID, String password, String classCode, String collegeName);

    void updateTeacher(String fullName, String userID, String password, String teacherCollege);

    void removeUser(String userID);

    void addStudentInfo(Map<String, String> mapInfo);

    void addTeacherInfo(Map<String, String> mapInfo);

    void updateStudentInfo(Map<String, String> mapInfo);

    void updateTeacherInfo(Map<String, String> mapInfo);
    
    void resetPassword(String userID, String oldPassword, String newPassword);
    
    void resetPasswordAsAdmin(String userID, String newPassword);

}
