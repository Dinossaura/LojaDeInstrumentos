<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                    <input type="text" class="form-control" name="cpfCliente" onkeydown="javascript: fMasc(this, mCPF);" maxlength="14" placeholder="Ex 000.000.000-00"><br><br>

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
        </div><br><br><br><br><br><br>

        <div class="container" align="center">

            <form class="form-control-static" action="${pageContext.request.contextPath}/ConsultaProdutosVendaServlet" method="post">
                <div class="form-group" id="produto">
                    <label for="Prod">Produdo</label>
                    <input type="text" class="form-control" name="nomeProd" placeholder="Digite o nome do Produto"><br><br>

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

                    </tr>
                </thead>
                <c:forEach items="${ListaProduto}" var="produto">
                    <tr>
                        <td><c:out value="${produto.nome}" /></td>
                        <td><c:out value="${produto.categoria}" /></td>
                        <td><c:out value="${produto.estoque}" /></td>
                        <td><c:out value="${produto.precovenda}" /></td>
                        <td><c:out value="${produto.codigo}" /></td>

                        <td>

                            <div>
                                <form class="form-control-static" action="${pageContext.request.contextPath}/ListagemDeCarrinhoServlet" method="post" >
                                    <div class="form-group">
                                        <button type="submit" name="nomeproduto" value="${produto.nome}" 
                                                class="btn btn-success center-block">Adicionar</button>
                                    </div>
                                </form>                              

                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>



    </body>
</html>
