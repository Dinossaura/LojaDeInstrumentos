<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <!-- Variável Altera é um Atributo vindo do Servlet de Alteração para possível alteração do jsp de cadastro -->
        <c:choose>
            <c:when test="${empty Altera}">
                <title>Cadastro de Clientes</title>
            </c:when>
            <c:otherwise>
                <title>Alteração de Clientes</title>
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
            function mCPF(cpf) {
                cpf = cpf.replace(/\D/g, "")
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2")
                return cpf
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

            function MM_formtCep(e, src, mask) {
                if (window.event) {
                    _TXT = e.keyCode;
                } else if (e.which) {
                    _TXT = e.which;
                }
                if (_TXT > 47 && _TXT < 58) {
                    var i = src.value.length;
                    var saida = mask.substring(0, 1);
                    var texto = mask.substring(i)
                    if (texto.substring(0, 1) != saida) {
                        src.value += texto.substring(0, 1);
                    }
                    return true;
                } else {
                    if (_TXT != 8) {
                        return false;
                    } else {
                        return true;
                    }
                }
            }
            function mRG(v) {
                v = v.replace(/\D/g, '');
                v = v.replace(/^(\d{2})(\d)/g, "$1.$2");
                v = v.replace(/(\d{3})(\d)/g, "$1.$2");
                v = v.replace(/(\d{3})(\d)/g, "$1-$2");
                return v;
            }

            function verifica() {
                if (document.forms[0].email.value.length == 0) {
                    alert('Por favor, informe o seu EMAIL.');
                    document.frmEnvia.email.focus();
                    return false;
                }
                return true;
            }

            function checarEmail() {
                if (document.forms[0].email.value == ""
                        || document.forms[0].email.value.indexOf('@') == -1
                        || document.forms[0].email.value.indexOf('.') == -1)
                {
                    alert("Por favor, informe um E-mail válido!");
                    return false;
                }
            }

            function checarTelefone1() {
                if (document.forms[0].tel1.value == ""
                        || document.forms[0].tel1.value.indexOf('-') == -1)
                {
                    alert("Por favor, informe um Telefone válido!");
                    return false;
                }
            }

            function checarTelefone2() {
                if (document.forms[0].tel2.value == ""
                        || document.forms[0].tel2.value.indexOf('-') == -1)
                {
                    alert("Por favor, informe um Telefone válido!");
                    return false;
                }
            }

            function checarRG() {
                if (document.forms[0].rg.value == ""
                        || document.forms[0].rg.value.indexOf('-') == -1)
                {
                    alert("Por favor, informe um RG válido!");
                    return false;
                }
            }

            function checarCPF() {
                if (document.forms[0].cpf.value == ""
                        || document.forms[0].cpf.value.indexOf('-') == -1)
                {
                    alert("Por favor, informe um CPF válido!");
                    return false;
                }
            }

            function checarCEP() {
                if (document.forms[0].cep.value == ""
                        || document.forms[0].cep.value.indexOf('-') == -1)
                {
                    alert("Por favor, informe um CEP válido!");
                    return false;
                }
            }

            function soLetras(v) {
                return v.replace(/\d/g, "") //Remove tudo o que não é Letra
            }



        </script>

        <link href="css/cadastroCliente.css" rel="stylesheet">
    </head>

    <body>
        <jsp:include page="menu.jsp"/>
        <c:choose>
            <c:when test = "${empty Altera}">
                <div class="container">
                    <h1 id="cli">Cadastro de Clientes</h1>
                    <div class="well">
                        <form class="form-inline" action="${pageContext.request.contextPath}/cadastrar-cliente" method="post">

                            <div class="form-group">
                                <form method="post" action="" onSubmit="return (verifica())" name="frmEnvia"/>
                                <label for="nome">Nome*</label>
                                <input type="text" class="form-control" name="name" id="nome" onblur="checarNome();" onkeydown="javascript: fMasc(this, soLetras);" >
                            </div>

                            <div class="form-group">
                                <label for="desc">Sobrenome*</label>
                                <input class="form-control" name="sobrenome" id="sobrenome" onkeydown="javascript: fMasc(this, soLetras);">
                            </div>                   

                            <div class="form-group">
                                <label for="perfil">Sexo*</label>
                                <select class="form-control" name="sexo" id="sexo">
                                    <option value="1">MASCULINO</option>
                                    <option value="2">FEMININO</option>

                                </select>
                            </div>     

                            <div class="form-group">
                                <label for="desc">Nascimento</label>
                                <input class="form-control" type="date" name="dataNasc" id="nasc">
                            </div>

                            <div class="form-group">
                                <form method="post" action="" onSubmit="return (verifica())" name="frmEnvia"/>
                                <label for="desc" id="cpf">CPF*</label>
                                <input class="form-control" type="text" name="cpf" id="cpf" onblur="checarCPF()();" onkeydown="javascript: fMasc(this, mCPF);" maxlength="14" placeholder="Ex 000.000.000-00">
                            </div>

                            <div class="form-group">
                                <form method="post" action="" onSubmit="return (verifica())" name="frmEnvia"/>
                                <label for="desc" id="rgl">RG*</label>
                                <input class="form-control" type="text" name="rg" id="rg" onblur="checarRG()();" onkeydown="javascript: fMasc(this, mRG);" maxlength="12" placeholder="Ex 00.000.000-0">
                            </div>

                            <div class="form-group">
                                <form method="post" action="" onSubmit="return (verifica())" name="frmEnvia"/>
                                <label for="desc" id="email">E-mail</label>
                                <input class="form-control" name="email" id="email" onblur="checarEmail();"  maxlength="60" placeholder="Ex exemplo@email.com">
                            </div>

                            <div class="form-group">
                                <form method="post" action="" onSubmit="return (verificaTel1())" name="frmEnvia"/>
                                <label for="desc" id="tel">Tel 1</label>
                                <input class="form-control" name="tel1" id="tel1" onblur="checarTelefone1();" onkeydown="javascript: fMasc(this, mTel);" maxlength="14" placeholder="Ex (00)0000-0000">
                            </div>

                            <div class="form-group">
                                <form method="post" action="" onSubmit="return (verificaTel2())" name="frmEnvia"/>
                                <label for="desc" id="tel2">Tel 2</label>
                                <input class="form-control" name="tel2" id="tel2" onblur="checarTelefone2();" onkeydown="javascript: fMasc(this, mTel);" maxlength="14" placeholder="Ex (00)00000-0000">
                            </div>

                            <div class="form-group">
                                <label for="desc" >End*</label>
                                <input class="form-control" name="endereco" id="endereco" onkeydown="javascript: fMasc(this, soLetras);">
                            </div>

                            <div class="form-group">
                                <label for="desc">Número*</label>
                                <input class="form-control" name="numCasa" id="numero" onkeydown="javascript: fMasc(this, mNum)" maxlength="6">
                            </div>

                            <div class="form-group">
                                <label for="desc">Complemento</label>
                                <input class="form-control" name="complemento" id="complemento" onkeydown="javascript: fMasc(this, soLetras);">
                            </div>

                            <div class="form-group" >
                                <label for="desc">CEP*</label>
                                <input class="form-control" name="cep" id="cep" onblur="checarCEP();" onkeypress="return MM_formtCep(event, this, '#####-###');" maxlength="9" placeholder="Ex 00000-000">
                            </div>

                            <div class="form-group">
                                <label for="desc">Cidade*</label>
                                <input class="form-control" name="cidade" id="cidade" onkeydown="javascript: fMasc(this, soLetras);">
                            </div>

                            <div class="form-group">
                                <label for="perfil">Estado*</label>
                                <select class="form-control" name="estados" id="estado">
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
                                <label for="empresa" id="perfilCliLab">Empresa*</label>
                                <select class="form-control" name="empresa" id="perfilCli">
                                    <option value="1">Matriz - São Paulo</option>
                                    <option value="2">Filial - Porto Alegre</option>
                                    <option value="3">Filial - Recife</option>
                                </select>
                            </div>
                            
                            <label id="mensagem">(*)Campos Obrigatórios</label>

                            <button type="submit" class="btn btn-default" name="submit" id="botaoSalvarCli">Cadastrar</button><br>

                        </form>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="container">
                    <h1 id="cli">Alteração de Clientes</h1>
                    <div class="well">
                        <form class="form-inline" action="${pageContext.request.contextPath}/alterarCliente" method="post">

                            <div class="form-group">
                                <label for="nome">Nome*</label>
                                <input type="text" class="form-control" value="${cli.nome}" name="nome" id="nome" onblur="checarNome();" onkeydown="javascript: fMasc(this, soLetras);">
                            </div>

                            <div class="form-group">
                                <label for="desc">Sobrenome*</label>
                                <input class="form-control" name="sobrenome" value="${cli.sobrenome}" id="sobrenome" onkeydown="javascript: fMasc(this, soLetras);">
                            </div>                   

                            <div class="form-group">
                                <label for="perfil">Sexo*</label>
                                <c:set var="sexo" value="${cli.getSexo()}"/>

                                <c:if test="${sexo == 'Masculino'}">
                                    <c:set var="sexo" value="Masculino"/>
                                </c:if>
                                <c:if test="${sexo == 'Feminino'}">
                                    <c:set var="sexo" value="Feminino"/>
                                </c:if>
                                <select class="form-control" name="sexo" id="sexo">
                                    <option><c:out value="${sexo}"/></option>
                                </select>
                            </div>     

                            <div class="form-group">
                                <label for="desc">Nascimento</label>
                                <input class="form-control" type="date" name="dataNasc" value="${cli.idade}" id="nasc">
                            </div>

                            <div class="form-group">
                                <label for="desc" id="cpf">CPF*</label>
                                <input class="form-control" type="text" name="cpf" value="${cli.cpf}" id="cpf" onblur="checarCPF()();" onkeydown="javascript: fMasc(this, mCPF);" maxlength="14" placeholder="Ex 000.000.000-00">
                            </div>

                            <div class="form-group">
                                <label for="desc" id="rgl">RG*</label>
                                <input class="form-control" type="text" name="rg" value="${cli.rg}" id="rg" onblur="checarRG()();" onkeydown="javascript: fMasc(this, mRG);" maxlength="12" placeholder="Ex 00.000.000-0">
                            </div>

                            <div class="form-group">
                                <label for="desc" id="email">E-mail</label>
                                <input class="form-control" name="email"  value="${cli.email}" id="email" onblur="checarEmail();"  maxlength="60" placeholder="Ex exemplo@email.com">
                            </div>

                            <div class="form-group">
                                <label for="desc" id="tel">Tel 1</label>
                                <input class="form-control" name="tel1" value="${cli.telefone}" id="tel1" onblur="checarTelefone1();" onkeydown="javascript: fMasc(this, mTel);" maxlength="14" placeholder="Ex (00)0000-0000">
                            </div>

                            <div class="form-group">
                                <label for="desc" id="tel2">Tel 2</label>
                                <input class="form-control" name="tel2" value="${cli.telefone2}" id="tel2" onblur="checarTelefone2();" onkeydown="javascript: fMasc(this, mTel);" maxlength="14" placeholder="Ex (00)00000-0000">
                            </div>

                            <div class="form-group">
                                <label for="desc" >End*</label>
                                <input class="form-control" name="endereco" value="${cli.endereco}" id="endereco" onkeydown="javascript: fMasc(this, soLetras);">
                            </div>

                            <div class="form-group">
                                <label for="desc">Número*</label>
                                <input class="form-control" name="numCasa" value="${cli.numero}" id="numero" onkeydown="javascript: fMasc(this, mNum)" maxlength="6">
                            </div>

                            <div class="form-group">
                                <label for="desc">Complemento</label>
                                <input class="form-control" name="complemento" value="${cli.complemento}" id="complemento">
                            </div>

                            <div class="form-group" >
                                <label for="desc">CEP*</label>
                                <input class="form-control" name="cep" value="${cli.cep}" id="cep" onblur="checarCEP();" onkeypress="return MM_formtCep(event, this, '#####-###');" maxlength="9" placeholder="Ex 00000-000">
                            </div>

                            <div class="form-group">
                                <label for="desc">Cidade*</label>
                                <input class="form-control" name="cidade" value="${cli.cidade}" id="cidade" onkeydown="javascript: fMasc(this, soLetras);">
                            </div>

                            <div class="form-group">
                                <label for="perfil">Estado*</label>
                                <select class="form-control" name="estados" id="estado">
                                    <option><c:out value="${cli.estado}"/></option>

                                </select>
                            </div>

                            <div class="form-group">
                                <c:set var="codigoempresa" value="${cli.getEmpresa()}"/>

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
                                
                                <label id="mensagem">(*)Campos Obrigatórios</label>
                            </div>

                            <button type="submit" class="btn btn-default">Salvar</button><br>
                            
                        </form>
                    </div>
                </div>        
            </c:otherwise>
        </c:choose>
        <jsp:include page="rodape.jsp"/>
    </body>

</html>