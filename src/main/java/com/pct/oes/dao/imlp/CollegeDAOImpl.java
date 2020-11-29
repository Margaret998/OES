/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao.imlp;

import com.pct.oes.dao.CollegeDAO;
import com.pct.oes.model.CollegeModel;
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
public class CollegeDAOImpl implements CollegeDAO {

    @Autowired
    SessionFactory sessionFactory;

    Transaction transaction;

    CollegeModel cm = new CollegeModel();

    @Override
    public void addCollege(String collegeName) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            cm.setCollegeName(collegeName);
            session.save(cm);

            transaction.commit();
        }
    }

    @Override
    public void updateCollege(String collegeName) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            cm.setCollegeName(collegeName);
            session.saveOrUpdate(cm);

            transaction.commit();
        }
    }

    @Override
    public void removeCollege(String collegeName) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            cm = (CollegeModel) session.createQuery("From CollegeModel cm "
                    + "where cm.collegeName=:collegeName").setParameter("collegeName", collegeName).uniqueResult();
            if (cm != null) {
                session.remove(cm);
            }
            transaction.commit();
        }
    }

    @Override
    public List collegesList() {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            List<CollegeModel> collegesList = session.createQuery("From CollegeModel cm").list();
            
            transaction.commit();
            return collegesList;
        }
    }

}
