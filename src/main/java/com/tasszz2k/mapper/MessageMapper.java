/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.mapper;

import com.tasszz2k.model.MessageModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TASS
 */
public class MessageMapper implements RowMapper<MessageModel> {

    @Override
    public MessageModel mapRow(ResultSet resultSet) {
        try {
            MessageModel message = new MessageModel();
            message.setId(resultSet.getLong("id"));

            message.setContent(resultSet.getString("content"));

            message.setCreatedDate(resultSet.getDate("createddate"));
            message.setCreatedBy(resultSet.getString("createdby"));
            if (resultSet.getDate("modifieddate") != null) {
                message.setModifiedDate(resultSet.getDate("modifieddate"));
            }
            if (resultSet.getString("modifiedby") != null) {
                message.setModifiedBy(resultSet.getString("modifiedby"));
            }

            return message;
        } catch (SQLException ex) {
            Logger.getLogger(NewsMapper.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
