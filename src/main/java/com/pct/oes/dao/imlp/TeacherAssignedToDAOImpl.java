/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao.imlp;

import com.pct.oes.dao.TeacherAssignedToDAO;
import com.pct.oes.model.TeacherAssignedToModel;
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
@Transactional
@Repository
public class TeacherAssignedToDAOImpl implements TeacherAssignedToDAO {

    @Autowired
    SessionFactory sessionFactory;

    Transaction transaction;

    TeacherAssignedToModel tatm = new TeacherAssignedToModel();

    @Override
    public void assignTeacher(String teacherID, String subjectCode, String classCode) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            tatm.setTeacherID(teacherID);
            tatm.setSubjectCode(subjectCode);
            tatm.setClassCode(classCode);
            session.save(tatm);
            transaction.commit();
        }
    }

    @Override
    public void assignTeacherUpdate(String teacherID, String subjectCode, String classCode) {

        //Not Complete
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            tatm = (TeacherAssignedToModel) session.createQuery("From TeacherAssignedToModel tatm"
                    + " where tatm.teacherID =:teacherID ");
            tatm.setTeacherID(teacherID);
            tatm.setSubjectCode(subjectCode);
            tatm.setClassCode(classCode);
            session.saveOrUpdate(tatm);
            transaction.commit();
        }
    }

    @Override
    public void assignTeacherRemove(String teacherID, String subjectCode, String classCode) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            tatm = (TeacherAssignedToModel) session.createQuery("From TeacherAssignedToModel tatm"
                    + " where tatm.teacherID =:teacherID AND tatm.subjectCode=:subjectCode AND tatm.classCode=:classCode"
                    + " ").setParameter("teacherID", teacherID).setParameter("subjectCode", subjectCode).
                    setParameter("classCode", classCode).uniqueResult();
            if (tatm != null) {
                session.remove(tatm);
            }
            transaction.commit();
        }
    }

    @Override
    public List assignedTeacherList() {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            List<TeacherAssignedToModel> assignedTeachersList
                    = session.createQuery("From TeacherAssignedToModel tatm").list();

            transaction.commit();
            return assignedTeachersList;
        }
    }

}
