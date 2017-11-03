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
            <h1>Consulta de Cliente</h1>
            <div class="well">
                <form class="form-inline" action="${pageContext.request.contextPath}/cadastro-usuario" method="post">
                    <div class="form-group">
                        <label for="nome">Cliente: </label>
                        <input type="text" class="form-control" name="cliente">
                        <button type="submit" class="btn btn-default">Buscar</button>
                    </div>
                </form><br/>
                <div class="tabela">
                    <table class="table table-bordered table-responsive">
                        <caption>Lista de Clientes</caption>
                        <tr>
                            <th >Nome</th>
                            <th >Sobrenome</th> 
                            <th >CPF</th>
                            <th >Telefone</th>
                            <th >Cidade</th>
                            <th >Estado</th>
                            <th >Editar</th>
                            <th >Deletar</th>
                        </tr>
                        <c:forEach items="${listaClientes}" var="cliente">
                            <tr>
                                <td class=""><c:out value="${cliente.getNome()}" /></td>
                                <td ><c:out value="${cliente.getSobrenome()}" /></td> 
                                <td ><c:out value="${cliente.getCpf()}" /></td>
                                <td ><c:out value="${cliente.getTelefone()}" /></td>
                                <td ><c:out value="${cliente.getCidade()}" /></td>
                                <td ><c:out value="${cliente.getEstado()}" /></td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/editar-cliente" method="post" >
                                        <input type="hidden" name="idEscondido" value="${cliente.getId()}"/>
                                        <button style="margin-left: 30px" type="submit" class="btn btn-default">Editar</button>                                        
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/excluirCliente" method="post" >
                                        <input type="hidden" name="idEscondido" value="${cliente.getId()}"/>
                                        <button style="margin-left: 30px" type="submit" class="btn btn-warning">Excluir</button>                                       
                                </td>   
                            </tr>
                        </c:forEach>

                    </table>
                </div>
            </div>
        </div>            
        <jsp:include page="rodape.jsp"/>      
    </body>

</html>