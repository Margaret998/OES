/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao.imlp;

import com.pct.oes.dao.QuestionDAO;
import com.pct.oes.model.QuestionModel;
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
public class QuestionDAOImpl implements QuestionDAO {

    @Autowired
    SessionFactory sessionFactory;

    Transaction transaction;

    QuestionModel qd = new QuestionModel();

    @Override
    public String addQuestion(Map<String, String> mapInfo) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            qd.setQuestionContext(mapInfo.get("questionContext"));
            qd.setSubjectCode(mapInfo.get("subjectCode"));
            qd.setTypeOfQuestionCode(mapInfo.get("typeOfQuestionCode"));
            qd.setQuestionMark(Integer.parseInt(mapInfo.get("questionMark")));
            qd.setQuestionContext(mapInfo.get("questionContext"));
            session.save(qd);
            transaction.commit();
        }

        return String.valueOf(qd.getQuestionID());
    }

    @Override
    public void updateQuestion(Map<String, String> mapInfo) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            qd = (QuestionModel) session.createQuery("from QuestionModel qd where qd.questionID = :questionID").setParameter("questionID", mapInfo.get("questionID"));
            if (qd != null) {
                qd.setQuestionContext(mapInfo.get("questionContext"));
                qd.setTypeOfQuestionCode(mapInfo.get("typeOfQuestionCode"));
                qd.setQuestionMark(Integer.parseInt(mapInfo.get("questionMark")));
                qd.setQuestionContext(mapInfo.get("questionContext"));
                session.update(qd);
                transaction.commit();

            }
        }
    }

    @Override
    public void removeQuestion(int questionID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            qd = (QuestionModel) session.createQuery("from QuestionModel qd where qd.questionID = :questionID").setParameter("questionID", questionID).uniqueResult();
            if (qd != null) {
                session.remove(qd);
                transaction.commit();
            }
        }
    }

    @Override
    public List questionsList(String subjectCode) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            List<QuestionModel> questionsList = session.createQuery("from QuestionModel qd "
                    + "where subjectCode=:subjectCode").setParameter("subjectCode", subjectCode).list();
            transaction.commit();
            return questionsList;

        }
    }

}
