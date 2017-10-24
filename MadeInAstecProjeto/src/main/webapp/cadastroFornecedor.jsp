<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Cadastro de Fornecedores</title>
    </head>

    <body>
    <jsp:include page="menu.jsp"/>
    <div class="container">
    <h1>Cadastro de Fornecedores</h1>
    <div class="well">
        <form class="form-inline" action="${pageContext.request.contextPath}/cadastro-fornecedor" method="post">
            <div class="form-group">
                <label for="fornecedor">Fornecedor: </label>
                <input type="text" name="fornecedor" class="form-control" id="fornecedor">
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
    <jsp:include page="rodape.jsp"/>
    </body>

</html>
