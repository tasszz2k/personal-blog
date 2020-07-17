/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.dao.base;

import com.tasszz2k.model.CategoryModel;
import java.util.List;

/**
 *
 * @author TASS
 */
public interface ICategoryDAO extends GenericDAO<CategoryModel>{
     List<CategoryModel> findAll();
     CategoryModel findOne(long id);
     CategoryModel findOneByCode(String code);
     List<CategoryModel> report();
     
}
