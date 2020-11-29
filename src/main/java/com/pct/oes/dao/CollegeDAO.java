/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao;

import java.util.List;

/**
 *
 * @author looper
 */
public interface CollegeDAO {

    void addCollege(String collegeName);

    void updateCollege(String collegeName);

    void removeCollege(String collegeName);

    List collegesList();
}
