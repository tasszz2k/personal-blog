/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.service.base;

import com.tasszz2k.model.MessageModel;
import com.tasszz2k.paging.Pageble;
import java.util.List;

/**
 *
 * @author TASS
 */
public interface IMessageService {
    MessageModel save(MessageModel messageModel);
    List<MessageModel> findAll(Pageble pageble);
    MessageModel findOne(Long id);
}
