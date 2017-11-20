<%-- 
    Document   : consultarProduto
    Created on : 14/10/2017, 16:23:37
    Author     : Vinícius R. Itoi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head> 
        <title>Consulta de Produtos</title>
       
    </head>

    <body align="center">
        <jsp:include page="menu.jsp"/>    
        <div class="container" align="center">
            <h3>Consulta de Produtos</h3>
            <!--<div class="well">-->

            <form class="form-control-static" action="${pageContext.request.contextPath}/consultaprodutos" method="post">
                <div class="form-group">
                    <label for="nome">Produto: </label>
                    <input type="text" class="form-control" name="produto" placeholder="Digite nome Produto">
                </div>
                <button type="submit" class="btn btn-default">Pesquisar</button>
            </form>
            <div class="tabela">
                <table class="table table-selectable table-bordered table-hover col-md-8" id="tabelaclientes">
                    <caption>Lista de Produtos</caption>
                    <tr>
                    <th>Código</th>
                    <th>Empresa</th>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>Fornecedor</th>
                    <th>Categoria</th>
                    <th>Preço de Compra</th>
                    <th>Preço de Venda</th>
                    <th>Estoque</th>
                    </tr>
                    <c:forEach items="${ListaProdutos}" var="produto">
                            <tr>
                                <td><c:out value="${produto.codigo}"  /></td>
                                <td><c:set var="empresa" scope="session" value="${produto.getCodigoempresa()}"/>
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
                                <td><c:out value="${produto.nome}" /></td>
                                <td><c:out value="${produto.descricao}" /></td>
                                <td><c:forEach items="${ListaFornecedores}" var="f">
                                        <c:if test="${produto.fornecedor} == ${f.getCodigo()}">
                                            <c:out value="${f.getNome()}" />
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td><c:out value="${produto.categoria}" /></td>
                                <td><c:out value="${produto.precocompra}" /></td>
                                <td><c:out value="${produto.precovenda}" /></td>
                                <td><c:out value="${produto.estoque}"/></td>
                                <td>
                                    <div>
                                    <form class="form-control-static" action="${pageContext.request.contextPath}/alterarProduto" method="post" >
                                        <div class="form-group">
                                        <button type="submit" name="cpfcliente" value="${produto.codigo}" 
                                                class="btn btn-success center-block">Alterar/ Visualizar</button>
                                        </div>
                                    </form>
                              
                                    <form class="form-control-static" action="${pageContext.request.contextPath}/excluirProduto" method="post" >
                                        <div class="form-group">
                                        <button type="submit" name="cpfcliente" value="${produto.codigo}" 
                                                class="btn btn-danger center-block">Excluir</button> 
                                        </div>
                                    </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    
            </table>
            </div>
        </div>
    <jsp:include page="rodape.jsp"/>
    </body>
</html>
