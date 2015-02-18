<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="Style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ITT</title>
    </head>
    <body>
        <div id="header">
        </div>
        <div id="cuerpo">
            <%
                String No_Control=request.getParameter("No_Control");
                String Password=request.getParameter("Password");
                boolean bandera=false;
            %>
            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/tec" user="daniel" password="123456"/>
            <sql:query dataSource="${snapshot}" var="result">
                SELECT Nombre_Alumno from alumno where No_Control='<%=No_Control%>' and Password='<%=Password%>';
            </sql:query>
            <c:forEach var="row" items="${result.rows}">
                <h2>Bienvenido <c:out value="${row.Nombre_Alumno}"/></h2>
                <%bandera=true;%>
            </c:forEach>
            <%
                if(bandera==false)
                {
            %>
                    <script language="JavaScript" type="text/javascript">
                        alert("Usuario o contraseña incorrecta");
                        function redireccionar() 
                        {
                            location.href="./Acceso.jsp"
                        }
                        setTimeout ("redireccionar()", 10);
                    </script>
            <%
                }
                else if(bandera==true)
                {
            %>
                
            <%
                }
            %>
        </div>
        <div id="footer">
            <%=(new java.util.Date()).toString() %>
        </div>
    </body>
</html>