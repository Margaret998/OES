/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.controller;

import com.pct.oes.dao.ExamDAO;
import com.pct.oes.dao.FindUserDAO;
import com.pct.oes.dao.MultipleChoiceQuestionDAO;
import com.pct.oes.dao.QuestionDAO;
import com.pct.oes.dao.SubjectDAO;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author looper
 */
@Controller
@ResponseBody
public class ExamController {

    public static final String USERID = "userID";

    @Autowired
    QuestionDAO qd;

    @Autowired
    ExamDAO ed;

    @Autowired
    MultipleChoiceQuestionDAO mcqd;

    @Autowired
    SubjectDAO sd;

    @Autowired
    FindUserDAO fud;

    @RequestMapping("/teacher/exam/add-question")
    public ModelAndView addQuestion() {
        ModelAndView mav = new ModelAndView();
        String teacherID = fud.getUserID();
        mav.addObject("subjectList", sd.showTeacherSubjects(teacherID));
        mav.setViewName("teacher/exam/add-question");
        return mav;
    }

    @PostMapping("/teacher/exam/add-question")
    public ModelAndView addQuestionPost(@RequestParam Map<String, String> mapInfo) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("questionID", qd.addQuestion(mapInfo));
        mav.setViewName("teacher/exam/add-multiple-choice");
        return mav;
    }

    @PostMapping("/teacher/exam/add-multi-choice")
    public ModelAndView addQuestionChoicesPost(@RequestParam Map<String, String> mapInfo) {
        ModelAndView mav = new ModelAndView();
        mcqd.addQuestion(mapInfo);
        mav.setViewName("messages/question-added");
        return mav;
    }

    @RequestMapping("/teacher/exam/generate-exam")
    public ModelAndView generateExam() {
        ModelAndView mav = new ModelAndView();
        String teacherID = fud.getUserID();
        mav.addObject("subjectList", sd.showTeacherSubjects(teacherID));
        mav.setViewName("teacher/exam/exam");
        return mav;
    }

    @PostMapping("/teacher/exam/generate-exam")
    public ModelAndView generateExamPost(@RequestParam Map<String, String> mapInfo) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("examID", ed.generateExam(mapInfo));
        mav.setViewName("teacher/exam/generated-exam");
        return mav;
    }

    @RequestMapping("/teacher/exam/generated-exam")
    public ModelAndView generatedExam(@RequestParam int examID) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("examID", examID);
        mav.addObject("examHeader", ed.getGeneratedExamHeader(examID));
        mav.addObject("examQuestions", ed.getGeneratedExamQuestions(examID).toArray());

        return mav;
    }

    @RequestMapping("/teacher/exam/show-exam")
    public ModelAndView showExam(@RequestParam int examID) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("examID", examID);
        mav.addObject("examHeader", ed.getGeneratedExamHeader(examID));
        mav.addObject("examQuestions", ed.getGeneratedExamQuestions(examID).toArray());

        return mav;
    }

    @RequestMapping("/teacher/exam/ready-exams-list")
    public ModelAndView readyExamsList() {
        ModelAndView mav = new ModelAndView();
        String teacherID = fud.getUserID();
        mav.addObject("examsList", ed.getReadyExams(teacherID));
        mav.setViewName("teacher/exam/ready-exams");
        return mav;
    }

    @RequestMapping("/teacher/exam/remove-exam")
    public ModelAndView removeExam(@RequestParam int examID) {
        ModelAndView mav = new ModelAndView();
        String teacherID = fud.getUserID();
        ed.removeExam(examID);
        mav.setViewName("teacher/exam/ready-exams");
        mav.addObject("examsList", ed.getReadyExams(teacherID));
        return mav;
    }

    @RequestMapping("/teacher/exam/show-questions")
    public ModelAndView showQuestions() {
        ModelAndView mav = new ModelAndView();
        String teacherID = fud.getUserID();
        mav.addObject("subjectList", sd.showTeacherSubjects(teacherID));
        mav.setViewName("teacher/exam/show-questions");
        return mav;
    }

    @RequestMapping("/teacher/exam/show-subject-questions")
    public ModelAndView showQuestions2(@RequestParam String subjectCode) {
        ModelAndView mav = new ModelAndView();
        String teacherID = fud.getUserID();
        mav.addObject("subjectList", sd.showTeacherSubjects(teacherID));
        mav.addObject("questionsList", qd.questionsList(subjectCode));
        mav.setViewName("teacher/exam/show-questions");
        return mav;
    }

    @RequestMapping("/teacher/exam/remove-question")
    public ModelAndView removeQuestion(@RequestParam int questionID) {
        ModelAndView mav = new ModelAndView();
        String teacherID = fud.getUserID();
        qd.removeQuestion(questionID);
        mav.addObject("subjectList", sd.showTeacherSubjects(teacherID));
        mav.setViewName("teacher/exam/show-questions");
        return mav;
    }

}
