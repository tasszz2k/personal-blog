/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.dao.impl;

import com.tasszz2k.dao.base.IMessageDAO;
import com.tasszz2k.mapper.MessageMapper;
import com.tasszz2k.model.MessageModel;
import com.tasszz2k.paging.Pageble;
import java.util.List;

/**
 *
 * @author TASS
 */
public class MessageDAO extends AbstractDAO<MessageModel> implements IMessageDAO {

    @Override
    public Long save(MessageModel messageModel) {
        String sql = "INSERT INTO dbo.message\n"
                + "(content, createddate,createdby)\n"
                + "VALUES(?, GETDATE(), ? )";
        return insert(sql, messageModel.getContent(), messageModel.getCreatedBy());
    }

    @Override
    public List<MessageModel> findAll(Pageble pageble) {
        String sql = "SELECT * FROM dbo.message ";
        return query(sql, new MessageMapper());
    }

    @Override
    public MessageModel findOne(Long id) {
        String sql = "SELECT * FROM dbo.message\n"
                + "WHERE id=? ";
        List<MessageModel> messages = query(sql, new MessageMapper(), id);
        return messages.isEmpty() ? null : messages.get(0);
    }

}
