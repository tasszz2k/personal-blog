/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tasszz2k.controller.web;

import com.tasszz2k.constant.SystemConstant;
import com.tasszz2k.model.NewsModel;
import com.tasszz2k.model.PhotoModel;
import com.tasszz2k.model.UserModel;
import com.tasszz2k.paging.PageRequest;
import com.tasszz2k.paging.Pageble;
import com.tasszz2k.service.base.ICategoryService;
import com.tasszz2k.service.base.INewsService;
import com.tasszz2k.service.base.IPhotoService;
import com.tasszz2k.service.base.IUserService;
import com.tasszz2k.sort.Sorter;
import com.tasszz2k.utils.FormUtil;
import com.tasszz2k.utils.SessionUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ResourceBundle;
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
@WebServlet(name = "HomeController", urlPatterns = {"/home-page", "/about", "/login", "/logout", "/register"})
public class HomeController extends HttpServlet {

    @Inject
    private ICategoryService categoryService;

    @Inject
    private IUserService userService;

    @Inject
    private INewsService newsService;

    @Inject
    private IPhotoService photoService;

    ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

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
        String url = request.getRequestURI();
        String view = "";
        NewsModel model = FormUtil.toModel(NewsModel.class, request);
        UserModel currentUser = null;
        String action = request.getParameter("action");
        if (action != null && action.equals("login")) {
            String message = request.getParameter("message");
            String alert = request.getParameter("alert");

            if (message != null && alert != null) {
                request.setAttribute("message", resourceBundle.getString(message));
                request.setAttribute("alert", alert);
            }
            view = "view/login.jsp";
//            RequestDispatcher rd = request.getRequestDispatcher("view/login.jsp");
//            rd.forward(request, response);
        } else if (action != null && action.equals("logout")) {
            SessionUtil.getInstance().removeValue(request, "USERMODEL");
            response.sendRedirect(request.getContextPath() + "/home-page");
            return;
        } else {
            currentUser = ((UserModel) SessionUtil.getInstance().getValue(request, "USERMODEL"));
            request.setAttribute("categories", categoryService.findAll());
            if (request.getParameter("page") == null) {
                model.setType("list");
                model.setPage(1);
                model.setMaxPageItem(5);
                model.setSortBy("id");
                model.setSortType("desc");
            }

            Pageble pageble = new PageRequest(model.getPage(), model.getMaxPageItem(),
                    new Sorter(model.getSortBy(), model.getSortType()));
            model.setListResult(newsService.findAll(pageble));
            model.setTotalItems(newsService.getTotalItems());
            model.setTotalPages((int) Math.ceil((double) model.getTotalItems() / model.getMaxPageItem()));
//            
//            photo
            PhotoModel photo = FormUtil.toModel(PhotoModel.class, request);
            //set list result
            photo.setListResult(photoService.findAll());
            photo.setTotalItems(photoService.getTotalItems());
//            photo
            request.setAttribute(SystemConstant.PHOTO, photo);
            request.setAttribute(SystemConstant.MODEL, model);
            request.setAttribute(SystemConstant.CURRENT_USER, currentUser);

//            ===============Redirect page===================
            if (url.startsWith(request.getContextPath() + "/home-page")) {
                view = "view/web/home.jsp";
            } else if (url.startsWith(request.getContextPath() + "/about")) {
                view = "view/web/about.jsp";
            } else if (url.startsWith(request.getContextPath() + "/register")) {
                if (action != null && action.equals("register")) {
                    String message = request.getParameter("message");
                    String alert = request.getParameter("alert");

                    if (message != null && alert != null) {
                        request.setAttribute("message", resourceBundle.getString(message));
                        request.setAttribute("alert", alert);
                    }
                }
                view = "view/register.jsp";
            } else if (url.startsWith(request.getContextPath() + "/moments")) {
                view = "view/web/moments.jsp";
            }

//            RequestDispatcher rd = request.getRequestDispatcher("view/web/home.jsp");
//            rd.forward(request, response);
        }
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
        String action = request.getParameter("action");

        if (action != null && action.equals("login")) {
            UserModel model = FormUtil.toModel(UserModel.class, request);
            model = userService.findByUserNameAndPasswordAndStatus(model.getUserName(), model.getPassword(), 1);
            if (model != null) {
                SessionUtil.getInstance().putValue(request, "USERMODEL", model);
                if (model.getRole().getCode().equals("USER")) {
                    response.sendRedirect(request.getContextPath() + "/home-page");
                } else if (model.getRole().getCode().equals("ADMIN")) {
                    response.sendRedirect(request.getContextPath() + "/admin-home");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/login?action=login&message=username_password_invalid&alert=danger");
            }
            //private
//            String url = AuthenticationFilter.of(model.getUserName(), model.getPassword()).urlRedirect(request);
//            response.sendRedirect(request.getContextPath() + url);
        }
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
