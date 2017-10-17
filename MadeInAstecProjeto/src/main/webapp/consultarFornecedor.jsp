<%-- 
    Document   : consultarCliente
    Created on : 14/10/2017, 15:50:03
    Author     : vinicius.ritoi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .jumbotron {
                margin-bottom: 0;
            }
            .com {
                text-align: center;
                border: 2px solid gray;
                border-collapse: collapse;
            }
            td.com{
                border: 1px solid gray;
                border-collapse: collapse;
            }
            tr, th {
                padding: 1px;
                text-align: left;    
            }
            .sem{

                border: none;
            }

        </style>
        <title>Consulta de Fornecedores</title>
    </head>

    <body align="center">
        <div class="header">
            <div class="jumbotron">
                <div class="container text-center">
                    <h1>Made in Astec</h1>
                    <p>Sistema de Gerenciamento de Vendas</p>
                </div>
            </div>
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">Made in Astec </a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li><a href="#">Clientes</a></li>
                        <li><a href="#">Produtos</a></li>
                        <li><a href="#">Vendas</a></li>
                        <li><a href="#">Relatórios</a></li>
                        <li><a href="#">Usuários</a></li>
                    </ul>
                </div>
        </div>
    </nav>
</div>
<div class="container" align="center">
    <h1>Consulta de Fornecedores</h1>
    <div class="well">

        <form class="form-inline" action="${pageContext.request.contextPath}/cadastro-usuario" method="post">
            <div class="form-group">
                <label for="nome">Fornecedor: </label>
                <input type="text" class="form-control" name="cliente">
                <button type="submit" class="btn btn-default">Buscar</button>
            </div>
        </form><br/>
        <div class="tabela"style="width:800px">
            <table>
                <caption>Lista de Fornecedores</caption>
                <tr >
                    <th class="com" style="width:50px">Nome</th>
                    <th class="com"style="width:150px">CNPJ</th>
                    <th class="com"style="width:110px">Telefone</th>
                    <th class="com"style="width:15px">Estado</th>
                </tr>
                <tr >
                    <td class="com">ViníciusCorp </td>
                    <td class="com">00.000.000/0000-00</td>
                    <td class="com">(00)00000-0000</td>
                    <td class="com">SP</td>
                    <td class="sem"><button type="exluir" class="btn btn-default">Excluir</button></td>
                    <td class="sem"><button type="editar" class="btn btn-default">Editar</button></td>
                </tr>
                <%-- EXEMPLO--%>
                <tr >
                    <td class="com">Palhetas.TM </td>
                    <td class="com">00.000.000/0000-00</td>
                    <td class="com">(00)00000-0000</td>
                    <td class="com">SP</td>
                    <td class="sem"><button type="exluir" class="btn btn-default">Excluir</button></td>
                    <td class="sem"><button type="editar" class="btn btn-default">Editar</button></td>
                </tr>
                <tr >
                    <td class="com">Fornecedor.Inc </td>
                    <td class="com">00.000.000/0000-00</td>
                    <td class="com">(00)00000-0000</td>
                    <td class="com">SP</td>
                    <td class="sem"><button type="exluir" class="btn btn-default">Excluir</button></td>
                    <td class="sem"><button type="editar" class="btn btn-default">Editar</button></td>
                </tr>
                <%-- EXEMPLO--%>
            </table>
        </div>
    </div>
</div>            

<div class="footer">
    <div class="jumbotron">
        <div class="container text-center">
            <p>Made in Astec 2017</p>
        </div>
    </div>
</div>
</body>

</html>