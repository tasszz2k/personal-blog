/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.dao.impl;

import com.tasszz2k.dao.base.INewsDAO;
import com.tasszz2k.mapper.NewsMapper;
import com.tasszz2k.model.NewsModel;
import com.tasszz2k.paging.Pageble;
import java.util.List;
import org.apache.commons.lang.StringUtils;

/**
 *
 * @author TASS
 */
public class NewsDAO extends AbstractDAO<NewsModel> implements INewsDAO {

    @Override
    public List<NewsModel> findByCategoryId(Long categoryId) {
        StringBuilder sql = new StringBuilder("SELECT * FROM news WHERE categoryid=?");
        return query(sql.toString(), new NewsMapper(), categoryId);
    }

    @Override
    public Long save(NewsModel newsModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO [news](title, content, thumbnail, shortDescription, categoryid, createddate, createdby) values(?,?,?,?,?,?,?)");
        return insert(sql.toString(), newsModel.getTitle(), newsModel.getContent(), newsModel.getThumbnail(),
                newsModel.getShortDescription(), newsModel.getCategoryId(), newsModel.getCreatedDate(), newsModel.getCreatedBy());
    }

    @Override
    public void update(NewsModel newsUpdate) {
        StringBuilder sql = new StringBuilder("UPDATE [dbo].[news]\n"
                + "   SET [title] = ?\n"
                + "      ,[thumbnail] = ?\n"
                + "      ,[shortdescription] = ?\n"
                + "      ,[content] = ?\n"
                + "      ,[categoryid] = ?\n"
                + "      ,[createddate] = ?\n"
                + "      ,[createdby] = ?\n"
                + "      ,[modifieddate] = ?\n"
                + "      ,[modifiedby] = ?\n"
                + " WHERE id = ? ");

        update(sql.toString(), newsUpdate.getTitle(), newsUpdate.getThumbnail(), newsUpdate.getShortDescription(),
                newsUpdate.getContent(), newsUpdate.getCategoryId(), newsUpdate.getCreatedDate(), newsUpdate.getCreatedBy(),
                newsUpdate.getModifiedDate(), newsUpdate.getModifiedBy(), newsUpdate.getId());
    }

    @Override
    public NewsModel findOne(Long id) {
        StringBuilder sql = new StringBuilder("SELECT news.id,\n"
                + "       title,\n"
                + "       thumbnail,\n"
                + "       shortdescription,\n"
                + "       content,\n"
                + "       categoryid,\n"
                + "       news.createddate,\n"
                + "       news.modifieddate,\n"
                + "       news.createdby,\n"
                + "       news.modifiedby,\n"
                + "       category.code,\n"
                + "       category.name\n"
                + "FROM news\n"
                + "    INNER JOIN dbo.category\n"
                + "        ON category.id = news.categoryid\n"
                + "WHERE news.id=?");
        List<NewsModel> news = query(sql.toString(), new NewsMapper(), id);
        return news.isEmpty() ? null : news.get(0);
    }

    @Override
    public void delete(Long id) {
        StringBuilder sql = new StringBuilder("DELETE FROM [dbo].[news]\n"
                + "      WHERE id = ?");
        update(sql.toString(), id);
    }

    @Override
    public List<NewsModel> findAll(Pageble pageble) {
        StringBuilder sql = new StringBuilder("SELECT news.id,title,thumbnail,shortdescription,content,categoryid,"
                + "news.createddate,news.modifieddate,news.createdby,news.modifiedby,category.code,category.name \n"
                + "FROM news \n"
                + "INNER JOIN dbo.category ON category.id = news.categoryid");
        if (pageble.getSorter() != null
                && StringUtils.isNotBlank(pageble.getSorter().getSortBy()) 
                && StringUtils.isNotBlank(pageble.getSorter().getSortType())) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortBy() + " " + pageble.getSorter().getSortType() + "\n");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" OFFSET " + pageble.getOffset() + " ROWS\n"
                    + "FETCH NEXT " + pageble.getLimit() + " ROW ONLY ");
        }
        return query(sql.toString(), new NewsMapper());

    }

    @Override
    public Integer getTotalItems() {
        String sql = "SELECT COUNT(*) FROM dbo.news";
        return count(sql);
    }
}
