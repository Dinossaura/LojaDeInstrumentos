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
        <title>Cadastro de Usuários</title>
    </head>

    <body>
        <jsp:include page="menu.jsp"/>
            
<div class="container">
    <h1>Cadastro de Usuários</h1>
    <div class="well">
        <form class="form-inline" action="${pageContext.request.contextPath}/cadastro-usuario" method="post">
            <div class="form-group">
                <label for="nome">Nome: </label>
                <input type="text" class="form-control" name="name">
            </div>
            <div class="form-group">
                <label for="login">LOGIN:</label>
                <input class="form-control" rows="1" name="login"></input>
            </div>
            <div class="form-group">
                <label for="senha">Senha:</label>
                <input class="form-control" rows="1" name="senha"></input>
            </div>
            <div class="form-group">
                <label for="perfil">Perfil</label>
                <select class="form-control" name="perfil">
                    <option value="1">DIRETOR</option>
                    <option value="2">GERENTE</option>
                    <option value="3">VENDEDOR</option>
                    <option value="4">ESTOQUISTA</option>
                </select>
            </div>
            <button type="submit" class="btn btn-default">Cadastrar</button>
            <button type="submit" class="btn btn-default">&nbsp&nbsp&nbsp&nbsp Sair &nbsp&nbsp&nbsp&nbsp</button>
    </div>            
    
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