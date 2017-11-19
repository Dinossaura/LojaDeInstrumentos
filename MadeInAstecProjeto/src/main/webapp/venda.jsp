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
        </style>
        <title>Venda</title>
    </head>
    <body>        
        <jsp:include page="menu.jsp"/>

        <div class="container" align="center">
            <h3>Venda</h3>
            <form class="form-control-static" action="${pageContext.request.contextPath}/(nome da servlet de consultar cliente)" method="post">
                <div class="form-group" id="nome">
                    <label for="CPF">Pesquisar Cliente:</label>
                    <input type="text" class="form-control" name="cpfCliente" placeholder="Digite o CPF do Cliente"><br><br>

                    <button type="submit" class="btn btn-success center-block">Pesquisar</button>
                </div>
        </div>

        <div>
            <table class="table table-selectable table-bordered table-hover col-md-8" id="tabelaClientes">
                <thead>
                    <tr>
                        <th>CPF</th>
                        <th>Nome</th>
                        <th>Sobrenome</th>
                        <th>Telefone</th>
                    </tr>
                </thead>
            </table>
        </div><br><br><br><br><br><br>

        <div class="container" align="center">

            <form class="form-control-static" action="${pageContext.request.contextPath}/(nome da servlet de consultar produto)" method="post">
                <div class="form-group" id="nome">
                    <label for="Prod">Produdo:</label>
                    <input type="text" class="form-control" name="nomeProd" placeholder="Digite o nome do Produto"><br><br>

                    <button type="submit" class="btn btn-success center-block">Pesquisar</button>
                </div>

        </div>
        <div>
            <table class="table table-selectable table-bordered table-hover col-md-8" id="tabelaProdutos">
                <thead>
                    <tr>
                        <th>Produto</th>
                        <th>Categoria</th>
                        <th>Estoque</th>
                        <th>Preço</th>
                    </tr>
                </thead>
            </table>
        </div>


        <div>
            <button type="submit" class="btn btn-success center-block">Adicionar</button>
        </div><br><br>
        <div>
            <button type="submit" class="btn btn-success center-block">Retirar</button>
        </div>
                
                















    </body>

</html>
