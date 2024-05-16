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
import java.sql.SQLIntegrityConstraintViolationException;

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
            log.setIdUsuario(rs.getInt("IdUsuario"));
            log.setNombre(rs.getString("Nombre"));
            log.setApellidoP(rs.getString("ApellidoP"));
            log.setApellidoM(rs.getString("ApellidoM"));
            log.setFecha_Nacimiento(rs.getDate("Fecha_Nacimiento"));
            log.setCorreoE(rs.getString("CorreoE"));
            log.setNImg_Perfil(rs.getString("NImg_Perfil"));
            log.setImg_Perfil(rs.getBlob("Img_Perfil"));
            log.setContraseña(rs.getString("Contraseña"));
            log.setNImg_Portada(rs.getString("NImg_Portada"));
            log.setImg_Portada(rs.getBlob("Img_Portada"));
            log.setEdad(rs.getInt("Edad"));
            log.setUsername(rs.getString("Username"));
            log.setOcupacion(rs.getString("Ocupacion"));
            log.setLocalizacion(rs.getString("Localizacion"));
            log.setDescripcion(rs.getString("Descripcion"));
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
        public int update(Object obj, InputStream Proimagen, String ProrutaImagen,InputStream Portimagen, String PortrutaImagen, ServletContext context) throws FileNotFoundException, IOException{
        Usuarios usu = new Usuarios();
        usu = (Usuarios)obj;
        
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        
        String sql;

        if(Proimagen == null&&Portimagen==null){
            sql = "UPDATE Usuarios SET Nombre = ?, ApellidoP = ?, ApellidoM = ?, Fecha_Nacimiento = ?, Ocupacion = ?, Localizacion = ?, Descripcion = ?,CorreoE = ?, Contraseña = ? WHERE IdUsuario = ?";

        } else if(Proimagen != null&&Portimagen==null){
            sql = "UPDATE Usuarios SET Nombre = ?, ApellidoP = ?, ApellidoM = ?, Fecha_Nacimiento = ?, Ocupacion = ?, Localizacion = ?, Descripcion = ?,CorreoE = ?, Contraseña = ?, NImg_Perfil = ?, Img_Perfil=? WHERE IdUsuario = ?";

        }else if(Portimagen != null&&Proimagen==null){
            sql = "UPDATE Usuarios SET Nombre = ?, ApellidoP = ?, ApellidoM = ?, Fecha_Nacimiento = ?, Ocupacion = ?, Localizacion = ?, Descripcion = ?,CorreoE = ?, Contraseña = ?, NImg_Portada = ?, Img_Portada=? WHERE IdUsuario = ?";
        }else{
            sql = "UPDATE Usuarios SET Nombre = ?, ApellidoP = ?, ApellidoM = ?, Fecha_Nacimiento = ?, Ocupacion = ?, Localizacion = ?, Descripcion = ?,CorreoE = ?, Contraseña = ?,NImg_Perfil = ?, Img_Perfil=?, NImg_Portada = ?, Img_Portada=? WHERE IdUsuario = ?";
        }
        
        
        int result = 0;
        
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(
                    db.getUrl() + db.getDatabase(),
                    db.getUser(),
                    db.getPass());
            ps = con.prepareStatement(sql);
            ps.setString(1, usu.getNombre());
            ps.setString(2, usu.getApellidoP());
            ps.setString(3, usu.getApellidoM());
            java.sql.Date fechaNacimiento = new java.sql.Date(usu.getFecha_Nacimiento().getTime());
            ps.setDate(4, fechaNacimiento);
            ps.setString(5, usu.getOcupacion());
            ps.setString(6, usu.getLocalizacion());
            ps.setString(7, usu.getDescripcion());
            ps.setString(8, usu.getCorreoE());
            ps.setString(9, usu.getContraseña());
            if(Proimagen == null&&Portimagen==null){
                ps.setInt(10, usu.getIdUsuario());
            } else if(Proimagen != null&&Portimagen==null) {
                ps.setString(10, ProrutaImagen);
                if (Proimagen != null) {
                ps.setBlob(11, Proimagen); // Establecer la imagen como un Blob en la sentencia preparada
                String path = context.getRealPath("/Imageees");
                System.out.println("la nueva file esta en:"+path);
                File fpath = new File(path);
                if (!fpath.exists()) {
                    fpath.mkdirs();
                }

                String rutaGuardarImagen = path + File.separator + ProrutaImagen;
                System.out.println("sigo vivo:"+rutaGuardarImagen);
                FileOutputStream outputStream = new FileOutputStream(rutaGuardarImagen);
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = Proimagen.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                System.out.println("sigo vivo aun");
                outputStream.close();
            } else {
                ps.setNull(11, java.sql.Types.BLOB); // Si la imagen es nula, establecer el campo de imagen como NULL en la base de datos
            }
                ps.setInt(12, usu.getIdUsuario());
            } else if(Portimagen != null&&Proimagen==null){
                ps.setString(10, PortrutaImagen);
                if (Portimagen != null) {
                ps.setBlob(11, Portimagen); // Establecer la imagen como un Blob en la sentencia preparada
                String path = context.getRealPath("/Imageees");
                System.out.println("la nueva file esta en:"+path);
                File fpath = new File(path);
                if (!fpath.exists()) {
                    fpath.mkdirs();
                }

                String rutaGuardarImagen = path + File.separator + PortrutaImagen;
                System.out.println("sigo vivo:"+rutaGuardarImagen);
                FileOutputStream outputStream = new FileOutputStream(rutaGuardarImagen);
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = Portimagen.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                System.out.println("sigo vivo aun");
                outputStream.close();
            } else {
                ps.setNull(11, java.sql.Types.BLOB); // Si la imagen es nula, establecer el campo de imagen como NULL en la base de datos
            }
                ps.setInt(12, usu.getIdUsuario());
            }else{
                 ps.setString(10, ProrutaImagen);
                if (Proimagen != null) {
                ps.setBlob(11, Proimagen); // Establecer la imagen como un Blob en la sentencia preparada
                String path = context.getRealPath("/Imageees");
                System.out.println("la nueva file esta en:"+path);
                File fpath = new File(path);
                if (!fpath.exists()) {
                    fpath.mkdirs();
                }

                String rutaGuardarImagen = path + File.separator + ProrutaImagen;
                System.out.println("sigo vivo:"+rutaGuardarImagen);
                FileOutputStream outputStream = new FileOutputStream(rutaGuardarImagen);
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = Proimagen.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                System.out.println("sigo vivo aun");
                outputStream.close();
            } else {
                ps.setNull(11, java.sql.Types.BLOB);
                }
                ps.setString(12, PortrutaImagen);
                if (Portimagen != null) {
                ps.setBlob(13, Portimagen); // Establecer la imagen como un Blob en la sentencia preparada
                String path = context.getRealPath("/Imageees");
                System.out.println("la nueva file esta en:"+path);
                File fpath = new File(path);
                if (!fpath.exists()) {
                    fpath.mkdirs();
                }

                String rutaGuardarImagen = path + File.separator + PortrutaImagen;
                System.out.println("sigo vivo:"+rutaGuardarImagen);
                FileOutputStream outputStream = new FileOutputStream(rutaGuardarImagen);
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = Portimagen.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                System.out.println("sigo vivo aun");
                outputStream.close();
            } else {
                ps.setNull(13, java.sql.Types.BLOB); // Si la imagen es nula, establecer el campo de imagen como NULL en la base de datos
            }
                ps.setInt(14, usu.getIdUsuario());
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
        
        public Object getusuario(Object obj){
        Usuarios user = new Usuarios();
        user = (Usuarios)obj;
        
        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        String sql = "SELECT * FROM Usuarios WHERE IdUsuario = ?";
        
        Usuarios log = new Usuarios();
        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(
                    db.getUrl() + db.getDatabase(),
                    db.getUser(),
                    db.getPass());
            ps = con.prepareStatement(sql);
            ps.setInt(1, user.getIdUsuario());
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                log.setIdUsuario(rs.getInt("IdUsuario"));
            log.setNombre(rs.getString("Nombre"));
            log.setApellidoP(rs.getString("ApellidoP"));
            log.setApellidoM(rs.getString("ApellidoM"));
            log.setFecha_Nacimiento(rs.getDate("Fecha_Nacimiento"));
            log.setCorreoE(rs.getString("CorreoE"));
            log.setNImg_Perfil(rs.getString("NImg_Perfil"));
            log.setImg_Perfil(rs.getBlob("Img_Perfil"));
            log.setContraseña(rs.getString("Contraseña"));
            log.setNImg_Portada(rs.getString("NImg_Portada"));
            log.setImg_Portada(rs.getBlob("Img_Portada"));
            log.setEdad(rs.getInt("Edad"));
            log.setUsername(rs.getString("Username"));
            log.setOcupacion(rs.getString("Ocupacion"));
            log.setLocalizacion(rs.getString("Localizacion"));
            log.setDescripcion(rs.getString("Descripcion"));
                
            }
            con.close();
            
        } catch(SQLException | ClassNotFoundException e){
            System.out.println("Error en LogIn " + e.getMessage());
        } finally {
            return log;
        }
        
    }
}
