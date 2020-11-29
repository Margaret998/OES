/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @author looper
 */
@Entity
@Table(name = "studentAnswer")

public class StudentAnswerModel implements Serializable {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name = "native", strategy = "native")
    int id;

    @Column
    int examID;

    @Column
    int questionID;

    @Column
    String questionContext;

    @Column
    String studentID;

    @Column
    int studentAnswerID;

    @Column
    int validAnswerID;

    @Column
    String studentAnswerContext;

    @Column
    String validAnswerContext;

    @Column
    String answerAssessment; // correct or incorrect

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getExamID() {
        return examID;
    }

    public void setExamID(int examID) {
        this.examID = examID;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getQuestionContext() {
        return questionContext;
    }

    public void setQuestionContext(String questionContext) {
        this.questionContext = questionContext;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public int getStudentAnswerID() {
        return studentAnswerID;
    }

    public void setStudentAnswerID(int studentAnswerID) {
        this.studentAnswerID = studentAnswerID;
    }

    public int getValidAnswerID() {
        return validAnswerID;
    }

    public void setValidAnswerID(int validAnswerID) {
        this.validAnswerID = validAnswerID;
    }

    public String getStudentAnswerContext() {
        return studentAnswerContext;
    }

    public void setStudentAnswerContext(String studentAnswerContext) {
        this.studentAnswerContext = studentAnswerContext;
    }

    public String getValidAnswerContext() {
        return validAnswerContext;
    }

    public void setValidAnswerContext(String validAnswerContext) {
        this.validAnswerContext = validAnswerContext;
    }

    public String getAnswerAssessment() {
        return answerAssessment;
    }

    public void setAnswerAssessment(String answerAssessment) {
        this.answerAssessment = answerAssessment;
    }

}
