/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.service.base;

import com.tasszz2k.model.NewsModel;
import com.tasszz2k.paging.Pageble;
import java.util.List;

/**
 *
 * @author TASS
 */
public interface INewsService {
    List<NewsModel> findByCategoryId(Long categoryId);
    NewsModel save(NewsModel newsModel);
    NewsModel update(NewsModel newsUpdate);
    void delete(Long[] ids);
    List<NewsModel> findAll(Pageble pageble);
    Integer getTotalItems();
    NewsModel findOne(long id);
}
