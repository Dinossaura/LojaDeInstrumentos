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
        <c:choose>
            <c:when test="${empty venda}">
                <div class="container" align="center">
                    <h3>Carrinho</h3>
                    <div class="col-md-12">
                        <div class="form-control-static">
                        <label><c:out value="Carrinho n°:${cabecalhocarrinho.codigo}"/></label>
                        <label>
                            <c:forEach items="${listaclientes}" var="cli">
                                <c:if test="${cli.id eq cabecalhocarrinho.codigoCliente}">
                                <c:out value="Cliente: ${cli.nome} ${cli.sobrenome}"/>
                                <c:out value="/ CPF: ${cli.cpf}"/>
                                </c:if>
                            </c:forEach>
                        </label>
                        <label><c:out value="Data Carrinho: ${cabecalhocarrinho.data}"/></label>
                        <label><c:out value="Valor Total: R$ ${cabecalhocarrinho.valorTotal}"/></label>
                        </div>
                
                    </div>
                    <table class="table table-selectable table-bordered table-hover col-md-8" id="tabelaProdutos">
                                <thead>
                                    <tr>
                                        <th>Produto</th>
                                        <th>Descrição</th>
                                        <th>Valor Unitário</th>
                                        <th>Quantidade</th>
                                        <th>Ação</th>
                                    </tr>
                                </thead>
                
                                <c:forEach items="${itenscarrinho}" var="item">
                                    <tr>
                                        <td>
                                            <c:forEach items="${listaprodutos}" var="prod">
                                                <c:if test="${prod.codigo eq item.getProduto()}">
                                                    <c:out value="${prod.nome}" />
                                                </c:if>
                                            </c:forEach>    
                                        </td>
                                        <td>
                                            <c:forEach items="${listaprodutos}" var="prod">
                                                <c:if test="${prod.codigo eq item.getProduto()}">
                                                    <c:out value="${prod.descricao}" />
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <c:forEach items="${listaprodutos}" var="prod">
                                                <c:if test="${prod.codigo eq item.getProduto()}">
                                                    <c:out value="R$ ${prod.precovenda}" />
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td><c:out value="${item.quantidade}" /></td>
                                        <td>
                                            <form class="form-control-static" action="${pageContext.request.contextPath}/removeritemcarrinho" method="post" >
                                                <div class="form-group">
                                                    <input type="hidden" name="codigocarrinho" value="${cabecalhocarrinho.getCodigo()}">
                                                    <input type="hidden" name="quantidadeitem" value="${item.quantidade}">
                                                    <input type="hidden" name="codigoitem" value="${item.codigo}">
                                                    <button type="submit" name="produtoitem" value="${item.getProduto()}" 
                                                                class="btn btn-danger center-block">Remover Produto</button>
                                                </div>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                    </table>
                </div>
                <div class="container form-control-static">
            
                    <div class="col-md-4">
                        <form class="" action="${pageContext.request.contextPath}/finalizarvenda" method="post">
                            <input type="hidden" name="codigocarrinho" value="${cabecalhocarrinho.getCodigo()}">
                            <input type="submit" class="btn btn-success" title="Finalizar Venda">            
                         </form>
                    </div>
                    <div class="col-md-8">
                        <a href="${pageContext.request.contextPath}/venda.jsp" class="btn btn-danger">Voltar</a>
                    </div>
            
                </div>
            </c:when>
            <c:otherwise>
                <div class="container" align="center">
                    <h3>Venda</h3>
                    <div class="col-md-12">
                        <div class="form-control-static">
                        <label><c:out value="Venda n°:${venda.getCodigo()}"/></label>
                        <label><c:out value="Cliente: ${clientevenda.nome} ${clientevenda.sobrenome}"/></label>
                        <label><c:out value="/ CPF: ${clientevenda.cpf}"/></label>
                        <label><c:out value="Data Venda: ${venda.data}"/></label>
                        <label><c:out value="Valor Total: R$ ${venda.valorTotal}"/></label>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose> 
    <jsp:include page="rodape.jsp"/>           
    </body>
</html>
