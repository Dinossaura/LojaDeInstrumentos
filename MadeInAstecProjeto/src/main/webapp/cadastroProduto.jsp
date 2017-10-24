<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de Produtos</title>
    </head>

    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <h1>Cadastro de Produtos</h1>
            <div class="well">
                <form class="form-inline" action="${pageContext.request.contextPath}/cadastrar-cliente" method="post>
                    <div class="form-group">
                        <label for="nome">Produto: </label>
                        <input type="text" class="form-control" name="prod">
                    </div>
                    <div class="form-group">
                        <label for="desc">Descrição:</label>
                        <textarea class="form-control" rows="1" name="dscProd"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="desc">Categoria:</label>
                        <textarea class="form-control" rows="1" name="categ"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="desc">Cód.Empresa:</label>
                        <input class="form-control" name="codE"></textarea>
                    </div><br><br>
                    <div class="form-group">
                        <label for="desc">Cod.Fornecedor:</label>
                        <input class="form-control" name="codF"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="desc">Estoque:</label>
                        <input class="form-control" type="number" name="estoque"></textarea>
                    </div><br><br>
                    <div class="form-group">
                        <label for="desc">Preços:</label>
                    </div><br>
                    <div class="form-group">
                        <label for="desc">Compra:</label>
                        <input class="form-control" type="number" name="compra"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="desc">Venda:</label>
                        <input class="form-control"  name="venda"></textarea>
                    </div><br><br>
                    <button type="submit" class="btn btn-default">Cadastrar</button>

                </form>
            </div>



        </div>
        <div class="footer">
            <jsp:include page="rodape.jsp"/>
        </div>

    </body>

</html>