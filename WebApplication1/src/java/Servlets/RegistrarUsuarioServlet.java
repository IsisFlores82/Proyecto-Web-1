package Servlets;

import DAO.DAOUsuario;
import entidades.Usuarios;
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

@WebServlet(name = "RegistrarUsuarioServlet", urlPatterns = {"/RegistrarUsuarioServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class RegistrarUsuarioServlet extends HttpServlet {
    DAOUsuario daoUsuario = new DAOUsuario();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener parámetros del formulario
        System.out.println("Create User Post");
        String nombre = request.getParameter("name");
        System.out.println(nombre);
        String apellidoP = request.getParameter("pname");
        System.out.println(apellidoP);
        String apellidoM = request.getParameter("mname");
        System.out.println(apellidoM);
        String username = request.getParameter("username");
        System.out.println(username);
        String correo = request.getParameter("email");
        System.out.println(correo);
        String contraseña = request.getParameter("pass");
        System.out.println(contraseña);
         System.out.println("hasta la fecha si pedi todo wey");
        String fechaNacimientoStr = request.getParameter("fechaNacimiento"); // Asegúrate de que la fecha se envíe en el formato correcto desde el formulario
        // Convertir la fecha de String a java.util.Date
        System.out.println("Fecha de nacimiento recibida: " + fechaNacimientoStr);

        java.util.Date fechaNacimiento = null;
        try {
            fechaNacimiento = java.sql.Date.valueOf(fechaNacimientoStr);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            // Manejar el error de formato de fecha
            // Puedes redirigir al usuario de vuelta al formulario de registro con un mensaje de error
            return;
        }
         System.out.println("si pedi la fecha wey");
        // Obtener la parte del archivo (imagen)
        Part filePart = request.getPart("photo-file");
        
        // Obtener el InputStream de la imagen
        InputStream imagen = filePart.getInputStream();
        
        // Obtener la ruta de la imagen (si es necesario)
        String rutaImagen = filePart.getSubmittedFileName(); // Esto es un ejemplo, puedes manejar la ruta de la imagen según tu necesidad
        
        // Llamar al método para registrar el usuario en la base de datos
        Usuarios usuario = new Usuarios();
        usuario.setNombre(nombre);
        usuario.setApellidoP(apellidoP);
        usuario.setApellidoM(apellidoM);
        usuario.setUsername(username);
        usuario.setCorreoE(correo);
        usuario.setContraseña(contraseña);
        usuario.setFecha_Nacimiento(fechaNacimiento);
        
        // Aquí pasas el InputStream de la imagen y la ruta de la imagen (si es necesario)
        boolean registrado = daoUsuario.registrarUsuario(usuario, imagen, rutaImagen, getServletContext());
        String pantalla;
        // Aquí rediriges según si el usuario se ha registrado correctamente o no
        if (registrado) {
            // Usuario registrado correctamente, redirigir a la página de inicio o a otra página de éxito
             pantalla="SignIn.jsp";
             System.out.println("Si me cree yei"); 
        } else {
            // Error al registrar usuario, redirigir de vuelta al formulario de registro con un mensaje de error
            // Puedes usar request.setAttribute() para pasar mensajes de error al JSP
            pantalla="CreateAcount.jsp";
            System.out.println("No me cree unu"); 
        }
         RequestDispatcher rd= request.getRequestDispatcher(pantalla);
         rd.forward(request, response);
    }
}
