/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao.imlp;

import com.pct.oes.dao.MultipleChoiceQuestionDAO;
import com.pct.oes.model.MultipleChoiceQuestionModel;
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
public class MultipleChoiceQuestionDAOImpl implements MultipleChoiceQuestionDAO {

    @Autowired
    SessionFactory sessionFactory;

    Transaction transaction;

    MultipleChoiceQuestionModel mcqm = new MultipleChoiceQuestionModel();

    @Override
    public void addQuestion(Map<String, String> mapInfo) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            mcqm.setQuestionID(Integer.parseInt(mapInfo.get("questionID")));
            mcqm.setChoice1(mapInfo.get("choice1"));
            mcqm.setChoice2(mapInfo.get("choice2"));
            mcqm.setChoice3(mapInfo.get("choice3"));
            mcqm.setChoice4(mapInfo.get("choice4"));
            mcqm.setRightAnswer(Integer.parseInt(mapInfo.get("rightAnswer")));
            session.save(mcqm);
            transaction.commit();

        }
    }

    @Override
    public void updateQuestion(Map<String, String> mapInfo) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();

            mcqm = (MultipleChoiceQuestionModel) session.createQuery("from MultipleChoiceQuestionModel mcqm where mcqm.questionChoicesID = :questionChoicesID").setParameter("questionChoicesID", mapInfo.get("questionChoicesID"));
            if (mcqm != null) {
                mcqm.setQuestionID(Integer.parseInt(mapInfo.get("questionID")));
                mcqm.setChoice1(mapInfo.get("choice1"));
                mcqm.setChoice2(mapInfo.get("choice2"));
                mcqm.setChoice3(mapInfo.get("choice3"));
                mcqm.setChoice4(mapInfo.get("choice4"));
                mcqm.setRightAnswer(Integer.parseInt(mapInfo.get("rightAnswer")));
                
                session.saveOrUpdate(mcqm);
                transaction.commit();

            }
        }

    }

    @Override
    public void removeQuestion(int questionID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();

            mcqm = (MultipleChoiceQuestionModel) session.createQuery("from MultipleChoiceQuestionModel mcqm where mcqm.questionID = :questionID").setParameter("questionID", questionID);
            if (mcqm != null) {
                session.remove(mcqm);
                transaction.commit();
            }
        }
    }

}
