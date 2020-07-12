/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.mapper;

import com.tasszz2k.model.NewsModel;
import com.tasszz2k.model.RoleModel;
import com.tasszz2k.model.UserModel;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author TASS
 */
public class UserMapper implements RowMapper<UserModel> {

    @Override
    public UserModel mapRow(ResultSet resultSet) {
        try {
            UserModel user = new UserModel();
            user.setId(resultSet.getLong("id"));
            user.setUserName(resultSet.getString("username"));
            user.setFullName(resultSet.getString("fullname"));
            user.setPassword(resultSet.getString("password"));
            user.setStatus(resultSet.getInt("status"));
            user.setCreatedDate(resultSet.getDate("createddate"));
            user.setCreatedBy(resultSet.getString("createdby"));
            if (resultSet.getDate("modifieddate") != null) {
                user.setModifiedDate(resultSet.getDate("modifieddate"));
            }
            if (resultSet.getString("modifiedby") != null) {
                user.setModifiedBy(resultSet.getString("modifiedby"));
            }
            try {
                user.setAvatar(resultSet.getString("avatar"));
            } catch (Exception ex) {
                Logger.getLogger(UserMapper.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                RoleModel role = new RoleModel();
                role.setCode(resultSet.getString("code"));
                role.setName(resultSet.getString("name"));
                user.setRole(role);
            } catch (Exception ex) {
                Logger.getLogger(UserMapper.class.getName()).log(Level.SEVERE, null, ex);
            }

            return user;
        } catch (SQLException ex) {
            Logger.getLogger(UserMapper.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

}
