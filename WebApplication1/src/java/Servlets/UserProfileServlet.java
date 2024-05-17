/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import DAO.DAOPublicacion;
import DAO.DAOUsuario;
import entidades.Publicacion;
import entidades.Usuarios;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;



/**
 *
 * @author estra
 */
@WebServlet(name = "UserProfileServlet", urlPatterns = {"/UserProfileServlet"})
public class UserProfileServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        Usuarios usuario = new Usuarios();
        String id = request.getParameter("UPId");
        System.out.println("ID Hidden: " + id); 
        int ID = Integer.parseInt(id.trim());
        System.out.println("ID int: " + ID); 
        usuario.setIdUsuario(ID);
        
        List<Publicacion> publicaciones;
        DAOPublicacion daopost = new DAOPublicacion();
        DAOUsuario daousu = new DAOUsuario();
        publicaciones = daopost.obtenerPubUser(usuario.getIdUsuario());
        Object usu=daousu.getusuario(usuario);
        usuario=(Usuarios)usu;
        HttpSession session = request.getSession();
        request.setAttribute("success", request.getAttribute("success"));
        request.setAttribute("error", request.getAttribute("error"));
        session.setAttribute("UsuarioProfile", usuario);
        request.setAttribute("publicaciones", publicaciones);
        System.out.println("Hola quiero ir al perfil de este tilino");
        RequestDispatcher dispatcher = request.getRequestDispatcher("UserProfile.jsp");
        dispatcher.forward(request, response);
    }
}