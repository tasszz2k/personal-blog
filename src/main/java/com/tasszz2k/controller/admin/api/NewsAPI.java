/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.controller.admin.api;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tasszz2k.model.NewsModel;
import com.tasszz2k.model.UserModel;
import com.tasszz2k.service.base.INewsService;
import com.tasszz2k.service.impl.NewsService;
import com.tasszz2k.utils.HttpUtils;
import com.tasszz2k.utils.SessionUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TASS
 */
@WebServlet(name = "NewsAPI", urlPatterns = {"/api-admin-news"})
public class NewsAPI extends HttpServlet {

    @Inject
    private INewsService newsService;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewsAPI</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NewsAPI at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

//        ObjectMapper mapper = new ObjectMapper();
//        
//        
//        NewsModel newsModel = HttpUtils.of(request.getReader()).toModel(NewsModel.class);
//        newsModel = newsService.save(newsModel);
//        mapper.writeValue(response.getOutputStream(), newsModel);
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        ObjectMapper mapper = new ObjectMapper();
        NewsModel newsModel = HttpUtils.of(request.getReader()).toModel(NewsModel.class);
        newsModel.setCreatedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUserName());
        newsModel = newsService.save(newsModel);
        mapper.writeValue(response.getOutputStream(), newsModel);
    }

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        ObjectMapper mapper = new ObjectMapper();
        NewsModel newsUpdate = HttpUtils.of(request.getReader()).toModel(NewsModel.class);
        newsUpdate.setModifiedBy(((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL")).getUserName());
        newsUpdate = newsService.update(newsUpdate);

        mapper.writeValue(response.getOutputStream(), newsUpdate);

    }


    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        ObjectMapper mapper = new ObjectMapper();
        NewsModel newsModel = HttpUtils.of(request.getReader()).toModel(NewsModel.class);
        newsService.delete(newsModel.getIds());
        mapper.writeValue(response.getOutputStream(), "{sakjdhsadkj}");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
