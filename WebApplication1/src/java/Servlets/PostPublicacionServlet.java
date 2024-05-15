package Servlets;

import DAO.DAOPublicacion;
import entidades.Publicacion;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.InputStream;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(name = "PostPublicacionServlet", urlPatterns = {"/PostPublicacionServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class PostPublicacionServlet extends HttpServlet {
    DAOPublicacion daoPublicacion = new DAOPublicacion();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    // Obtener parámetros del formulario
    System.out.println("Create Post");
    String titulo = request.getParameter("postTitle");
    System.out.println(titulo);
    String contenido = request.getParameter("bodypost");
    System.out.println(contenido);
    int idUsuario = Integer.parseInt(request.getSession().getAttribute("idUsuario").toString()); // Obtener el ID de usuario de la sesión
    System.out.println(idUsuario);
    // Obtener la categoría seleccionada
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
    publicacion.setTitulo(titulo);
    publicacion.setContenido(contenido);
    publicacion.setIdUsuario(idUsuario);
    publicacion.setIdCategoria(idCategoria); // Asignar la categoría
    
    // Llamar al método para registrar la publicación en la base de datos
    boolean registrado = daoPublicacion.registrarPublicacion(publicacion, imagen, rutaImagen, getServletContext());
    
    // Redirigir según si la publicación se ha registrado correctamente o no
    if (registrado) {
        // Publicación registrada correctamente, redirigir a la página de inicio o a otra página de éxito
        System.out.println("Si me cree yei"); 
        response.sendRedirect("LoadPublicacionesServlet");
    } else {
        // Error al registrar publicación, redirigir de vuelta al formulario de publicación con un mensaje de error
        // Puedes usar request.setAttribute() para pasar mensajes de error al JSP
        System.out.println("No me cree unu"); 
        response.sendRedirect("LoadPublicacionesServlet");
    }
    }
}
