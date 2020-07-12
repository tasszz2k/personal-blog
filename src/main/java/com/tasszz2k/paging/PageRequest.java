/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.paging;

import com.tasszz2k.sort.Sorter;

/**
 *
 * @author TASS
 */
public class PageRequest implements Pageble {

    private Integer page;
    private Integer maxPageItem;
    private Sorter sorter;

    public PageRequest() {
    }

    public PageRequest(Integer page, Integer maxPageItem, Sorter sorter) {
        this.page = page;
        this.maxPageItem = maxPageItem;
        this.sorter = sorter;
    }

    public Integer getMaxPageItem() {
        return maxPageItem;
    }

    public void setMaxPageItem(Integer maxPageItem) {
        this.maxPageItem = maxPageItem;
    }

    @Override
    public Sorter getSorter() {
        return sorter;
    }

    public void setSorter(Sorter sorter) {
        this.sorter = sorter;
    }

    @Override
    public Integer getPage() {
        return this.page;
    }

    @Override
    public Integer getOffset() {
        if (page != null && maxPageItem != null) {
            return (page - 1) * maxPageItem;
        }
        return null;
    }

    @Override
    public Integer getLimit() {
        return this.maxPageItem;
    }

}
