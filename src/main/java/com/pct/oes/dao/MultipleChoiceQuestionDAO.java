/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao;

import java.util.Map;

/**
 *
 * @author looper
 */
public interface MultipleChoiceQuestionDAO {

    void addQuestion(Map<String, String> mapInfo);

    void updateQuestion(Map<String, String> mapInfo);

    void removeQuestion(int questionID);

}
