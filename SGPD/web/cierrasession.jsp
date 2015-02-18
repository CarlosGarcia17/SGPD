<%-- 
    Document   : cierrasession
    Created on : 20/11/2014, 10:01:21 AM
    Author     : CarlosAlberto
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.invalidate();
response.sendRedirect("Acceso.jsp");
%>
<!DOCTYPE html>
