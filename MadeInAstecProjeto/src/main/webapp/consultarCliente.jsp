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
            <div class="tabela"style="width:800px">
                <table>
                    <caption>Lista de Clientes</caption>
                    <tr >
                        <th class="com" style="width:30px">Nome</th>
                        <th class="com"style="width:130px">Sobrenome</th> 
                        <th class="com"style="width:100px">CPF</th>
                        <th class="com"style="width:100px">Telefone</th>
                        <th class="com"style="width:150px">Cidade</th>
                        <th class="com"style="width:15px">Estado</th>
                    </tr>
                    <tr>
                        <td class="com">Vinícius </td>
                        <td class="com">Ribeiro itoi</td> 
                        <td class="com">000.000.000-00</td>
                        <td class="com">(00)0000-0000</td>
                        <td class="com">Itapecerica da Serra</td>
                        <td class="com">SP</td>
                        <td class="sem"><button type="submit" class="btn btn-default">Excluir</button></td>
                        <td class="sem"><button type="submit" class="btn btn-default">Editar</button></td>
                    </tr>
                    <%-- EXEMPLO--%>
                    <tr >
                        <td class="com">João </td>
                        <td class="com">da Silva</td> 
                        <td class="com">000.000.000-00</td>
                        <td class="com">(00)0000-0000</td>
                        <td class="com">Rio de Janeiro</td>
                        <td class="com">RJ</td>
                        <td class="sem"><button type="submit" class="btn btn-default">Excluir</button></td>
                        <td class="sem"><button type="submit" class="btn btn-default">Editar</button></td>
                    </tr>
                    <tr>
                        <td class="com">Maria </td>
                        <td class="com">Carvalho dos Santos</td> 
                        <td class="com">000.000.000-00</td>
                        <td class="com">(00)0000-0000</td>
                        <td class="com">São Paulo</td>
                        <td class="com">SP</td>
                        <td class="sem"><button type="submit" class="btn btn-default">Excluir</button></td>
                        <td class="sem"><button type="submit" class="btn btn-default">Editar</button></td>
                    </tr>
                    <%-- EXEMPLO--%>
                </table>
            </div>
            </div>
        </div>            
    <jsp:include page="rodape.jsp"/>      
    </body>

</html>