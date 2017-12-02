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

    <body> 
    <jsp:include page="menu.jsp"/>
    <div class="container" align="center">
    <h3>Relatório de Vendas</h3>
        <div class="container">
            <div class="row">
                <div class="col-md-10">
                    <form class="form-group-md" action="${pageContext.request.contextPath}/listagemvendas" method="post">
                           
                    <label for="datainicial">Data Inicial</label>
                    <input type="date" class="form-control-static" name="datainicial">
                    
                    <label for="datainicial">Data Final</label>
                    <input type="date" class="form-control-static" name="datafinal">
                    <c:if test="${not empty datasvazias}">
                        <label><c:out value="${datasvazias}"/></label>
                    </c:if>
                    <c:if test="${not empty datamaior}">
                        <label><c:out value="${datamaior}"/></label>
                    </c:if>
                    
                    <label for="empresa">Empresa*</label>
                    <select class="form-control-static" name="empresa" id="perfilFor">
                        <option value="1"><c:out value="Matriz - São Paulo"/></option>
                        <option value="2"><c:out value="Filial - Porto Alegre"/></option>
                        <option value="3"><c:out value="Filial - Recife"/></option>
                        <option value="todos"><c:out value="Todas Empresas"/></option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button type="submit" class="btn btn-success center-block">Pesquisar</button>
                    </form>
                </div>
            </div>    
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-selectable table-bordered table-hover col-md-8" id="tabelavendas">
                        <caption>Lista de Vendas</caption>
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Cliente</th>
                                <th>Data Venda</th>
                                <th>Valor Total</th>
                                <th>Empresa</th>
                                <th>Itens</th>
                            </tr>
                        </thead>
                        <c:forEach items="${listavendas}" var="venda">
                        <tbody>
                            <tr>
                                <td><c:out value="${venda.codigo}" /></td>
                                <td><c:out value="${venda.nomecliente}"/></td>
                                <td><c:out value="${venda.data}" /></td>
                                <td><c:out value="${venda.valorTotal}"/></td>
                                <td><c:out value="${venda.nomeempresa}"/></td>
                                <td>
                                    <div>
                                        <form class="form-control-static" action="${pageContext.request.contextPath}/listaritens" method="post">
                                            <div class="form-group">
                                                <button type="submit" name="codigovenda" value="${venda.codigo}"
                                                    class="btn btn-success center-block">Listar Itens</button>
                                            </div>
                                        </form>                              
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class = "col-md-12">
                        <button class="btn btn-info center-block" id="exportavendas">Exportar</button>   
                </div>
            </div>
        </div>
        <hr class="btn-default">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-selectable table-bordered table-hover col-md-8" id="itensvenda">
                        <caption>Lista de Itens</caption>
                        <thead>
                            <tr>
                                <th>Código Venda</th>
                                <th>Código Produto</th>
                                <th>Nome</th>
                                <th>Descrição</th>
                                <th>Categoria</th>
                                <th>Quantidade</th>
                                <th>Preço Venda</th>
                            </tr>
                        </thead>
                
                        <c:forEach items="${itensvenda}" var="itens">
                        <tbody>
                            <tr>
                                <td><c:out value="${itens.codigovenda}" /></td>
                                <td><c:out value="${itens.getCodigoProduto()}" /></td>
                                <td><c:out value="${itens.nomeproduto}" /></td>
                                <td><c:out value="${itens.descricaoproduto}" /></td>
                                <td><c:out value="${itens.nomecategoria}" /></td>
                                <td><c:out value="${itens.quantidade}" /></td>
                                <td><c:out value="${itens.prevovenda}" /></td>
                            </tr>
                        </tbody>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    
        <div class="container">
            <div class ="row">
                <div class="col-md-12">
                        <button id="exportaitensvenda" class="btn btn-info center-block">Exportar</button>
                </div>
            </div>
        </div>
    </div>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="js/jquery.btechco.excelexport.js"></script>
    <script src="js/jquery.base64.js"></script>
    
    <script>
    $(document).ready(function () {
        $("#exportavendas").click(function () {
            $("#tabelavendas").btechco_excelexport({
                containerid: "tabelavendas"
               , datatype: $datatype.Table
               , filename: 'Planilha de Vendas'
            });
        });
    });
    </script>
    <script>
    $(document).ready(function () {
        $("#exportaitensvenda").click(function () {
            $("#itensvenda").btechco_excelexport({
                containerid: "itensvenda"
               , datatype: $datatype.Table
               , filename: 'Planilha de ItensVenda'
            });
        });
    });
    </script>
    <jsp:include page="rodape.jsp"/>                
    </body>
</html>

