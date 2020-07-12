/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.filter;

import com.tasszz2k.constant.SystemConstant;
import com.tasszz2k.model.NewsModel;
import com.tasszz2k.model.UserModel;
import com.tasszz2k.utils.SessionUtil;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TASS
 */
public class AuthorizationFilter implements Filter {

    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String url = request.getRequestURI();
        if (url.startsWith(request.getContextPath() +"/admin")) {
            UserModel model = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
            if (model != null) {
                if (model.getRole().getCode().equals(SystemConstant.ADMIN)) {
                    filterChain.doFilter(servletRequest, servletResponse);
                } else if (model.getRole().getCode().equals(SystemConstant.USER)) {
                    response.sendRedirect(request.getContextPath() + "/login?action=login&message=not_permission&alert=danger");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/login?action=login&message=not_login&alert=danger");
            }
        } else {
            ///add more for test
//            UserModel model = (UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL");
            /// end add more for test
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {
    }

}
