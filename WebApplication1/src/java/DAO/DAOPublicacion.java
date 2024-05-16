/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.CallableStatement;
import entidades.Publicacion;
import jakarta.servlet.ServletContext;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import modelos.Database;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;
import java.util.Set;
/**
 *
 * @author cdpin
 */
public class DAOPublicacion {

    Database db = new Database();

    public boolean registrarPublicacion(Publicacion publicacion, InputStream imagen, String rutaImagen, ServletContext context) throws FileNotFoundException, IOException {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "INSERT INTO Publicaciones (Titulo, Contenido, NImg, Img, IdUsuario, IdCategoria) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl() + db.getDatabase(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);

            ps.setString(1, publicacion.getTitulo());
            ps.setString(2, publicacion.getContenido());
            ps.setString(3, rutaImagen); // Establecer la ruta de la imagen
            
            if (imagen != null) {
                ps.setBlob(4, imagen); // Establecer la imagen como un Blob en la sentencia preparada
                String path = context.getRealPath("/Imageees");
                File fpath = new File(path);
                if (!fpath.exists()) {
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
            } else {
                ps.setNull(4, java.sql.Types.BLOB); // Si la imagen es nula, establecer el campo de imagen como NULL en la base de datos
            }

            ps.setInt(5, publicacion.getIdUsuario());
            ps.setInt(6, publicacion.getIdCategoria());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("ERROR EN REGISTRO DE PUBLICACIÓN: " + e.getMessage());
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
    
    public List<Publicacion> obtenerPublicacionesActivas() {
    List<Publicacion> publicaciones = new ArrayList<>();
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    String sql = "SELECT * FROM Publicaciones WHERE Estatus = 1"; // Suponiendo que el estado 1 significa activo
    
    try {
        Class.forName(db.getDriver());
        con = DriverManager.getConnection(db.getUrl() + db.getDatabase(), db.getUser(), db.getPass());
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        
        while (rs.next()) {
            // Crear objeto Publicacion y agregarlo a la lista
            Publicacion publicacion = new Publicacion();
            publicacion.setIdPublicacion(rs.getInt("IdPublicacion"));
            publicacion.setTitulo(rs.getString("Titulo"));
            publicacion.setContenido(rs.getString("Contenido"));
            publicacion.setFecha_Alta(rs.getTimestamp("Fecha_Alta"));
            publicacion.setNImg(rs.getString("NImg"));
            publicacion.setImg(rs.getBlob("Img"));
            publicacion.setEstatus(rs.getBoolean("Estatus"));
            publicacion.setIdUsuario(rs.getInt("IdUsuario"));
            publicacion.setIdCategoria(rs.getInt("IdCategoria"));
            
            publicaciones.add(publicacion);
        }
    } catch (SQLException | ClassNotFoundException e) {
        System.out.println("Error al obtener publicaciones activas: " + e.getMessage());
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
    
    return publicaciones;
}
    public List<Publicacion> obtenerPubUser(int IdUser){
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT * FROM Publicaciones WHERE IdUsuario = ? AND Estatus = 1 ORDER BY Fecha_Alta DESC";
        
        List<Publicacion> log = new ArrayList<>();
        
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(
                    db.getUrl() + db.getDatabase(),
                    db.getUser(),
                    db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, IdUser);
            rs = ps.executeQuery();
            
            
            while(rs.next()){
                Publicacion publicacion = new Publicacion();
                publicacion.setIdPublicacion(rs.getInt("IdPublicacion"));
            publicacion.setTitulo(rs.getString("Titulo"));
            publicacion.setContenido(rs.getString("Contenido"));
            publicacion.setFecha_Alta(rs.getTimestamp("Fecha_Alta"));
            publicacion.setNImg(rs.getString("NImg"));
            publicacion.setImg(rs.getBlob("Img"));
            publicacion.setEstatus(rs.getBoolean("Estatus"));
            publicacion.setIdUsuario(rs.getInt("IdUsuario"));
            publicacion.setIdCategoria(rs.getInt("IdCategoria"));
                
                log.add(publicacion);
            }
            con.close();
            
        } catch(SQLException | ClassNotFoundException e){
            System.out.println("Error en LogIn " + e.getMessage());
        } finally {
            return log;
        }
    }
    
     public int deletepost(int IdPost) {
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "UPDATE Publicaciones SET Estatus = 0 WHERE IdPublicacion = ?";
        
        int result = 0;

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(
                    db.getUrl() + db.getDatabase(),
                    db.getUser(),
                    db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, IdPost);
            
            ps.executeUpdate();
            
            con.close();
            result = 1;
            
        } catch (SQLIntegrityConstraintViolationException e){
            result = 2;
        } 
        catch(SQLException | ClassNotFoundException e){
            result = 0;
        } finally {
            return result;
        }
    }
     public int updatepost(Publicacion publicacion, InputStream imagen, String rutaImagen, ServletContext context) throws FileNotFoundException, IOException  {
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        String sql;
        if(imagen == null){
            sql = "UPDATE Publicaciones SET Titulo = ?, Contenido = ?, IdCategoria = ? WHERE IdPublicacion = ?;";
        } else {
            sql = "UPDATE Publicaciones SET Titulo = ?, Contenido = ?, IdCategoria = ?, NImg = ?, Img = ? WHERE IdPublicacion = ?;";
        }
        
        int result = 0;

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(
                    db.getUrl() + db.getDatabase(),
                    db.getUser(),
                    db.getPass());
            ps = con.prepareStatement(sql);
            ps.setString(1, publicacion.getTitulo());
            ps.setString(2, publicacion.getContenido());
            ps.setInt(3, publicacion.getIdCategoria());
            if(imagen == null){
                ps.setInt(4, publicacion.getIdPublicacion());
            } else {
                ps.setString(4, rutaImagen);
                if (imagen != null) {
                ps.setBlob(5, imagen); // Establecer la imagen como un Blob en la sentencia preparada
                String path = context.getRealPath("/Imageees");
                File fpath = new File(path);
                if (!fpath.exists()) {
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
            } else {
                ps.setNull(5, java.sql.Types.BLOB); // Si la imagen es nula, establecer el campo de imagen como NULL en la base de datos
            }
                ps.setInt(6, publicacion.getIdPublicacion());
            }
            
            ps.executeUpdate();
            
            con.close();
            result = 1;
            
        } catch (SQLIntegrityConstraintViolationException e){
            result = 2;
        } 
        catch(SQLException | ClassNotFoundException e){
            result = 0;
        } finally {
            return result;
        }
    }
     public List<Publicacion> obtenerPubDash(int pag){
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT * FROM Publicaciones WHERE Estatus = 1 ORDER BY Fecha_Alta DESC LIMIT 10 OFFSET ?;";
        
        List<Publicacion> log = new ArrayList<>();
        
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(
                    db.getUrl() + db.getDatabase(),
                    db.getUser(),
                    db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, pag*10);
            rs = ps.executeQuery();
            
            
            while(rs.next()){
                Publicacion publicacion = new Publicacion();
                publicacion.setIdPublicacion(rs.getInt("IdPublicacion"));
            publicacion.setTitulo(rs.getString("Titulo"));
            publicacion.setContenido(rs.getString("Contenido"));
            publicacion.setFecha_Alta(rs.getTimestamp("Fecha_Alta"));
            publicacion.setNImg(rs.getString("NImg"));
            publicacion.setImg(rs.getBlob("Img"));
            publicacion.setEstatus(rs.getBoolean("Estatus"));
            publicacion.setIdUsuario(rs.getInt("IdUsuario"));
            publicacion.setIdCategoria(rs.getInt("IdCategoria"));
                
                log.add(publicacion);
            }
            con.close();
            
        } catch(SQLException | ClassNotFoundException e){
            System.out.println("Error " + e.getMessage());
        } finally {
            return log;
        }
    }
     public int obtenerTotalPost(){
         Connection con;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT COUNT(IdPublicacion) AS Num FROM Publicaciones WHERE Estatus=  1;";
        
        int log = 0;
        
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(
                    db.getUrl() + db.getDatabase(),
                    db.getUser(),
                    db.getPass());
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            
            
            while(rs.next()){
                log = rs.getInt("Num");
            }
            con.close();
            
        } catch(SQLException | ClassNotFoundException e){
            System.out.println("Error " + e.getMessage());
        } finally {
            return log;
        }   
    }
}

