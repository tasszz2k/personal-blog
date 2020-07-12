/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.utils;

import java.lang.reflect.InvocationTargetException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.beanutils.BeanUtils;

/**
 *
 * @author TASS
 */
public class FormUtil {

    @SuppressWarnings("unchecked")
    public static <T> T toModel(Class<T> tClass, HttpServletRequest request) {
        T object = null;
        try {
            object = (T) tClass.newInstance();
            BeanUtils.populate(object, request.getParameterMap());
        } catch (InstantiationException | IllegalAccessException | InvocationTargetException ex) {
            Logger.getLogger(FormUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return object;
    }
}
