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
                        <label for="nome">Nome*</label>
                        <input type="text" class="form-control" name="name" id="nome">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc">Sobrenome*</label>
                        <input class="form-control" name="sobrenome" id="sobrenome">
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
                        <label for="desc" id="cpf">CPF*</label>
                        <input class="form-control" type="text" name="cpf" id="cpf">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc" id="rgl">RG*</label>
                        <input class="form-control" type="text" name="rg" id="rg">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc" id="email">E-mail</label>
                        <input class="form-control" name="email" id="email">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc" id="tel">Tel 1</label>
                        <input class="form-control" name="tel1" id="tel1">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc" id="tel2">Tel 2</label>
                        <input class="form-control" name="tel2" id="tel2">
                    </div>
                                       
                    <div class="form-group">
                        <label for="desc" >End*</label>
                        <input class="form-control" name="endereco" id="endereco">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc">Número*</label>
                        <input class="form-control" name="numCasa" id="numero">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc">Complemento</label>
                        <input class="form-control" name="complemento" id="complemento">
                    </div>
                    
                    <div class="form-group" >
                        <label for="desc">CEP*</label>
                        <input class="form-control" name="cep" id="cep">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc">Cidade*</label>
                        <input class="form-control" name="cidade" id="cidade">
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
                        <label for="empresa">Perfil</label>
                        <select class="form-control" name="empresa" id="perfil">
                            <option value="1">Matriz - São Paulo</option>
                            <option value="2">Filial - Porto Alegre</option>
                            <option value="3">Filial - Recife</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-default">Cadastrar</button><br>
                    <label id="mensagem">(*)Campos Obrigatórios</label>

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
                        <input type="text" class="form-control" value="${cli.nome}" name="nome" id="nome">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc">Sobrenome*</label>
                        <input class="form-control" name="sobrenome" value="${cli.sobrenome}" id="sobrenome">
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
                        <input class="form-control" type="text" name="cpf" value="${cli.cpf}" id="cpf">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc" id="rgl">RG*</label>
                        <input class="form-control" type="text" name="rg" value="${cli.rg}" id="rg">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc" id="email">E-mail</label>
                        <input class="form-control" name="email"  value="${cli.email}" id="email">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc" id="tel">Tel 1</label>
                        <input class="form-control" name="tel1" value="${cli.telefone}" id="tel1">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc" id="tel2">Tel 2</label>
                        <input class="form-control" name="tel2" value="${cli.telefone2}" id="tel2">
                    </div>
                                       
                    <div class="form-group">
                        <label for="desc" >End*</label>
                        <input class="form-control" name="endereco" value="${cli.endereco}" id="endereco">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc">Número*</label>
                        <input class="form-control" name="numCasa" value="${cli.numero}" id="numero">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc">Complemento</label>
                        <input class="form-control" name="complemento" value="${cli.complemento}" id="complemento">
                    </div>
                    
                    <div class="form-group" >
                        <label for="desc">CEP*</label>
                        <input class="form-control" name="cep" value="${cli.cep}" id="cep">
                    </div>
                    
                    <div class="form-group">
                        <label for="desc">Cidade*</label>
                        <input class="form-control" name="cidade" value="${cli.cidade}" id="cidade">
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
                        <label for="empresa">Empresa*</label>
                        <select class="form-control" name="empresa" id="perfilFor">
                            <option><c:out value="${nomeempresa}"/></option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-default">Salvar</button><br>
                    <label id="mensagem">(*)Campos Obrigatórios</label>
                </form>
            </div>
        </div>        
            </c:otherwise>
        </c:choose>
            <jsp:include page="rodape.jsp"/>
    </body>

</html>