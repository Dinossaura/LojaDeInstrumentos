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
                    <input type="password" class="form-control" rows="1" name="senha"></input>
                </div>
                <div class="form-group">
                    <label for="perfil">Perfil</label>
                    <select class="form-control" name="perfil">
                        <option value="1">Diretoria</option>
                        <option value="2">Gerente Produtos/ Serviços</option>
                        <option value="3">Gerente Vendas</option>
                        <option value="4">Gerente TI</option>
                        <option value="5">Funcionário Retaguarda</option>
                        <option value="6">Vendedor</option>
                        <option value="7">Suporte Técnico</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="empresa">Perfil</label>
                    <select class="form-control" name="empresa">
                        <option value="1">Matriz - São Paulo</option>
                        <option value="2">Filial - Porto Alegre</option>
                        <option value="3">Filial - Recife</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-default">Salvar</button>
                
            </form>
        </div>            
    </div>
    <jsp:include page="rodape.jsp"/>            
    </body>

</html>