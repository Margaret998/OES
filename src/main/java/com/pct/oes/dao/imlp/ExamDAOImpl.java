/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao.imlp;

import com.pct.oes.dao.ExamDAO;
import com.pct.oes.model.ExamModel;
import com.pct.oes.model.ExamQuestionsModel;
import com.pct.oes.model.MultipleChoiceQuestionModel;
import com.pct.oes.model.QuestionModel;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author looper
 */
@Repository
@Transactional

public class ExamDAOImpl implements ExamDAO {

    @Autowired
    SessionFactory sessionFactory;

    Transaction transaction;

    ExamModel em = new ExamModel();
    QuestionModel qm = new QuestionModel();
    ExamQuestionsModel eqm = new ExamQuestionsModel();
    MultipleChoiceQuestionModel mcqm = new MultipleChoiceQuestionModel();

    List<ExamModel> exam = new ArrayList<>();
    List<ExamQuestionsModel> examQuestions = new ArrayList<>();

    private int fullMark = 0;

    @Override
    public String generateExam(Map<String, String> mapInfo) {
        LocalDate examDate = LocalDate.parse(mapInfo.get("examDate"));

        int numberOfQuestions = Integer.parseInt(mapInfo.get("numberOfQuestions"));
        String subjectCode = mapInfo.get("subjectCode");
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Query q = session.createQuery("from QuestionModel qm where qm.subjectCode=:subjectCode").setParameter("subjectCode", subjectCode);
            if (q != null) {
                em.setExamDate(java.sql.Date.valueOf(examDate));
                em.setExamName(mapInfo.get("examName"));
                em.setExamTime(Integer.parseInt(mapInfo.get("examTime")));
                em.setExamDescription(mapInfo.get("examDescription"));
                em.setNumberOfQuestions(numberOfQuestions);
                em.setSubjectCode(subjectCode);
                session.save(em);
                session.flush();

                em = (ExamModel) session.createQuery("From ExamModel em where em.examDate = :examDate AND em.subjectCode = :subjectCode").setParameter("subjectCode", subjectCode).setParameter("examDate", java.sql.Date.valueOf(examDate)).setMaxResults(1).uniqueResult();
                if (em != null) {
                    List<QuestionModel> q1
                            = session.createQuery("from QuestionModel qm where qm.subjectCode=:subjectCode ORDER BY rand()").setParameter("subjectCode", subjectCode).setMaxResults(numberOfQuestions).list();

                    for (int i = 0; i < q1.size(); i++) {

                        mcqm = (MultipleChoiceQuestionModel) session.createQuery("from MultipleChoiceQuestionModel mcqm where mcqm.questionID = :questionID").setParameter("questionID", q1.get(i).getQuestionID()).uniqueResult();

                        eqm.setExamID(em.getExamID());
                        eqm.setQuestionID(q1.get(i).getQuestionID());
                        System.out.println("question ID:" + q1.get(i).getQuestionID());
                        System.out.println("multi choice ID:" + mcqm.getQuestionChoicesID());
                        eqm.setQuestionChoicesID(mcqm.getQuestionChoicesID());
                        eqm.setQuestionContext(q1.get(i).getQuestionContext());
                        eqm.setQuestionMark(q1.get(i).getQuestionMark());
                        fullMark += q1.get(i).getQuestionMark();
                        eqm.setChoice1(mcqm.getChoice1());
                        eqm.setChoice2(mcqm.getChoice2());
                        eqm.setChoice3(mcqm.getChoice3());
                        eqm.setChoice4(mcqm.getChoice4());
                        session.save(eqm);
                        session.flush();
                        session.evict(eqm);
                    }
                    em.setExamFullMark(fullMark); // exam Full Mark
                    session.update(em);
                }
            }
            transaction.commit();
        }
        return String.valueOf(eqm.getExamID());
    }

    @Override
    public List getGeneratedExamHeader(int examID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            eqm = (ExamQuestionsModel) session.createQuery("from ExamQuestionsModel eqm where eqm.examID = :examID").setParameter("examID", examID).setMaxResults(1).uniqueResult();
            if (eqm != null) {
                exam = session.createQuery("from ExamModel em where em.examID = :examID").setParameter("examID", examID).list();
            }
        }
        return exam;
    }

    @Override
    public List getGeneratedExamQuestions(int examID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            em = (ExamModel) session.createQuery("from ExamModel em where em.examID = :examID").setParameter("examID", examID).uniqueResult();
            if (em != null) {
                examQuestions = session.createQuery("from ExamQuestionsModel eqm where "
                        + "eqm.examID = :examID").setParameter("examID", examID).list();

            }
        }
        return examQuestions;
    }

    @Override
    public List getReadyExams(String teacherID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            
            List<ExamModel> examsList = session.createQuery("from ExamModel em where "
                    + "em.subjectCode IN (Select tatm.subjectCode From TeacherAssignedToModel tatm where tatm.teacherID=:teacherID)").
                    setParameter("teacherID", teacherID).list();
            if (!examsList.isEmpty()) {
                return examsList;
            }
        }
        return null;
    }

    @Override
    public void removeExam(int examID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            em = (ExamModel) session.createQuery("from ExamModel em where em.examID = :examID").setParameter("examID", examID).uniqueResult();
            if (em != null) {
                session.remove(em);
                transaction.commit();
            }
        }
    }

}
