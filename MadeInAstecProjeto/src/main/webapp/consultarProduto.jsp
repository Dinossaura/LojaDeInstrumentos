<%-- 
    Document   : consultarProduto
    Created on : 14/10/2017, 16:23:37
    Author     : Vinícius R. Itoi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head> 
        <title>Consulta de Produtos</title>
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
        <h1>Consulta de Produtos</h1>
        <div class="well">

        <form class="form-inline" action="${pageContext.request.contextPath}/cadastro-usuario" method="post">
            <div class="form-group">
                <label for="nome">Produto: </label>
                <input type="text" class="form-control" name="cliente">
                <button type="submit" class="btn btn-default">Buscar</button>
            </div>
        </form><br/>
        <div class="tabela"style="width:800px">
            <table>
                <caption>Lista de Produtos</caption>
                <tr >
                    <th class="com" style="width:100px">Produto</th>
                    <th class="com" style="width:75px">Marca</th>
                    <th class="com"style="width:75px">Categoria</th>
                    <th class="com"style="width:30px">Qtd.Estoq.</th>
                    <th class="com"style="width:15px">Preço</th>
                </tr>
                <tr >
                    <td class="com">Flauta Transversal</td>
                    <td class="com">Yamaha</td>
                    <td class="com">Instrumento</td>
                    <td class="com">07</td>
                    <td class="com">5799,00</td>
                    <td class="sem"><button type="exluir" class="btn btn-default">Excluir</button></td>
                    <td class="sem"><button type="editar" class="btn btn-default">Editar</button></td>
                </tr>
                <%-- EXEMPLO--%>
                <tr >
                    <td class="com">Viola de Arco</td>
                    <td class="com">Eagle</td>
                    <td class="com">Instrumento</td>
                    <td class="com">03</td>
                    <td class="com">750,00</td>
                    <td class="sem"><button type="exluir" class="btn btn-default">Excluir</button></td>
                    <td class="sem"><button type="editar" class="btn btn-default">Editar</button></td>
                </tr>
                <tr >
                    <td class="com">violão elétrico</td>
                    <td class="com">Fender</td>
                    <td class="com">Instrumento</td>
                    <td class="com">15</td>
                    <td class="com">1250,00</td>
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
