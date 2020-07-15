/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.mapper;

import com.tasszz2k.model.NewsModel;
import com.tasszz2k.model.PhotoModel;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TASS
 */
public class PhotoMapper implements RowMapper<PhotoModel> {

    @Override
    public PhotoModel mapRow(ResultSet resultSet) {
        try {
            PhotoModel photo = new PhotoModel();
            photo.setId(resultSet.getLong("id"));
            photo.setUserId(resultSet.getLong("userid"));
            photo.setTitle(resultSet.getString("title"));
            photo.setImage(resultSet.getString("image"));
            photo.setShortDescription(resultSet.getString("shortdescription"));
            photo.setCreatedDate(resultSet.getDate("createddate"));
            photo.setCreatedBy(resultSet.getString("createdby"));
            if (resultSet.getDate("modifieddate") != null) {
                photo.setModifiedDate(resultSet.getDate("modifieddate"));
            }
            if (resultSet.getString("modifiedby") != null) {
                photo.setModifiedBy(resultSet.getString("modifiedby"));
            }
            return photo;
        } catch (SQLException ex) {
            Logger.getLogger(PhotoMapper.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
