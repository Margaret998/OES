/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao.imlp;

import com.pct.oes.dao.ExamStudentDAO;
import com.pct.oes.model.ExamModel;
import com.pct.oes.model.ExamResultModel;
import com.pct.oes.model.ExamStudentsModel;
import com.pct.oes.model.MultipleChoiceQuestionModel;
import com.pct.oes.model.QuestionModel;
import com.pct.oes.model.StudentAnswerModel;
import com.pct.oes.model.StudentModel;
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
@Transactional
@Repository
public class ExamStudentDAOImpl implements ExamStudentDAO {

    @Autowired
    SessionFactory sessionFactory;

    Transaction transaction;

    ExamStudentsModel esm = new ExamStudentsModel();
    ExamModel em = new ExamModel();
    StudentModel sm = new StudentModel();
    MultipleChoiceQuestionModel mcqm = new MultipleChoiceQuestionModel();
    QuestionModel qm = new QuestionModel();
    ExamResultModel erm = new ExamResultModel();
    StudentAnswerModel sam = new StudentAnswerModel();

    List<ExamStudentsModel> examStudentsList = new ArrayList<>();
    List<ExamResultModel> StudentResultsList = new ArrayList<>();
    List<ExamStudentsModel> allEnrolledStudents = new ArrayList<>();
    List<StudentAnswerModel> getStudentExamAsessment = new ArrayList<>();

    private double finalMark = 0;
    private double examFullMark = 1;

    @Override
    public void enrollStudentInExam(String studentID, int examID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            em = (ExamModel) session.createQuery("from ExamModel em where em.examID = :examID").setParameter("examID", examID).uniqueResult();
            sm = (StudentModel) session.createQuery("from StudentModel sm where sm.studentID = :studentID").setParameter("studentID", studentID).uniqueResult();

            if (em != null && sm != null) {
                esm.setExamID(examID);
                esm.setFullName(sm.getFullName());
                esm.setStudentID(studentID);
                esm.setExamName(em.getExamName());
                session.save(esm);
            }
            transaction.commit();
        }
    }

    @Override
    public List getStudentExams(String studentID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            examStudentsList = session.createQuery("from ExamStudentsModel esm where esm.studentID = :studentID").setParameter("studentID", studentID).list();

        }

        return examStudentsList;
    }

    @Override
    public void examCorrection(Map<String, String> mapInfo) {

        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            String studentID = mapInfo.get("studentID");
            int examID = Integer.parseInt(mapInfo.get("examID"));
            String examName = mapInfo.get("examName");
            int numberOfQuestions = Integer.parseInt(mapInfo.get("numberOfQuestions"));

            em = (ExamModel) session.createQuery("from ExamModel em where "
                    + "em.examID=:examID").setParameter("examID", examID).uniqueResult();
            if (em != null) {
                examFullMark = em.getExamFullMark();
            }

            for (int i = 1; i < numberOfQuestions; i++) {
                String answerAssessment = "incorrect";
                String questionID = mapInfo.get(String.valueOf(i).concat("questionID"));
                String questionID2 = questionID.substring(Integer.toString(i).length() - 1, questionID.length());
                int choice = Integer.parseInt(mapInfo.get("q".concat(String.valueOf(i))));
                qm = (QuestionModel) session.createQuery("from QuestionModel qm where "
                        + "qm.questionID =:questionID").setParameter("questionID", Integer.parseInt(questionID2)).uniqueResult();
                int qMark = qm.getQuestionMark();
                //get right answer
                mcqm = (MultipleChoiceQuestionModel) session.createQuery("from MultipleChoiceQuestionModel mcqm where "
                        + "mcqm.questionID =:questionID").setParameter("questionID", Integer.parseInt(questionID2)).uniqueResult();
                int validAnswerID = mcqm.getRightAnswer();

                // check if student answer is correct 
                if (choice == validAnswerID) {
                    System.out.println("ValidID::" + validAnswerID);
                    System.out.println("ChoiceID::" + choice);
                    finalMark += qMark;
                    answerAssessment = "correct";
                }
                System.out.println("assessment::" + answerAssessment);

                // Storing info for Student Assessment
                String validAnswerContext = session.createQuery("select mcqm.choice" + validAnswerID + " FROM MultipleChoiceQuestionModel mcqm where "
                        + "mcqm.questionID =:questionID").setParameter("questionID", Integer.parseInt(questionID2)).uniqueResult().toString();
                String studentAnswerContext = session.createQuery("select mcqm.choice" + choice + " FROM MultipleChoiceQuestionModel mcqm where "
                        + "mcqm.questionID =:questionID").setParameter("questionID", Integer.parseInt(questionID2)).uniqueResult().toString();
                qm = (QuestionModel) session.createQuery("from QuestionModel qm where "
                        + "qm.questionID =:questionID").setParameter("questionID", Integer.parseInt(questionID2)).uniqueResult();
                sam.setExamID(examID);
                sam.setStudentID(studentID);
                sam.setQuestionID(examID);
                sam.setQuestionContext(qm.getQuestionContext());
                sam.setStudentAnswerID(choice);
                sam.setStudentAnswerContext(studentAnswerContext);
                sam.setValidAnswerID(validAnswerID);
                sam.setValidAnswerContext(validAnswerContext);
                sam.setAnswerAssessment(answerAssessment);
                session.save(sam);
                session.evict(sam);
            }

            erm.setExamID(examID);
            erm.setExamName(examName);
            erm.setStudentID(studentID);
            System.out.println("Final Mark:" + finalMark + ":::: fullMark::" + examFullMark);
            double score = ((finalMark / examFullMark) * 100);
            erm.setFinalMark((int) score);
            session.save(erm);
            transaction.commit();
        }

    }

    @Override
    public List studentResults(String studentID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            StudentResultsList = session.createQuery("from ExamResultModel erm where "
                    + "erm.studentID = :studentID").setParameter("studentID", studentID).list();

            return StudentResultsList;
        }
    }

    @Override
    public List allStudentsResults(int examID) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void removeStudentFromExam(String studentID, int examID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            esm = (ExamStudentsModel) session.createQuery("from ExamStudentsModel esm where "
                    + "esm.studentID =:studentID AND "
                    + "esm.examID=:examID").setParameter("studentID", studentID).setParameter("examID", examID).uniqueResult();

            if (esm != null) {
                session.remove(esm);
                transaction.commit();
            }
        }
    }

    @Override
    public List getAllEnrolledStudents(String teacherID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            allEnrolledStudents = session.createQuery("from ExamStudentsModel esm where esm.studentID IN "
                    + "(Select sm.studentID From StudentModel sm where sm.classCode IN "
                    + "(Select tatm.classCode From TeacherAssignedToModel tatm) AND :teacherID IN "
                    + "(Select tatm.teacherID From TeacherAssignedToModel tatm where tatm.classCode = sm.classCode))").
                    setParameter("teacherID", teacherID).list();

        }

        return allEnrolledStudents;
    }

    @Override
    public List studentExamAssessment(String studentID, int examID) {
        try ( Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            getStudentExamAsessment = session.createQuery("from StudentAnswerModel sam where "
                    + "sam.studentID=:studentID AND sam.examID=:examID ").
                    setParameter("studentID", studentID).setParameter("examID", examID).list();
        }
        return getStudentExamAsessment;
    }

}
