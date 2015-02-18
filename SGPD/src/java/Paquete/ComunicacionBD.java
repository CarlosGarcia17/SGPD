/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Paquete;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author CarlosAlberto
 */
public class ComunicacionBD {
    public boolean actualizar(String Nombre, String Datos, String Usuario) throws SQLException{
            ConnexionBD db = new ConnexionBD();
            Connection con = db.CrearConexion();
            Statement s = con.createStatement();
            String sql = "update aspirante set nombre='"+ Nombre + "', img='"+Datos+"' WHERE usuario='"+Usuario+"'" ;
            System.out.println("Ejecutar SQL: " + sql);
            return s.executeUpdate(sql)==1;
    }
}
