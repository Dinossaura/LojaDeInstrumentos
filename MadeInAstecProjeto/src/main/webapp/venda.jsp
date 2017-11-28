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
            <form class="form-control-static" action="${pageContext.request.contextPath}/ConsultaClientesVendaServlet" method="post">
                <div class="form-group" id="cliente">
                    <label for="CPF">Cliente</label>
                    <input type="text" class="form-control" name="cpfCliente" onkeydown="javascript: fMasc(this, mCPF);" maxlength="14" placeholder="Ex 000.000.000-00">
                </div>
                <button type="submit" class="btn btn-success center-block">Pesquisar</button>
            </form>
                
            <table class="table table-selectable table-bordered table-hover col-md-8" id="tabelaClientes">
                <thead>
                    <tr>
                        <th>CPF</th>
                        <th>Nome</th>
                        <th>Sobrenome</th>
                        <th>Telefone</th>
                        <th>Ação</th>
                    </tr>
                </thead>
                <c:forEach items="${ListaClientes}" var="cliente">
                    <tr>
                        <td><c:out value="${cliente.cpf}" /></td>
                        <td><c:out value="${cliente.nome}" /></td>
                        <td><c:out value="${cliente.sobrenome}" /></td>
                        <td><c:out value="${cliente.telefone}" /></td>

                        <td>
                            <div>
                                <form class="form-control-static" action="${pageContext.request.contextPath}/FazerFuncaoDoBotao" method="post" >
                                    <div class="form-group">
                                        <button type="submit" name="cpfcliente" value="${cliente.cpf}" 
                                                class="btn btn-success center-block">Adicionar</button>
                                    </div>
                                </form>                              

                            </div>
                        </td>
                    </tr>
                </c:forEach>


            </table>
        </div> 
        <hr class="btn-default">
        <div class="container" align="center">

            <form class="form-control-static" action="${pageContext.request.contextPath}/ConsultaProdutosVendaServlet" method="post">
                <div class="form-group" id="produto">
                    <label for="Prod">Produtos</label>
                    <input type="text" class="form-control" name="nomeProd" placeholder="Digite o nome do Produto">
                </div>
                <button type="submit" class="btn btn-success center-block">Pesquisar</button>
            </form>

            <table class="table table-selectable table-bordered table-hover col-md-8" id="tabelaProdutos">
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
                    <tr>
                        <td><c:out value="${produto.nome}" /></td>
                        <td><c:out value="${produto.categoria}" /></td>
                        <td><c:out value="${produto.estoque}" /></td>
                        <td><c:out value="${produto.precovenda}" /></td>
                        <td><c:out value="${produto.codigo}" /></td>

                        <td class="col-sm-1">
                            <div>
                                <form class="form-control-static" action="${pageContext.request.contextPath}/ListagemDeCarrinhoServlet" method="post" >
                                        <div class="form-group">
                                          <input type="number" class="form-control center-block" maxlength="4" name="qtdProd" placeholder="Qtd">    
                                          
                                        </div>
                                        <button type="submit" name="nomeproduto" value="${produto.codigo}" 
                                                class="btn btn-success center-block">Adicionar</button>
                                </form>                              

                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="container" align="center">
            <form class="form-control-static" action="${pageContext.request.contextPath}/ConsultaCarrinhoServlet" method="post">
                <button type="submit" class="btn btn-info center-block">Ir para Carrinho</button>
            </form>
        </div>
    <jsp:include page="rodape.jsp"/>           
    </body>
</html>
