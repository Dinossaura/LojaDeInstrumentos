<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de Produtos</title>
        <link href="css/cadastroProduto.css" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <h1 id="pro">Cadastro de Produtos</h1>
            <div class="well">
                <form class="form-inline" action="${pageContext.request.contextPath}/cadastrar-cliente" method="post">

                    <div class="form-group">
                        <label for="nome">Produto</label>
                        <input type="text" class="form-control" name="prod" id="produto"/>
                    </div>

                    <div class="form-group">
                        <label for="desc">Descrição</label>
                        <textarea class="form-control" rows="1" name="dscProd" id="descricao"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="desc">Categoria</label>
                        <textarea class="form-control" rows="1" name="categ" id="categoria"></textarea>
                    </div>

                    <div class="form-group">
                        <label for="desc" id="coE">Cod.Empresa</label>
                        <input class="form-control" name="codE" id="codE"/>
                    </div>

                    <div class="form-group">
                        <label for="desc">Cod.Fornecedor</label>
                        <input class="form-control" name="codF" id="codF"/>
                    </div>

                    <div class="form-group">
                        <label for="desc">Estoque</label>
                        <input class="form-control" type="number" name="estoque" id="estoque"/>
                    </div>
                    
                    <hr id="linha"> <!--Linha de separação-->                       
                    
                    </br><div class="form-group" id="preco">
                        <label for="desc">Preços</label>
                    </div></br>

                    <div class="form-group">
                        <label for="desc" id="labCom">Compra</label>
                        <input class="form-control" type="number" name="compra" id="compra"/>
                    </div>

                    <div class="form-group">
                        <label for="desc">Venda</label>
                        <input class="form-control"  name="venda" id="venda"/>
                    </div>

                    <button type="submit" class="btn btn-default" id="botao">Cadastrar</button>

                </form>
            </div>



        </div>
        <div class="footer">
            <jsp:include page="rodape.jsp"/>
        </div>

    </body>

</html>