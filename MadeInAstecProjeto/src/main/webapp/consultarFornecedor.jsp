<%-- 
    Document   : consultarCliente
    Created on : 14/10/2017, 15:50:03
    Author     : vinicius.ritoi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Consulta de Fornecedores</title>
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
        <h1>Consulta de Fornecedores</h1>
        <div class="well">

        <form class="form-inline" action="${pageContext.request.contextPath}/cadastro-usuario" method="post">
            <div class="form-group">
                <label for="nome">Fornecedor: </label>
                <input type="text" class="form-control" name="cliente">
                <button type="submit" class="btn btn-default">Buscar</button>
            </div>
        </form><br/>
        <div class="tabela"style="width:800px">
            <table>
                <caption>Lista de Fornecedores</caption>
                <tr >
                    <th class="com" style="width:50px">Nome</th>
                    <th class="com"style="width:150px">CNPJ</th>
                    <th class="com"style="width:110px">Telefone</th>
                    <th class="com"style="width:15px">Estado</th>
                </tr>
                <tr >
                    <td class="com">ViníciusCorp </td>
                    <td class="com">00.000.000/0000-00</td>
                    <td class="com">(00)00000-0000</td>
                    <td class="com">SP</td>
                    <td class="sem"><button type="exluir" class="btn btn-default">Excluir</button></td>
                    <td class="sem"><button type="editar" class="btn btn-default">Editar</button></td>
                </tr>
                <%-- EXEMPLO--%>
                <tr >
                    <td class="com">Palhetas.TM </td>
                    <td class="com">00.000.000/0000-00</td>
                    <td class="com">(00)00000-0000</td>
                    <td class="com">SP</td>
                    <td class="sem"><button type="exluir" class="btn btn-default">Excluir</button></td>
                    <td class="sem"><button type="editar" class="btn btn-default">Editar</button></td>
                </tr>
                <tr >
                    <td class="com">Fornecedor.Inc </td>
                    <td class="com">00.000.000/0000-00</td>
                    <td class="com">(00)00000-0000</td>
                    <td class="com">SP</td>
                    <td class="sem"><button type="exluir" class="btn btn-default">Excluir</button></td>
                    <td class="sem"><button type="editar" class="btn btn-default">Editar</button></td>
                </tr>
                <%-- EXEMPLO--%>
            </table>
        </div>
        </div>
    </div>            
    <jsp:include page="rodape.jsp"/>
</body>

</html>