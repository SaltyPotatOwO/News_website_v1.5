/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package servlet;

import dao.*;
import model.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Asus
 */
@WebServlet(name="DeleteComment", urlPatterns={"/DeleteComment"})
public class DeleteComment extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            CommentDAO commentDAO = new CommentDAO();
            
            String rawCommentID = request.getParameter("comment_id");
            int news_id = Integer.parseInt(request.getParameter("news_id"));
            
            commentDAO.deleteComments(Integer.parseInt(rawCommentID));//delete by id
            response.sendRedirect("GetNews?news_id=" + news_id);
        } catch (Exception e) {
            System.out.println("error deleting news");
        }
    }


}
