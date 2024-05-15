
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
@WebServlet(name = "PaginacionServlet", urlPatterns = {"/PaginacionServlet"})
public class PaginacionServlet extends HttpServlet {

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pagina = request.getParameter("Pag");
        int pag = Integer.parseInt(pagina.trim());
        
 
            List<Publicacion> publicaciones;
            DAOPublicacion daopost = new DAOPublicacion();
            publicaciones = daopost.obtenerPubDash(pag);
            request.setAttribute("num_paginas",daopost.obtenerTotalPost()/10+1); 
            request.setAttribute("publicaciones", publicaciones);
            request.setAttribute("Pagina", pag);

            RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
            dispatcher.forward(request, response);
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