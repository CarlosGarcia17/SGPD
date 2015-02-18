/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Paquete;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author CarlosAlberto
 */
public class ConnexionBD {
    public Connection CrearConexion()
        {
            Connection conexion = null;
            try
            {
                conexion =
                    DriverManager.getConnection("jdbc:mysql://localhost:3306/servlet?zeroDateTimeBehavior=convertToNull", "root", "123456");
            }
            catch (SQLException e)
            {
                System.out.println(e.toString());
            }
            return conexion;
        }
}
