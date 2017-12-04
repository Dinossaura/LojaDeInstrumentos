
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : parte do menu
    Created on : 10/10/2017, 20:02:54
    Author     : mayra.jpereira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% HttpSession sessao = request.getSession(); %>
<!DOCTYPE html>
<html>
    <body>
        <jsp:include page="topo.jsp"/>
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <label class="form-control-static">
                    <c:if test = "${Empresa == 1}">
                        <c:out value="Made in Astec - Filial" />
                    </c:if>
                    <c:if test = "${Empresa == 2}">
                        <c:out value="Made in Astec - Porto Alegre" />
                    </c:if>
                    <c:if test = "${Empresa == 3}">
                        <c:out value="Made in Astec - Recife" />
                    </c:if>
                    </label>
                    <form action="${pageContext.request.contextPath}/logout" method="get">
                       
                </div>
                <div class="col-md-1">
                     <button class="btn-default form-group" type="submit">Logout</button>
                    </form>
                </div>
            </div>
        </div>
        <nav class="navbar navbar-default">
                <div class="container">
                    <div class="row">
                        <ul class="nav navbar-btn menu col-md-10">
                            <c:if test="${(perfilusuario == 1) || (perfilusuario == 3) ||(perfilusuario == 6)}">
                            <li class="col-md-2 text-center dropdown">
                                <a style="font-size: 20px" class="dropdown-toggle" data-toggle="dropdown" href="#">Clientes</a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="cadastroCliente.jsp">Cadastrar</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="consultarCliente.jsp">Consultar/Alterar</a></li>
                                </ul>  
                            </li>
                            </c:if>
                            <c:if test="${(perfilusuario == 1) || (perfilusuario == 2) ||(perfilusuario == 5)}">
                            <li class="col-md-2 text-center dropdown">
                                <a style="font-size: 20px" class="dropdown-toggle" data-toggle="dropdown" href="3">Produtos</a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/consultafornecedorprod?acao=doGet">Cadastrar</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="consultarProduto.jsp">Consultar/Alterar</a></li>
                                </ul> 
                            </li>
                            </c:if>
                            <c:if test="${(perfilusuario == 1) || (perfilusuario == 3) ||(perfilusuario == 6)}">
                            <li style="font-size: 20px" class="col-md-2 text-center"><a href="venda.jsp">Vendas</a></li>
                            </c:if>
                            <c:if test="${(perfilusuario == 1) || (perfilusuario == 3)}">
                            <li style="font-size: 20px" class="col-md-2 text-center"><a href="relatorio.jsp">Relatórios</a></li>
                            </c:if>
                            <c:if test="${(perfilusuario == 1) || (perfilusuario == 4) || (perfilusuario == 7)}">
                            <li class="col-md-2 text-center dropdown">
                                <a style="font-size: 20px" class="dropdown-toggle" data-toggle="dropdown" href="#">Usuários</a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="cadastroUsuario.jsp" id="cadastrarusuarios">Cadastrar</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="consultarUsuario.jsp">Consultar/Alterar</a></li>
                                </ul>
                            </li>
                            </c:if>
                            <c:if test="${(perfilusuario == 1) || (perfilusuario == 2) || (perfilusuario == 5)}">
                            <li class="col-md-2 text-center dropdown">
                                <a style="font-size: 20px" class="dropdown-toggle" data-toggle="dropdown" href="#">Fornecedores</a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="cadastroFornecedor.jsp" id="cadastrarfornecedores">Cadastrar</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="consultarFornecedor.jsp">Consultar/Alterar</a></li>
                                </ul>
                            </li>
                            </c:if>
                        </ul>
                </div>
        </div>
    </nav>
    </body>
</html>
