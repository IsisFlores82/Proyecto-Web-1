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
@WebServlet(name = "EditarPublicacionServlet", urlPatterns = {"/EditarPublicacionServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)  // 50MB
public class EditarPublicacionServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher rd;
        
String idpost = request.getParameter("EpostId");

System.out.println("ID Post: " + idpost); // Print the value of idpost to the console
int id_post = Integer.parseInt(idpost.trim());


        String titulo = request.getParameter("postTitle");
        
        String contenido = request.getParameter("bodypost");
        
int idCategoria = Integer.parseInt(request.getParameter("categoria"));
    System.out.println(idCategoria);
    // Obtener la parte del archivo (imagen)
    Part filePart = request.getPart("nPostinputImage");

// Inicializar variables para la imagen y la ruta de la imagen
InputStream imagen = null;
String rutaImagen = null;

// Verificar si se proporcionó una imagen
if (filePart != null && filePart.getSize() > 0) {
    // Si se proporcionó una imagen, obtener el InputStream y la ruta de la imagen
    imagen = filePart.getInputStream();
    rutaImagen = filePart.getSubmittedFileName();
}
       // Crear objeto Publicacion
    Publicacion publicacion = new Publicacion();
    publicacion.setIdPublicacion(id_post);
    publicacion.setTitulo(titulo);
    publicacion.setContenido(contenido);
    publicacion.setIdCategoria(idCategoria); // Asignar la categoría
    
        
        DAOPublicacion daopost = new DAOPublicacion();
        int result = daopost.updatepost(publicacion,imagen, rutaImagen, getServletContext());
        
     
        switch (result) {
            case 1 -> {
                System.out.println("success Publicación editada.");
                response.sendRedirect("ProfileServlet");
            }
            default -> {
                request.setAttribute("error", "No se pudo editar la publicación, intente de nuevo.");
                System.out.println("trone XD");
                rd = request.getRequestDispatcher("MyProfile.jsp");
                rd.forward(request, response);
            }
        }
        
    }


}