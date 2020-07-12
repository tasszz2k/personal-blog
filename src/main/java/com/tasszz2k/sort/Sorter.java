/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.sort;

/**
 *
 * @author TASS
 */
public class Sorter {

    private String sortBy;
    private String sortType;
    

    public Sorter() {
        this.sortBy="id";
        this.sortType="desc";
    }

    public Sorter(String sortBy, String sortType) {
        this.sortBy = sortBy;
        this.sortType = sortType;
    }

    public String getSortBy() {
        return sortBy;
    }

    public void setSortBy(String sortBy) {
        this.sortBy = sortBy;
    }

    public String getSortType() {
        return sortType;
    }

    public void setSortType(String sortType) {
        this.sortType = sortType;
    }

}
