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
@Table(name = "typeOfQuestion")
public class TypeOfQuestionModel implements Serializable {

    @Id
    @Column
    String typeOfQuestionCode;
    
    @Column
    String typeOfQuestionDescription;

    public String getTypeOfQuestionCode() {
        return typeOfQuestionCode;
    }

    public void setTypeOfQuestionCode(String typeOfQuestionCode) {
        this.typeOfQuestionCode = typeOfQuestionCode;
    }

    public String getTypeOfQuestionDescription() {
        return typeOfQuestionDescription;
    }

    public void setTypeOfQuestionDescription(String typeOfQuestionDescription) {
        this.typeOfQuestionDescription = typeOfQuestionDescription;
    }
    
    
}
