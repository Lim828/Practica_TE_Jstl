<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emerii.modelo.Libro"%>
<%@page import="com.emerii.modelo.GestorLibros"%>
<%
    if (session.getAttribute("agenda") == null) {
        GestorLibros objeto1 = new GestorLibros();

        objeto1.insertarLibro(new Libro(1, "El Principito", "Antonio","si","cuento"));
        objeto1.insertarLibro(new Libro(2, "La Conspiracon", "salazar","no","novela"));
        objeto1.insertarLibro(new Libro(3, "Hstoria de Bolivia", "Torez","no","cuento"));
        session.setAttribute("agenda", objeto1);
    }

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias</title>
    </head>
    <body>
        <h1>Lista Categorias</h1>
        <a href="Controller?op=nuevo">Nuevo</a>
        <table border="1"> 
            <tr>
                <th>Id</th>
                <th>Categoria</th> 
                <th></th>
                <th></th>
            </tr> 
            <c:forEach var="item" items="${sessionScope.agenda.getLista()}"> 
                <tr>
                    <td>${item.id}</td>
                    <td>${item.categoria}</td>
                    <td><a href="Controller?op=modificar&id=${item.id}">Modificar</a></td>
                    <td><a href="Controller?op=eliminar&id=${item.id}">Eliminar</a> </td>
                </tr>
            </c:forEach> 
        </table>
         <a href="index.jsp">Volver</a>
    </body>
</html>
