<%-- 
    Document   : parte do menu
    Created on : 10/10/2017, 20:02:54
    Author     : mayra.jpereira
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estilo.css" rel="stylesheet">
        <title></title>
    </head>
    <body>
        <jsp:include page="topo.jsp"/> 
        <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="index.jsp">Made in Astec </a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li><a href="cadastroCliente.jsp">Clientes</a></li>
                        <li><a href="cadastroProduto.jsp">Produtos</a></li>
                        <li><a href="venda.jsp">Vendas</a></li>
                        <li><a href="relatorio.jsp">Relatórios</a></li>
                        <li><a href="cadastroUsuario.jsp">Usuários</a></li>
                    </ul>
                </div>
        </div>
    </nav>
    </body>
</html>