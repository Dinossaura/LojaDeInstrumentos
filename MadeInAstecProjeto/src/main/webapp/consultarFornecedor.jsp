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
        <script src="js/programa.js" type="text/javascript"></script>
    </head>

    <body align="center">
    <jsp:include page="menu.jsp"/> 
    <div class="container" align="center">
        <h3>Fornecedores</h3>
        <form class="form-control-static" action="${pageContext.request.contextPath}/consultafornecedor" method="post">
            <div class="form-group" id="nome">
                <label for="Fornecedores">Nome:</label>
                <input type="text" class="form-control" name="fornecedor" placeholder="Digite nome Fornecedor">
            </div>
            <button type="submit" class="btn btn-success center-block">Pesquisar</button>
        </form>
        <form class="form-control-static" action="${pageContext.request.contextPath}/alterarfornecedor" method="post">
        <table class="table table-selectable table-bordered table-hover col-md-8" id="tabelafornecedores">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Código</th>
                    <th>Nome</th>
                    <th>Empresa</th>
                    <th>Ação</th>
                </tr>
            </thead>
            <tbody>  
                <c:forEach var="lista" items="${ListaFornecedores}">
                    <tr>
                        
                        <td>#</td>
                        <td name="codigo"><c:out value="${lista.codigo}"/></td>
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
                        <td>
                          <div>
                          <form class="form-control-static" action="${pageContext.request.contextPath}/alterarfornecedor" method="post">
                            <div class="form-group" id="alterar">
                                <button type="submit" name="codigofornecedor" value="${lista.codigo}" 
                                        class="btn btn-success center-block">Alterar</button>
                            </div>
                          </form>
                            
                          <form class="form-control-static" action="${pageContext.request.contextPath}/excluirfornecedor" method="post">
                             <div class="form-group" id="excluir">
                                 <button type="submit" name="codigofornecedor" value="${lista.codigo}" 
                                         class="btn btn-danger center-block">Excluir</button>
                             </div>   
                          </form>
                          </div>
                          
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>            
    <jsp:include page="rodape.jsp"/>
</body>

</html>