<%-- 
    Document   : finalizar
    Created on : 21-abr-2018, 20:25:15
    Author     : aitor
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finalizar Compra</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/estilos.css" media="screen" />
    </head>
    <body>
        <div class="columnasCentradas">
            <h1 style="color: blue;">¡Muchas gracias por comprar en nuestra tienda!</h1>
            <h2>Los articulos comprados son:</h2>
            <c:if test="${requestScope.error != null}">
                <h2><c:out value="${requestScope.error}"/></h2>
            </c:if>
            <c:if test="${sessionScope.arrayLibros!=null}">
                <c:forEach items="${sessionScope.arrayLibros}" var="libro">
                    <c:if test="${libro.cantidad>0}">
                        <c:set var="nombre" value="${libro.nombre}"/>
                        <c:if test="${nombre == \"nombreDelViento\"}">
                            <img src="<%=request.getContextPath()%>/IMG/elNombreDelViento.jpg" width="100px"/>
                            <p>
                                <b>Nombre:</b> <c:out value="El nombre del Viento"/> |
                                <b>Cantidad:</b> <c:out value="${libro.cantidad}"/>
                            </p>
                        </c:if>
                        <c:if test="${nombre == \"seniorAnillos\"}">
                            <img src="<%=request.getContextPath()%>/IMG/elSeniorDeLosAnillos.jpg" width="100px"/>
                            <p>
                                <b>Nombre:</b> <c:out value="El Señor de los Anillos"/> |
                                <b>Cantidad:</b> <c:out value="${libro.cantidad}"/>
                            </p>
                        </c:if>
                        <c:if test="${nombre == \"reyDemonio\"}">
                            <img src="<%=request.getContextPath()%>/IMG/elReyDemonio.jpg" width="100px"/>
                            <p>
                                <b>Nombre:</b> <c:out value="El Rey Demonio"/> |
                                <b>Cantidad:</b> <c:out value="${libro.cantidad}"/>
                            </p>
                        </c:if>
                        <c:if test="${nombre == \"cronicasNarnia\"}">
                            <img src="<%=request.getContextPath()%>/IMG/lasCronicasDeNarnia.jpg" width="100px"/>
                            <p>
                                <b>Nombre:</b> <c:out value="Las Cronicas de Narnia"/> |
                                <b>Cantidad:</b> <c:out value="${libro.cantidad}"/>
                            </p>
                        </c:if>
                        <c:if test="${nombre == \"alasNegras\"}">
                            <img src="<%=request.getContextPath()%>/IMG/alasNegras.jpg" width="100px"/>
                            <p>
                                <b>Nombre:</b> <c:out value="Alas Negras"/> |
                                <b>Cantidad:</b> <c:out value="${libro.cantidad}"/>
                            </p>
                        </c:if>
                    </c:if>
                </c:forEach>
            </c:if>
            <a href="<%=request.getContextPath()%>/index.html">Volver</a>
        </div>
        <br><br>
    </body>
</html>
