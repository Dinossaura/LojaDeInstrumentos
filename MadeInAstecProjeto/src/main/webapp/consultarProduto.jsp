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
                max-width:200px;
                max-height:5px; 
                border:2px solid gray;
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
        <title>Consulta de Produtos</title>
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
    <h1>Consulta de Produtos</h1>
    <div class="well">

        <form class="form-inline" action="${pageContext.request.contextPath}/cadastro-usuario" method="post">
            <div class="form-group">
                <label for="nome">Produto: </label>
                <input type="text" class="form-control" name="cliente">
                <button type="submit" class="btn btn-default">Buscar</button>
            </div>
        </form><br/>
        <div class="tabela"style="width:800px">
            <table>
                <caption>Lista de Produtos</caption>
                <tr >
                    <th class="com" style="width:100px">Produto</th>
                    <th class="com" style="width:75px">Marca</th>
                    <th class="com"style="width:75px">Categoria</th>
                    <th class="com"style="width:30px">Qtd.Estoq.</th>
                    <th class="com"style="width:15px">Preço</th>
                </tr>
                <tr >
                    <td class="com">Flauta Transversal</td>
                    <td class="com">Yamaha</td>
                    <td class="com">Instrumento</td>
                    <td class="com">07</td>
                    <td class="com">5799,00</td>
                    <td class="sem"><button type="exluir" class="btn btn-default">Excluir</button></td>
                    <td class="sem"><button type="editar" class="btn btn-default">Editar</button></td>
                </tr>
                <%-- EXEMPLO--%>
                <tr >
                    <td class="com">Viola de Arco</td>
                    <td class="com">Eagle</td>
                    <td class="com">Instrumento</td>
                    <td class="com">03</td>
                    <td class="com">750,00</td>
                    <td class="sem"><button type="exluir" class="btn btn-default">Excluir</button></td>
                    <td class="sem"><button type="editar" class="btn btn-default">Editar</button></td>
                </tr>
                <tr >
                    <td class="com">violão elétrico</td>
                    <td class="com">Fender</td>
                    <td class="com">Instrumento</td>
                    <td class="com">15</td>
                    <td class="com">1250,00</td>
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
