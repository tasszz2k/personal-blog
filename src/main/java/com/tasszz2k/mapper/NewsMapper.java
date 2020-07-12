/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.mapper;

import com.tasszz2k.model.NewsModel;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TASS
 */
public class NewsMapper implements RowMapper<NewsModel> {

    @Override
    public NewsModel mapRow(ResultSet resultSet) {
        try {
            NewsModel news = new NewsModel();
            news.setId(resultSet.getLong("id"));
            news.setTitle(resultSet.getString("title"));
            news.setContent(resultSet.getString("content"));
            news.setCategoryId(resultSet.getLong("categoryid"));
            news.setThumbnail(resultSet.getString("thumbnail"));
            news.setShortDescription(resultSet.getString("shortdescription"));
            news.setCreatedDate(resultSet.getDate("createddate"));
            news.setCreatedBy(resultSet.getString("createdby"));
            if (resultSet.getDate("modifieddate") != null) {
                news.setModifiedDate(resultSet.getDate("modifieddate"));
            }
            if (resultSet.getString("modifiedby") != null) {
                news.setModifiedBy(resultSet.getString("modifiedby"));
            }
            //Retrieving the ResultSetMetaData object
            ResultSetMetaData rsmd = resultSet.getMetaData();
            //getting the column type
            int columnCount = rsmd.getColumnCount();
            if (columnCount > 10) {
                news.setCategoryCode(resultSet.getString("code"));
                news.setCategoryName(resultSet.getString("name"));
            }
            return news;
        } catch (SQLException ex) {
            Logger.getLogger(NewsMapper.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
