<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>        
        <title>Cadastro de Usuários</title>
        <link href="css/cadastroUsuario.css" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="menu.jsp"/>

        <div class="container">
            <h1 id="usu">Cadastro de Usuários</h1>
            <div class="well">
                <c:choose>
                <c:when test = "${empty Altera}">
                <form class="form-inline" action="${pageContext.request.contextPath}/cadastro-usuario" method="post">
                </c:when>
                <c:otherwise>
                <form class="form-inline" action="${pageContext.request.contextPath}/alterarusuario" method="post">
                </c:otherwise>
            </c:choose>
                    
            <c:choose>
                <c:when test = "${empty Altera}">
                    <div class="form-group">
                        <label for="nome">Nome*</label>
                        <input type="text" class="form-control" name="name" id="nomeUsu"/>
                    </div>
     
                    <div class="form-group">
                        <label for="login">LOGIN*</label>
                        <input class="form-control" rows="1" name="login" id="loginUsu"/>
                    </div>

                    <div class="form-group">
                        <label for="senha">Senha*</label>
                        <input type="password" class="form-control" rows="1" name="senha" id="senha"/>
                    </div>

                    <div class="form-group">
                        <label for="perfil">Perfil*</label>
                        <select class="form-control" name="perfil" id="perfilUsu">
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
                        <label for="empresa">Empresa*</label>
                        <select class="form-control" name="empresa" id="empresaUsu">
                            <option value="1">Matriz - São Paulo</option>
                            <option value="2">Filial - Porto Alegre</option>
                            <option value="3">Filial - Recife</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>(*)Campos Obrigatórios</label>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="form-group">
                           <label for="nome">Nome*</label>
                        <input type="text" class="form-control" name="nomeUsuario" value="${usu.getNome()}"/>
                    </div>

                    <div class="form-group">
                        <label for="login">LOGIN*</label>
                        <input class="form-control" rows="1" name="loginUsuario" value="${usu.getLogin()}"/>
                    </div>

                    <div class="form-group">
                        <label for="senha">Senha*</label>
                        <input type="password" class="form-control" rows="1" name="senhaUsuario" value="${usu.getSenha()}"/>
                    </div>

                    <div class="form-group">
                        <label for="perfil">Perfil*</label>
                        <select class="form-control" name="perfilUsuario">
                            <c:if test="${usu.getcodigoPerfil() == 1}">
                                <option value="1">Diretoria</option>
                            </c:if>
                            <c:if test="${usu.getcodigoPerfil() == 2}">
                                <option value="2">Gerente Produtos/ Serviços</option>
                            </c:if>    
                            <c:if test="${usu.getcodigoPerfil() == 3}">
                                <option value="3">Gerente Vendas</option>
                            </c:if>
                            <c:if test="${usu.getcodigoPerfil() == 4}">
                                <option value="4">Gerente TI</option>
                            </c:if>
                            <c:if test="${usu.getcodigoPerfil() == 5}">
                                <option value="5">Funcionário Retaguarda</option>
                            </c:if>
                            <c:if test="${usu.getcodigoPerfil() == 6}">
                                <option value="6">Vendedor</option>
                            </c:if>
                            <c:if test="${usu.getcodigoPerfil() == 6}">
                                <option value="7">Suporte Técnico</option>
                            </c:if>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="empresa">Empresa*</label>
                        <select class="form-control" name="empresaUsuario">
                            <c:if test="${usu.getCodigoEmpresa() == 1}">
                                <option value="1">Matriz - São Paulo</option>
                            </c:if>
                            <c:if test="${usu.getCodigoEmpresa() == 2}">
                                <option value="2">Filial - Porto Alegre</option>
                            </c:if>
                            <c:if test="${usu.getCodigoEmpresa() == 2}">
                                <option value="3">Filial - Recife</option>
                            </c:if>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>(*)Campos Obrigatórios</label>
                    </div>
                </c:otherwise>
            </c:choose>
                    <button type="submit" class="btn btn-default" id="botaoUsu">Salvar</button>
                    <c:if test="${not empty mensagemErroCampos}">
                        <label><c:out value="${mensagemErroCampos}"/></label>
                    </c:if>
                    <c:if test="${empty mensagemErroCampos}">
                    <label><c:out value="${mensagemErroCampos}"/></label>
                    </c:if>
                    <c:if test="${not empty usuarioexiste}">
                        <label><c:out value="${usuarioexiste}"/></label>
                    </c:if>
                    <c:if test="${empty usuarioexiste}">
                        <label><c:out value="${usuarioexiste}"/></label>
                    </c:if>
        </form>
        </div>
                </form>
            </div>            
        </div>
        <div class="footer">
            <jsp:include page="rodape.jsp"/>
        </div>          
    </body>

</html>