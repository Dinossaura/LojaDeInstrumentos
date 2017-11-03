<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Alterar Cliente</title>
    </head>

    <body>
        <jsp:include page="menu.jsp"/>  
        <div class="container">
            <h1>Alterar Cliente</h1>
            <div class="well">
                <form class="form-inline" action="${pageContext.request.contextPath}/AtualizarClienteServlet" method="post">
                     <input type="hidden" name="idEscondido" value="${cliente.getId()}"/>
                    <div class="form-group">
                        <div class="form-group">
                            <label for="nome">Nome</label>
                            <input type="text" class="form-control" name="name" id="nome" value="${cliente.getNome()}">
                        </div>

                        <div class="form-group">
                            <label for="desc">Sobrenome</label>
                            <input class="form-control" name="sobrenome" id="sobrenome" value="${cliente.getSobrenome()}">
                        </div>                   

                        <div class="form-group">
                            <label for="perfil">Sexo</label>
                            <select class="form-control" name="sexo" id="sexo" value="${cliente.getSexo()}">
                                <option value="1">MASCULINO</option>
                                <option value="2">FEMININO</option>

                            </select>
                        </div>     

                        <div class="form-group">
                            <label for="desc">Nascimento</label>
                            <input class="form-control" type="date" name="dataNasc" id="nasc" value="${cliente.getIdade()}">
                        </div>

                        <div class="form-group">
                            <label for="desc" id="cpf">CPF</label>
                            <input class="form-control" type="text" name="cpf" id="cpf" value="${cliente.getCpf()}">
                        </div>

                        <div class="form-group">
                            <label for="desc">RG</label>
                            <input class="form-control" type="text" name="rg" id="rg" value="${cliente.getRg()}">
                        </div>

                        <div class="form-group">
                            <label for="desc" id="email">E-mail</label>
                            <input class="form-control" name="email" id="email" value="${cliente.getEmail()}">
                        </div>

                        <div class="form-group">
                            <label for="desc" id="tel">Tel 1</label>
                            <input class="form-control" name="tel1" id="tel1" value="${cliente.getTelefone()}">
                        </div>

                        <div class="form-group">
                            <label for="desc" id="tel2">Tel 2</label>
                            <input class="form-control" name="tel2" id="tel2" value="${cliente.getTelefone2()}">
                        </div>

                        <div class="form-group">
                            <label for="desc" >Endereço</label>
                            <input class="form-control" name="endereco" id="endereco" value="${cliente.getEndereco()}">
                        </div>

                        <div class="form-group">
                            <label for="desc">Número</label>
                            <input class="form-control" name="numCasa" id="numero" value="${cliente.getNumero()}">
                        </div>

                        <div class="form-group">
                            <label for="desc">Complemento</label>
                            <input class="form-control" name="complemento" id="complemento" value="${cliente.getComplemento()}">
                        </div>

                        <div class="form-group" >
                            <label for="desc">CEP</label>
                            <input class="form-control" name="cep" id="cep" value="${cliente.getCep()}">
                        </div>

                        <div class="form-group">
                            <label for="desc">Cidade</label>
                            <input class="form-control" name="cidade" id="cidade" value="${cliente.getCidade()}">
                        </div>

                        <div class="form-group">
                            <label for="perfil">Estado</label>
                            <select class="form-control" name="estados" id="estado" value="${cliente.getEstado()}">
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
                        <button type="submit" class="btn btn-default" >Atualizar</button>

                </form>
            </div>

        </div>
        <jsp:include page="rodape.jsp"/>
    </body>

</html>