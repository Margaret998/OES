/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao.imlp;

import com.pct.oes.dao.UserManageDAO;
import com.pct.oes.model.StudentModel;
import com.pct.oes.model.TeacherModel;
import com.pct.oes.model.UserModel;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author looper
 */
@Repository
@Transactional
public class UserMangeDAOImpl implements UserManageDAO {

    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    @Autowired
    SessionFactory sessionFactory;

    Transaction transaction;

    UserModel um = new UserModel();
    StudentModel sm = new StudentModel();
    TeacherModel tm = new TeacherModel();

    @Override
    public void addStudent(String fullName, String userID, String password, String classCode, String collegeName) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();

            um.setUserID(userID);
            um.setPassword(encoder.encode(password));
            um.setUserRole("ROLE_STUDENT");
            um.setEnabled(true);
            um.setFullName(fullName);

            session.save(um);

            sm.setStudentID(userID);
            sm.setEmail("0");
            sm.setPhone("0");
            sm.setGender("0");
            sm.setFullName(fullName);
            sm.setClassCode(classCode);
            sm.setCollegeName(collegeName);

            session.save(sm);
            transaction.commit();
        }
    }

    @Override
    public void addTeacher(String fullName, String userID, String password, String teacherCollege) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();

            um.setUserID(userID);
            um.setPassword(encoder.encode(password));
            um.setUserRole("ROLE_TEACHER");
            um.setEnabled(true);
            um.setFullName(fullName);

            session.save(um);

            tm.setTeacherID(userID);
            tm.setFullname(fullName);
            tm.setTeacherCollege(teacherCollege);
            tm.setEmail("0");
            tm.setGender("0");
            tm.setPhone("0");

            session.save(tm);
            transaction.commit();
        }
    }

    @Override
    public void updateStudent(String fullName, String userID, String password,String classCode, String collegeName) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            um = (UserModel) session.createQuery("from UserModel um where um.userID = :userID ").setParameter("userID", userID).uniqueResult();
            sm = (StudentModel) session.createQuery("from StudentModel sm where sm.studentID = :userID ").setParameter("userID", userID).uniqueResult();
            
            if (um != null && sm != null) {
                um.setUserID(userID);
                um.setPassword(encoder.encode(password));
                um.setUserRole("ROLE_STUDENT");
                um.setFullName(fullName);
                sm.setClassCode(classCode);
                sm.setCollegeName(collegeName);
                
                session.saveOrUpdate(um);
                session.saveOrUpdate(sm);
                transaction.commit();
            }
        }
    }

    @Override
    public void updateTeacher(String fullName, String userID, String password, String teacherCollege) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            um = (UserModel) session.createQuery("from UserModel um where um.userID = :userID ").setParameter("userID", userID).uniqueResult();
            tm = (TeacherModel) session.createQuery("from TeacherModel tm where tm.teacherID = :userID ").setParameter("userID", userID).uniqueResult();
            
            if (um != null && tm != null) {
                um.setUserID(userID);
                um.setPassword(encoder.encode(password));
                um.setUserRole("ROLE_TEACHER");
                um.setFullName(fullName);
                tm.setTeacherCollege(teacherCollege);
                
                session.saveOrUpdate(um);
                transaction.commit();
            }
        }
    }

    @Override
    public void addStudentInfo(Map<String, String> mapInfo) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            String studentID = mapInfo.get("studentID");
            sm = (StudentModel) session.createQuery("From StudentModel sm "
                    + "where sm.studentID=:studentID").setParameter("studentID", studentID).uniqueResult();
            if (sm != null) {
                sm.setEmail(mapInfo.get("email"));
                sm.setGender(mapInfo.get("gender"));
                sm.setPhone(mapInfo.get("phone"));
                session.update(sm);
            }
            transaction.commit();
        }
    }

    @Override
    public void addTeacherInfo(Map<String, String> mapInfo) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            String teacherID = mapInfo.get("teacherID");
            tm = (TeacherModel) session.createQuery("From TeacherModel tm "
                    + "where tm.teacherID = :teacherID").setParameter("teacherID", teacherID).uniqueResult();
            if (tm != null) {
                tm.setEmail(mapInfo.get("email"));
                tm.setGender(mapInfo.get("gender"));
                tm.setPhone(mapInfo.get("phone"));
                session.update(tm);
            }
            transaction.commit();
        }
    }

    @Override
    public void updateStudentInfo(Map<String, String> mapInfo) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            sm = (StudentModel) session.createQuery("from StudentModel sm where sm.studentID = :userID ").setParameter("userID", mapInfo.get("userID")).uniqueResult();
            if (sm != null) {

                sm.setEmail(mapInfo.get("email"));
                sm.setGender(mapInfo.get("gender"));
                sm.setPhone(mapInfo.get("phone"));
                session.update(sm);
                transaction.commit();
            }
        }
    }

    @Override
    public void updateTeacherInfo(Map<String, String> mapInfo) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            tm = (TeacherModel) session.createQuery("from TeacherModel tm where tm.teacherID = :userID ").setParameter("userID", mapInfo.get("userID")).uniqueResult();
            if (tm != null) {
                tm.setEmail(mapInfo.get("email"));
                tm.setGender(mapInfo.get("gender"));
                tm.setPhone(mapInfo.get("phone"));
                session.update(tm);
                transaction.commit();
            }

        }
    }

    @Override
    public void removeUser(String userID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            um = (UserModel) session.createQuery("from UserModel um where um.userID = :userID ").setParameter("userID", userID).uniqueResult();
            if (um != null) {
                session.remove(um);
                transaction.commit();
            }
        }
    }

    @Override
    public void resetPassword(String userID, String oldPassword, String newPassword) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            um = (UserModel) session.createQuery("from UserModel um where um.userID = :userID ").setParameter("userID", userID).uniqueResult();
            if (um != null) {
                if (um.getPassword().equals(oldPassword)) {
                    um.setPassword(encoder.encode(newPassword));
                    session.saveOrUpdate(um);
                }
            }
            transaction.commit();
        }
    }

    @Override
    public void resetPasswordAsAdmin(String userID, String newPassword) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            um = (UserModel) session.createQuery("from UserModel um where um.userID = :userID ").setParameter("userID", userID).uniqueResult();
            if (um != null) {
                um.setPassword(encoder.encode(newPassword));
                session.saveOrUpdate(um);

            }
            transaction.commit();
        }
    }

}
