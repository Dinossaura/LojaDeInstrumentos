<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Alterar Produto</title>
    </head>

    <body>
    <jsp:include page="menu.jsp"/>

    <div class="container">
        <h1>Alterar Produto</h1>
        <div class="well">
            <form class="form-inline">
                <div class="form-group">
                    <label for="nome">Produto: </label>
                    <input type="text" class="form-control" id="editProd">
                </div>
                <div class="form-group">
                    <label for="desc">Descrição:</label>
                    <textarea class="form-control" rows="1" id="editDscProd"></textarea>
                </div>
                <div class="form-group">
                    <label for="desc">Categoria:</label>
                    <textarea class="form-control" rows="1" id="editCateg"></textarea>
                </div>
                <div class="form-group">
                    <label for="desc">Cód.Empresa:</label>
                    <input class="form-control" id="editCodE">
                </div><br><br>
                <div class="form-group">
                    <label for="desc">Cod.Fornecedor:</label>
                    <input class="form-control" id="editCodF">
                </div>
                <div class="form-group">
                    <label for="desc">Estoque:</label>
                    <input class="form-control" type="number" id="editEstoque">
                </div><br><br>
		<div class="form-group">
                    <label for="desc">Preços:</label>
                </div><br>
                <div class="form-group">
                    <label for="desc">Compra:</label>
                    <input class="form-control" type="number" id="editCompra">
                </div>
		<div class="form-group">
                    <label for="desc">Venda:</label>
                    <input class="form-control"  id="editVenda">
                </div><br><br>
                <button type="submit" class="btn btn-default">Atualizar</button>
	  
            </form>
        </div>

    </div>
    <jsp:include page="rodape.jsp"/>
    </body>
</html>
