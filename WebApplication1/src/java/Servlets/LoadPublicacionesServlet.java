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
        publicaciones = daopost.obtenerPublicacionesActivas();
        System.out.println(publicaciones); // Imprimir la lista para verificar su contenido
        request.setAttribute("publicaciones", publicaciones);
        System.out.println("Tamaño de la lista de publicaciones: " + publicaciones.size());
        // Redirigir al dashboard con las publicaciones cargadas
        RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
        rd.forward(request, response);
    }
}
