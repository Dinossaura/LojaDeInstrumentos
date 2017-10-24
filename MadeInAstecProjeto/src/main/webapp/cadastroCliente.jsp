<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro de Clientes</title>
    </head>

    <body>
        <jsp:include page="menu.jsp"/>
        <div class="container">
            <h1>Cadastro de Clientes</h1>
            <div class="well">
                <form class="form-inline" action="${pageContext.request.contextPath}/cadastrar-cliente" method="post">
                    <div class="form-group">
                        <label for="nome">Nome: </label>
                        <input type="text" class="form-control" name="name">
                    </div>
                    <div class="form-group">
                        <label for="desc">Sobrenome:</label>
                        <input class="form-control" name="sobrenome">
                    </div>
                    <div class="form-group">
                        <label for="perfil">Perfil</label>
                        <select class="form-control" name="sexo">
                            <option value="1">MASCULINO</option>
                            <option value="2">FEMININO</option>

                        </select>
                    </div>
                    <div class="form-group">
                        <label for="desc">Data Nascimento:</label>
                        <input class="form-control" type="date" name="dataNasc">
                    </div><br><br>
                    <div class="form-group">
                        <label for="desc">CPF:</label>
                        <input class="form-control" type="text" name="cpf"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="desc">RG:</label>
                        <input class="form-control" type="text" name="rg">
                    </div><br><br>
                    <div class="form-group">
                        <label for="desc">Telefone 1:</label>
                        <input class="form-control" name="tel1">
                    </div>
                    <div class="form-group">
                        <label for="desc">Telefone 2:</label>
                        <input class="form-control" name="tel2">
                    </div>
                    <div class="form-group">
                        <label for="desc">E-mail:</label>
                        <input class="form-control" name="email">
                    </div>
                    <div class="form-group">
                        <label for="desc">Número:</label>
                        <input class="form-control" name="numCasa">
                    </div>
                    <div class="form-group">
                        <label for="desc">Complemento:</label>
                        <input class="form-control" name="complemento">
                    </div>
                    <div class="form-group" >
                        <label for="desc">Endereço:</label>
                        <input class="form-control" name="endereco">
                    </div>
                    <div class="form-group" >
                        <label for="desc">CEP:</label>
                        <input class="form-control" name="cep">
                    </div>
                    <div class="form-group">
                        <label for="desc">Cidade:</label>
                        <input class="form-control" name="cidade">
                    </div>
                    <div class="form-group">
                        <label for="perfil">Estado</label>
                        <select class="form-control" name="estados">
                            <option value="Ac">Acre</option>
                            <option value="Al">Alagoas</option>
                            <option value="Ap">Amapá</option>
                            <option value="Am">Amazonas</option>
                            <option value="Ba">Bahia</option>
                            <option value="Ce">Ceará</option>
                            <option value="Df">Distrito Federal</option>
                            <option value="Es">Espírito Santo</option>
                            <option value="Go">Goiás</option>
                            <option value="Ma">Maranhão</option>
                            <option value="Mt">Mato Grosso</option>
                            <option value="Ms">Mato Grosso do Sul</option>
                            <option value="Mg">Minas Gerais</option>
                            <option value="Pa">Pará</option>
                            <option value="Pb">Paraíba</option>
                            <option value="Pr">Paraná</option>
                            <option value="Pe">Pernambuco</option>
                            <option value="Pi">Piauí</option>
                            <option value="Rj">Rio de Janeiro</option>
                            <option value="Rn">Rio Grande do Norte</option>
                            <option value="Rs">Rio Gramnde do Sul</option>
                            <option value="Ro">Rondonia</option>
                            <option value="Rr">Rorâima</option>
                            <option value="Sc">Santa Catarina</option>
                            <option value="Sp">São Paulo</option>
                            <option value="Sg">Sergipe</option>
                            <option value="To">Tocantins</option>

                        </select>
                    </div><br><br>

                    <div class="form-group">
                        <label for="empresa">Perfil</label>
                        <select class="form-control" name="empresa">
                            <option value="1">Matriz - São Paulo</option>
                            <option value="2">Filial - Porto Alegre</option>
                            <option value="3">Filial - Recife</option>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-default">Cadastrar</button> 

                </form>
            </div>
            <jsp:include page="rodape.jsp"/>
    </body>

</html>