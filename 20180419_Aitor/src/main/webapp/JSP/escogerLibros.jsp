<%-- 
    Document   : escogerLibros
    Created on : 18-abr-2018, 23:03:35
    Author     : aitor
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tienda de Libros</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/estilos.css" media="screen" />
    </head>
    <body>
        <div class="columnasCentradas">
            <h2>Nuestros libros</h2>
            <img src="<%=request.getContextPath()%>/IMG/462.jpg" width="300px"/>
            <form action="<%=request.getContextPath()%>/ControladorInsertar" method="post">
                <input type="number" value="1" name="cantidad" min="1" max="10"/>
                <select name="nombre">
                    <option value=""></option>
                    <option value="nombreDelViento">El nombre del Viento</option>
                    <option value="seniorAnillos">El Señor de los Anillos</option>
                    <option value="reyDemonio">El Rey Demonio</option>
                    <option value="cronicasNarnia">Las Cronicas de Narnia</option>
                    <option value="alasNegras">Alas Negras</option> 
                </select><br><br>
                <input type="submit" name="insertar" value="Insertar al carrito"><br><br>
                <input type="submit" name="finalizar" value="Finalizar Compra">
                <a href="<%=request.getContextPath()%>/index.html"><input type="button" name="volver" value="Volver"></a><br><br>
            </form>
            
            
                <c:if test="${sessionScope.arrayLibros!=null}">
                <h3>Contenido del carro:</h3>
                <c:forEach items="${sessionScope.arrayLibros}" var="libro">
                    <c:if test="${libro.cantidad>0}">
                        <c:set var="nombre" value="${libro.nombre}"/>
                        <c:if test="${nombre == \"nombreDelViento\"}">
                            <p>
                                <b>Nombre:</b> <c:out value="El nombre del Viento"/> |
                                <b>Cantidad:</b> <c:out value="${libro.cantidad}"/>
                            </p>
                        </c:if>
                        <c:if test="${nombre == \"seniorAnillos\"}">
                            <p>
                                <b>Nombre:</b> <c:out value="El Señor de los Anillos"/> |
                                <b>Cantidad:</b> <c:out value="${libro.cantidad}"/>
                            </p>
                        </c:if>
                        <c:if test="${nombre == \"reyDemonio\"}">
                            <p>
                                <b>Nombre:</b> <c:out value="El Rey Demonio"/> |
                                <b>Cantidad:</b> <c:out value="${libro.cantidad}"/>
                            </p>
                        </c:if>
                        <c:if test="${nombre == \"cronicasNarnia\"}">
                            <p>
                                <b>Nombre:</b> <c:out value="Las Cronicas de Narnia"/> |
                                <b>Cantidad:</b> <c:out value="${libro.cantidad}"/>
                            </p>
                        </c:if>
                        <c:if test="${nombre == \"alasNegras\"}">
                            <p>
                                <b>Nombre:</b> <c:out value="Alas Negras"/> |
                                <b>Cantidad:</b> <c:out value="${libro.cantidad}"/>
                            </p>
                        </c:if>
                    </c:if>
                </c:forEach>
            </c:if>
        </div>
    </body>   
</html>