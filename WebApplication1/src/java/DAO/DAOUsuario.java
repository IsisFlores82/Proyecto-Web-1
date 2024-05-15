package DAO;

import entidades.Publicacion;
import entidades.Usuarios;
import jakarta.servlet.ServletContext;
import java.sql.DriverManager;
import modelos.Database;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
public class DAOUsuario {
    Database db = new Database();

    public Usuarios login(Object obj) {
Usuarios usuario = (Usuarios) obj;
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = "SELECT * FROM Usuarios WHERE CorreoE=? AND Contraseña=?";
    Usuarios log = new Usuarios();

    try {
        Class.forName(db.getDriver());
        con = DriverManager.getConnection(db.getUrl() + db.getDatabase(), db.getUser(), db.getPass());
        ps = con.prepareStatement(sql);
        ps.setString(1, usuario.getCorreoE());
        ps.setString(2, usuario.getContraseña());

        rs = ps.executeQuery();

        if (rs.next()) {
            log.setIdUsuario(rs.getInt("idUsuario"));
            log.setCorreoE(rs.getString("CorreoE"));
            log.setContraseña(rs.getString("Contraseña"));
            // Obtener el nombre de la imagen de perfil desde la base de datos
            String nombreImagenPerfil = rs.getString("NImg_Perfil");
            // Establecer el nombre de la imagen de perfil en el objeto Usuarios
            log.setNImg_Perfil(nombreImagenPerfil);
            log.setUsername(rs.getNString("Username"));
            log.setNombre(rs.getString("Nombre"));
            log.setEdad(rs.getInt("Edad"));
        }
    } catch (SQLException | ClassNotFoundException e) {
        System.out.println("ERROR EN LOGIN: " + e.getMessage());
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar conexión: " + e.getMessage());
        }
    }
    return log;
}
   public boolean registrarUsuario(Usuarios usuario, InputStream imagen, String rutaImagen,ServletContext context ) throws FileNotFoundException, IOException{ 
    Connection con = null;
    PreparedStatement ps = null;
    String sql = "INSERT INTO Usuarios (Nombre, ApellidoP, ApellidoM, Username, CorreoE, Contraseña, Fecha_Nacimiento, NImg_Perfil, Img_Perfil) "
               + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
    try {
        Class.forName(db.getDriver());
        con = DriverManager.getConnection(db.getUrl() + db.getDatabase(), db.getUser(), db.getPass());
        ps = con.prepareStatement(sql);
        System.out.println("DATOS EN EL DAO:");
        System.out.println(usuario.getNombre());
        System.out.println(usuario.getApellidoP());
        System.out.println(usuario.getApellidoM());
        System.out.println(usuario.getUsername());
        System.out.println(usuario.getCorreoE());
        System.out.println(usuario.getContraseña());
        ps.setString(1, usuario.getNombre());
        ps.setString(2, usuario.getApellidoP());
        ps.setString(3, usuario.getApellidoM());
        ps.setString(4, usuario.getUsername());
        ps.setString(5, usuario.getCorreoE());
        ps.setString(6, usuario.getContraseña());
        java.sql.Date fechaNacimiento = new java.sql.Date(usuario.getFecha_Nacimiento().getTime());
        ps.setDate(7, fechaNacimiento);
        ps.setString(8, rutaImagen); // Establecer la ruta de la imagen
        ps.setBlob(9, imagen); // Establecer la imagen como un Blob en la sentencia preparada
        String path =context.getRealPath("/Imageees");
        
        File fpath=new File(path);
        if(!fpath.exists()){
            fpath.mkdirs();
        }
        
        String rutaGuardarImagen = path + File.separator + rutaImagen;
        FileOutputStream outputStream = new FileOutputStream(rutaGuardarImagen);
        byte[] buffer = new byte[1024];
        int bytesRead;
        while ((bytesRead = imagen.read(buffer)) != -1) {
            outputStream.write(buffer, 0, bytesRead);
        }
        outputStream.close();
        int rowsAffected = ps.executeUpdate();
        return rowsAffected > 0;
    } catch (SQLException | ClassNotFoundException e) {
        System.out.println("ERROR EN REGISTRO DE USUARIO: " + e.getMessage());
        return false;
    } finally {
        try {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.out.println("Error al cerrar conexión: " + e.getMessage());
        }
    }
}

   public boolean existeUsuario(String username) {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    boolean existe = false;
    
    try {
        con = DriverManager.getConnection(db.getUrl() + db.getDatabase(), db.getUser(), db.getPass());
        String sql = "SELECT COUNT(*) FROM Usuarios WHERE Username = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, username);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            int count = rs.getInt(1);
            existe = count > 0;
        }
    } catch (SQLException e) {
        System.out.println("Error en existeUsuario: " + e.getMessage());
    } finally {
        // Cerrar recursos
    }
    
    return existe;
}
    public String getUsername(int ID){
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT Username FROM Usuarios WHERE IdUsuario = ?";
        
        String usu = "";
        
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(
                    db.getUrl() + db.getDatabase(),
                    db.getUser(),
                    db.getPass());
            ps = con.prepareStatement(sql);    
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            
            
            while(rs.next()){
                usu = rs.getString("Username");
            }
            con.close();
            
        } catch(SQLException | ClassNotFoundException e){
            System.out.println("Error en LogIn " + e.getMessage());
        } finally {
            return usu;
        }
    }
    public String getNombreUsuario(int ID){
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT Nombre FROM Usuarios WHERE IdUsuario = ?";
        
        String nom = "";
        
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(
                    db.getUrl() + db.getDatabase(),
                    db.getUser(),
                    db.getPass());
            ps = con.prepareStatement(sql);    
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            
            
            while(rs.next()){
                nom = rs.getString("Nombre");
            }
            con.close();
            
        } catch(SQLException | ClassNotFoundException e){
            System.out.println("Error en LogIn " + e.getMessage());
        } finally {
            return nom;
        }
    }
        public String getNImg_Perfil(int ID){
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT NImg_Perfil FROM Usuarios WHERE IdUsuario = ?";
        
        String img = "";
        
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(
                    db.getUrl() + db.getDatabase(),
                    db.getUser(),
                    db.getPass());
            ps = con.prepareStatement(sql);    
            ps.setInt(1, ID);
            rs = ps.executeQuery();
            
            
            while(rs.next()){
                img = rs.getString("NImg_Perfil");
            }
            con.close();
            
        } catch(SQLException | ClassNotFoundException e){
            System.out.println("Error en LogIn " + e.getMessage());
        } finally {
            return "/WebApplication1/Imageees/" + img;
        }
    }
}
