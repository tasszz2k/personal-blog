/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.controller.web;

import com.tasszz2k.constant.SystemConstant;
import com.tasszz2k.dao.impl.PhotoDAO;
import com.tasszz2k.model.PhotoModel;
import com.tasszz2k.service.base.ICategoryService;
import com.tasszz2k.service.base.IPhotoService;
import com.tasszz2k.utils.FormUtil;
import com.tasszz2k.utils.MessageUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TASS
 */
@WebServlet(name = "PhotoWebController", urlPatterns = {"/moments"})
public class PhotoWebController extends HttpServlet {

    @Inject
    private IPhotoService photoService;

    @Inject
    private ICategoryService categoryService;

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PhotoController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PhotoController at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PhotoModel photo = FormUtil.toModel(PhotoModel.class, request);
        String view = "";

        //set list result
        photo.setListResult(photoService.findAll());
        photo.setTotalItems(photoService.getTotalItems());

        request.setAttribute("categories", categoryService.findAll());

        //set list result
        view = "/view/web/moments.jsp";

        MessageUtil.showMessage(request);

        request.setAttribute(SystemConstant.PHOTO, photo);
        RequestDispatcher rd = request.getRequestDispatcher(view);
        rd.forward(request, response);

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
        processRequest(request, response);
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
