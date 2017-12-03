<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
            .jumbotron {
                margin-bottom: 0;
            }
        </style>

        <script>

            function fMasc(objeto, mascara) {
                obj = objeto
                masc = mascara
                setTimeout("fMascEx()", 1)
            }
            function fMascEx() {
                obj.value = masc(obj.value)
            }

            function mCPF(cpf) {
                cpf = cpf.replace(/\D/g, "")
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2")
                return cpf
            }

        </script>
        <title>Venda</title>
    </head>
    <body>        
        <jsp:include page="menu.jsp"/>

        <div class="container" align="center">
            <h3>Venda</h3>
            <c:choose>
                <c:when test = "${empty codigocarrinho}">
                    <label for="CPF">Cliente:</label>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-10">
                                <form class="form-group-md" action="${pageContext.request.contextPath}/ConsultaClientesVendaServlet" method="post">
                                    <div class="form-group" id="cliente">
                                        <input type="text" class="form-control" name="cpfCliente" onkeydown="javascript: fMasc(this, mCPF);" maxlength="14" placeholder="Ex 000.000.000-00">
                                    </div>
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
                                <table class="table table-selectable table-bordered table-hover col-md-8" id="tabelaClientes">
                                    <thead>
                                        <tr>
                                            <th>Código</th>
                                            <th>CPF</th>
                                            <th>Nome</th>
                                            <th>Telefone</th>
                                            <th>Ação</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${ListaClientes}" var="cliente">
                                        <tr>
                                            <td><c:out value="${cliente.id}" /></td>
                                            <td><c:out value="${cliente.cpf}" /></td>
                                            <td><c:out value="${cliente.nome} ${cliente.sobrenome}" /></td>
                                            <td><c:out value="${cliente.telefone}" /></td>

                                            <td>
                                                <div>
                                                    <form class="form-control-static" action="${pageContext.request.contextPath}/cadastrarclientecarrinho" method="post" >
                                                        <div class="form-group">
                                                            <button type="submit" name="codigoCliente" value="${cliente.id}" 
                                                                class="btn btn-success center-block">Adicionar</button>
                                                        </div>
                                                    </form>                              
                                                </div>
                                            </td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </c:when>
            
                <c:otherwise>
                    <div class="form-group" id="cliente">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <label for="CPF">Cliente: <c:out value="${cliente.nome} ${cliente.sobrenome}"/></label>
                                    <label for="CodCarrinho">Carrinho: <c:out value="${codigocarrinho}"/></label>
                                    <form class="form-control-static" action="${pageContext.request.contextPath}/removerclientecarrinho" method="post" >
                                        <div class="form-group">
                                            <button type="submit" name="codigocarrinho" value="${codigocarrinho}" 
                                                class="btn btn-danger center-block">Remover Carrinho</button>
                                        </div>
                                    </form> 
                                </div>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose> 
        </div> 
        <hr class="btn-default">
        <div class="container" align="center">
            <label for="Prod">Produtos</label>
            <div class="container">
                <div class="row">
                    <div class="col-md-10">
                        <form class="form-group-md" action="${pageContext.request.contextPath}/ConsultaProdutosVendaServlet" method="post">
                            <input type="text" class="form-control" name="nomeProd" placeholder="Digite o nome do Produto" maxlength="70">
                    </div>
                    <div class="col-md-2">
                        <button type="submit" class="btn btn-success center-block">Pesquisar</button>        
                    </div>
                        </form>
                </div>
            </div>
            <c:choose>
                <c:when test="${not empty codigocarrinho}">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <table class="table table-selectable table-bordered table-hover col-md-8" id="tabelaProdutos">
                                <caption>Listagem de Produtos</caption>
                                <thead>
                                    <tr>
                                        <th>Produto</th>
                                        <th>Categoria</th>
                                        <th>Estoque</th>
                                        <th>Preço</th>
                                        <th>ID</th>
                                        <th>Carrinho</th>
                                    </tr>
                                </thead>
                
                                <c:forEach items="${ListaProduto}" var="produto">
                                <tbody>
                                    <tr>
                                        <td><c:out value="${produto.nome}" /></td>
                                        <td><c:out value="${produto.categoria}" /></td>
                                        <td><c:out value="${produto.estoque}" /></td>
                                        <td><c:out value="${produto.precovenda}" /></td>
                                        <td><c:out value="${produto.codigo}" /></td>

                                        <td class="col-sm-1">
                                            <div>
                                                <form class="form-control-static" action="${pageContext.request.contextPath}/cadastraritemcarrinho" method="post" >
                                                    <div class="form-group">
                                                        <input type="number" class="form-control center-block" maxlength="4" name="qtdProd" placeholder="Qtd">    
                                                        <input type="hidden" name="codigocarrinho" value="${codigocarrinho}">
                                                        <input type="hidden" name="precovenda" value="${produto.precovenda}">
                                                    </div>
                                                    <button type="submit" name="codigoproduto" value="${produto.codigo}" 
                                                        class="btn btn-success center-block">Adicionar</button>
                                                </form>                              

                                            </div>
                                            <!--Variáveis vem do Servlet para verificação de campos -->
                                            <c:if test="${not empty produtoqtdvazia}">
                                                <c:if test="${produtoqtdvazia == produto.codigo}">
                                                    <label><c:out value="Qtd Vazia"/></label>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${not empty estoqueinsuficiente}">
                                                <c:if test="${produtoestoqueinsuficiente == produto.codigo}">
                                                    <label><c:out value="Estoque Insuficiente"/></label>
                                                </c:if> 
                                            </c:if>
                                        </td>
                                    </tr>
                                </tbody>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
        </div>
        <div class="container" align="center">
            <form class="form-control-static" action="${pageContext.request.contextPath}/listagemcarrinho" method="post">
                <input type="hidden" name="codigocarrinho" value="${codigocarrinho}">
                <button type="submit" class="btn btn-info center-block">Ir para Carrinho</button>
            </form>
        </div>
                </c:when>
                <c:otherwise>
                    <label>Atribua um Cliente ao Carrinho</label>
                </c:otherwise>
            </c:choose>
        
    <jsp:include page="rodape.jsp"/>           
    </body>
</html>
