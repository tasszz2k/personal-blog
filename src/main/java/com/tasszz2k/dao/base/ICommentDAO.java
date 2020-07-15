/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.dao.base;

import com.tasszz2k.model.CommentModel;
import com.tasszz2k.model.UserModel;
import com.tasszz2k.paging.Pageble;
import java.util.List;

/**
 *
 * @author TASS
 */
public interface ICommentDAO  extends GenericDAO<CommentModel>{

    Long save(CommentModel commentModel);
    void update(CommentModel commentUpdate);
    CommentModel findOne(Long id);
    List<CommentModel> findAll(Pageble pageble);
    Integer getTotalItems();
    List<CommentModel> findCommentsByNewsId(Long newsId);
    Integer getTotalItemsByNewsId(Long newsId);
    
}
