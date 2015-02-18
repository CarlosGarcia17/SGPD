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
                <table align="center" WIDTH="1000px" HEIGHT="700px" id="tabla" >
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
                        <form action="Guardar.jsp" method="POST">
                            <table align="center">

                                <tr>
                                    <td>
                                        Nombre(s)
                                    </td>
                                    <td>
                                        <input class="campos" type="text" name="Nombre_Docente" maxlength="50" placeholder="Caelos..." />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Apellido paterno
                                    </td>
                                    <td>
                                        <input class="campos" type="text" name="Apellido_Paterno_Docente" maxlength="50" placeholder="Garcia..." />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Apellido materno
                                    </td>
                                    <td>
                                        <input class="campos" type="text" name="Apellido_Materno_Docente" maxlength="50" placeholder="Fernandez..." />
                                    </td>
                                </tr>
                                <th colspan="2">
                                <div id="b_submit"> 
                                    <input class="boton" type="submit" value="Enviar"/>
                                </div>
                                </th>
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