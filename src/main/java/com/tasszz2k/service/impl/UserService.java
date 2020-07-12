/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.service.impl;

import com.tasszz2k.dao.base.IUserDAO;
import com.tasszz2k.model.UserModel;
import com.tasszz2k.paging.Pageble;
import com.tasszz2k.service.base.IUserService;
import java.util.Calendar;
import java.util.List;
import javax.inject.Inject;

/**
 *
 * @author TASS
 */
public class UserService implements IUserService {

    @Inject
    private IUserDAO userDAO;

    @Override
    public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status) {
        return userDAO.findByUserNameAndPasswordAndStatus(userName, password, status);
    }

    @Override
    public UserModel save(UserModel userModel) {
        userModel.setCreatedDate(new java.sql.Date(Calendar.getInstance().getTime().getTime()));
        Long userId = userDAO.save(userModel);
        if (userId != null) {
            return userDAO.findByUserNameAndPasswordAndStatus(userModel.getUserName(), userModel.getPassword(), userModel.getStatus());
        } else {
            return null;
        }
    }

    @Override
    public List<UserModel> findAll(Pageble pageble) {
        return userDAO.findAll(pageble);
    }

    @Override
    public Integer getTotalItems() {
        return userDAO.getTotalItems();
    }

    @Override
    public UserModel findByUserName(String userName) {
        return userDAO.findByUserName(userName);
    }

    @Override
    public UserModel update(UserModel newUser) {
        userDAO.update(newUser);
        return userDAO.findByUserName(newUser.getUserName());
    }

}
