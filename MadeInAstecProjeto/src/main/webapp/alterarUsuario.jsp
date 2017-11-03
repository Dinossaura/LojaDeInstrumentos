<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Alterar Usuário</title>
        <title>Cadastro de Clientes</title>
        <link href="css/alterarUsuario.css" rel="stylesheet">
    </head>

    <body>

        <div class="container">
            <h1>Alterar Usuário</h1>
            <div class="well">
                <form class="form-inline" action="${pageContext.request.contextPath}/AlterarUsuarioServlet" method="post">
                    <div class="form-group">
                        <label for="nome">Usuário: </label>
                        <input type="text" class="form-control" name="editUsuario" value="${usuario.getNome()}">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc">Login:</label>
                        <input class="form-control" name="editLogin" value="${usuario.getLogin()}">
                    </div>

                    <div class="form-group">
                        <label for="desc">Senha:</label>
                        <input class="form-control" name="editSenha" value="${usuario.getSenha()}">
                    </div>
                    <div class="form-group">
                        <label for="desc">Função:</label>
                        <input class="form-control" name="editFunc" value="${requestScope.funcao}">
                    </div>
                    <div class="form-group">
                        <label for="desc">Empresa:</label>
                        <input class="form-control"  name="editUsuarioEmp" value="${requestScope.empresa}">
                    </div><br><br>
                        <input type="hidden" name="idDoUsuario" value="${requestScope.id}"/>
                        <input type="hidden" name="idDaFuncao" value="${requestScope.codFunc}"/>
                        <input type="hidden" name="idDaEmpresa" value="${requestScope.codEmpresa}"/>
                        <button type="submit" class="btn btn-default">Atualizar</button>
                  
            </div>
        </div>
        <jsp:include page="rodape.jsp"/>
    </body>

</html>
