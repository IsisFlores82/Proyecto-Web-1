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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author cdpin
 */
@WebServlet(name = "LoadPublicacionesServlet", urlPatterns = {"/LoadPublicacionesServlet"})
public class LoadPublicacionesServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener las publicaciones activas desde el DAOList<Publicacion> publicaciones;
        List<Publicacion> publicaciones;
        DAOPublicacion daopost = new DAOPublicacion();
        publicaciones = daopost.obtenerPubDash(0);
        request.setAttribute("num_paginas",daopost.obtenerTotalPost()/10+1);
        System.out.println(publicaciones); // Imprimir la lista para verificar su contenido
        request.setAttribute("publicaciones", publicaciones);
        System.out.println("Tamaño de la lista de publicaciones: " + publicaciones.size());
        // Redirigir al dashboard con las publicaciones cargadas
        RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
        rd.forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String texto = request.getParameter("busqueda").trim();

        List<Publicacion> publicaciones;
        DAOPublicacion daopost = new DAOPublicacion();
        
        publicaciones = daopost.getSearchPosts(texto,0);
        request.setAttribute("num_paginas",daopost.getnSearchPosts(texto)/10+1); 
        request.setAttribute("search", publicaciones);
        request.setAttribute("searchword", texto);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
        dispatcher.forward(request, response);
    }


}
