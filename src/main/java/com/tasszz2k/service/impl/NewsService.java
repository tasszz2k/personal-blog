/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.service.impl;

import com.tasszz2k.dao.base.ICategoryDAO;
import com.tasszz2k.dao.base.INewsDAO;
import com.tasszz2k.model.CategoryModel;
import com.tasszz2k.model.NewsModel;
import com.tasszz2k.paging.Pageble;
import com.tasszz2k.service.base.INewsService;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author TASS
 */
public class NewsService implements INewsService {

    @Inject
    private INewsDAO newsDAO;

    @Inject
    private ICategoryDAO categoryDAO;

    @Override
    public List<NewsModel> findByCategoryId(Long categoryId) {
        return newsDAO.findByCategoryId(categoryId);
    }

    @Override
    public NewsModel save(NewsModel newsModel) {
        newsModel.setCreatedDate(new java.sql.Date(Calendar.getInstance().getTime().getTime()));
        CategoryModel category = categoryDAO.findOneByCode(newsModel.getCategoryCode());
        newsModel.setCategoryId(category.getId());
        Long newsId = newsDAO.save(newsModel);
        return newsDAO.findOne(newsId);
    }

    @Override
    public NewsModel update(NewsModel newsUpdate) {
        NewsModel oldNews = newsDAO.findOne(newsUpdate.getId());
        newsUpdate.setCreatedDate(oldNews.getCreatedDate());
        newsUpdate.setCreatedBy(oldNews.getCreatedBy());
        newsUpdate.setModifiedDate(new java.sql.Date(Calendar.getInstance().getTime().getTime()));
        CategoryModel category = categoryDAO.findOneByCode(newsUpdate.getCategoryCode());
        newsUpdate.setCategoryId(category.getId());

        newsDAO.update(newsUpdate);
        return newsDAO.findOne(newsUpdate.getId());
    }

    @Override
    public void delete(Long[] ids) {
        for (Long id : ids) {
            //delete comment first (FK_news_comment)
            newsDAO.delete(id);
        }
    }

    @Override
    public List<NewsModel> findAll(Pageble pageble) {
        return newsDAO.findAll(pageble);
    }

    @Override
    public Integer getTotalItems() {
        return newsDAO.getTotalItems();
    }

    @Override
    public NewsModel findOne(long id) {
        NewsModel newsModel = newsDAO.findOne(id);
        CategoryModel categoryModel = categoryDAO.findOne(newsModel.getCategoryId());
        newsModel.setCategoryCode(categoryModel.getCode());
        return newsModel;
    }

    @Override
    public List<NewsModel> searchByKeyword(Pageble pageble, String keyword) {
        return newsDAO.searchByKeyword(pageble, keyword);
    }

    @Override
    public Integer getTotalResulSearched(String keyword) {
        return newsDAO.getTotalResulSearched(keyword);
    }

}
