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
        <title>Alterar Usuário</title>
    </head>

    <body>
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
<div class="container">
    <h1>Alterar Usuário</h1>
    <div class="well">
        <form class="form-inline">
            <div class="form-group">
                <label for="nome">Usuário: </label>
                <input type="text" class="form-control" id="editUsuario">
            </div>

            <div class="form-group">
                <label for="desc">Senha:</label>
                <input class="form-control" id="editSenha">
            </div>
            <div class="form-group">
                <label for="desc">Função:</label>
                <input class="form-control" id="editFunc">
            </div>
            <div class="form-group">
                <label for="desc">Empresa:</label>
                <input class="form-control"  id="editUsuarioEmp">
            </div><br><br>
			
            <button type="submit" class="btn btn-default">Atualizar</button>
			
        </form>
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