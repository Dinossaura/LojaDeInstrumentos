<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .jumbotron {
                margin-bottom: 0;
            }
        </style>
        <title>Cadastro de Clientes</title>
    </head>

    <body>
        <div class="header">
            <div class="jumbotron">
                <div class="container text-center">
                    <h1>Made in Astec</h1>
                    <p>Sistema de Gerenciamento de Vendas</p>
                </div>
            </div>
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="#">Made in Astec </a>
                    </div>
                    <ul class="nav navbar-nav">
                        <li><a href="#">Clientes</a></li>
                        <li><a href="#">Produtos</a></li>
                        <li><a href="#">Vendas</a></li>
                        <li><a href="#">Relatórios</a></li>
                        <li><a href="#">Usuários</a></li>
                    </ul>
                </div>
        </div>
    </nav>
</div>
<div class="container">
    <h1>Cadastro de Clientes</h1>
    <div class="well">
        <form class="form-inline">
            <div class="form-group">
                <label for="nome">Nome: </label>
                <input type="text" class="form-control" id="name">
            </div>
            <div class="form-group">
                <label for="desc">Sobrenome:</label>
                <input class="form-control" id="sobrenome">
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
                <input class="form-control" type="date" id="dataNasc">
            </div><br><br>
            <div class="form-group">
                <label for="desc">CPF:</label>
                <input class="form-control" type="number" id="cpf"></textarea>
            </div>
            <div class="form-group">
                <label for="desc">RG:</label>
                <input class="form-control" type="number" id="rg">
            </div><br><br>
			<div class="form-group">
                <label for="desc">Telefone 1:</label>
		<input class="form-control" id="tel1">
            </div>
            <div class="form-group">
                <label for="desc">Telefone 2:</label>
		<input class="form-control" id="tel2">
            </div>
            <div class="form-group">
                <label for="desc">E-mail:</label>
                 <input class="form-control" id="email">
            </div>
			<div class="form-group">
                <label for="desc">Número:</label>
                 <input class="form-control" id="numCasa">
            </div>
			<div class="form-group">
                <label for="desc">Complemento:</label>
                 <input class="form-control" id="complemento">
            </div>
			<div class="form-group">
                <label for="desc">Cidade:</label>
                 <input class="form-control" id="cidade">
            </div>
			<div class="form-group">
                <label for="perfil">Estado</label>
                <select class="form-control" name="estados">
                    <option value="1">Acre</option>
                    <option value="2">Alagoas</option>
					<option value="3">Amapá</option>
					<option value="4">Amazonas</option>
					<option value="5">Bahia</option>
					<option value="6">Ceará</option>
					<option value="7">Distrito Federal</option>
					<option value="8">Espírito Santo</option>
					<option value="9">Goiás</option>
					<option value="10">Maranhão</option>
					<option value="11">Mato Grosso</option>
					<option value="12">Mato Grosso do Sul</option>
					<option value="13">Minas Gerais</option>
					<option value="14">Pará</option>
					<option value="15">Paraíba</option>
					<option value="16">Paraná</option>
					<option value="17">Pernambuco</option>
					<option value="18">Piauí</option>
					<option value="19">Rio de Janeiro</option>
					<option value="20">Rio Grande do Norte</option>
					<option value="21">Rio Gramnde do Sul</option>
					<option value="22">Rondonia</option>
					<option value="23">Rorâima</option>
					<option value="24">Santa Catarina</option>
					<option value="25">São Paulo</option>
					<option value="26">Sergipe</option>
					<option value="27">Tocantins</option>
                    
                </select>
            </div><br><br>
			
            <button type="submit" class="btn btn-default">Cadastrar</button> 
			
        </form>
    </div>



</div>
<div class="footer">
    <div class="jumbotron">
        <div class="container text-center">
            <p>Made in Astec 2017</p>
        </div>
    </div>
</div>

</body>

</html>