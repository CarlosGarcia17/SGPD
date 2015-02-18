<%@ page errorPage="/WEB-INF/errorPage.jsp" %>
<%
if(session.getAttribute("usuario")!=null){
    response.sendRedirect("Bienvenidos.jsp");
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
            <h2>Acceso</h2>
            <div id="formul">
                <form action="ValidaSession" method="POST" id="la">
                    <table align="center">
                        <tr>
                            <td>
                                <p>Usuario</p>
                            </td>
                            <td>
                                <input class="campos" type="text" name="usuario" id="nombre" value="" size="25"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <p>Contraseña</p>
                            </td>
                            <td>
                                <input class="campos" type="password" name="password" value="" size="25"/>
                            </td>
                        </tr>
                        <tr>
                            <td>

                            </td>
                            
                        </tr>
                        <tr>
                            <td>

                            </td>
                            <td>     
                                <div id="b_submit"> 
                                    <button class="boton" onclick="validacampo()" />Entrar</button>
                                </div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </body>
</html>
<%!
    public String replaceUnderscore(String s) {
        return s.replace(' ', '_');
    }
%>