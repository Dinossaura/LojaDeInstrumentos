
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
        <nav class="navbar navbar-default">
                <div class="container">
                    <div class="row">
                        <ul class="nav navbar-btn menu col-md-8">
                            <li class="col-md-2 text-center dropdown">
                                <a style="font-size: 20px" class="dropdown-toggle" data-toggle="dropdown" href="#">Clientes</a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="cadastroCliente.jsp">Cadastrar</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="consultarCliente.jsp">Consultar/Alterar</a></li>
                                </ul>  
                            </li>
                            <li class="col-md-2 text-center dropdown">
                                <a style="font-size: 20px" class="dropdown-toggle" data-toggle="dropdown" href="#">Produtos</a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="cadastroProduto.jsp">Cadastrar</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="consultarProduto.jsp">Consultar/Alterar</a></li>
                                </ul>  
                            </li>
                            <li style="font-size: 20px" class="col-md-2 text-center"><a href="venda.jsp">Vendas</a></li>
                            <li style="font-size: 20px" class="col-md-2 text-center"><a href="relatorio.jsp">Relatórios</a></li>
                            <li class="col-md-2 text-center dropdown">
                                <a style="font-size: 20px" class="dropdown-toggle" data-toggle="dropdown" href="#">Usuários</a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="cadastroUsuario.jsp" id="cadastrarusuarios">Cadastrar</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="consultarUsuario.jsp">Consultar/Alterar</a></li>
                                </ul>
                                
                            </li>
                            <li class="col-md-2 text-center dropdown">
                                <a style="font-size: 20px" class="dropdown-toggle" data-toggle="dropdown" href="#">Fornecedores</a>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="cadastroFornecedor.jsp" id="cadastrarfornecedores">Cadastrar</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="consultarFornecedor.jsp">Consultar/Alterar</a></li>
                                </ul>
                            </li>
                        </ul>
                </div>
        </div>
    </nav>
    </body>
</html>
