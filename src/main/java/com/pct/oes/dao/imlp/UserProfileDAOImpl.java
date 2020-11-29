/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao.imlp;

import com.pct.oes.dao.FindUserDAO;
import com.pct.oes.dao.UserProfileDAO;
import com.pct.oes.model.ClassesModel;
import com.pct.oes.model.StudentModel;
import com.pct.oes.model.TeacherModel;
import com.pct.oes.model.UserModel;
import java.util.ArrayList;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author looper
 */
@Repository
@Transactional
public class UserProfileDAOImpl implements UserProfileDAO {

    @Autowired
    SessionFactory sessionFactory;

    Transaction transaction;

    StudentModel sm = new StudentModel();
    TeacherModel tm = new TeacherModel();
    UserModel um = new UserModel();
    ClassesModel cm = new ClassesModel();

    FindUserDAO fud;

    List<StudentModel> studentProfile = new ArrayList<>();
    List<TeacherModel> teacherProfile = new ArrayList<>();

    @Override
    public List studentProfileList(String userID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            studentProfile = session.createQuery("from StudentModel sm where sm.studentID = :userID").setParameter("userID", userID).list();

            transaction.commit();
        }
        return studentProfile;
    }

    @Override
    public List teacherProfileList(String userID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            teacherProfile = session.createQuery("from TeacherModel tm where tm.teacherID = :userID").setParameter("userID", userID).list();

            transaction.commit();

        }

        return teacherProfile;
    }

    @Override
    public List studentsList() {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            List<StudentModel> studentsList = session.createQuery("from StudentModel sm").list();
            transaction.commit();

            return studentsList;
        }
    }

    @Override
    public List teachersList() {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            List<TeacherModel> teachersList = session.createQuery("from TeacherModel tm").list();
            transaction.commit();

            return teachersList;
        }
    }

    @Override
    public List collegeStudentsList(String teacherID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            tm = (TeacherModel) session.createQuery("from TeacherModel tm"
                    + " where tm.teacherID =:teacherID").setParameter("teacherID", teacherID).uniqueResult();
            String teacherCollege = tm.getTeacherCollege();
            List<StudentModel> studentsList = session.createQuery("From StudentModel sm"
                    + " where sm.collegeName=:teacherCollege ").setParameter("teacherCollege", teacherCollege).list();
            transaction.commit();

            return studentsList;
        }
    }

    @Override
    public List collegeTeachersList(String collegeName) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            List<TeacherModel> teachersList = session.createQuery("from TeacherModel tm"
                    + " where tm.teacherCollege =:collegeName").setParameter("collegeName", collegeName).list();
            transaction.commit();

            return teachersList;
        }
    }

    @Override
    public List collegeStudentsListByCollegeName(String collegeName, String classCode) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            List<StudentModel> studentsList = session.createQuery("From StudentModel sm"
                    + " where sm.collegeName=:collegeName AND sm.classCode=:classCode"
                    + " ").setParameter("classCode", classCode).
                    setParameter("collegeName", collegeName).list();
            transaction.commit();

            return studentsList;
        }
    }

    @Override
    public List studentsListForTeacher(String teacherID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            List<StudentModel> studentsList =  session.createQuery("From StudentModel sm  where "
                    + "sm.classCode IN (select tatm.classCode From TeacherAssignedToModel tatm) AND :teacherID IN (Select tatm.teacherID From TeacherAssignedToModel tatm where tatm.classCode = sm.classCode) ").setParameter("teacherID", teacherID).list();
            transaction.commit();

            return studentsList;
        }
    }
}
