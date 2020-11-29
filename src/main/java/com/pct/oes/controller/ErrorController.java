/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pct.oes.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author looper
 */
@Controller
public class ErrorController {

    @RequestMapping("/errors")
    public ModelAndView renderErrorPage(HttpServletRequest req) {
        ModelAndView mav = new ModelAndView();
        int httpErrorCode = getErrorCode(req);

        switch (httpErrorCode) {
            case 400:
                mav.setViewName("messages/error/400");
                break;
            case 401:
                mav.setViewName("messages/error/401");
                break;
            case 404:
                mav.setViewName("messages/error/404");
                break;
            case 500:
                mav.setViewName("messages/error/500");
                break;
            default:
                mav.setViewName("messages/error/error");
                break;
        }

        return mav;
    }

    private int getErrorCode(HttpServletRequest req) {
        return (Integer) req.getAttribute("javax.servlet.error.status_code");
    }

}
