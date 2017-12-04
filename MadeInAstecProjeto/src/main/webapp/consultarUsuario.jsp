<%@page import="com.senac.madeinastec.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Consulta de Usuários</title>
    </head>

    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container" align="center">
            <h3>Usuários</h3>
            <label for="Usuarios">Nome:</label>
            <div class="container">
                <div class="row">
                    <div class="col-md-10">
                        <form class="form-group-md" action="${pageContext.request.contextPath}/consultausuariostotais" method="post">
                            <input type="text" class="form-control" name="usuarios" placeholder="Digite nome Usuário" maxlength="30"/>
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-success center-block">Pesquisar</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class ="row">
                    <div class="col-md-12">
                        <table class="table table-selectable table-bordered table-hover col-md-8" id="tabelausuarios">
                        <caption>Lista de Usuários</caption>
                            <thead>
                                <tr>
                                    <th>Nome</th>
                                    <th>Login</th>
                                    <th>Senha</th>
                                    <th>Perfil</th>
                                    <th>Empresa</th>
                                    <th>Ação</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listaUsuario}" var="usuario">
                                <tr>
                                    <td><c:out value="${usuario.getNome()}" /></td>
                                    <td><c:out value="${usuario.getLogin()}" /></td>
                                    <td><c:out value="${usuario.getSenha()}" /></td>
                                    <td><c:set var="perfil" scope="session" value="${usuario.getcodigoPerfil()}"/>
                                        <c:if test = "${perfil == 1}">
                                            <c:out value="Diretoria" />
                                        </c:if>
                                        <c:if test = "${perfil == 2}">
                                            <c:out value="Gerente Produtos/ Serviços" />
                                        </c:if>
                                        <c:if test = "${perfil == 3}">
                                            <c:out value="Gerente Vendas" />
                                        </c:if>
                                        <c:if test = "${perfil == 4}">
                                            <c:out value="Gerente TI" />
                                        </c:if>
                                        <c:if test = "${perfil == 5}">
                                            <c:out value="Funcionário Retaguarda" />
                                        </c:if>
                                        <c:if test = "${perfil == 6}">
                                            <c:out value="Vendedor" />
                                        </c:if>
                                        <c:if test = "${perfil == 7}">
                                            <c:out value="Suporte Técnico" />
                                        </c:if>
                                    </td>
                                    <td><c:set var="empresa" scope="session" value="${usuario.getCodigoEmpresa()}"/>
                                        <c:if test = "${empresa == 1}">
                                            <c:out value="Made in Astec - Filial" />
                                        </c:if>
                                        <c:if test = "${empresa == 2}">
                                            <c:out value="Made in Astec - Porto Alegre" />
                                        </c:if>
                                        <c:if test = "${empresa == 3}">
                                            <c:out value="Made in Astec - Recife" />
                                        </c:if>
                                    </td>
                                    <td>
                                    <div>
                                        <form class="form-control-static" action="${pageContext.request.contextPath}/alterarusuario" method="post">
                                            <div class="form-group" id="alterar">
                                                <button type="submit" name="codigousuario" value="${usuario.getCodigo()}" 
                                                    class="btn btn-success center-block">Alterar</button>
                                            </div>
                                        </form>
                            
                                        <form class="form-control-static" action="${pageContext.request.contextPath}/excluirusuario" method="post">
                                            <div class="form-group" id="excluir">
                                                <button type="submit" name="codigousuario" value="${usuario.getCodigo()}" 
                                                    class="btn btn-danger center-block">Excluir</button>
                                            </div>   
                                        </form>
                                    </div>
                          
                                    </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    <jsp:include page="rodape.jsp"/>
    </body>

</html>