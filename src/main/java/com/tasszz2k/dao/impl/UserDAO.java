/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.dao.impl;

import com.tasszz2k.dao.base.IUserDAO;
import com.tasszz2k.mapper.UserMapper;
import com.tasszz2k.model.UserModel;
import com.tasszz2k.paging.Pageble;
import java.util.List;
import org.apache.commons.lang.StringUtils;

/**
 *
 * @author TASS
 */
public class UserDAO extends AbstractDAO<UserModel> implements IUserDAO {

    @Override
    public UserModel findByUserNameAndPasswordAndStatus(String userName, String password, Integer status) {
        StringBuilder sql = new StringBuilder("SELECT * FROM dbo.[user]\n"
                + "INNER JOIN dbo.role ON role.id = [user].roleid\n"
                + "WHERE username = ? AND password = ? AND status = ? ");
        List<UserModel> users = query(sql.toString(), new UserMapper(), userName, password, status);
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public Long save(UserModel userModel) {
        StringBuilder sql = new StringBuilder("INSERT INTO [dbo].[user]\n"
                + "           ([username],[password],[fullname],[status],[roleid],createddate,createdby,avatar)\n"
                + "     VALUES (?,?, ?, ?, ?,?,?,?);");
        return insert(sql.toString(), userModel.getUserName(), userModel.getPassword(), userModel.getFullName(), userModel.getStatus(), userModel.getRoleId(),
                userModel.getCreatedDate(), userModel.getCreatedBy(), userModel.getAvatar());
    }

    @Override
    public List<UserModel> findAll(Pageble pageble) {
        StringBuilder sql = new StringBuilder("SELECT * FROM dbo.[user]");
        if (pageble.getSorter() != null
                && StringUtils.isNotBlank(pageble.getSorter().getSortBy())
                && StringUtils.isNotBlank(pageble.getSorter().getSortType())) {
            sql.append(" ORDER BY " + pageble.getSorter().getSortBy() + " " + pageble.getSorter().getSortType() + "\n");
        }
        if (pageble.getOffset() != null && pageble.getLimit() != null) {
            sql.append(" OFFSET " + pageble.getOffset() + " ROWS\n"
                    + "FETCH NEXT " + pageble.getLimit() + " ROW ONLY ");
        }
        return query(sql.toString(), new UserMapper());
    }

    @Override
    public Integer getTotalItems() {
        String sql = "SELECT COUNT(*) FROM dbo.[user]";
        return count(sql);
    }

    @Override
    public UserModel findByUserName(String userName) {
        StringBuilder sql = new StringBuilder("SELECT * FROM dbo.[user]\n"
                + "WHERE username LIKE ?");
        List<UserModel> users = query(sql.toString(), new UserMapper(), userName);
        return users.isEmpty() ? null : users.get(0);
    }

    @Override
    public void update(UserModel userModel) {
        StringBuilder sql = new StringBuilder("UPDATE dbo.[user]\n"
                + "SET password = ?,\n"
                + "fullname=?,\n"
                + "avatar= ?,\n"
                + "modifiedby=(SELECT username FROM dbo.[user] WHERE username=?),\n"
                + "modifieddate=GETDATE()\n"
                + "WHERE [user].username=?");

        update(sql.toString(), userModel.getPassword(), userModel.getFullName(), userModel.getAvatar(), userModel.getUserName(), userModel.getUserName());

    }

}
