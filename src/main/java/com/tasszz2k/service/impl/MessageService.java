/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.service.impl;

import com.tasszz2k.dao.base.IMessageDAO;
import com.tasszz2k.model.MessageModel;
import com.tasszz2k.paging.Pageble;
import com.tasszz2k.service.base.IMessageService;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author TASS
 */
public class MessageService implements IMessageService {

    @Inject
    private IMessageDAO messageDAO;

    @Override
    public MessageModel save(MessageModel messageModel) {
        Long messageId = messageDAO.save(messageModel);
        return messageDAO.findOne(messageId);
    }

    @Override
    public List<MessageModel> findAll(Pageble pageble) {
        return messageDAO.findAll(pageble);
    }

    @Override
    public MessageModel findOne(Long id) {
        return messageDAO.findOne(id);
    }

}
