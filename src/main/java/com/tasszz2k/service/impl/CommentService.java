/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.service.impl;

import com.tasszz2k.dao.base.ICommentDAO;
import com.tasszz2k.model.CommentModel;
import com.tasszz2k.model.UserModel;
import com.tasszz2k.paging.Pageble;
import com.tasszz2k.service.base.ICommentService;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author TASS
 */
public class CommentService implements ICommentService {

    @Inject
    private ICommentDAO commentDAO;

    @Override
    public CommentModel save(CommentModel commentModel) {
//        commentModel.setCreatedDate(new java.sql.Date(Calendar.getInstance().getTime().getTime()));

        Long commentId = commentDAO.save(commentModel);
        return commentDAO.findOne(commentId);
    }

    @Override
    public CommentModel findOne(Long id) {
        CommentModel commentModel = commentDAO.findOne(id);
        return commentModel;
    }

    @Override
    public List<CommentModel> findAll(Pageble pageble) {
        return commentDAO.findAll(pageble);
    }

    @Override
    public Integer getTotalItems() {
        return commentDAO.getTotalItems();
    }

    @Override
    public List<CommentModel> findCommentsByNewsId(Long newsId) {
        return commentDAO.findCommentsByNewsId(newsId);
    }

    @Override
    public Integer getTotalItemsByNewsId(Long newsId) {
        return commentDAO.getTotalItemsByNewsId(newsId);
    }

    @Override
    public CommentModel update(CommentModel commentUpdate) {
        commentDAO.update(commentUpdate);
        return findOne(commentUpdate.getId());
    }

}
