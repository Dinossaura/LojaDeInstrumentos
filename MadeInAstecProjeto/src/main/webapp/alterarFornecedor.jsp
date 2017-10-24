<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    </head>

    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <h1>Alterar Fornecedor</h1>
        <div class="well">
            <form class="form-inline">
                <div class="form-group">
                    <label for="nome">Fornecedor: </label>
                    <input type="text" rows class="form-control" name="editarFornecedor">
                </div><br><br>
	
                <button type="submit" class="btn btn-default">Atualizar</button>
            </form>
    </div>

    </div>
    <jsp:include page="rodape.jsp"/>
</body>

</html>
