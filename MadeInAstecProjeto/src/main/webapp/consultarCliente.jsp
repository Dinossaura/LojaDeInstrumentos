<%-- 
    Document   : consultarCliente
    Created on : 10/10/2017, 21:53:43
    Author     : vinicius.ritoi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Consulta de Cliente</title>
        <!--        <style>
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
        
                </style>-->
    </head>

    <body align="center">
        <jsp:include page="menu.jsp"/>
        <div class="container" align="center">
            <h3>Consulta de Cliente</h3>
            <!--<div class="well">-->
            <label for="nome">Cliente: </label>
            <div class ="container">   
                <div class="row">
                    <div class="col-md-10">
                    <form class="form-group-md" action="${pageContext.request.contextPath}/consultacliente" method="post">
                        <input type="text" class="form-control" name="cliente" placeholder="Digite nome Cliente" maxlength="30"/>
                    </div>
                    <div class="col-md-2">
                       <button type="submit" class="btn btn-success center-block">Pesquisar</button>    
                    </div>                           
                    </form>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                    <div class="tabela">
                        <table class="table table-selectable table-bordered table-hover col-md-8" id="tabelaclientes">
                            <caption>Lista de Clientes</caption>
                            <tr>
                                <th>Nome</th>
                                <th>Sexo</th>
                                <th>CPF</th>
                                <th>RG</th>
                                <th>Data Nascimento</th>
                                <th>Telefone 1</th>
                                <th>Email</th>
                                <th>Endereço</th>
                                <th>Cidade</th>
                                <th>Empresa</th>
                                <th>CEP</th>
                                <th>Ação</th>
                            </tr>
                            <c:forEach items="${ListaClientes}" var="cliente">
                                <tr>
                                    <td><c:out value="${cliente.nome} ${cliente.sobrenome} "  /></td>
                                    <td><c:out value="${cliente.sexo}" /></td>
                                    <td><c:out value="${cliente.cpf}" /></td>
                                    <td><c:out value="${cliente.rg}" /></td>
                                    <td><c:out value="${cliente.idade}" /></td>
                                    <td><c:out value="${cliente.telefone}" /></td>
                                    <td><c:out value="${cliente.email}" /></td>
                                    <td><c:out value="${cliente.endereco}, ${cliente.numero}" /></td>
                                    <td><c:out value="${cliente.cidade} - ${cliente.estado}" /></td>
                                    <td><c:set var="empresa" scope="session" value="${cliente.getEmpresa()}"/>
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
                                    <td><c:out value="${cliente.cep}" /></td>
                                    <td>
                                        <div>
                                            <form class="form-control-static" action="${pageContext.request.contextPath}/alterarCliente" method="post" >
                                                <div class="form-group">
                                                    <button type="submit" name="cpfcliente" value="${cliente.cpf}" 
                                                    class="btn btn-success center-block">Alterar/ Visualizar</button>
                                                </div>
                                            </form>
                              
                                            <form class="form-control-static" action="${pageContext.request.contextPath}/excluirCliente" method="post" >
                                                <div class="form-group">
                                                    <button type="submit" name="cpfcliente" value="${cliente.cpf}" 
                                                        class="btn btn-danger center-block">Excluir</button> 
                                                </div>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                        </table>
                    </div>
                    </div>
                </div>
            </div>
        </div>            
        <jsp:include page="rodape.jsp"/>      
    </body>

</html>