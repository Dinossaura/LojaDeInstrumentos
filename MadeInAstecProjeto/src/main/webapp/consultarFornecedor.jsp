<%-- 
    Document   : consultarCliente
    Created on : 14/10/2017, 15:50:03
    Author     : vinicius.ritoi
--%>

<%@page import="com.senac.madeinastec.model.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Consulta de Fornecedores</title>
    </head>

    <body align="center">
    <jsp:include page="menu.jsp"/> 
    <div class="container" align="center">
        <h3>Fornecedores</h3>
        <form class="form-control-static" action="${pageContext.request.contextPath}/fornecedor" method="post">
            <div class="form-group" id="usuario">
                <label for="Fornecedores">Nome:</label>
                <input type="text" class="form-control" name="fornecedor" placeholder="Digite nome Fornecedor">
            </div>
            <button type="submit" class="btn btn-success center-block">Pesquisar</button>
        </form>
        <table class="table col-md-8">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Empresa</th>
                </tr>
            </thead>
            <tbody>  
                <c:forEach var="lista" items="${ListaFornecedores}">
                    <tr>
                        <td>#</td>
                        <td><c:out value="${lista.codigo}" /></td>
                        <td><c:out value="${lista.nome}" /></td>
                        <td><c:set var="empresa" scope="session" value="${lista.codigoempresa}"/>
                            <c:if test = "${empresa == 1}">
                            <c:out value="Made in Astec - Filial" />
                            </c:if>
                            <c:if test = "${empresa == 2}">
                            <c:out value="Made in Astec - Porto Alegre" />
                            </c:if>
                            <c:if test = "${empresa == 3}">
                            <c:out value="Made in Astec - Recife" />
                            </c:if>
                        </td>
                            
                    </tr>
                </c:forEach>
            </tbody>
            
            
        </table>
    </div>            
    <jsp:include page="rodape.jsp"/>
</body>

</html>