/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.service.base;

import com.tasszz2k.dao.base.GenericDAO;
import com.tasszz2k.model.PhotoModel;
import java.util.List;

/**
 *
 * @author TASS
 */
public interface IPhotoService {

    List<PhotoModel> findAll();
    Integer getTotalItems();
    PhotoModel findOne(Long id);
    PhotoModel save(PhotoModel photoModel);
    PhotoModel update(PhotoModel photoModel);

}
