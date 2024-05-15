/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;
import java.sql.Blob;
import java.text.SimpleDateFormat;
import java.sql.Timestamp;
import DAO.DAOUsuario;
import java.sql.SQLException;
import java.util.Base64;

public class Publicacion {
    private int IdPublicacion;
    private String Titulo;
    private String Contenido;
    private Timestamp Fecha_Alta;
    private String NImg;
    private Blob Img;
    private boolean Estatus;
    private int IdUsuario;
    private int IdCategoria;
    
    
    public Publicacion(){}

    public Publicacion(int IdUsuario, String Titulo, String Contenido,String NImg, Blob Img, int IdCategoria){
        this.IdUsuario = IdUsuario;
        this.Titulo = Titulo;
        this.Contenido = Contenido;
        this.NImg=NImg;
        this.Img = Img;
        this.IdCategoria = IdCategoria;
    }
    public Publicacion(String Titulo, String Contenido, String NImg, Blob Img, int IdCategoria, int IdPublicacion){
        this.IdPublicacion = IdPublicacion;
        this.Titulo = Titulo;
        this.Contenido = Contenido;
        this.NImg=NImg;
        this.Img = Img;
        this.IdCategoria = IdCategoria;
    }
    public String getImageAsBase64() {
        if (Img == null) {
            return null;
        }
        try {
            byte[] bytes = Img.getBytes(1, (int) Img.length());
            return Base64.getEncoder().encodeToString(bytes);
        } catch (SQLException e) {
            return null;
        }
    }
    
    public int getIdUsuario() {
        return IdUsuario;
    }
    
   public String getNImg_Perfil() {
        DAOUsuario daousu = new DAOUsuario();
        System.out.println(daousu.getNImg_Perfil(IdUsuario));
        return daousu.getNImg_Perfil(IdUsuario);
    }
    public String getNombreUsuario(){
        DAOUsuario daousu=new DAOUsuario();
        System.out.println(daousu.getNombreUsuario(IdUsuario));
        return daousu.getNombreUsuario(IdUsuario);
    }
    public String getUsername() {
        DAOUsuario daousu = new DAOUsuario();
        System.out.println(daousu.getUsername(IdUsuario));
        return daousu.getUsername(IdUsuario);
    }
    
    public void setIdUsuario(int IdUsuario) {
        System.out.println(IdUsuario);
        this.IdUsuario = IdUsuario;
    }

    public int getIdPublicacion() {
        System.out.println(IdPublicacion);
        return IdPublicacion;
    }

    public void setIdPublicacion(int IdPublicacion) {
        this.IdPublicacion = IdPublicacion;
    }

    public String getTitulo() {
        System.out.println(Titulo);
        return Titulo;
    }

    public void setTitulo(String Titulo) {
        this.Titulo = Titulo;
    }

    public String getContenido() {
        System.out.println(Contenido);
        return Contenido;
    }

    public void setContenido(String Contenido) {
        this.Contenido = Contenido;
    }

    public Blob getImg() {
        return Img;
    }

    public void setImg(Blob Img) {
        this.Img = Img;
    }

    public int getIdCategoria() {
        return IdCategoria;
    }

    public void setIdCategoria(int IdCategoria) {
        this.IdCategoria = IdCategoria;
    }

    public boolean isEstatus() {
        return Estatus;
    }

    public void setEstatus(boolean Estatus) {
        this.Estatus = Estatus;
    }

    public Timestamp getFecha_Alta() {
        return Fecha_Alta;
    }

    public void setFecha_Alta(Timestamp Fecha_Alta) {
        this.Fecha_Alta = Fecha_Alta;
    }
    
    public String getFormattedDate() {
        String formattedDate = "Publicado el ";

        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy 'a las' HH:mm");

        formattedDate += sdf.format(Fecha_Alta);
System.out.println(formattedDate);
        return formattedDate;
    }
        public String getNImg() {
        System.out.println("/Imageees/" + NImg);
        return "/WebApplication1/Imageees/" + NImg;
        
    }

    public void setNImg(String NImg) {
        this.NImg = NImg;
    }
    public String getCategoria() {
        System.out.println(getIdCategoria());
        return switch (getIdCategoria()) {
            case 1 -> "Action";
            case 2 -> "Adventure";
            case 3 -> "Arcade";
            case 4 -> "Sport";
            case 5 -> "Strategy";
            case 6 -> "Simulation";
            case 7 -> "Rythm";
            default -> "Unknown";
        };
    }
}