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
            <label for="nome">Produto: </label>
            <div class="container">
                <div class="row">
                    <div class="col-md-10">
                        <form class="form-group-md" action="${pageContext.request.contextPath}/consultaprodutos" method="post">
                                <input type="text" class="form-control" name="produto" placeholder="Digite nome Produto" maxlength="70"/>
                    </div>
                    <div class="col-md-2">
                            <button type="submit" class="btn btn-success center-block" action="">Pesquisar</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
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
                                    <th>Preço de Compra (R$)</th>
                                    <th>Preço de Venda (R$)</th>
                                    <th>Estoque</th>
                                    <th>Ação</th>
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
                                    <td>
                                    <c:forEach items="${ListaFornecedores}" var="f">
                                    <c:if test="${produto.fornecedor eq f.getCodigo()}">
                                        <c:out value="${f.getNome()}" />
                                    </c:if>
                                    </c:forEach>
                                    </td>
                                    <td><c:set var="categoria" scope="session" value="${produto.categoria}"/>
                                        <c:if test = "${categoria == 1}">
                                            <c:out value="Audio Profissional" />
                                        </c:if>
                                        <c:if test = "${categoria == 2}">
                                            <c:out value="Bateria & Percussão" />
                                        </c:if>
                                        <c:if test = "${categoria == 3}">
                                            <c:out value="Cordas & Acessórios" />
                                        </c:if>
                                        <c:if test = "${categoria == 4}">
                                            <c:out value="Pianos e Teclados" />
                                        </c:if>
                                        <c:if test = "${categoria == 5}">
                                            <c:out value="Sopro"/>
                                        </c:if>
                                    </td>        
                                  
                                    <td><c:out value="${produto.precocompra}" /></td>
                                    <td><c:out value="${produto.precovenda}" /></td>
                                    <td><c:out value="${produto.estoque}"/></td>
                                    <td>
                                        <div class="form-control-static">
                                            <form class="form-group" action="${pageContext.request.contextPath}/alterarProduto" method="post" >
                                                <button type="submit" name="codigoproduto" value="${produto.codigo}" 
                                                    class="btn btn-success center-block">Alterar</button>
                                            </form>
                             
                                            <form class="form-group" action="${pageContext.request.contextPath}/excluirProduto" method="post" >         
                                                <button type="submit" name="codigoproduto" value="${produto.codigo}" 
                                                    class="btn btn-danger center-block">Excluir</button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                    
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <jsp:include page="rodape.jsp"/>
    </body>
</html>
