/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.service.base;

import com.tasszz2k.model.CategoryModel;
import java.util.List;

/**
 *
 * @author TASS
 */
public interface ICategoryService {

    List<CategoryModel> findAll();
    List<CategoryModel> report();
}
