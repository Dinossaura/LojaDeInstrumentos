<%@page import="com.senac.madeinastec.model.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <c:choose>
            <c:when test = "${empty Altera}">
                <title>Cadastro de Fornecedores</title>
            </c:when>
            <c:otherwise>
                <title>Alteração de Fornecedores</title>   
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
            function mTel(tel) {
                tel = tel.replace(/\D/g, "")
                tel = tel.replace(/^(\d)/, "($1")
                tel = tel.replace(/(.{3})(\d)/, "$1)$2")
                if (tel.length == 9) {
                    tel = tel.replace(/(.{1})$/, "-$1")
                } else if (tel.length == 10) {
                    tel = tel.replace(/(.{2})$/, "-$1")
                } else if (tel.length == 11) {
                    tel = tel.replace(/(.{3})$/, "-$1")
                } else if (tel.length == 12) {
                    tel = tel.replace(/(.{4})$/, "-$1")
                } else if (tel.length > 12) {
                    tel = tel.replace(/(.{4})$/, "-$1")
                }
                return tel;
            }
            function mNum(num) {
                num = num.replace(/\D/g, "")
                return num
            }
            function checarTelefone() {
                if (document.forms[0].telefone.value == ""
                        || document.forms[0].telefone.value.indexOf('-') == -1)
                {
                    alert("Por favor, informe um Telefone válido!");
                    return false;
                }
            }
            
        </script>
        <link href="css/cadastroFornecedor.css" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="menu.jsp"/>
        
        <c:choose>
            <c:when test = "${empty Altera}">
            <div class="container">
                <h1 id="for">Cadastro de Fornecedores</h1>
            <div class="well">
            </c:when>
            <c:otherwise>
            <div class="container">
                <h1 id="for">Alteração de Fornecedores</h1>
            <div class="well"> 
            </c:otherwise>
        </c:choose>
        
            <c:choose>
                <c:when test = "${empty Altera}">
                <form class="form-inline" action="${pageContext.request.contextPath}/cadastro-fornecedor" method="post">
                </c:when>
                <c:otherwise>
                <form class="form-inline" action="${pageContext.request.contextPath}/alterarfornecedor" method="post">
                </c:otherwise>
            </c:choose>
            
        <div class="form-group">
            <c:choose>
                <c:when test = "${empty Altera}">
                    <label for="fornecedor">Fornecedor*</label>
                    <input type="text" name="fornecedor" class="form-control" id="fornecedor"> 
                </c:when>
                <c:otherwise>
                    <label for="fornecedor">Fornecedor*</label>
                    <input type="text" name="fornecedor" class="form-control" value="${for.nome}" id="fornecedor"> 
                </c:otherwise>
            </c:choose>
        </div>
        <div class="form-group">
            
            <c:choose>
                <c:when test = "${not empty Altera}">
                    <c:set var="codigoempresa" value="${for.getCodigoempresa()}"/>
                    <c:if test="${codigoempresa == 1}">
                        <c:set var="nomeempresa" value="Matriz - São Paulo"/>
                    </c:if>
                    <c:if test="${codigoempresa == 2}">
                        <c:set var="nomeempresa" value="Filial - Porto Alegre"/>
                    </c:if>
                    <c:if test="${codigoempresa == 3}">
                        <c:set var="nomeempresa" value="Matriz - Recife"/>
                    </c:if>
                    <label for="empresa">Empresa*</label>
                    <select class="form-control" name="empresa" id="perfilFor">
                        <option><c:out value="${nomeempresa}"/></option>
                    </select>
                </c:when>
                <c:otherwise>
                    <label for="empresa">Empresa*</label>
                    <select class="form-control" name="empresa" id="perfilFor">
                        <option value="1">Matriz - São Paulo</option>
                        <option value="2">Filial - Porto Alegre</option>
                        <option value="3">Filial - Recife</option>
                    </select>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="form-group">
            <c:choose>
                <c:when test="${not empty Altera}">
                   <div class="form-group">
                        <label for="endereco">Endereço*</label>
                        <input type="text" name="endereco" class="form-control" value="${for.endereco}" id="endereco">
                   </div>
                   <div class="form-group">
                        <label for="numero">Número*</label>
                        <input type="text" name="numero" class="form-control" value="${for.numero}" id="numero" onkeydown="javascript: fMasc(this, mNum)" maxlength="6">
                   </div>
                   <div class="form-group">
                        <label for="complemento">Complemento</label>
                        <input type="text" name="complemento" class="form-control" value="${for.complemento}" id="complemento">
                   </div>
                   <div class="form-group">
                        <label for="cidade">Cidade*</label>
                        <input type="text" name="cidade" class="form-control" value="${for.cidade}" id="cidade">
                   </div>
                   <div class="form-group"> 
                        <label for="estado">Estado*</label>
                        <select class="form-control" name="estados" id="estados">
                            <option value="${for.estado}"><c:out value="${for.estado}" /></option>
                        </select>
                   </div>
                   <div class="form-group">
                        <label for="telefone">Telefone</label>
                        <input type="text" name="telefone" class="form-control" value="${for.telefone}" id="telefone" onblur="checarTelefone();" onkeydown="javascript: fMasc(this, mTel);" maxlength="14" placeholder="Ex (00)0000-0000">
                   </div>
                </c:when>
                <c:otherwise>
                    <div class="form-group">
                        <label for="endereco">Endereço*</label>
                        <input type="text" name="endereco" class="form-control" id="endereco">
                   </div>
                   <div class="form-group">
                        <label for="numero">Número*</label>
                        <input type="text" name="numero" class="form-control" id="numero" onkeydown="javascript: fMasc(this, mNum)" maxlength="6">
                   </div>
                   <div class="form-group">
                        <label for="complemento">Complemento</label>
                        <input type="text" name="complemento" class="form-control" id="complemento">
                   </div>
                   <div class="form-group">
                        <label for="cidade">Cidade*</label>
                        <input type="text" name="cidade" class="form-control" id="cidade">
                   </div>
                   <div class="form-group"> 
                        <label for="estado">Estado*</label>
                        <select class="form-control" name="estados" id="estados">
                            <option value="AC">Acre</option>
                            <option value="AL">Alagoas</option>
                            <option value="AP">Amapá</option>
                            <option value="AM">Amazonas</option>
                            <option value="BA">Bahia</option>
                            <option value="CE">Ceará</option>
                            <option value="DF">Distrito Federal</option>
                            <option value="ES">Espírito Santo</option>
                            <option value="GO">Goiás</option>
                            <option value="MA">Maranhão</option>
                            <option value="MT">Mato Grosso</option>
                            <option value="MS">Mato Grosso do Sul</option>
                            <option value="MG">Minas Gerais</option>
                            <option value="PA">Pará</option>
                            <option value="PB">Paraíba</option>
                            <option value="PR">Paraná</option>
                            <option value="PE">Pernambuco</option>
                            <option value="PI">Piauí</option>
                            <option value="RJ">Rio de Janeiro</option>
                            <option value="RN">Rio Grande do Norte</option>
                            <option value="RS">Rio Gramnde do Sul</option>
                            <option value="RO">Rondonia</option>
                            <option value="RR">Rorâima</option>
                            <option value="SC">Santa Catarina</option>
                            <option value="SP">São Paulo</option>
                            <option value="SG">Sergipe</option>
                            <option value="TO">Tocantins</option>
                        </select>
                   </div>
                   <div class="form-group">
                        <label for="estado">Telefone</label>
                        <input type="text" name="telefone" class="form-control" id="telefone" onblur="checarTelefone();" onkeydown="javascript: fMasc(this, mTel);" maxlength="14" placeholder="Ex (00)0000-0000">
                   </div>
                </c:otherwise>
            </c:choose>
        </div>
        
        <button type="submit" class="btn btn-default" id="botaoForn">Salvar</button>
        <div class="form-group">
            <label id="mensagem">(*)Campos Obrigatórios</label>
        </div>
        
        <!--Variáveis vem do Servlet para verificação de campos -->
        <c:if test="${not empty mensagemErroCampos}">
            <label><c:out value="${mensagemErroCampos}"/></label>
        </c:if>
        <c:if test="${empty mensagemErroCampos}">
            <label><c:out value="${mensagemErroCampos}"/></label>
        </c:if>
        <c:if test="${not empty fornecedorexiste}">
            <label><c:out value="${fornecedorexiste}"/></label>
        </c:if>
        <c:if test="${empty fornecedorexiste}">
            <label><c:out value="${fornecedorexiste}"/></label>
        </c:if>
        </form>
        </div>
        </div>
        <jsp:include page="rodape.jsp"/>
    </body>
</html>
