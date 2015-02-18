<%-- 
    Document   : actualizaperfil
    Created on : 25/11/2014, 10:11:31 PM
    Author     : CarlosAlberto
--%>

<%@page import="java.lang.System.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileUploadException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.io.File, javazoom.upload.*"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="Paquete.ComunicacionBD"%>
<%@page import="java.io.DataInputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String direccion = request.getSession().getServletContext().getRealPath("Usuarios/");
%>

<jsp:useBean id="upBean" scope="page" class="javazoom.upload.UploadBean" >
    <jsp:setProperty name="upBean" property="folderstore" value="<%= direccion%>" />
    <jsp:setProperty name="upBean" property="whitelist" value="*.jpg,*.gif" />
    <jsp:setProperty name="upBean" property="overwritepolicy" value="nametimestamp"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                /*   if (MultipartFormDataRequest.isMultipartFormData(request)) {
                 MultipartFormDataRequest mrequest = new MultipartFormDataRequest(request);
                 String todo = null;
                 if (mrequest != null) {
                 todo = mrequest.getParameter("nombre");
                 }
                 if (todo != null ) {
                 Hashtable files = mrequest.getFiles();
                 if ((files != null) && (!files.isEmpty())) {
                 String archivo = ((UploadFile) mrequest.getFiles().get("img")).getFileName();
                 int posicionPunto = archivo.indexOf(".");
                 String nombreImagen = session.getAttribute("usuario").toString();
                 String extension = archivo.substring(posicionPunto);
                 nombreImagen = nombreImagen + extension;
                 ((UploadFile) mrequest.getFiles().get("img")).setFileName(nombreImagen);
                 UploadFile file = (UploadFile) files.get("img");
                 if (file != null) {
                 out.println("El archivo: " + file.getFileName() + " se subio correctamente");
                 ComunicacionBD com = new ComunicacionBD();
                 com.actualizar(todo, nombreImagen, session.getAttribute("usuario").toString());           
                 }
                 upBean.store(mrequest, "img");
                        
                 } else {
                 out.println("Archivos no subidos");
                 }
                 } else {
                 out.println("<BR> todo=" + todo);
                 }
                 }
                 response.sendRedirect("PerfilGeneral.jsp");   */
                String fileName = "";
                List fileItems = null;
                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setSizeThreshold(4096);
                factory.setRepository(new File(direccion+"/"));
                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setSizeMax(1024 * 512);
                fileItems = upload.parseRequest(request);
                Iterator i = fileItems.iterator();
                FileItem actual = null;
                if (i.hasNext()) {
                    actual = (FileItem) i.next();
                    actual = (FileItem) i.next();
                    fileName = actual.getName();
                    File fichero = new File(fileName);
                    fichero = new File(direccion+"/"+ fichero.getName());
                    System.out.println(fichero.getName());
                    System.out.println(direccion);
                    actual.write(fichero);
                }
            
// req es la HttpServletRequest que recibimos del formulario.
// Los items obtenidos serán cada uno de los campos del formulario,
// tanto campos normales como ficheros subidos.

        
        %>
        <!--<%
        /*     File fichero = new File(request.getParameter("img"));
         FileInputStream file = new FileInputStream(fichero);
         ComunicacionBD com = new ComunicacionBD();
         com.actualizar(request.getParameter("nombre"), file, session.getAttribute("usuario").toString());
         response.sendRedirect("PerfilGeneral.jsp");
         */

        %>-->
    </body>
</html>
