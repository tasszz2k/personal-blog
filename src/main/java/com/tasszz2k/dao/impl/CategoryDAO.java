/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.dao.impl;

import com.tasszz2k.dao.base.ICategoryDAO;
import com.tasszz2k.mapper.CategoryMapper;
import com.tasszz2k.mapper.NewsMapper;
import com.tasszz2k.model.CategoryModel;
import com.tasszz2k.model.NewsModel;
import java.util.List;

/**
 *
 * @author TASS
 */
public class CategoryDAO extends AbstractDAO<CategoryModel> implements ICategoryDAO {

    @Override
    public List<CategoryModel> findAll() {
        String sql = "SELECT * FROM category";
        return query(sql, new CategoryMapper());
    }

    @Override
    public CategoryModel findOne(long id) {
        StringBuilder sql = new StringBuilder("SELECT * FROM category WHERE id=?");
        List<CategoryModel> category = query(sql.toString(), new CategoryMapper(), id);
        return category.isEmpty() ? null : category.get(0);
    }

    @Override
    public CategoryModel findOneByCode(String code) {
        StringBuilder sql = new StringBuilder("SELECT * FROM category WHERE code=?");
        List<CategoryModel> category = query(sql.toString(), new CategoryMapper(), code);
        return category.isEmpty() ? null : category.get(0);
    }

}
