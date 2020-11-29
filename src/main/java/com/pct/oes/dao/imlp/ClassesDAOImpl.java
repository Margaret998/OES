/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao.imlp;

import com.pct.oes.dao.ClassesDAO;
import com.pct.oes.model.ClassesModel;
import java.util.List;
import javax.persistence.TemporalType;
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
public class ClassesDAOImpl implements ClassesDAO {

    @Autowired
    SessionFactory sessionFactory;

    Transaction transaction;

    ClassesModel cm = new ClassesModel();

    @Override
    public void addClass(String classCode, String ClassCollege) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            cm.setClassCode(classCode);
            cm.setClassCollege(ClassCollege);

            session.save(cm);
            transaction.commit();
        }
    }

    @Override
    public void updateClass(String classCode, String ClassCollege) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            cm.setClassCode(classCode);
            cm.setClassCollege(ClassCollege);

            session.saveOrUpdate(cm);
            transaction.commit();
        }
    }

    @Override
    public void remove(String classCode) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            cm = (ClassesModel) session.createQuery("From ClassesModel cm "
                    + "where cm.classCode=:classCode").setParameter("classCode", classCode).uniqueResult();
            if (cm != null) {
                session.remove(cm);
            }
            transaction.commit();
        }
    }

    @Override
    public List showClasses() {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            List<ClassesModel> classesList = session.createQuery("From ClassesModel cm ").list();

            transaction.commit();

            return classesList;

        }

    }

    @Override
    public List getClassesByCollege(String collegeName) {
      try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            List<ClassesModel> classesList = session.createQuery("From ClassesModel cm "
                    + "where cm.classCollege=:collegeName").setParameter("collegeName",collegeName).list();

            transaction.commit();

            return classesList;

        }    }

}
