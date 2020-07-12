/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.utils;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author TASS
 */
public class SessionUtil {
    
    private static SessionUtil sessionUtil = null;
    
    public static SessionUtil getInstance() {
        if (sessionUtil == null) {
            sessionUtil = new SessionUtil();
        }
        return sessionUtil;
    }
    
    public void putValue(HttpServletRequest request, String key, Object value) {
        request.getSession().setAttribute(key, value);
    }
    
    public Object getValue(HttpServletRequest request, String key) {
        return request.getSession().getAttribute(key);
    }
    
    public void removeValue(HttpServletRequest request, String key) {
        request.getSession().removeAttribute(key);
    }
}
