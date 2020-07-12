/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TASS
 */
public class HttpUtils {

    private String value;

    public HttpUtils() {

    }

    public HttpUtils(String value) {
        this.value = value;
    }

    /***
     * Convert data JSON to Model
     * @param <T>
     * @param tClass
     * @return 
     */
    
    public <T> T toModel(Class<T> tClass) {
        try {
            return new ObjectMapper().readValue(value, tClass);
        } catch (IOException ex) {
            Logger.getLogger(HttpUtils.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static HttpUtils of(BufferedReader reader) {
        StringBuilder sb = new StringBuilder();

        try {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        } catch (IOException ex) {
            Logger.getLogger(HttpUtils.class.getName()).log(Level.SEVERE, null, ex);
        }

        return new HttpUtils(sb.toString());
    }
}
