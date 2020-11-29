/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.controller;

import com.google.common.collect.Multimap;
import com.pct.oes.dao.ExamDAO;
import com.pct.oes.dao.ExamStudentDAO;
import com.pct.oes.dao.FindUserDAO;
import com.pct.oes.dao.UserProfileDAO;
import com.pct.oes.model.ExamStudentsModel;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author looper
 */
@Controller
public class ExamStudentsController {

    public static final String USERID = "userID";

    @Autowired
    ExamDAO ed;

    @Autowired
    ExamStudentDAO esd;

    @Autowired
    UserProfileDAO upd;

    @Autowired
    FindUserDAO fud;
    
    ExamStudentsModel esm;

    @RequestMapping("/teacher/students/enrollStudent")
    public ModelAndView enrollStudent() {
        ModelAndView mav = new ModelAndView();
        String teacherID = fud.getUserID();
        mav.addObject("exams", ed.getReadyExams(teacherID));
        mav.addObject("students", upd.collegeStudentsList(teacherID));
        mav.addObject("studentsList", upd.studentsListForTeacher(teacherID));
        mav.setViewName("teacher/enroll-student-in-exam");
        return mav;
    }

    @PostMapping("/teacher/students/enrollStudent")
    public ModelAndView enrollStudentPost(@RequestParam String studentID, @RequestParam String examID) {
        ModelAndView mav = new ModelAndView();
        System.out.println("examID" + examID);
        System.out.println("studentID: " + studentID);
        esd.enrollStudentInExam(studentID, Integer.parseInt(examID));

        mav.setViewName("messages/student-enrolled");
        return mav;
    }

    @RequestMapping("/teacher/students/enrolled-students")
    public ModelAndView getAllEnrolledStudents() {
        ModelAndView mav = new ModelAndView();
        String teacherID = fud.getUserID();
        mav.addObject("enrolledStudents", esd.getAllEnrolledStudents(teacherID));
        mav.setViewName("teacher/get-all-enrolled");
        return mav;
    }

    @PostMapping("/teacher/students/enrolled-students")
    public ModelAndView EnrolledStudentsPost(@RequestParam Map<Integer, ArrayList<ExamStudentsModel>> mapInfo) {
        ModelAndView mav = new ModelAndView();
        String teacherID = fud.getUserID();
        mav.addObject("enrolledStudents", esd.getAllEnrolledStudents(teacherID));
        mav.setViewName("teacher/get-all-enrolled");
        System.out.println("Enrolled Student: " + mapInfo.get(0).stream());
        return mav;
    }

    @PostMapping("/student/exam/submit-exam")
    public ModelAndView examCorection(@RequestParam Map<String, String> mapInfo, @RequestParam int examID) {
        ModelAndView mav = new ModelAndView();
        String studentID = fud.getUserID();
        System.out.println("Student id:" + studentID + "ExamID: " + examID);
        esd.examCorrection(mapInfo);
        esd.removeStudentFromExam(studentID, examID);

        mav.setViewName("student/student-dashboard");

        return mav;
    }

    @RequestMapping("/student/exam/my-results")
    public ModelAndView studentResults() {
        ModelAndView mav = new ModelAndView();
        String studentID = fud.getUserID();
        mav.addObject("studentID", studentID);
        mav.addObject("studentResults", esd.studentResults(studentID));
        mav.setViewName("student/my-results");
        return mav;

    }

    @RequestMapping("/student/exam/my-exam-assessment")
    public ModelAndView studentExamAssessment(@RequestParam int examID, @RequestParam String examName) {
        ModelAndView mav = new ModelAndView();
        String studentID = fud.getUserID();
        mav.addObject("studentID", studentID);
        mav.addObject("examName", examName);
        mav.addObject("studentAssessment", esd.studentExamAssessment(studentID, examID));
        mav.setViewName("student/my-exam-assessment");
        return mav;

    }

    @RequestMapping("/teacher/exam/student-unenroll")
    public ModelAndView studentUnenrollFromExam(@RequestParam String studentID, @RequestParam int examID) {
        ModelAndView mav = new ModelAndView();
        esd.removeStudentFromExam(studentID, examID);
        mav.setViewName("teacher/get-all-enrolled");
        return mav;

    }

}
