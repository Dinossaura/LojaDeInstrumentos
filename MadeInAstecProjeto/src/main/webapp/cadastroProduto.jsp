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
        <title>Cadastro de Produtos</title>
    </head>

    <body>
        <jsp:include page="menu.jsp"/>

        <div class="container">
            <h1>Cadastro de Produtos</h1>
            <div class="well">
                <form class="form-inline">
                    <div class="form-group">
                        <label for="nome">Produto: </label>
                        <input type="text" class="form-control" id="prod">
                    </div>
                    <div class="form-group">
                        <label for="desc">Descrição:</label>
                        <textarea class="form-control" rows="1" id="dscProd"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="desc">Categoria:</label>
                        <textarea class="form-control" rows="1" id="categ"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="desc">Cód.Empresa:</label>
                        <input class="form-control" id="codE"></textarea>
                    </div><br><br>
                    <div class="form-group">
                        <label for="desc">Cod.Fornecedor:</label>
                        <input class="form-control" id="codF"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="desc">Estoque:</label>
                        <input class="form-control" type="number" id="estoque"></textarea>
                    </div><br><br>
                    <div class="form-group">
                        <label for="desc">Preços:</label>
                    </div><br>
                    <div class="form-group">
                        <label for="desc">Compra:</label>
                        <input class="form-control" type="number" id="compra"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="desc">Venda:</label>
                        <input class="form-control"  id="venda"></textarea>
                    </div><br><br>
                    <button type="submit" class="btn btn-default">Cadastrar</button>

                </form>
            </div>



        </div>
        <div class="footer">
            <jsp:include page="rodape.jsp"/>
        </div>

    </body>

</html>