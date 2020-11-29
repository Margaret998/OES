/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao;

/**
 *
 * @author looper
 */
public interface LoginDAO {

    boolean authAdmin(String username, String password);

    boolean authStudent(String username, String password);

    boolean authTeacher(String username, String password);
    
    
}
