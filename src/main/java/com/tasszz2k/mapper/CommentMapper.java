/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.mapper;

import com.tasszz2k.model.CommentModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TASS
 */
public class CommentMapper implements RowMapper<CommentModel> {

    @Override
    public CommentModel mapRow(ResultSet resultSet) {
        try {
            CommentModel comment = new CommentModel();
            comment.setId(resultSet.getLong("id"));
            comment.setContent(resultSet.getString("content"));
            comment.setUserId(resultSet.getLong("user_id"));
            comment.setNewsId(resultSet.getLong("news_id"));
            comment.setCreatedDate(resultSet.getDate("createddate"));
            comment.setCreatedBy(resultSet.getString("createdby"));

            try {
                if (resultSet.getDate("modifieddate") != null) {
                    comment.setModifiedDate(resultSet.getDate("modifieddate"));
                }
                if (resultSet.getString("modifiedby") != null) {
                    comment.setModifiedBy(resultSet.getString("modifiedby"));
                }
            } catch (Exception e) {
                Logger.getLogger(CommentMapper.class.getName()).log(Level.SEVERE, null, e);
            }

            try {
                comment.setAvatarUserComment(resultSet.getString("avatar"));
            } catch (Exception ex) {
                Logger.getLogger(UserMapper.class.getName()).log(Level.SEVERE, null, ex);
            }

            try {
                comment.setFullNameUserComment(resultSet.getString("fullname"));
                comment.setTitleNewsComment(resultSet.getString("title"));
            } catch (Exception e) {
                Logger.getLogger(CommentMapper.class.getName()).log(Level.SEVERE, null, e);
            }

            return comment;
        } catch (SQLException ex) {
            Logger.getLogger(CommentMapper.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
