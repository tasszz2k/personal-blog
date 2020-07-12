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
public interface Pageble {
    Integer getPage();
    Integer getOffset();
    Integer getLimit();
    Sorter getSorter();
}
