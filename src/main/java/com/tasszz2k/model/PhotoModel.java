/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.model;

/**
 *
 * @author TASS
 */
public class PhotoModel extends AbstractModel<PhotoModel> {

    private Long userId;
    private String title;
    private String image;
    private String shortDescription;
    private UserModel user;

    public PhotoModel() {
    }

    public PhotoModel(Long userId, String title, String image, String shortDescription) {
        this.userId = userId;
        this.title = title;
        this.image = image;
        this.shortDescription = shortDescription;
    }

    public UserModel getUser() {
        return user;
    }

    public void setUser(UserModel user) {
        this.user = user;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

}
