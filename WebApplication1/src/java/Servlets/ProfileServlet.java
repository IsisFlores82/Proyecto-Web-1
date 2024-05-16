/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import DAO.DAOUsuario;
import entidades.Usuarios;
import entidades.Publicacion;
import DAO.DAOPublicacion;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpSession;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;
import java.util.regex.Pattern;


/**
 *
 * @author estra
 */
@WebServlet(name = "ProfileServlet", urlPatterns = {"/ProfileServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)  // 50MB
public class ProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuarios usuario = (Usuarios)session.getAttribute("Usuario");
        
        List<Publicacion> publicaciones;
        DAOPublicacion daopost = new DAOPublicacion();
        publicaciones = daopost.obtenerPubUser(usuario.getIdUsuario());
        
        
        request.setAttribute("success", request.getAttribute("success"));
        request.setAttribute("error", request.getAttribute("error"));

        request.setAttribute("publicaciones", publicaciones);
        System.out.println("Hola quiero ir a mi perfil");
        RequestDispatcher dispatcher = request.getRequestDispatcher("MyProfile.jsp");
        dispatcher.forward(request, response);
    }
}
    