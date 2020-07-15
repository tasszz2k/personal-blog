/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.dao.impl;

import com.tasszz2k.dao.base.IPhotoDAO;
import com.tasszz2k.mapper.PhotoMapper;
import com.tasszz2k.mapper.RowMapper;
import com.tasszz2k.model.PhotoModel;
import com.tasszz2k.paging.Pageble;
import java.util.List;

/**
 *
 * @author TASS
 */
public class PhotoDAO extends AbstractDAO<PhotoModel> implements IPhotoDAO {

    @Override
    public List<PhotoModel> findAll() {
        StringBuilder sql = new StringBuilder("SELECT * FROM dbo.photo\n"
                + "ORDER BY id DESC");
        return query(sql.toString(), new PhotoMapper());
    }

    @Override
    public Integer getTotalItems() {
        String sql = "SELECT COUNT(*) FROM dbo.photo";
        return count(sql);
    }

    @Override
    public PhotoModel findOne(Long id) {
        StringBuilder sql = new StringBuilder("SELECT * FROM dbo.photo\n"
                + "WHERE id = ?");
        List<PhotoModel> photo = query(sql.toString(), new PhotoMapper(), id);
        return photo.isEmpty() ? null : photo.get(0);
    }

    @Override
    public Long save(PhotoModel photoModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO dbo.photo\n"
                + "(userid,title,image,shortdescription,createddate,createdby)\n"
                + "VALUES\n"
                + "(?,?,?,?, GETDATE(),?)");
        return insert(sql.toString(), photoModel.getUserId(), photoModel.getTitle(), photoModel.getImage(), photoModel.getShortDescription(), photoModel.getCreatedBy());
    }

    @Override
    public void update(PhotoModel photoModel) {
        StringBuilder sql = new StringBuilder("UPDATE dbo.photo\n"
                + "SET title= ?,\n"
                + "image=?,\n"
                + "shortdescription=?,\n"
                + "modifiedby=?,\n"
                + "modifieddate=GETDATE()\n"
                + "WHERE id=?");
        update(sql.toString(), photoModel.getTitle(),photoModel.getImage(),photoModel.getShortDescription(),photoModel.getModifiedBy(),photoModel.getId());
    }

}
