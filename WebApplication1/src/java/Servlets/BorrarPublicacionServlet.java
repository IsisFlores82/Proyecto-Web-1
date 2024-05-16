/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import DAO.DAOPublicacion;
import entidades.Publicacion;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author estra
 */
@WebServlet(name = "BorrarPublicacionServlet", urlPatterns = {"/BorrarPublicacionServlet"})
public class BorrarPublicacionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd;
        int id_post = Integer.parseInt(request.getParameter("IpostId").trim());
        DAOPublicacion daopost = new DAOPublicacion();
        
        int result = daopost.deletepost(id_post);
        String pantalla;
        switch (result) {
            case 1 -> {
                request.setAttribute("success", "Publicación eliminada.");
                response.sendRedirect("ProfileServlet");
            }
            default -> {
                request.setAttribute("error", "No se pudo eliminar la publicación, intente de nuevo.");
                pantalla = "profile.jsp";
                rd = request.getRequestDispatcher(pantalla);
                rd.forward(request, response);
            }
        }
        
    }


}