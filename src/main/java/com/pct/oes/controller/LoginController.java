/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.controller;

import com.pct.oes.dao.FindUserDAO;
import com.pct.oes.dao.SubjectDAO;
import com.pct.oes.dao.UserProfileDAO;
import java.security.Principal;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author looper
 */
@Controller
public class LoginController {

    public static final String USERID = "userID";

    @Autowired
    FindUserDAO fud;
    
    @Autowired
    UserProfileDAO upd;

    @Autowired
    SubjectDAO sd;

    @RequestMapping("/")
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView("login");
        System.out.println("userID::" + fud.getUserID());
        return mav;
    }

    @RequestMapping("/login")
    public ModelAndView postLogin2(@RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout, HttpServletRequest req, Principal p) {

        ModelAndView mav = new ModelAndView();
        System.out.println("role::" + fud.getUserRole());
        if (error != null) {
            mav.addObject("error", "Invalid UserID or Password !");
        }
        if (logout != null) {
            mav.setViewName("login");
            mav.addObject("msg", "You have been logged out Successfully!");
            return mav;
        }

        if (fud.getUserRole().equals("[ROLE_ADMIN]")) {
            mav.setViewName("admin/admin-dashboard");
            mav.addObject("subjectsList", sd.showSubjects());
            mav.addObject("teachersList", upd.teachersList());
            mav.addObject("studentsList", upd.studentsList());
        }
        if (fud.getUserRole().equals("[ROLE_STUDENT]")) {
            mav.setViewName("student/student-dashboard");
        }
        if (fud.getUserRole().equals("[ROLE_TEACHER]")) {
            mav.setViewName("teacher/teacher-dashboard");
        } else {
            mav.addObject("error", "Invalid UserID or Password !");

        }

        return mav;
    }

}
