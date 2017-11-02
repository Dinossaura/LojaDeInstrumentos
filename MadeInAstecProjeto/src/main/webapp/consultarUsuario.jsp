<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Consulta Usuário</title>
        <style>
            .com {
                border: 2px solid gray;
                border-collapse: collapse;
            }
            td.com{
                border: 1px solid gray;
                border-collapse: collapse;
            }
            tr, th , td{
                padding: 1px;
                text-align: left;    
            }
            .sem{
                border: none;
            }
            td:nth-child(7) button{
                border:none;   
                background: none;
                text-decoration:underline;
            }
            
            td:nth-child(8) button{
                background: none;
                text-decoration: underline;
                border:none;   
            }
            
        </style>
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
                        <td><form action="${pageContext.request.contextPath}/EditarUsuarioServlet" method="post" >
                                <input type="hidden" name="idEscondido" value="${usuario.getCodigo()}"/>
                                <button type="submit" class="editar">Editar</button>
                                    
                            </form></td>
                    </tr>
                    </c:forEach>
                </tbody>
                </table>
            </div>
        </div>
    <jsp:include page="rodape.jsp"/>
    </body>

</html>