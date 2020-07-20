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
import com.tasszz2k.paging.PageRequest;
import com.tasszz2k.paging.Pageble;
import com.tasszz2k.service.base.ICategoryService;
import com.tasszz2k.service.base.ICommentService;
import com.tasszz2k.service.base.INewsService;
import com.tasszz2k.service.base.IPhotoService;
import com.tasszz2k.service.base.IUserService;
import com.tasszz2k.sort.Sorter;
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
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

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

        String action = request.getParameter("action");

        UserModel user = FormUtil.toModel(UserModel.class, request);
        NewsModel news = FormUtil.toModel(NewsModel.class, request);
        CommentModel comment = FormUtil.toModel(CommentModel.class, request);
        PhotoModel photo = FormUtil.toModel(PhotoModel.class, request);

        /* get all */
        Pageble pageble = new PageRequest(news.getPage(), news.getMaxPageItem(),
                new Sorter(news.getSortBy(), news.getSortType()));
        news.setListResult(newsService.findAll(pageble));
        comment.setListResult(commentService.findAll(pageble));
        user.setListResult(userService.findAll(pageble));
        /* end get all */

        user.setTotalItems(userService.getTotalItems());
        news.setTotalItems(newsService.getTotalItems());
        comment.setTotalItems(commentService.getTotalItems());
        photo.setTotalItems(photoService.getTotalItems());

        /* Export excel*/
        if (action != null && action.equals("export")) {
            response.setContentType("application/vnd.ms-excel");
            response.setHeader("Content-Dispositon", "attachment;filename=reportDataBlog.xls");
            XSSFWorkbook wb = new XSSFWorkbook();
            XSSFCellStyle style = createStyleForTitle(wb);
            /*============== News Report =========================*/
            XSSFSheet sheet = wb.createSheet("articles_report");
            /* Create Excel*/
            //1.Header
            int rowNo = 0;
            Row row = sheet.createRow(rowNo++);
            int cellNum = 0;
            Cell cell = row.createCell(cellNum++);
            cell.setCellValue("id");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("title");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("thumbnail");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("shortdescription");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("content");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("categoryid");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("createddate");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("modifieddate");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("createdby");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("modifiedby");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("category code");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("category name");
            cell.setCellStyle(style);

            //2.detail
            for (NewsModel newsModel : news.getListResult()) {
                cellNum = 0;
                row = sheet.createRow(rowNo++);

                cell = row.createCell(cellNum++);
                cell.setCellValue(newsModel.getId());

                cell = row.createCell(cellNum++);
                cell.setCellValue(newsModel.getTitle());

                cell = row.createCell(cellNum++);
                cell.setCellValue(newsModel.getThumbnail());

                cell = row.createCell(cellNum++);
                cell.setCellValue(newsModel.getShortDescription());

                cell = row.createCell(cellNum++);
                cell.setCellValue(newsModel.getContent());

                cell = row.createCell(cellNum++);
                cell.setCellValue(newsModel.getCategoryId());

                cell = row.createCell(cellNum++);
                cell.setCellValue(newsModel.getCreatedDate());

                cell = row.createCell(cellNum++);
                cell.setCellValue(newsModel.getModifiedDate());

                cell = row.createCell(cellNum++);
                cell.setCellValue(newsModel.getCreatedBy());

                cell = row.createCell(cellNum++);
                cell.setCellValue(newsModel.getModifiedBy());

                cell = row.createCell(cellNum++);
                cell.setCellValue(newsModel.getCategoryCode());

                cell = row.createCell(cellNum++);
                cell.setCellValue(newsModel.getCategoryName());

            }
            /*============== End News Report =========================*/
            //
            /*============== News Report =========================*/
            XSSFSheet sheet2 = wb.createSheet("comments_report");
            /* Create Excel*/
            //1.Header
            rowNo = 0;
            row = sheet2.createRow(rowNo++);
            cellNum = 0;
            cell = row.createCell(cellNum++);
            cell.setCellValue("id");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("content");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("user_id");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("news_id");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("createddate");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("createdby");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("fullname");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("news title");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("avatar");
            cell.setCellStyle(style);

            //2.detail
            for (CommentModel commentModel : comment.getListResult()) {
                cellNum = 0;
                row = sheet2.createRow(rowNo++);

                cell = row.createCell(cellNum++);
                cell.setCellValue(commentModel.getId());

                cell = row.createCell(cellNum++);
                cell.setCellValue(commentModel.getContent());

                cell = row.createCell(cellNum++);
                cell.setCellValue(commentModel.getUserId());

                cell = row.createCell(cellNum++);
                cell.setCellValue(commentModel.getNewsId());

                cell = row.createCell(cellNum++);
                cell.setCellValue(commentModel.getCreatedDate());

                cell = row.createCell(cellNum++);
                cell.setCellValue(commentModel.getCreatedBy());

                cell = row.createCell(cellNum++);
                cell.setCellValue(commentModel.getFullNameUserComment());

                cell = row.createCell(cellNum++);
                cell.setCellValue(commentModel.getTitleNewsComment());

                cell = row.createCell(cellNum++);
                cell.setCellValue(commentModel.getAvatarUserComment());

            }
            /*============== End News Report =========================*/
            //
            /*============== News Report =========================*/
            XSSFSheet sheet3 = wb.createSheet("user_report");
            /* Create Excel*/
            //1.Header
            rowNo = 0;
            row = sheet3.createRow(rowNo++);
            cellNum = 0;
            cell = row.createCell(cellNum++);
            cell.setCellValue("id");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("username");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("password");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("fullname");
            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("status");
            cell.setCellStyle(style);


            cell = row.createCell(cellNum++);
            cell.setCellValue("createddate");
            cell.setCellStyle(style);

//            cell = row.createCell(cellNum++);
//            cell.setCellValue("modifieddate");
//            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("createdby");
            cell.setCellStyle(style);

//            cell = row.createCell(cellNum++);
//            cell.setCellValue("modifiedby");
//            cell.setCellStyle(style);

            cell = row.createCell(cellNum++);
            cell.setCellValue("avatar");
            cell.setCellStyle(style);

            //2.detail
            for (UserModel userModel : user.getListResult()) {
                cellNum = 0;
                row = sheet3.createRow(rowNo++);

                cell = row.createCell(cellNum++);
                cell.setCellValue(userModel.getId());

                cell = row.createCell(cellNum++);
                cell.setCellValue(userModel.getUserName());

                cell = row.createCell(cellNum++);
                cell.setCellValue(userModel.getPassword());

                cell = row.createCell(cellNum++);
                cell.setCellValue(userModel.getFullName());

                cell = row.createCell(cellNum++);
                cell.setCellValue(userModel.getStatus());


                cell = row.createCell(cellNum++);
                cell.setCellValue(userModel.getCreatedDate());

//                cell = row.createCell(cellNum++);
//                cell.setCellValue(userModel.getModifiedDate());

                cell = row.createCell(cellNum++);
                cell.setCellValue(userModel.getCreatedBy());

//                cell = row.createCell(cellNum++);
//                cell.setCellValue(userModel.getModifiedBy());

                cell = row.createCell(cellNum++);
                cell.setCellValue(userModel.getAvatar());

            }
            /*============== End News Report =========================*/
            //
            /* End Create Excel*/
            wb.write(response.getOutputStream());
            wb.close();
            return;
        } else {
            response.setContentType("text/html;charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
        }

        request.setAttribute("user", user);
        request.setAttribute("news", news);
        request.setAttribute("comment", comment);
        request.setAttribute("photo", photo);

        RequestDispatcher rd = request.getRequestDispatcher("view/admin/home.jsp");
        rd.forward(request, response);

    }

    private static XSSFCellStyle createStyleForTitle(XSSFWorkbook workbook) {
        XSSFFont font = workbook.createFont();
        font.setBold(true);
        XSSFCellStyle style = workbook.createCellStyle();
        style.setFont(font);
        return style;
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
