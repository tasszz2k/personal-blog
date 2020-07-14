/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.dao.base;

import com.tasszz2k.model.NewsModel;
import com.tasszz2k.paging.Pageble;
import java.util.List;

/**
 *
 * @author TASS
 */
public interface INewsDAO extends GenericDAO<NewsModel> {

    NewsModel findOne(Long id);
    List<NewsModel> findByCategoryId(Long categoryId);
    List<NewsModel> searchByKeyword(Pageble pageble,String keyword);
    Long save(NewsModel newsModel);
    void update(NewsModel newsUpdate);
    void delete(Long id);
    List<NewsModel> findAll(Pageble pageble);
    Integer getTotalItems();
    Integer getTotalResulSearched(String keyword);
    Integer getTotalItemsByCategoryCode(String categoryCode);
    List<NewsModel> findByCategoryCode(Pageble pageble, String categoryCode);
    
}
