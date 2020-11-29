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
public interface FindUserDAO {

    String getUserID();

    String getUserRole();

    String findUserByID(String userID);
}
