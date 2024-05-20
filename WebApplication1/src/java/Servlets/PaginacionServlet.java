
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
 * @author estra
 */
@WebServlet(name = "PaginacionServlet", urlPatterns = {"/PaginacionServlet"})
public class PaginacionServlet extends HttpServlet {

   @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String pagina = request.getParameter("Pag");
        int pag = Integer.parseInt(pagina.trim());
        String asearch = request.getParameter("ASearch").trim();
        String search = request.getParameter("Search").trim();
        if ("true".equals(search)){
            String texto = request.getParameter("Searchword").trim();

            List<Publicacion> publicaciones;
            DAOPublicacion daopost = new DAOPublicacion();

            publicaciones = daopost.getSearchPosts(texto,pag);

            request.setAttribute("num_paginas",daopost.getnSearchPosts(texto)/10+1); 
            request.setAttribute("search", publicaciones);
            request.setAttribute("searchword", texto);
            request.setAttribute("Pagina", pag);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
            dispatcher.forward(request, response);
        } else if ("true".equals(asearch)){
            List<Publicacion> publicaciones;
        DAOPublicacion daopost = new DAOPublicacion();
        
        String texto = request.getParameter("Searchword").trim();
        String idcategoria = request.getParameter("IdCategoria");
        int idCategoria = Integer.parseInt(idcategoria.trim());
        String f_inicio_string = request.getParameter("F_inicio");
        System.out.println("esta es mi f_inicio recibida en servlet pag: "+f_inicio_string);
        String f_fin_string = request.getParameter("F_fin");
            System.out.println("esta es mi f_fin recibida en servlet pag: "+f_fin_string); 
        java.util.Date utilDate;
        Date f_inicio = null;
        if (!"".equals(f_inicio_string)){
            try {
                utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(f_inicio_string);
                f_inicio = new java.sql.Date(utilDate.getTime());
            } catch (ParseException ex) {
                System.out.println("me fui de fecha inicio");
            }
            System.out.println("fecha inicio servlet en el if: "+f_inicio);
        }
        System.out.println("fecha inicio servlet en el if: "+f_inicio);
        Date f_fin = null;
        System.out.println("fecha fin servlet"+f_fin_string);
        if (!"".equals(f_fin_string)){
            try {
                utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(f_fin_string);
                f_fin = new java.sql.Date(utilDate.getTime());
            } catch (ParseException ex) {
                System.out.println("me fui de fecha fin");
            }
            System.out.println("fecha fin servlet en el if: "+f_fin);
        }
        System.out.println("fecha fin servlet en el if: "+f_fin);
        publicaciones = daopost.getAdvancedSearchPosts(f_inicio, f_fin, pag, idCategoria,texto);
        int numpag=daopost.getnAdvancedSearchPosts(f_inicio, f_fin, idCategoria,texto)/10+1;
        request.setAttribute("searchword", texto);
        request.setAttribute("num_paginas",numpag);
         System.out.println("mis num_paginas de avanced en paginacion son:"+numpag);
            request.setAttribute("Pagina", pag);
            System.out.println("mis Pagina de avanced en paginacion son:"+pag);
            request.setAttribute("BusquedaAvanzada", publicaciones);
            request.setAttribute("idCategoria", idCategoria);
            request.setAttribute("f_inicio", f_inicio);
            request.setAttribute("f_fin", f_fin);
        
            RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
            dispatcher.forward(request, response);
        }else {
            List<Publicacion> publicaciones;
            DAOPublicacion daopost = new DAOPublicacion();
            publicaciones = daopost.obtenerPubDash(pag);
            request.setAttribute("num_paginas",daopost.obtenerTotalPost()/10+1); 
            request.setAttribute("publicaciones", publicaciones);
            request.setAttribute("Pagina", pag);

            RequestDispatcher dispatcher = request.getRequestDispatcher("Home.jsp");
            dispatcher.forward(request, response);
        }
       
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