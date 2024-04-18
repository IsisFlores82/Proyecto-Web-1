package modelos;
 
 
public class Database {
    /*Atributos*/
    private String url;
    private String database;
    private String user;
    private String pass;
    private String driver;
    /*CONSTRUCTOR*/
    public Database(){
        this.url ="jdbc:mysql://localhost:3306/";
        this.database ="ClaseLogin";
        this.user ="root";
        this.pass ="";
        this.driver = "com.mysql.cj.jdbc.Driver";
    }
    /*METODOS*/
 
    public String getUrl() {
        return url;
    }
 
    public String getDatabase() {
        return database;
    }
 
    public String getUser() {
        return user;
    }
 
    public String getPass() {
        return pass;
    }
 
    public String getDriver() {
        return driver;
    }
}