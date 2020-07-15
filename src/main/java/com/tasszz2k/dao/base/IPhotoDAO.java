/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.dao.base;

import com.tasszz2k.model.PhotoModel;
import com.tasszz2k.paging.Pageble;
import java.util.List;

/**
 *
 * @author TASS
 */
public interface IPhotoDAO extends GenericDAO<PhotoModel>{
    List<PhotoModel> findAll();
    Integer getTotalItems();
    PhotoModel findOne(Long id);
    Long save(PhotoModel photoModel);
    void update(PhotoModel photoModel);
}
