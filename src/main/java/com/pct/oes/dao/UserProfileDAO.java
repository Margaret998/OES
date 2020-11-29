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
public interface UserProfileDAO {

    List studentProfileList(String userID);

    List teacherProfileList(String userID);

    List studentsList();

    List teachersList();

    List collegeStudentsList(String teacherID);

    List collegeTeachersList(String collegeName);

    List collegeStudentsListByCollegeName(String collegeName, String classCode);

    List studentsListForTeacher(String teacherID);

}
