/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.controller.admin;

import com.tasszz2k.constant.SystemConstant;
import com.tasszz2k.model.RoleModel;
import com.tasszz2k.model.UserModel;

import com.tasszz2k.paging.PageRequest;
import com.tasszz2k.paging.Pageble;
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
@WebServlet(name = "UserController", urlPatterns = {"/admin-user", "/profile"})
public class UserController extends HttpServlet {

    @Inject
    private IUserService userService;

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
            out.println("<title>Servlet UserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserController at " + request.getContextPath() + "</h1>");
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
        UserModel model = FormUtil.toModel(UserModel.class, request);
        UserModel currentUser = null;
        String view = "";
        if (model.getType().equals(SystemConstant.EDIT)) {
            //update account here
            model = userService.findByUserName(model.getUserName());
            currentUser = ((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL"));

            if (currentUser != null && model.getId() == currentUser.getId()) {
                model.setRole(new RoleModel(currentUser.getRole().getId(),currentUser.getRole().getName(),currentUser.getRole().getCode()));
                SessionUtil.getInstance().putValue(request, "USERMODEL", model);
                view = "/view/profile.jsp";
            }else{
                response.sendRedirect("home-page");
                return;
            }
        } else if (model.getType().equals(SystemConstant.LIST)) {//model.getType().equals(SystemConstant.LIST)
            Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(),
                    new Sorter(model.getSortBy(), model.getSortType()));
            model.setListResult(userService.findAll(pageble));
            model.setTotalItems(userService.getTotalItems());
            model.setTotalPages((int) Math.ceil((double) model.getTotalItems() / model.getMaxPageItem()));

            view = "/view/admin/listUsers.jsp";
        }

        MessageUtil.showMessage(request);

        request.setAttribute(SystemConstant.CURRENT_USER, model);
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
