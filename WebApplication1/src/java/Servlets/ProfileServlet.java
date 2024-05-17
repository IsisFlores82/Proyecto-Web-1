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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("PROFILE EDIT");
        RequestDispatcher rd;
        DAOUsuario daoUsu = new DAOUsuario();
        Usuarios usuario = new Usuarios();
    int id = Integer.parseInt(request.getParameter("EPIdF").trim());
usuario.setIdUsuario(id);
    String user = request.getParameter("EPusernameF");
usuario.setUsername(user);
    String name = request.getParameter("name");

    String occupation = request.getParameter("occupation");

    String plastname = request.getParameter("plastname");

    String mlastname = request.getParameter("mlastname");

    String location = request.getParameter("location");

    String fechaNacimientoStr = request.getParameter("birthdate");
    // Convertir la fecha de String a java.util.Date
        System.out.println("Fecha de nacimiento recibida: " + fechaNacimientoStr);

        java.util.Date fechaNacimiento = null;
        try {
            fechaNacimiento = java.sql.Date.valueOf(fechaNacimientoStr);
            usuario.setFecha_Nacimiento(fechaNacimiento);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            // Manejar el error de formato de fecha
            // Puedes redirigir al usuario de vuelta al formulario de registro con un mensaje de error
            return;
        }
         System.out.println("si pedi la fecha wey");

    String description = request.getParameter("description");

    usuario.setNombre(name);
usuario.setOcupacion(occupation);
usuario.setApellidoP(plastname);
usuario.setApellidoM(mlastname);
usuario.setLocalizacion(location);
usuario.setDescripcion(description);
String email = request.getParameter("email");
if (email == null || email.isEmpty()) {
    // Obtener el email de la sesión si el campo está vacío
    Usuarios sessionUser = (Usuarios) request.getSession().getAttribute("Usuario");
    if (sessionUser != null) {
        email = sessionUser.getCorreoE();
    }
}
usuario.setCorreoE(email);

String password = request.getParameter("password");

if (password == null || password.isEmpty()) {
    // Obtener la contraseña de la sesión si el campo está vacío
    Usuarios sessionUser = (Usuarios) request.getSession().getAttribute("Usuario");
    if (sessionUser != null) {
        password = sessionUser.getContraseña();
    }
}

// Solo establecer la contraseña si no está vacía
if (password != null && !password.isEmpty()) {
    usuario.setContraseña(password);
}
    // Get the Part corresponding to the file input field for profile image
    Part profileImagePart = request.getPart("nProfileinputImage");

    // Get the Part corresponding to the file input field for cover image
    Part coverImagePart = request.getPart("nPortinputImage");
    // Inicializar variables para la imagen y la ruta de la imagen
InputStream ProImagen = null;
String ProRutaImagen = null;
InputStream PortImagen = null;
String PortRutaImagen = null;

        if (profileImagePart != null && profileImagePart.getSize() > 0) {
    // Si se proporcionó una imagen, obtener el InputStream y la ruta de la imagen
    ProImagen = profileImagePart.getInputStream();
    ProRutaImagen = profileImagePart.getSubmittedFileName();
}
        
          if (coverImagePart != null && coverImagePart.getSize() > 0) {
    // Si se proporcionó una imagen, obtener el InputStream y la ruta de la imagen
    PortImagen = coverImagePart.getInputStream();
    PortRutaImagen = coverImagePart.getSubmittedFileName();
}
          
        

        int result = daoUsu.update(usuario,ProImagen,ProRutaImagen, PortImagen,PortRutaImagen,getServletContext());

        String pantalla;
        switch (result) {
            case 1 -> {
                
                
                Object u = daoUsu.getusuario(usuario);
        
                Usuarios newUsuario = new Usuarios();
                newUsuario = (Usuarios)u;
//                
//                HttpSession session = request.getSession();
//                session.setAttribute("Usuario", newUsuario);
//                request.setAttribute("success", "Información guardada correctamente.");
//                rd = request.getRequestDispatcher("ProfileServlet");
//                response.sendRedirect("ProfileServlet");
//                rd.forward(request, response);
                String nombreImagenPerfil = newUsuario.getNImg_Perfil();
                String urlImagenPerfil = request.getContextPath() + "/Imageees/" + nombreImagenPerfil;
                String nombreImagenPortada = newUsuario.getNImg_Portada();
                String urlImagenPortada = request.getContextPath() + "/Imageees/" + nombreImagenPortada;
                HttpSession session = request.getSession();
                session.setAttribute("Usuario", newUsuario);
                session.setAttribute("urlImagenPerfil", urlImagenPerfil);
                session.setAttribute("urlImagenPortada", urlImagenPortada);
                request.setAttribute("success", "Información guardada correctamente.");
                response.sendRedirect("ProfileServlet");
                
            }
            case 2 -> {
                request.setAttribute("error", "El correo ya existe");
                pantalla = "MyProfile.jsp";
                rd = request.getRequestDispatcher(pantalla);
                rd.forward(request, response);
            }
            default -> {
                request.setAttribute("error", "No se pudo guardar la información, intente de nuevo.");
                pantalla = "MyProfile.jsp";
                rd = request.getRequestDispatcher(pantalla);
                rd.forward(request, response);
            }
        }

        
        
     
    }


}
    