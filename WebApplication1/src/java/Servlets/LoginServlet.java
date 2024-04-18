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
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
            System.out.println(usuario.getUsuario());
            System.out.println(usuario.getContraseña());
            Usuarios usu = new Usuarios();
            Object loginUsuario=daousu.login(usuario);
            
            usu=(Usuarios)loginUsuario;
            
            String pantalla;
            if(usu.getIdUsuario()!=0){
                //si existe
                pantalla="Home.jsp";
                request.setAttribute("Usuario", usu);
                request.setAttribute("error",0);
                System.out.println("Si existo");
            
            }else{
                //no existe
                 pantalla="SignIn.jsp";
                 request.setAttribute("error",1);
                 System.out.println("No existo");
                 System.out.println(usu.getIdUsuario());
                 System.out.println(usu.getUsuario());
            }
            RequestDispatcher rd= request.getRequestDispatcher(pantalla);
            rd.forward(request, response);
    }

}