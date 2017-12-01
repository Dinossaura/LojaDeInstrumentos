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
        <label for="Fornecedores">Nome:</label>
        <div class="container">
            <div class="row">
                <div class="col-md-10">
                    <form class="form-group-md" action="${pageContext.request.contextPath}/consultafornecedor" method="post">                     
                            <input type="text" class="form-control" name="fornecedor" placeholder="Digite nome Fornecedor">
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-success center-block">Pesquisar</button>
                </div>
                    </form>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-selectable table-bordered table-hover col-md-8" id="tabelafornecedores">
                        <caption>Lista de Fornecedores</caption>
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Nome</th>
                                <th>Empresa</th>
                                <th>Endereço</th>
                                <th>Número</th>
                                <th>Complemento</th>
                                <th>Cidade</th>
                                <th>Estado</th>
                                <th>Telefone</th>
                                <th>Ação</th>
                            </tr>
                        </thead>
                        <tbody>  
                            <c:forEach var="lista" items="${ListaFornecedores}">
                            <tr>
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
                                <td><c:out value="${lista.endereco}"/></td>
                                <td><c:out value="${lista.numero}"/></td>
                                <td><c:out value="${lista.complemento}"/></td>
                                <td><c:out value="${lista.cidade}"/></td>
                                <td><c:out value="${lista.estado}"/></td>
                                <td><c:out value="${lista.telefone}"/></td>
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
            </div>
        </div>
    </div>
    <jsp:include page="rodape.jsp"/>
</body>

</html>