<%@page import="com.senac.madeinastec.model.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <title>Cadastro de Fornecedores</title>
        <link href="css/cadastroFornecedor.css" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="menu.jsp"/>
        
        <div class="container">
            <h1 id="for">Cadastro de Fornecedores</h1>
        <div class="well">
            <c:choose>
                <c:when test = "${empty Altera}">
                <form class="form-inline" action="${pageContext.request.contextPath}/cadastro-fornecedor" method="post">
                </c:when>
                <c:otherwise>
                <form class="form-inline" action="${pageContext.request.contextPath}/alterarfornecedor" method="post">
                </c:otherwise>
            </c:choose>
            
        <div class="form-group">
            <c:choose>
                <c:when test = "${empty Altera}">
                    <label for="fornecedor">Fornecedor*</label>
                    <input type="text" name="fornecedor" class="form-control" id="fornecedo"> 
                </c:when>
                <c:otherwise>
                    <label for="fornecedor">Fornecedor*</label>
                    <input type="text" name="fornecedor" class="form-control" value="${for.nome}"> 
                </c:otherwise>
            </c:choose>
        </div>
        <div class="form-group">
            
            <c:choose>
                <c:when test = "${not empty Altera}">
                    <c:set var="codigoempresa" value="${for.codigoempresa}"/>
                    <c:if test="codigoempresa == 1">
                        <c:set var="nomeempresa" value="Matriz - São Paulo"/>
                    </c:if>
                    <c:if test="codigoempresa == 2">
                        <c:set var="nomeempresa" value="Filial - Porto Alegre"/>
                    </c:if>
                    <c:if test="codigoempresa == 3">
                        <c:set var="nomeempresa" value="Matriz - Recife"/>
                    </c:if>
                    <label for="empresa">Perfil*</label>
                    <select class="form-control" name="empresa" id="perfilFor">
                        <option><c:out value="${nomeempresa}"/></option>
                    </select>
                </c:when>
                <c:otherwise>
                    <label for="empresa">Perfil*</label>
                    <select class="form-control" name="empresa" id="perfilFor">
                        <option value="1">Matriz - São Paulo</option>
                        <option value="2">Filial - Porto Alegre</option>
                        <option value="3">Filial - Pernambuco</option>
                    </select>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="form-group">
            <label>(*)Campos Obrigatórios</label>
        </div>
        <button type="submit" class="btn btn-default" id="botaoForn">Salvar</button>
        </form>
        </div>
        <jsp:include page="rodape.jsp"/>
    </body>
</html>
