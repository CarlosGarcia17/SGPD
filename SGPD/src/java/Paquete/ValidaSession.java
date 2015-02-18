/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Paquete;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CarlosAlberto
 */
@WebServlet(name = "ValidaSession", urlPatterns = {"/ValidaSession"})
public class ValidaSession extends HttpServlet {

    private ConfiguraDB db = null;
    String drivers, urlDB, usrDB, passDB,usuario,password,nombre, imagen;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession ses=request.getSession();
            ses.setAttribute("usuario", usuario);
            ses.setAttribute("img", imagen);  
            ses.setAttribute("nom", nombre);
            out.println("<script>");
            out.println("location.href=\"./Bienvenidos.jsp\";</script>");
        }
    }

    private void fail(HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter salida = response.getWriter();
        salida.println("<script>");
        salida.println("alert('Usuario o Password no validos.');");
        salida.println("location.href=\"Acceso.jsp\";</script>");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        usuario = request.getParameter("usuario");
        password = request.getParameter("password");
        if (validasess(usuario, password)) {
            System.out.println("Bien");
            processRequest(request, response);
        } else {
            System.out.println("Error");
            fail(response);
        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    public void init(ServletConfig config) throws ServletException {
        try {
            db = new ConfiguraDB(config);
        } catch (IOException e) {
        }
    }

    private boolean validasess(String usuario, String password) {
        try {
            System.out.println("el valor d db es:" + db);
            System.out.println("Creando conexion");
            Connection con = db.CrearConexion();
            System.out.println("Creando statement");
            Statement s = con.createStatement();
            String sql = "SELECT * FROM aspirante"
                    + " WHERE usuario='" + usuario + "'"
                    + " AND contraseña='" + password + "'";
            ResultSet rs = null;
            System.out.println("Ejecutar SQL: " + sql);
            if (s.execute(sql)) {
                rs = s.getResultSet();
                if (rs.next()) {
                    nombre=rs.getString("nombre")+" "+ rs.getString("apellido");
                    imagen=rs.getString("img");
                    return true;
                }
                // Existe al menos un registro
            }

        } catch (SQLException ex) {
            Logger.getLogger(ValidaSession.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    class ConfiguraDB {

        public ConfiguraDB(ServletConfig config) throws IOException {
            try {
                java.lang.Class.forName(config.getInitParameter("jdbc.drivers"));
            } catch (ClassNotFoundException ex) {
                //Logger.getLogger(ServletCuate.class.getName()).log(Level.SEVERE,null,ex);
                System.out.println(ex);
            }
            drivers = config.getInitParameter("jdbc.drivers");
            urlDB = config.getInitParameter("jdbc.url");
            usrDB = config.getInitParameter("jdbc.username");
            passDB = config.getInitParameter("jdbc.password");
        }

        public Connection CrearConexion() {
            Connection conexion = null;
            try {
                System.out.println("Creando conexion a \"" + urlDB + "\"....");
                conexion
                        = DriverManager.getConnection(urlDB, usrDB, passDB);
            } catch (SQLException e) {
                System.out.println(e.toString());
            }
            return conexion;
        }
    }
}
