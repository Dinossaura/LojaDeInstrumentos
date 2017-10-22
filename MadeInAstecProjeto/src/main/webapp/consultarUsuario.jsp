<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Consulta Usuário</title>
    </head>

    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <h1>Listagem de usuários</h1>
            <div class="well">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Nome</th>
                            <th>Usuario</th>
                            <th>Senha</th>
                        </tr>
                    </thead>
                <tbody>
                    <c:forEach items="${listaUsuario}" var="usuario">
                    <tr>
                        <td><c:out value="${usuario.getNome()}" /></td>
                        <td><c:out value="${usuario.getLogin()}" /></td>
                        <td><c:out value="${usuario.getSenha()}" /></td>
                    </tr>
                    </c:forEach>
                </tbody>
                </table>
            </div>
        </div>
    <jsp:include page="rodape.jsp"/>
    </body>

</html>