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
public interface ClassesDAO {

    void addClass(String classCode, String ClassCollege);

    void updateClass(String classCode, String ClassCollege);

    void remove(String classCode);

    List showClasses();

    List getClassesByCollege(String collegeName);
}
