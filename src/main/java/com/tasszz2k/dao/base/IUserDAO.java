/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.dao.base;

import com.tasszz2k.model.UserModel;
import com.tasszz2k.paging.Pageble;
import java.util.List;

/**
 *
 * @author TASS
 */
public interface IUserDAO extends GenericDAO<UserModel> {

    UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status);
    UserModel findByUserName(String userName);
    Long save(UserModel userModel);
    List<UserModel> findAll(Pageble pageble);
    Integer getTotalItems();
    void update(UserModel userModel);

}
