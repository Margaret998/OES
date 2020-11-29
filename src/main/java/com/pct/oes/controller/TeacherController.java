/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.controller;

import com.pct.oes.dao.FindUserDAO;
import com.pct.oes.dao.UserManageDAO;
import com.pct.oes.dao.UserProfileDAO;
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
public class TeacherController {

    public static final String USERID = "userID";

    @Autowired
    UserManageDAO umd;

    @Autowired
    UserProfileDAO upd;

    @Autowired
    FindUserDAO fud;

    @RequestMapping("/teacher")
    public ModelAndView teacherDashboard() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("teacher/teacher-dashboard");

        return mav;
    }

    @RequestMapping("/teacher/update-teacher")
    public ModelAndView teacherProfile() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("teacher/profile");
        String teacherID = fud.getUserID();
        mav.addObject("teacherList", upd.teacherProfileList(teacherID));

        return mav;
    }

    @PostMapping("/teacher/update-teacher")
    public ModelAndView teacherProfilePost(@RequestParam Map<String, String> mapInfo) {
        ModelAndView mav = new ModelAndView();
        mapInfo.put("teacherID", fud.getUserID());
        umd.addTeacherInfo(mapInfo);
        mav.setViewName("messages/profile-updated");
        return mav;
    }

    @RequestMapping("/teacher/show-students")
    public ModelAndView showStudents() {
        ModelAndView mav = new ModelAndView();
        String teacherID = fud.getUserID();
        mav.addObject("studentsList", upd.studentsListForTeacher(teacherID));
        mav.setViewName("teacher/show-students");
        return mav;
    }

    @RequestMapping("/teacher/reset-password")
    public ModelAndView resetPassword() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("teacher/reset-password");
        return mav;
    }

    @PostMapping("/teacher/reset-password")
    public ModelAndView resetPasswordPost(@RequestParam String oldPassword, @RequestParam String newPassword) {
        ModelAndView mav = new ModelAndView();
        String userID = fud.getUserID();
        umd.resetPassword(userID, oldPassword, newPassword);

        mav.setViewName("teacher/teacher-dashboard");
        return mav;
    }
}
