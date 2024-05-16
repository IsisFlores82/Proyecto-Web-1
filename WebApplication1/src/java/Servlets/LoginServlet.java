/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlets;

import DAO.DAOUsuario;
import entidades.Usuarios;
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

/**
 *
 * @author cdpin
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
DAOUsuario daousu=new DAOUsuario();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            System.out.println("Login Post");
            String user=request.getParameter("fusuario");
            String pass=request.getParameter("fcontra");
            System.out.println("si pedi los datos wey");
            System.out.println(user);
            System.out.println(pass);
            
            Usuarios usuario=new Usuarios(user,pass);
            System.out.println(usuario.getCorreoE());
            System.out.println(usuario.getContraseña());
            Usuarios usu = new Usuarios();
            Object loginUsuario=daousu.login(usuario);
            
            usu=(Usuarios)loginUsuario;
            
            if(usu.getIdUsuario()!=0){
                //si existe
                
                String nombreImagenPerfil = usu.getNImg_Perfil();
                String urlImagenPerfil = request.getContextPath() + "/Imageees/" + nombreImagenPerfil;
                String nombreImagenPortada = usu.getNImg_Portada();
                String urlImagenPortada = request.getContextPath() + "/Imageees/" + nombreImagenPortada;
                HttpSession session = request.getSession();
                session.setAttribute("urlImagenPerfil", urlImagenPerfil);
                session.setAttribute("urlImagenPortada", urlImagenPortada);
                session.setAttribute("Usuario", usu);
                request.setAttribute("error",0);
                System.out.println("Si existo");
                response.sendRedirect("LoadPublicacionesServlet");
            }else{
                //no existe
                 request.setAttribute("error","La combinacion de Usuario y Contraseña es inválida");
                 System.out.println("No existo");
                 RequestDispatcher rd= request.getRequestDispatcher("SignIn.jsp");
                 rd.forward(request, response);
            }
            
    }

}
