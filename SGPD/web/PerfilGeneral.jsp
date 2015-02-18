<%@ page errorPage="/WEB-INF/errorPage.jsp" %>

<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("Acceso.jsp");
    }
%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="Style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            ITT
        </title>
    </head>
    <body>
        <div id="header">
        </div>
        <br>
        <div id="cuerpo">
            <div id="formul">
                <table align="center" WIDTH="1000px" HEIGHT="700px" id="tabla">
                    <tr border="0">
                        <td WIDTH=20% align="center">
                            <p>Usuario <%=session.getAttribute("usuario")%></p>
                            <br/>
                        </td>
                        <td>
                            <h2><%=session.getAttribute("nom")%></h2>
                        </td>
                        <td WIDTH=15% align="center">
                            <img src="Usuarios/<%=session.getAttribute("img")%>" height="110px" width="100px"/><br/>
                            <a href="./cierrasession.jsp"><span>&nbsp;Cerrar Session</span></a>
                        </td>
                    </tr>
                    <tr border="0">
                        <td>
                    <li type="disc" >Perfil
                        <ul>
                            <li type="circle" ><a href="#">General</a></li>
                            <li type="circle" ><a href="#">Profecional</a></li>
                        </ul>
                    </li>
                    </td>
                    <td rowspan="7" colspan="2" valign="top">
                        <form method="post" action="actualizaperfil.jsp" enctype="multipart/form-data">
                                    <table> <tr>
                                            <td>
                                                Nombre: <input type="text" name="nombre"/> 
                                            </td>
                                            <td>Imagen: 
                                                <input type="file" name="img" /></td>
                                </tr>
                                <tr><td><input type="submit" value="Actualizar Perfil"/></td></tr>
                            </table>
                        </form>
                    </td>
                    </tr>
                    <tr border="0">
                        <td>
                    <li type="disc" >Concursos
                        <ul>
                            <li type="circle" ><a href="#">Estado</a></li>
                            <li type="circle" ><a href="#">Resultados</a></li>
                            <li type="circle" ><a href="#">Notificaciones</a></li>
                        </ul>
                    </li>    
                    </td>
                    </tr>
                    <tr border="0">
                        <td rowspan="5" >
                            
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </body>
</html>