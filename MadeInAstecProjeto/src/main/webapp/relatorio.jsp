<%-- 
    Document   : relatorio
    Created on : 14/10/2017, 16:56:41
    Author     : Vinícius R. Itoi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Relatórios</title>
    </head>

    <body align="center"> 
        <jsp:include page="menu.jsp"/>
        <div class="container" align="center">
            <h1>Relatórios</h1>
            <div class="well">

            <form class="form-inline" action="${pageContext.request.contextPath}/cadastro-usuario" method="post">
                <div class="form-group">
                    <label for="nome">Empresa: </label>
                    <input type="text" class="form-control" name="Empresa"><br></br>
                    <label for="nome">De: </label>
                    <input type="text" class="form-control" name="de">
                    <label for="nome">Até: </label>
                    <input type="text" class="form-control" name="ate">
                    <button type="submit" class="btn btn-default">Gerar</button>
                </div>
            </form><br/>
            <div class="tabelas"style="width:800px"align="center">
                <table class="tabela1" >
                    <tr>
                        <th class="com" style="width:50px">Código</th>
                        <th class="com" style="width:150px">Cliente</th>
                        <th class="com"style="width:150px">Empresa</th>
                        <th class="com"style="width:50px">Valor Nota</th>
                    </tr>
                    <tr>
                        <td class="com">0001</td>
                        <td class="com">Vinícius</td>
                        <td class="com">viniciusCorp</td>
                        <td class="com">2000,00</td>
                    </tr>
                    <%-- EXEMPLO--%>
                    <tr >
                        <td class="com">0002</td>
                        <td class="com">Maria</td>
                        <td class="com">Fornecedor.Inc</td>
                        <td class="com">9000,00</td>
                    </tr>
                    <%-- EXEMPLO--%>
                    <tr>
                        <td class="com">0003</td>
                        <td class="com">João</td>
                        <td class="com">Palhetas.TM</td>
                        <td class="com">1500,00</td>
                    </tr>
                    <tr>
                        <td class="sem"></td>
                        <td class="sem"></td>
                        <td class="sem"></td>
                        <td class="sem"><button type="exportar" class="btn btn-default">Exportar</button></td>
                    </tr>
                    <%-- EXEMPLO--%>
                </table>
                <br></br>
                <table class="tabela2">
                    <tr>
                        <th class="com" style="width:150px">Produto</th>
                        <th class="com"style="width:80px">Qtd</th>
                        <th class="com" style="width:100px">Valor Unid.</th>
                        <th class="com"style="width:100px">Valor Total</th>
                    </tr>
                    <tr>
                        <td class="com">Flauta Transversal</td>
                        <td class="com">2</td>
                        <td class="com">5799,00</td>
                        <td class="com">11598,00</td>
                    </tr>
                    <%-- EXEMPLO--%>
                    <tr>
                        <td class="com">Violão Elétrico</td>
                        <td class="com">1</td>
                        <td class="com">1250,00</td>
                        <td class="com">2500,00</td>
                    </tr>
                    <tr>
                        <td class="com">Viola de arco</td>
                        <td class="com">5</td>
                        <td class="com">750,00</td>
                        <td class="com">3750,00</td>
                    </tr>
                    <%-- EXEMPLO--%>
                    <tr>
                        <td class="sem"></td>
                        <td class="sem"></td>
                        <td class="sem"></td>
                        <td class="sem"><button type="exportar" class="btn btn-default">Exportar</button></td>
                    </tr>
                </table>
            </div>
            </div>
        </div>            
    <jsp:include page="rodape.jsp"/>                
    </body>

</html>

