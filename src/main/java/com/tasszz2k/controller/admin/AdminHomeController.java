/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.controller.admin;

import com.tasszz2k.model.CommentModel;
import com.tasszz2k.model.NewsModel;
import com.tasszz2k.model.PhotoModel;
import com.tasszz2k.model.UserModel;
import com.tasszz2k.service.base.ICategoryService;
import com.tasszz2k.service.base.ICommentService;
import com.tasszz2k.service.base.INewsService;
import com.tasszz2k.service.base.IPhotoService;
import com.tasszz2k.service.base.IUserService;
import com.tasszz2k.utils.FormUtil;
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
@WebServlet(name = "AdminHomeController", urlPatterns = {"/admin-home"})
public class AdminHomeController extends HttpServlet {

    @Inject
    private INewsService newsService;

    @Inject
    private ICommentService commentService;

    @Inject
    private IUserService userService;

    @Inject
    private ICategoryService categoryService;

    @Inject
    private IPhotoService photoService;

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
            out.println("<title>Servlet HomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath() + "</h1>");
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

        UserModel user = FormUtil.toModel(UserModel.class, request);
        NewsModel news = FormUtil.toModel(NewsModel.class, request);
        CommentModel comment = FormUtil.toModel(CommentModel.class, request);
        PhotoModel photo = FormUtil.toModel(PhotoModel.class, request);

        user.setTotalItems(userService.getTotalItems());
        news.setTotalItems(newsService.getTotalItems());
        comment.setTotalItems(commentService.getTotalItems());
        photo.setTotalItems(photoService.getTotalItems());

        request.setAttribute("user", user);
        request.setAttribute("news", news);
        request.setAttribute("comment", comment);
        request.setAttribute("photo", photo);

        RequestDispatcher rd = request.getRequestDispatcher("view/admin/home.jsp");
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
