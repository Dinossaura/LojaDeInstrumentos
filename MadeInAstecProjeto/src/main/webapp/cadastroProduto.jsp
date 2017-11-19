<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de Produtos</title>
        <link href="css/cadastroProduto.css" rel="stylesheet">

        <script type="text/javascript">
            function fMasc(objeto, mascara) {
                obj = objeto
                masc = mascara
                setTimeout("fMascEx()", 1)
            }
            function fMascEx() {
                obj.value = masc(obj.value)
            }
            function mNum(num) {
                num = num.replace(/\D/g, "")
                return num
            }
            function mCompra(n) {
                return "R$ " + n.toFixed(2).replace('.', ',').replace(/(\d)(?=(\d{3})+\,)/g, "$1.");
            }

        </script>
    </head>

    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <h1 id="pro">Cadastro de Produtos</h1>
            <div class="well">
                <form class="form-inline" action="${pageContext.request.contextPath}/cadastrar-produto" method="post">

                    <div class="form-group">
                        <label for="nome">Produto*</label>
                        <input type="text" class="form-control" name="prod" id="produto"/>
                    </div>

                    <div class="form-group">
                        <label for="desc">Descrição*</label>
                        <textarea class="form-control" rows="1" name="descProd" id="descricao"></textarea>
                    </div>


                    <div class="form-group">
                        <label for="empresa">Categoria*</label>
                        <select class="form-control" name="categ" id="categoria">
                            <option value="1">Cordas</option>
                            <option value="2">Sopro</option>
                            <option value="3">Percussão</option>
                            <option value="4">Áudio</option>
                            <option value="5">Teclas</option>
                            <option value="6">Acessórios</option>
                            <option value="7">Outros</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="empresa" id="perfilLab">Perfil*</label>
                        <select class="form-control" name="empresa" id="perfilProduto">
                            <option value="1">Matriz - São Paulo</option>
                            <option value="2">Filial - Porto Alegre</option>
                            <option value="3">Filial - Recife</option>
                        </select>
                    </div>



                    <div class="form-group">
                        <label for="desc">Cod.Fornecedor*</label>
                        <input class="form-control" name="codF" id="codF" onkeydown="javascript: fMasc(this, mNum)" maxlength="4"/>
                    </div>

                    <div class="form-group">
                        <label for="desc">Estoque*</label>
                        <input class="form-control" name="estoque" id="estoque" onkeydown="javascript: fMasc(this, mNum)" maxlength="6"/>
                    </div>

                    <hr id="linha"> <!--Linha de separação-->                       

                    </br><div class="form-group" id="preco">
                        <label for="desc">Preços*</label>
                    </div></br>

                    <div class="form-group">
                        <label for="desc" id="labCom">Compra</label>
                        <input class="form-control" name="compra" id="compra" onkeydown="javascript: fMasc(this, mCompra);"/>
                    </div>

                    <div class="form-group">
                        <label for="desc">Venda</label>
                        <input class="form-control"  name="venda" id="venda" onkeydown="javascript: fMasc(this, mValor);" maxlength="14"/>
                    </div>

                    <button type="submit" class="btn btn-default" id="botao">Cadastrar</button>
                    <label id="mensagem">(*)Campos Obrigatórios</label>

                </form>
            </div>



        </div>
        <div class="footer">
            <jsp:include page="rodape.jsp"/>
        </div>

    </body>

</html>