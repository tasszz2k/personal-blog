/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.mapper;

import com.tasszz2k.model.CategoryModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TASS
 */
public class CategoryMapper implements RowMapper<CategoryModel> {

    @Override
    public CategoryModel mapRow(ResultSet resultSet) {
        try {
            CategoryModel category = new CategoryModel();
            category.setId(resultSet.getLong("id"));
            category.setCode(resultSet.getString("code"));
            category.setName(resultSet.getString("name"));
            return category;
        } catch (SQLException ex) {
            Logger.getLogger(CategoryMapper.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
