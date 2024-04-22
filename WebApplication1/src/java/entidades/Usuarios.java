/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entidades;

import java.util.Date;

/**
 *
 * @author cdpin
 */
public class Usuarios {
    private int IdUsuario;
    private String Nombre;
    private String Contraseña;
    private String ApellidoP;
    private String ApellidoM;
    private String CorreoE;
    private String NImg_Perfil;
    private byte[] Img_Perfil;
    private String NImg_Portada;
    private byte[] Img_Portada;
    private int Edad;
    private Date Fecha_Nacimiento;
    private Date Fecha_Alta;
    private Date Fecha_Actualizacion;
    private Date Fecha_Eliminacion;
    private String Username;
    private String Ocupacion;
    private String Localizacion;
    private String Descripcion;

    // Constructor vacío
    public Usuarios() {
    }

    // Constructor con usuario y contraseña
    public Usuarios(String user, String pass) {
        this.CorreoE = user;
        this.Contraseña = pass;
    }

    public int getIdUsuario() {
        return IdUsuario;
    }

    public void setIdUsuario(int IdUsuario) {
        this.IdUsuario = IdUsuario;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getContraseña() {
        return Contraseña;
    }

    public void setContraseña(String Contraseña) {
        this.Contraseña = Contraseña;
    }

    public String getApellidoP() {
        return ApellidoP;
    }

    public void setApellidoP(String ApellidoP) {
        this.ApellidoP = ApellidoP;
    }

    public String getApellidoM() {
        return ApellidoM;
    }

    public void setApellidoM(String ApellidoM) {
        this.ApellidoM = ApellidoM;
    }

    public String getCorreoE() {
        return CorreoE;
    }

    public void setCorreoE(String CorreoE) {
        this.CorreoE = CorreoE;
    }

    public String getNImg_Perfil() {
        return NImg_Perfil;
    }

    public void setNImg_Perfil(String NImg_Perfil) {
        this.NImg_Perfil = NImg_Perfil;
    }

    public byte[] getImg_Perfil() {
        return Img_Perfil;
    }

    public void setImg_Perfil(byte[] Img_Perfil) {
        this.Img_Perfil = Img_Perfil;
    }

        public String getNImg_Portada() {
        return NImg_Portada;
    }

    public void setNImg_Portada(String NImg_Portada) {
        this.NImg_Portada = NImg_Portada;
    }

    public byte[] getImg_Portada() {
        return Img_Portada;
    }

    public void setImg_Portada(byte[] Img_Portada) {
        this.Img_Portada = Img_Portada;
    }
    
    public int getEdad() {
        return Edad;
    }

    public void setEdad(int Edad) {
        this.Edad = Edad;
    }

    public Date getFecha_Nacimiento() {
        return Fecha_Nacimiento;
    }

    public void setFecha_Nacimiento(Date Fecha_Nacimiento) {
        this.Fecha_Nacimiento = Fecha_Nacimiento;
    }

    public Date getFecha_Alta() {
        return Fecha_Alta;
    }

    public void setFecha_Alta(Date Fecha_Alta) {
        this.Fecha_Alta = Fecha_Alta;
    }

    public Date getFecha_Actualizacion() {
        return Fecha_Actualizacion;
    }

    public void setFecha_Actualizacion(Date Fecha_Actualizacion) {
        this.Fecha_Actualizacion = Fecha_Actualizacion;
    }

    public Date getFecha_Eliminacion() {
        return Fecha_Eliminacion;
    }

    public void setFecha_Eliminacion(Date Fecha_Eliminacion) {
        this.Fecha_Eliminacion = Fecha_Eliminacion;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getOcupacion() {
        return Ocupacion;
    }

    public void setOcupacion(String Ocupacion) {
        this.Ocupacion = Ocupacion;
    }

    public String getLocalizacion() {
        return Localizacion;
    }

    public void setLocalizacion(String Localizacion) {
        this.Localizacion = Localizacion;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
   
     
}
