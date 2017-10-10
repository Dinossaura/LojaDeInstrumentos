<%-- 
    Document   : index.jsp
    Created on : 10/10/2017, 08:39:50
    Author     : magno
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="topo.jsp"/>
        <jsp:include page="menu.jsp"/>
        
        <div class="container-fluid" id="login">
            <h3 class="text-center">LOGIN</h3>
            <form class="form-control-static" action="${pageContext.request.contextPath}/consulta-usuario" method="post">
                <div class="form-group" id="usuario">
                    <label for="usuario">Usuário</label>
                    <input type="text" class="form-control" name="usuario" placeholder="Digite Usuário">
                </div>
                <div class="form-group" class="i" id="senha">
                    <label for="usuario">Senha</label>
                    <input type="password" class="form-control" name="senha" placeholder="Digite Senha">
                </div>
                <div class="form-group">
                    <label for="usuario">Empresa</label>
                    <select class="form-control" name="empresa">
                        <option value="1">Made In Astec - Matriz</option>
                        <option value="2">Made In Astec - Porto Alegre</option>
                        <option value="3">Made In Astec - Pernambuco</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-success center-block">Entrar</button>
            </form>
                
        </div>
    </body>
</html>
