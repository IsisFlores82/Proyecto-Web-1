package DAO;

import entidades.Usuarios;
import java.io.InputStream;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import modelos.Database;

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
   public boolean registrarUsuario(Usuarios usuario, InputStream imagen, String rutaImagen) {
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
}
