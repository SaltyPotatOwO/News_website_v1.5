/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import dao.CommentDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.*;

/**
 *
 * @author Asus
 */
@WebServlet(name = "UpdateComment", urlPatterns = {"/UpdateComment"})
public class UpdateComment extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            CommentDAO commentDAO = new CommentDAO();
            int comment_id = Integer.parseInt(request.getParameter("comment_id"));
            int news_id = Integer.parseInt(request.getParameter("news_id"));
            String updateRequest = request.getParameter("action");
            System.out.println(updateRequest);
            if (updateRequest == null || updateRequest.length() == 0) {
                String comment_content = request.getParameter("comment_content");
                Comments comment = new Comments(comment_id, comment_content);
                commentDAO.updateComments(comment);//update comment into database
                request.getSession().removeAttribute("update_id");
            } else {

                request.getSession().setAttribute("update_id", comment_id);
            }

            response.sendRedirect("GetNews?news_id=" + news_id);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

}
