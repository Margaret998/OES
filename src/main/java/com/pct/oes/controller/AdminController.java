/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.controller;

import com.pct.oes.dao.ClassesDAO;
import com.pct.oes.dao.CollegeDAO;
import com.pct.oes.dao.FindUserDAO;
import com.pct.oes.dao.SubjectDAO;
import com.pct.oes.dao.TeacherAssignedToDAO;
import com.pct.oes.dao.UserManageDAO;
import com.pct.oes.dao.UserProfileDAO;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.Gson;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author looper
 */
@Controller
@PreAuthorize("hasRole('ROLE_ADMIN')")
public class AdminController {

    public static final String USERID = "userID";

    @Autowired
    UserManageDAO umd;

    @Autowired
    FindUserDAO fud;

    @Autowired
    UserProfileDAO upd;

    @Autowired
    SubjectDAO sd;

    @Autowired
    ClassesDAO cd;

    @Autowired
    CollegeDAO cdd;
    
    @Autowired
    TeacherAssignedToDAO tatm;

   
    @RequestMapping("/admin")
    public ModelAndView adminDashbaord() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("subjectsList", sd.showSubjects());
        mav.addObject("teachersList", upd.teachersList());
        mav.addObject("studentsList", upd.studentsList());

        mav.setViewName("admin/admin-dashboard");
        return mav;
    }

    @RequestMapping("/admin/add-student")
    public ModelAndView addStudent() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("collegesList", cdd.collegesList());
        mav.addObject("classesList", cd.showClasses());
        mav.setViewName("admin/add-student");
        return mav;
    }

    @PostMapping("/admin/add-student")
    public ModelAndView addStudentPost(@RequestParam Map<String, String> mapInfo) {
        ModelAndView mav = new ModelAndView();
        String userID = mapInfo.get("userID");
        String password = mapInfo.get("password");
        String fullName = mapInfo.get("fullName");
        String classCode = mapInfo.get("classCode");
        String collegeName = mapInfo.get("collegeName");

        umd.addStudent(fullName, userID, password, classCode, collegeName);
        mav.setViewName("messages/student-added");
        return mav;
    }

    @RequestMapping("/admin/add-teacher")
    public ModelAndView addTeacher() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("collegesList", cdd.collegesList());

        mav.setViewName("admin/add-teacher");

        return mav;
    }

    @PostMapping("/admin/add-teacher")
    public ModelAndView addTeacherPost(@RequestParam Map<String, String> mapInfo) {
        ModelAndView mav = new ModelAndView();
        String userID = mapInfo.get("userID");
        String password = mapInfo.get("password");
        String fullName = mapInfo.get("fullName");
        String teacherCollege = mapInfo.get("teacherCollege");

        umd.addTeacher(fullName, userID, password, teacherCollege);
        mav.setViewName("messages/teacher-added");
        return mav;
    }

    @RequestMapping("/admin/remove-user")
    public ModelAndView removeUser() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/remove-user");
        return mav;
    }

    @PostMapping("/admin/remove-user")
    public ModelAndView removeUserPost(@RequestParam String userID) {
        ModelAndView mav = new ModelAndView();
        umd.removeUser(userID);
        mav.setViewName("messages/user-removed");
        return mav;
    }

    @RequestMapping("/admin/remove-student")
    public ModelAndView removeStudentPost(@RequestParam String userID) {
        ModelAndView mav = new ModelAndView();
        umd.removeUser(userID);
        mav.addObject("collegesList", cdd.collegesList());
        mav.setViewName("admin/show-students");
        return mav;
    }

    @RequestMapping("/admin/remove-teacher")
    public ModelAndView removeTeacherPost(@RequestParam String userID) {
        ModelAndView mav = new ModelAndView();
        umd.removeUser(userID);
        mav.addObject("collegesList", cdd.collegesList());
        mav.setViewName("admin/show-teachers");
        return mav;
    }

    @RequestMapping("/admin/show-teachers")
    public ModelAndView showTeachers() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("collegesList", cdd.collegesList());
        mav.addObject("teachersList", upd.teachersList());
        mav.setViewName("admin/show-teachers");
        return mav;
    }

    @PostMapping("/admin/show-teachers")
    public ModelAndView showTeachersPost(@RequestParam String teacherCollege) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("collegesList", cdd.collegesList());
        mav.addObject("teachersList", upd.collegeTeachersList(teacherCollege));
        mav.setViewName("admin/show-teachers");
        return mav;
    }
    
    @ResponseBody
    @RequestMapping("/admin/classes/loadClassesByCollege/{collegeName}")
    public String loadClassesByCollege(@PathVariable String collegeName){
        Gson gson = new Gson();
        return gson.toJson(cd.getClassesByCollege(collegeName));
    }

    @RequestMapping("/admin/show-students")
    public ModelAndView showStudents() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("collegesList", cdd.collegesList());
        mav.addObject("studentsList", upd.studentsList());
        mav.setViewName("admin/show-students");
        return mav;
    }

    @PostMapping("/admin/show-students")
    public ModelAndView showStudentsPost(@RequestParam String collegeName, @RequestParam String classCode) {
        ModelAndView mav = new ModelAndView();
        System.out.println("college:" +collegeName + "Class::"+classCode );
        mav.addObject("collegesList", cdd.collegesList());
        mav.addObject("classesList", cd.getClassesByCollege(collegeName));
        mav.addObject("studentsList", upd.collegeStudentsListByCollegeName(collegeName, classCode));
        mav.setViewName("admin/show-students");
        return mav;
    }

    @RequestMapping("/admin/manage-subjects")
    public ModelAndView manageSubject() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("subjectsList", sd.showSubjects());
        mav.addObject("collegesList", cdd.collegesList());
        mav.setViewName("admin/manage-subject");
        return mav;
    }

    @PostMapping("/admin/add-subject")
    public ModelAndView addSubject(@RequestParam String subjectCode, @RequestParam String subjectDescription,
            @RequestParam String subjectCollege) {
        ModelAndView mav = new ModelAndView();
        sd.addSubject(subjectCode, subjectDescription, subjectCollege);
        mav.addObject("collegesList", cdd.collegesList());
        mav.addObject("subjectsList", sd.showSubjects());
        mav.setViewName("admin/manage-subject");
        return mav;
    }

    @RequestMapping("/admin/remove-subject")
    public ModelAndView removeSubject(@RequestParam String subjectCode) {
        ModelAndView mav = new ModelAndView();
        sd.removeSubject(subjectCode);
        mav.addObject("collegesList", cdd.collegesList());
        mav.addObject("subjectsList", sd.showSubjects());
        mav.setViewName("admin/manage-subject");
        return mav;
    }

    @RequestMapping("/admin/reset-password")
    public ModelAndView resetPassword(@RequestParam String userID) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("userID", userID);
        mav.setViewName("admin/reset-password");
        return mav;
    }

    @PostMapping("/admin/reset-password")
    public ModelAndView resetPasswordPost(@RequestParam String userID, @RequestParam String newPassword) {
        ModelAndView mav = new ModelAndView();
        umd.resetPasswordAsAdmin(userID, newPassword);
        mav.setViewName("admin/admin-dashboard");
        return mav;
    }

    @RequestMapping("/admin/manageClasses")
    public ModelAndView manageClasses() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("classesList", cd.showClasses());
        mav.addObject("collegesList", cdd.collegesList());
        mav.setViewName("admin/manage-classes");
        return mav;
    }

    @PostMapping("/admin/manageClasses/add-class")
    public ModelAndView addClass(@RequestParam String classCode, @RequestParam String classCollege) {
        ModelAndView mav = new ModelAndView();
        cd.addClass(classCode, classCollege);
        mav.addObject("collegesList", cdd.collegesList());
        mav.addObject("classesList", cd.showClasses());
        mav.setViewName("admin/manage-classes");
        return mav;
    }

    @RequestMapping("/admin/manageClasses/remove-class")
    public ModelAndView removeClass(@RequestParam String classCode) {
        ModelAndView mav = new ModelAndView();
        cd.remove(classCode);
        mav.addObject("collegesList", cdd.collegesList());
        mav.addObject("classesList", cd.showClasses());
        mav.setViewName("admin/manage-classes");

        return mav;
    }

    @RequestMapping("/admin/manageColleges")
    public ModelAndView manageColleges() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("collegesList", cdd.collegesList());
        mav.setViewName("admin/manage-colleges");
        return mav;
    }

    @PostMapping("/admin/manageColleges/add-college")
    public ModelAndView addCollege(@RequestParam String collegeName) {
        ModelAndView mav = new ModelAndView();
        cdd.addCollege(collegeName);
        mav.addObject("collegesList", cdd.collegesList());
        mav.setViewName("admin/manage-colleges");
        return mav;
    }

    @RequestMapping("/admin/manageColleges/remove-college")
    public ModelAndView removeCollege(@RequestParam String collegeName) {
        ModelAndView mav = new ModelAndView();
        cdd.removeCollege(collegeName);
        mav.addObject("collegesList", cdd.collegesList());
        mav.setViewName("admin/manage-colleges");

        return mav;
    }

    @RequestMapping("admin/manage-teacher-classes")
    public ModelAndView assignTeacher() {
        ModelAndView mav = new ModelAndView();
        mav.addObject("classesList", cd.showClasses());
        mav.addObject("subjectsList", sd.showSubjects());
        mav.addObject("teachersList", upd.teachersList());
        mav.addObject("assignedTeachersList" , tatm.assignedTeacherList());
        mav.setViewName("admin/manage-teacher-classes");
        return mav;
    }
    @PostMapping("admin/manage-teacher-classes")
    public ModelAndView assignTeacherPost(@RequestParam String teacherID, @RequestParam String subjectCode,
            @RequestParam String classCode) {
        ModelAndView mav = new ModelAndView();
        tatm.assignTeacher(teacherID, subjectCode, classCode);
        mav.addObject("classesList", cd.showClasses());
        mav.addObject("subjectsList", sd.showSubjects());
        mav.addObject("teachersList", upd.teachersList());
        mav.addObject("assignedTeachersList" , tatm.assignedTeacherList());
        mav.setViewName("admin/manage-teacher-classes");
        return mav;
    }
    @RequestMapping("admin/remove-assigned-teacher")
    public ModelAndView assignTeacherRemove(@RequestParam String teacherID, @RequestParam String subjectCode,
            @RequestParam String classCode) {
        ModelAndView mav = new ModelAndView();
        tatm.assignTeacherRemove(teacherID, subjectCode, classCode);
        mav.addObject("classesList", cd.showClasses());
        mav.addObject("subjectsList", sd.showSubjects());
        mav.addObject("teachersList", upd.teachersList());
        mav.addObject("assignedTeachersList" , tatm.assignedTeacherList());
        mav.setViewName("admin/manage-teacher-classes");
        return mav;
    }

}
