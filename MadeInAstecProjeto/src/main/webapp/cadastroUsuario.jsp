<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>        
        <title>Cadastro de Usuários</title>
        <link href="css/cadastroUsuario.css" rel="stylesheet">

        <script type="text/javascript">

            function fMasc(objeto, mascara) {
                obj = objeto
                masc = mascara
                setTimeout("fMascEx()", 1)
            }
            function fMascEx() {
                obj.value = masc(obj.value)
            }

            function soLetras(v) {
                return v.replace(/\d/g, "") //Remove tudo o que não é Letra
            }
            
        </script>
    </head>

    <body>
        <jsp:include page="menu.jsp"/>

        <div class="container">
            <c:choose>
                <c:when test = "${empty Altera}">
                    <h1 id="usu">Cadastro de Usuários</h1>
                </c:when>
                <c:otherwise>
                    <h1 id="usu">Alteração de Usuários</h1>
                </c:otherwise>
            </c:choose>

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
                                    <input type="text" class="form-control" name="name" id="nomeUsu" onkeydown="javascript: fMasc(this, soLetras);" required oninvalid="this.setCustomValidity('Preencha o Nome')" oninput="setCustomValidity('')" maxlength="30"/>
                                </div>

                                <div class="form-group">
                                    <label for="login">Login*</label>
                                    <input class="form-control" rows="1" name="login" id="loginUsu" required oninvalid="this.setCustomValidity('Preencha o Login')" oninput="setCustomValidity('')" maxlength="20"/>
                                </div>

                                <div class="form-group">
                                    <label for="senha">Senha*</label>
                                    <input type="password" class="form-control" rows="1" name="senha" id="senha" required oninvalid="this.setCustomValidity('Preencha a Senha')" oninput="setCustomValidity('')" maxlength="20"/>
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

                            </c:when>
                            <c:otherwise>
                                <div class="form-group">
                                    <label for="nome">Nome*</label>
                                    <input type="text" class="form-control" name="nomeUsuario" value="${usu.getNome()}" id="nomeUsu" onkeydown="javascript: fMasc(this, soLetras);" required oninvalid="this.setCustomValidity('Preencha o Nome')" oninput="setCustomValidity('')" maxlength="30"/>
                                </div>

                                <div class="form-group">
                                    <label for="login">Login*</label>
                                    <input class="form-control" rows="1" name="loginUsuario" value="${usu.getLogin()}" id="loginUsu" required oninvalid="this.setCustomValidity('Preencha o Login')" oninput="setCustomValidity('')" maxlength="20"/>
                                </div>

                                <div class="form-group">
                                    <label for="senha">Senha*</label>
                                    <input type="password" class="form-control" rows="1" name="senhaUsuario" value="${usu.getSenha()}" id="senha" required oninvalid="this.setCustomValidity('Preencha a Senha')" oninput="setCustomValidity('')" maxlength="20"/>
                                </div>

                                <div class="form-group">
                                    <label for="perfil">Perfil*</label>
                                    <select class="form-control" name="perfilUsuario" id="perfilUsu">
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
                                    <select class="form-control" name="empresaUsuario" id="empresaUsu">
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

                        <label id="mensagem">(*)Campos Obrigatórios</label>
                        </div> 
                    </form>
            </div>            
        </div>
        <div class="footer">
            <jsp:include page="rodape.jsp"/>
        </div>          
    </body>

</html>
