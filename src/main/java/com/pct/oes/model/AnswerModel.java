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
@Table(name = "answer" )
public class AnswerModel implements Serializable {
    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
    @GenericGenerator(name = "native", strategy = "native")
    int validAnswerID;
    
    @Column
    int questionID;
    
    @Column
    String validAnswerContext;

    public int getValidAnswerID() {
        return validAnswerID;
    }

    public void setValidAnswerID(int validAnswerID) {
        this.validAnswerID = validAnswerID;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getValidAnswerContext() {
        return validAnswerContext;
    }

    public void setValidAnswerContext(String validAnswerContext) {
        this.validAnswerContext = validAnswerContext;
    }
    
    
}
