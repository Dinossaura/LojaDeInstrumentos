<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>        
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
            </form>
        </div>            
    </div>
    <jsp:include page="rodape.jsp"/>            
    </body>

</html>