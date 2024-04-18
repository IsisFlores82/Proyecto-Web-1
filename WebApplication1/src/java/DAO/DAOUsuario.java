package DAO;

import entidades.Usuarios;
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
        String sql = "SELECT * FROM TB_Usuario WHERE Usuario=? AND Contraseña=?";
        Usuarios log = new Usuarios();

        try {
            Class.forName(db.getDriver());
            con = DriverManager.getConnection(db.getUrl() + db.getDatabase(), db.getUser(), db.getPass());
            ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getUsuario());
            ps.setString(2, usuario.getContraseña());

            rs = ps.executeQuery();

            if (rs.next()) {
                log.setIdUsuario(rs.getInt("idUsuario"));
                log.setUsuario(rs.getString("Usuario"));
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
}
