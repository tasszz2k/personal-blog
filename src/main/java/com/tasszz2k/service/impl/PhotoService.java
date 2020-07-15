/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.service.impl;

import com.tasszz2k.dao.base.IPhotoDAO;
import com.tasszz2k.model.PhotoModel;
import com.tasszz2k.service.base.IPhotoService;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author TASS
 */
public class PhotoService implements IPhotoService {

    @Inject
    private IPhotoDAO photoDAO;

    @Override
    public List<PhotoModel> findAll() {
        return photoDAO.findAll();
    }

    @Override
    public Integer getTotalItems() {
        return photoDAO.getTotalItems();
    }

    @Override
    public PhotoModel findOne(Long id) {
        return photoDAO.findOne(id);
    }

    @Override
    public PhotoModel save(PhotoModel photoModel) {
        Long photoId = photoDAO.save(photoModel);
        return photoDAO.findOne(photoId);
    }

    @Override
    public PhotoModel update(PhotoModel photoModel) {
        photoDAO.update(photoModel);
        return photoDAO.findOne(photoModel.getId());
    }

}
