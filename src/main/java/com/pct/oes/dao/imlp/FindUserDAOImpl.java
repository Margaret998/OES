/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.dao.imlp;

import com.pct.oes.dao.FindUserDAO;
import com.pct.oes.model.UserModel;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;

/**
 *
 * @author looper
 */
@Repository
@Transactional
public class FindUserDAOImpl implements FindUserDAO {

    @Autowired
    SessionFactory sessionFactory;

    Transaction transaction;
    
    UserModel um = new UserModel();
   
    String user;
    String studentID;

    @Override
    public String getUserID() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        String userID;
        if (principal instanceof UserDetails) {
            userID = ((UserDetails) principal).getUsername();
        } else {
            userID = principal.toString();
        }
        return userID;
    }
    @Override
    public String getUserRole() {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        String userRole = "";
        if (principal instanceof UserDetails) {
            userRole = ((UserDetails) principal).getAuthorities().toString();
        } else {
            userRole = principal.toString();
        }
        return userRole;
    }

    @Override
    public String findUserByID(String userID) {

            try(Session session = sessionFactory.openSession()){
                transaction = session.beginTransaction();
                um = (UserModel) session.createQuery("From UserModel um "
                        + "where um.userID=:userID").setParameter("userID", userID).uniqueResult();
                
            }
            return um.getUserID();
    }
    
    
    

}
