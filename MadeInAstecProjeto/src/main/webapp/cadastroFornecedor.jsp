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
        <form class="form-inline">
            <div class="form-group">
                <label for="nome">Fornecedor: </label>
                <input type="text" rows class="form-control" id="fornecedor">
            </div><br><br>
	
            <button type="submit" class="btn btn-default">Cadastrar</button>
			
        </form>
    </div>
    <jsp:include page="rodape.jsp"/>
    </body>

</html>
