/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.model;

import java.sql.Date;

/**
 *
 * @author TASS
 */
public class UserModel extends AbstractModel<UserModel> {

    private Long id;
    private String userName;
    private String password;
    private String fullName;
    private Integer status;
    private Long roleId;
    private RoleModel role = new RoleModel();
    private String avatar;

    public UserModel() {
    }

    public UserModel(Long id, String userName, String password, String fullName, Integer status, Long roleId) {
        this.id = id;
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.status = status;
        this.roleId = roleId;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }
    
    

    public RoleModel getRole() {
        return role;
    }

    public void setRole(RoleModel role) {
        this.role = role;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

}
