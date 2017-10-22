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
            <form class="form-inline">
                <div class="form-group">
                    <label for="nome">Nome: </label>
                    <input type="text" class="form-control" id="editName">
                </div>
                <div class="form-group">
                    <label for="desc">Sobrenome:</label>
                    <textarea class="form-control" rows="1" id="editSobrenome"></textarea>
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
                    <input class="form-control" type="date" id="editDataNasc">
                </div><br><br>
                <div class="form-group">
                    <label for="desc">CPF:</label>
                    <input class="form-control" id="editCpf"></textarea>
                </div>
                <div class="form-group">
                    <label for="desc">RG:</label>
                    <input class="form-control" type="editNumber" id="rg">
                </div><br><br>
		<div class="form-group">
                    <label for="desc">Telefone:</label>
                    <input class="form-control" id="editTel">
                </div>
                <div class="form-group">
                    <label for="desc">E-mail:</label>
                    <input class="form-control" id="editEmail">
                </div>
		<div class="form-group">
                    <label for="desc">Número:</label>
                    <input class="form-control" id="editNumCasa">
                </div>
		<div class="form-group">
                    <label for="desc">Complemento:</label>
                    <input class="form-control" id="edit]Complemento">
                </div>
		<div class="form-group">
                    <label for="desc">Cidade:</label>
                    <input class="form-control" id="editCidade">
            </div>
			<div class="form-group">
                <label for="perfil">Estado</label>
                <select class="form-control" name="editEstados">
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
			
            <button type="submit" class="btn btn-default">Atualizar</button>
			
        </form>
    </div>

    </div>
    <jsp:include page="rodape.jsp"/>
</body>

</html>