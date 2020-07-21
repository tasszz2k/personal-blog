/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.controller.web;

import com.tasszz2k.constant.SystemConstant;
import com.tasszz2k.model.MessageModel;
import com.tasszz2k.model.UserModel;
import com.tasszz2k.paging.PageRequest;
import com.tasszz2k.paging.Pageble;
import com.tasszz2k.service.base.ICategoryService;
import com.tasszz2k.service.base.IMessageService;
import com.tasszz2k.service.base.IUserService;
import com.tasszz2k.sort.Sorter;
import com.tasszz2k.utils.FormUtil;
import com.tasszz2k.utils.MessageUtil;
import com.tasszz2k.utils.SessionUtil;
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
@WebServlet(name = "MessageController", urlPatterns = {"/message"})
public class MessageController extends HttpServlet {

    @Inject
    private ICategoryService categoryService;

    @Inject
    private IUserService userService;

    @Inject
    private IMessageService messageService;

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
            out.println("<title>Servlet MessageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MessageController at " + request.getContextPath() + "</h1>");
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
        UserModel currentUser = null;
        String view = "";

        currentUser = ((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL"));

        MessageModel messageModel = FormUtil.toModel(MessageModel.class, request);

        Pageble pageble = new PageRequest(messageModel.getPage(), messageModel.getMaxPageItem(),
                new Sorter(messageModel.getSortBy(), messageModel.getSortType()));
        messageModel.setListResult(messageService.findAll(pageble));

        view = "/view/web/message.jsp";

        MessageUtil.showMessage(request);
        request.setAttribute("categories", categoryService.findAll());
        request.setAttribute(SystemConstant.CURRENT_USER, currentUser);
        request.setAttribute(SystemConstant.MESSAGE_MODEL, messageModel);

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
