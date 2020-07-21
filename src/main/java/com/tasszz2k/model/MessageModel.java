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
public class MessageModel extends AbstractModel<MessageModel> {

    private String content;

    public MessageModel() {
    }

    public MessageModel(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

}
