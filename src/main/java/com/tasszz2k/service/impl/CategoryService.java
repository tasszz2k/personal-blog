/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.service.impl;

import com.tasszz2k.dao.base.ICategoryDAO;
import com.tasszz2k.dao.impl.CategoryDAO;
import com.tasszz2k.model.CategoryModel;
import com.tasszz2k.service.base.ICategoryService;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author TASS
 */
public class CategoryService implements ICategoryService {

    @Inject
    private ICategoryDAO categoryDAO;

    @Override
    public List<CategoryModel> findAll() {
        return categoryDAO.findAll();
    }

}
