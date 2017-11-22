<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de Produtos</title>
        <link href="css/cadastroProduto.css" rel="stylesheet">
        <!-- Variável Altera é um Atributo vindo do Servlet de Alteração para possível alteração do jsp de cadastro -->
        <c:choose>
            <c:when test="${empty Altera}">
                <title>Cadastro de Produtos</title>
            </c:when>
            <c:otherwise>
                <title>Alteração de Produtos</title>
            </c:otherwise>
        </c:choose>
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

            function formatamoney(c) {
                var t = this;
                if (c == undefined)
                    c = 2;
                var p, d = (t = t.split("."))[1].substr(0, c);
                for (p = (t = t[0]).length; (p -= 3) >= 1; ) {
                    t = t.substr(0, p) + "." + t.substr(p);
                }
                return t + "," + d + Array(c + 1 - d.length).join(0);
            }

            String.prototype.formatCurrency = formatamoney

            function demaskvalue(valor, currency) {

// Se currency é false, retorna o valor sem apenas com os números. Se é true, os dois últimos caracteres são considerados as 
// casas decimais
                var val2 = '';
                var strCheck = '0123456789';
                var len = valor.length;
                if (len == 0) {
                    return 0.00;
                }

                if (currency == true) {
// Elimina os zeros à esquerda 
// a variável <i> passa a ser a localização do primeiro caractere após os zeros e 
// val2 contém os caracteres (descontando os zeros à esquerda)


                    for (var i = 0; i < len; i++)
                        if ((valor.charAt(i) != '0') && (valor.charAt(i) != ','))
                            break;

                    for (; i < len; i++) {
                        if (strCheck.indexOf(valor.charAt(i)) != -1)
                            val2 += valor.charAt(i);
                    }

                    if (val2.length == 0)
                        return "0.00";
                    if (val2.length == 1)
                        return "0.0" + val2;
                    if (val2.length == 2)
                        return "0." + val2;

                    var parte1 = val2.substring(0, val2.length - 2);
                    var parte2 = val2.substring(val2.length - 2);
                    var returnvalue = parte1 + "." + parte2;
                    return returnvalue;

                } else {
// currency é false: retornamos os valores COM os zeros à esquerda, 
// sem considerar os últimos 2 algarismos como casas decimais 

                    val3 = "";
                    for (var k = 0; k < len; k++) {
                        if (strCheck.indexOf(valor.charAt(k)) != -1)
                            val3 += valor.charAt(k);
                    }
                    return val3;
                }
            }

            function reais(obj, event) {

                var whichCode = (window.Event) ? event.which : event.keyCode;

//Executa a formatação após o backspace nos navegadores !document.all

                if (whichCode == 8 && !documentall) {

//Previne a ação padrão nos navegadores

                    if (event.preventDefault) { //standart browsers
                        event.preventDefault();
                    } else { // internet explorer
                        event.returnValue = false;
                    }
                    var valor = obj.value;
                    var x = valor.substring(0, valor.length - 1);
                    obj.value = demaskvalue(x, true).formatCurrency();
                    return false;
                }

//Executa o Formata Reais e faz o format currency novamente após o backspace

                FormataReais(obj, '.', ',', event);
            } // end reais


            function backspace(obj, event) {

//Essa função basicamente altera o backspace nos input com máscara reais para os navegadores IE e opera.
//O IE não detecta o keycode 8 no evento keypress, por isso, tratamos no keydown.
//Como o opera suporta o infame document.all, tratamos dele na mesma parte do código.


                var whichCode = (window.Event) ? event.which : event.keyCode;
                if (whichCode == 8 && documentall) {
                    var valor = obj.value;
                    var x = valor.substring(0, valor.length - 1);
                    var y = demaskvalue(x, true).formatCurrency();

                    obj.value = ""; //necessário para o opera
                    obj.value += y;

                    if (event.preventDefault) { //standart browsers
                        event.preventDefault();
                    } else { // internet explorer
                        event.returnValue = false;
                    }
                    return false;

                }// end if 
            }// end backspace

            function FormataReais(fld, milSep, decSep, e) {
                var sep = 0;
                var key = '';
                var i = j = 0;
                var len = len2 = 0;
                var strCheck = '0123456789';
                var aux = aux2 = '';
                var whichCode = (window.Event) ? e.which : e.keyCode;

//if (whichCode == 8 ) return true;
//backspace - estamos tratando disso em outra função no keydown
                if (whichCode == 0)
                    return true;
                if (whichCode == 9)
                    return true; //tecla tab
                if (whichCode == 13)
                    return true; //tecla enter
                if (whichCode == 16)
                    return true; //shift internet explorer
                if (whichCode == 17)
                    return true; //control no internet explorer
                if (whichCode == 27)
                    return true; //tecla esc
                if (whichCode == 34)
                    return true; //tecla end
                if (whichCode == 35)
                    return true;//tecla end
                if (whichCode == 36)
                    return true; //tecla home


//O trecho abaixo previne a ação padrão nos navegadores. Não estamos inserindo o caractere normalmente, mas via script


                if (e.preventDefault) { //standart browsers
                    e.preventDefault()
                } else { // internet explorer
                    e.returnValue = false
                }

                var key = String.fromCharCode(whichCode); // Valor para o código da Chave
                if (strCheck.indexOf(key) == -1)
                    return false; // Chave inválida


//Concatenamos ao value o keycode de key, se esse for um número

                fld.value += key;

                var len = fld.value.length;
                var bodeaux = demaskvalue(fld.value, true).formatCurrency();
                fld.value = bodeaux;


//Essa parte da função tão somente move o cursor para o final no opera. Atualmente não existe como movê-lo no konqueror.

                if (fld.createTextRange) {
                    var range = fld.createTextRange();
                    range.collapse(false);
                    range.select();
                } else if (fld.setSelectionRange) {
                    fld.focus();
                    var length = fld.value.length;
                    fld.setSelectionRange(length, length);
                }
                return false;

            }
            

        </script>
    </head>

    <body>
        <jsp:include page="menu.jsp"/>
        <c:choose>
            <c:when test = "${empty Altera}">
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
                                <option value="1">Audio Profissional</option>
                                <option value="2">Bateria & Percussão</option>
                                <option value="3">Cordas & Acessórios</option>
                                <option value="4">Pianos & Teclados</option>
                                <option value="5">Sopro</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="empresa" id="perfilLab">Empresa*</label>
                            <select class="form-control" name="empresa" id="perfilProduto">
                                <option value="1">Matriz - São Paulo</option>
                                <option value="2">Filial - Porto Alegre</option>
                                <option value="3">Filial - Recife</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="desc">Fornecedor*</label>
                            <select class="form-control" name="fornecedor" id="fornecedorproduto">
                                <c:forEach items="${ListaFornecedoresProd}" var="f">
                                    <option value="${f.getCodigo()}">
                                        <c:out value ="${f.getNome()}" />
                                    </option>
                                </c:forEach>
                            </select>
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
                            <input class="form-control" name="compra" id="compra" onkeypress="reais(this, event)" onkeydown="backspace(this, event)" />
                        </div>

                        <div class="form-group">
                            <label for="desc">Venda</label>
                            <input class="form-control"  name="venda" id="venda" onkeypress="reais(this, event)" onkeydown="backspace(this, event)"/>
                        </div>

                        <button type="submit" class="btn btn-default" id="botao">Cadastrar</button>
                        <label id="mensagem">(*)Campos Obrigatórios</label>
                        
                        <!--Variáveis vem do Servlet para verificação de campos -->
                        <c:if test="${not empty mensagemErroCampos}">
                        <label><c:out value="${mensagemErroCampos}"/></label>
                        </c:if>
                        <c:if test="${empty mensagemErroCampos}">
                        <label><c:out value="${mensagemErroCampos}"/></label>
                        </c:if>
                        <c:if test="${not empty produtoexiste}">
                        <label><c:out value="${produtoexiste}"/></label>
                        </c:if>
                        <c:if test="${empty produtoexiste}">
                        <label><c:out value="${produtoexiste}"/></label>
                        </c:if>
                        </form>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="container">
                    <h1 id="pro">Alteração de Produtos</h1>
                    <div class="well">
                        <form class="form-inline" action="${pageContext.request.contextPath}/alterarProduto" method="post">

                        <div class="form-group">
                            <label for="produto">Produto*</label>
                            <input type="text" class="form-control" name="prod" value="${pro.nome}" id="produto"/>
                        </div>

                        <div class="form-group">
                            <label for="desc">Descrição*</label>
                            <textarea class="form-control" rows="1" name="descProd" id="descricao">${pro.descricao}</textarea>
                        </div>
                            
                        <div class="form-group">
                            <label for="empresa">Categoria*</label>
                            <c:set var="categoria" value="${pro.getCategoria()}"/>
                            <select class="form-control" name="categ" id="categoria">
                                <c:if test="${categoria == 1}">
                                    <option value="1">Audio Profissional</option>
                                    <option value="2">Bateria & Percussão</option>
                                    <option value="3">Cordas & Acessórios</option>
                                    <option value="4">Pianos & Teclados</option>
                                    <option value="5">Sopro</option>
                                </c:if>
                                <c:if test="${categoria == 2}">
                                    <option value="2">Bateria & Percussão</option>
                                    <option value="1">Audio Profissional</option>
                                    <option value="3">Cordas & Acessórios</option>
                                    <option value="4">Pianos & Teclados</option>
                                    <option value="5">Sopro</option>
                                </c:if>
                                <c:if test="${categoria == 3}">
                                    <option value="3">Cordas & Acessórios</option>
                                    <option value="1">Audio Profissional</option>
                                    <option value="2">Bateria & Percussão</option>
                                    <option value="4">Pianos & Teclados</option>
                                    <option value="5">Sopro</option>
                                </c:if>
                                <c:if test="${categoria == 4}">
                                    <option value="4">Pianos & Teclados</option>
                                    <option value="1">Audio Profissional</option>
                                    <option value="2">Bateria & Percussão</option>
                                    <option value="3">Cordas & Acessórios</option>
                                    <option value="5">Sopro</option>
                                </c:if>
                                <c:if test="${categoria == 5}">
                                    <option value="5">Sopro</option>
                                    <option value="1">Audio Profissional</option>
                                    <option value="2">Bateria & Percussão</option>
                                    <option value="3">Cordas & Acessórios</option>
                                    <option value="4">Pianos & Teclados</option>
                                </c:if> 
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="empresa" id="perfilLab">Empresa*</label>
                            <c:set var="codigoempresa" value="${pro.getCodigoempresa()}"/>

                                <c:if test="${codigoempresa == 1}">
                                    <c:set var="nomeempresa" value="Matriz - São Paulo"/>
                                </c:if>
                                <c:if test="${codigoempresa == 2}">
                                    <c:set var="nomeempresa" value="Filial - Porto Alegre"/>
                                </c:if>
                                <c:if test="${codigoempresa == 3}">
                                    <c:set var="nomeempresa" value="Matriz - Recife"/>
                                </c:if>
                                
                                <label for="empresa" id="perfilCliLab">Empresa*</label>
                                <select class="form-control" name="empresa" id="perfilCli">
                                    <option><c:out value="${nomeempresa}"/></option>
                                </select>
                        </div>

                        <div class="form-group">
                            <label for="desc">Cod.Fornecedor*</label>
                            <select class="form-control" name="fornecedor" id="fornecedorproduto">
                                <c:set var="codigofornecedor" value="${pro.getCodigoFornecedor()}"/>
                                <c:forEach items="${ListaFornecedores}" var="f">
                                    <c:if test="${codigofornecedor eq f.getCodigo()}">
                                        <option value="${f.getCodigo()}">
                                        <c:out value ="${f.getNome()}" />
                                        </option>
                                    </c:if>
                                </c:forEach>
                                <c:forEach items="${ListaFornecedores}" var="f">
                                    <option value="${f.getCodigo()}">
                                        <c:out value ="${f.getNome()}" />
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="desc">Estoque*</label>
                            <input class="form-control" name="estoque" id="estoque" value="${pro.estoque}" onkeydown="javascript: fMasc(this, mNum)" maxlength="6"/>
                        </div>

                        <hr id="linha"> <!--Linha de separação-->                       

                        </br><div class="form-group" id="preco">
                            <label for="desc">Preços*</label>
                        </div></br>

                        <div class="form-group">
                            <label for="desc" id="labCom">Compra</label>
                            <input class="form-control" name="compra" id="compra" value="${pro.precocompra}" onkeypress="javascript: fMasc(this, mNum)" onkeydown="javascript: fMasc(this, mNum)" />
                        </div>

                        <div class="form-group">
                            <label for="desc">Venda</label>
                            <input class="form-control"  name="venda" id="venda" value="${pro.precovenda}" onkeypress="javascript: fMasc(this, mNum)" onkeydown="javascript: fMasc(this, mNum)"/>
                        </div>

                        <button type="submit" class="btn btn-default" id="botao">Salvar</button>
                        <label id="mensagem">(*)Campos Obrigatórios</label>
                        
                        <!--Variáveis vem do Servlet para verificação de campos -->
                        <c:if test="${not empty mensagemErroCampos}">
                        <label><c:out value="${mensagemErroCampos}"/></label>
                        </c:if>
                        <c:if test="${empty mensagemErroCampos}">
                        <label><c:out value="${mensagemErroCampos}"/></label>
                        </c:if>
                        <c:if test="${not empty produtoexiste}">
                        <label><c:out value="${produtoexiste}"/></label>
                        </c:if>
                        <c:if test="${empty produtoexiste}">
                        <label><c:out value="${produtoexiste}"/></label>
                        </c:if>
                        </form>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="footer">
            <jsp:include page="rodape.jsp"/>
        </div>

    </body>

</html>