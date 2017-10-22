<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Alterar Usuário</title>
    </head>

    <body>
      
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
    <jsp:include page="rodape.jsp"/>
    </body>

</html>
