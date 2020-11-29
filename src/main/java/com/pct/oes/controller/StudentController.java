/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.controller;

import com.pct.oes.dao.ExamDAO;
import com.pct.oes.dao.ExamStudentDAO;
import com.pct.oes.dao.FindUserDAO;
import com.pct.oes.dao.UserManageDAO;
import com.pct.oes.dao.UserProfileDAO;
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
public class StudentController {

    public static final String USERID = "userID";

    @Autowired
    UserManageDAO umd;

    @Autowired
    UserProfileDAO upd;

    @Autowired
    ExamStudentDAO esd;

    @Autowired
    FindUserDAO fud;

    @Autowired
    ExamDAO ed;

    @RequestMapping("/student")
    public ModelAndView studentDashboard() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("student/student-dashboard");

        return mav;
    }

    @RequestMapping("/student/update-student")
    public ModelAndView studentProfile() {
        ModelAndView mav = new ModelAndView();

        String userID = fud.getUserID();
        mav.addObject("userID", userID);
        mav.addObject("studentList", upd.studentProfileList(userID));
        mav.setViewName("student/profile");

        return mav;
    }

    @PostMapping("/student/update-student")
    public ModelAndView studentProfilePost(@RequestParam Map<String, String> mapInfo) {
        ModelAndView mav = new ModelAndView();
        mapInfo.put("studentID", fud.getUserID());
        umd.addStudentInfo(mapInfo);
        mav.setViewName("messaged/student-profile-updated");
        return mav;
    }

    @RequestMapping("/student/my-exams")
    public ModelAndView getStudentExams() {
        ModelAndView mav = new ModelAndView();
        String studentID = fud.getUserID();
        mav.addObject("studentID", studentID);
        mav.addObject("exams", esd.getStudentExams(studentID));
        mav.setViewName("student/my-exams");
        return mav;
    }

    @RequestMapping("/student/exam/enter-exam")
    public ModelAndView enterExam(@RequestParam int examID) {
        ModelAndView mav = new ModelAndView();
        String studentID = fud.getUserID();
        mav.addObject("studentID", studentID);
        mav.addObject("examID", examID);
        mav.addObject("examHeader", ed.getGeneratedExamHeader(examID));
        mav.addObject("examQuestions", ed.getGeneratedExamQuestions(examID));
        mav.setViewName("student/enter-exam");
        return mav;
    }

    @PostMapping("/student/exam/enter-exam")
    public ModelAndView enterExamPost() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("student/student-dashboard");
        return mav;
    }

    @RequestMapping("/student/reset-password")
    public ModelAndView resetPassword() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("student/reset-password");
        return mav;
    }

    @PostMapping("/student/reset-password")
    public ModelAndView resetPasswordPost(@RequestParam String oldPassword, @RequestParam String newPassword) {
        ModelAndView mav = new ModelAndView();
        String userID = fud.getUserID();
        umd.resetPassword(userID, oldPassword, newPassword);

        mav.setViewName("student/student-dashboard");
        return mav;
    }

}
