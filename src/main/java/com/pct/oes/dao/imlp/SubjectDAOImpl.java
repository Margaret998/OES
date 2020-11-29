/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao.imlp;

import com.pct.oes.dao.SubjectDAO;
import com.pct.oes.model.SubjectModel;
import com.pct.oes.model.TeacherAssignedToModel;
import com.pct.oes.model.TeacherModel;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
public class SubjectDAOImpl implements SubjectDAO {

    @Autowired
    SessionFactory sessionFactory;

    Transaction transaction;

    SubjectModel sm = new SubjectModel();
    TeacherModel tm = new TeacherModel();
    TeacherAssignedToModel tatm = new TeacherAssignedToModel();

    @Override
    public void addSubject(String subjectCode, String subjectDescription, String subjectCollege) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            sm.setSubjectCode(subjectCode);
            sm.setSubjectDescription(subjectDescription);
            sm.setSubjectCollege(subjectCollege);
            session.save(sm);
            transaction.commit();
        }
    }

    @Override
    public void updateSubject(String subjectCode, String subjectDescription, String subjectCollege) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            sm.setSubjectCode(subjectCode);
            sm.setSubjectDescription(subjectDescription);
            sm.setSubjectCollege(subjectCollege);
            session.saveOrUpdate(sm);
            transaction.commit();
        }
    }

    @Override
    public void removeSubject(String subjectCode) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            sm = (SubjectModel) session.createQuery("From SubjectModel sm where "
                    + "sm.subjectCode=:subjectCode").setParameter("subjectCode", subjectCode).uniqueResult();
            if (sm != null) {
                session.remove(sm);
            }
            transaction.commit();
        }
    }

    @Override
    public List showSubjects() {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            List<SubjectModel> subjectsList = session.createQuery("From SubjectModel sm ").list();
            transaction.commit();
            return subjectsList;
        }
    }

    @Override
    public List showCollegeSubjects(String teacherID) {
        List<SubjectModel> subjectsList = new ArrayList<>();
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            tm = (TeacherModel) session.createQuery("From TeacherModel tm "
                    + "where tm.teacherID=:teacherID ").setParameter("teacherID", teacherID).uniqueResult();
            if (tm != null) {
                String teacherCollege = tm.getTeacherCollege();
                subjectsList = session.createQuery("From SubjectModel sm "
                        + "where sm.subjectCollege =:teacherCollege ").setParameter("teacherCollege", teacherCollege).list();

            }
            transaction.commit();
        }
        return subjectsList;

    }

    @Override
    public List showTeacherSubjects(String teacherID) {
        List<TeacherAssignedToModel> subjectsList = new ArrayList<>();
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            subjectsList = session.createQuery("From TeacherAssignedToModel tatm where "
                    + "tatm.teacherID=:teacherID ").setParameter("teacherID", teacherID).list();
         
            transaction.commit();
        }
        return subjectsList;
    }

}
