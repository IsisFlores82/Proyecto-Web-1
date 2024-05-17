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
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author cdpin
 */
@WebServlet(name = "BusquedaAvanzadaServlet", urlPatterns = {"/BusquedaAvanzadaServlet"})
public class BusquedaAvanzadaServlet extends HttpServlet {

 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String f_inicio_string = request.getParameter("datePickerInicio");
        String f_fin_string = request.getParameter("datePickerFin");
        
        java.util.Date utilDate;
        Date f_inicio = null;
        if (!"".equals(f_inicio_string)){
            try {
                utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(f_inicio_string);
            } catch (ParseException ex) {
                return;
            }
            f_inicio = new java.sql.Date(utilDate.getTime());
        }
        Date f_fin = null;
        if (!"".equals(f_fin_string)){
            try {
                utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(f_fin_string);
            } catch (ParseException ex) {
                return;
            }
            f_fin = new java.sql.Date(utilDate.getTime());
        }
        
        int offset = 0;
               
int idCategoria = Integer.parseInt(request.getParameter("clasification"));
        String texto = request.getParameter("BAText").trim();

        List<Publicacion> publicaciones;
        DAOPublicacion daopost = new DAOPublicacion();
        
        publicaciones = daopost.getAdvancedSearchPosts(f_inicio, f_fin, offset, idCategoria,texto);
        
        request.setAttribute("BusquedaAvanzada", publicaciones);
        System.out.println("esto tiene BusquedaAvanzada"+publicaciones);
        request.setAttribute("num_paginas",daopost.getnAdvancedSearchPosts(f_inicio, f_fin, idCategoria,texto)/10+1);
        System.out.println("mis num_paginas de avanced son:"+daopost.getnAdvancedSearchPosts(f_inicio, f_fin, idCategoria,texto)/10+1);
        request.setAttribute("searchword", texto);
        System.out.println("mis palabras de avanced son:"+texto);
        request.setAttribute("idCategoria", idCategoria);
        System.out.println("mi categoria de avanced es:"+idCategoria);
        request.setAttribute("f_inicio", f_inicio);
        System.out.println("mi fecha inicio de avanced es:"+f_inicio);
        request.setAttribute("f_fin", f_fin);
        System.out.println("mi fecha final de avanced es:"+f_fin);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
        dispatcher.forward(request, response);
    }


}
