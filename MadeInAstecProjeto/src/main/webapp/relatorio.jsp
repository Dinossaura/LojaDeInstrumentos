<%-- 
    Document   : relatorio
    Created on : 14/10/2017, 16:56:41
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
               text-align: left;
            }

        </style>
        <title>Relatórios</title>
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
    <h1>Relatórios</h1>
    <div class="well">

        <form class="form-inline" action="${pageContext.request.contextPath}/cadastro-usuario" method="post">
            <div class="form-group">
                <label for="nome">Empresa: </label>
                <input type="text" class="form-control" name="Empresa"><br></br>
                <label for="nome">De: </label>
                <input type="text" class="form-control" name="de">
                <label for="nome">Até: </label>
                <input type="text" class="form-control" name="ate">
                <button type="submit" class="btn btn-default">Gerar</button>
            </div>
        </form><br/>
        <div class="tabelas"style="width:800px"align="center">
            <table class="tabela1" >
                <tr >
                    <th class="com" style="width:50px">Código</th>
                    <th class="com" style="width:150px">Cliente</th>
                    <th class="com"style="width:150px">Empresa</th>
                    <th class="com"style="width:50px">Valor Nota</th>
                </tr>
                <tr >
                    <td class="com">0001</td>
                    <td class="com">Vinícius</td>
                    <td class="com">viniciusCorp</td>
                    <td class="com">2000,00</td>
                </tr>
                <%-- EXEMPLO--%>
                <tr >
                    <td class="com">0002</td>
                    <td class="com">Maria</td>
                    <td class="com">Fornecedor.Inc</td>
                    <td class="com">9000,00</td>
                </tr>
                <%-- EXEMPLO--%>
                <tr >
                    <td class="com">0003</td>
                    <td class="com">João</td>
                    <td class="com">Palhetas.TM</td>
                    <td class="com">1500,00</td>
                </tr>
                <tr >
                    <td class="sem"></td>
                    <td class="sem"></td>
                    <td class="sem"></td>
                    <td class="sem"><button type="exportar" class="btn btn-default">Exportar</button></td>
                </tr>
                <%-- EXEMPLO--%>
            </table>
            <br></br>
            <table class="tabela2">
                <tr >
                    <th class="com" style="width:150px">Produto</th>
                    <th class="com"style="width:80px">Qtd</th>
                    <th class="com" style="width:100px">Valor Unid.</th>
                    <th class="com"style="width:100px">Valor Total</th>
                </tr>
                <tr >
                    <td class="com">Flauta Transversal</td>
                    <td class="com">2</td>
                    <td class="com">5799,00</td>
                    <td class="com">11598,00</td>
                </tr>
                <%-- EXEMPLO--%>
                <tr >
                    <td class="com">Violão Elétrico</td>
                    <td class="com">1</td>
                    <td class="com">1250,00</td>
                    <td class="com">2500,00</td>
                </tr>
                <tr >
                    <td class="com">Viola de arco</td>
                    <td class="com">5</td>
                    <td class="com">750,00</td>
                    <td class="com">3750,00</td>
                </tr>
                <%-- EXEMPLO--%>
                <tr >
                    <td class="sem"></td>
                    <td class="sem"></td>
                    <td class="sem"></td>
                    <td class="sem"><button type="exportar" class="btn btn-default">Exportar</button></td>
                </tr>

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

