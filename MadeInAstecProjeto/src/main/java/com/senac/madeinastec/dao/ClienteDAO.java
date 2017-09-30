/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.dao;

import com.senac.madeinastec.model.Cliente;
import com.senac.madeinastec.utils.ConexaoBanco; 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author geoinformacao
 */
public class ClienteDAO {
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    
    Connection conn = conexaoBanco.createConnection();
    

    public void inserirCliente(Cliente cliente){
        
         String query = " insert into cliente (nome, sobrenome, sexo, cpf, rg, idade, telefone1, telefone2, email,"
                 + "bairro, cep, complemento, logradouro, numero, cidade, estado)"
        + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setString(1, cliente.getNome());
            preparedStatement.setString(2, cliente.getSobrenome());
            preparedStatement.setString(3, cliente.getSexo());
            preparedStatement.setString(4, cliente.getCpf());
            preparedStatement.setString(5, cliente.getRg());            
            preparedStatement.setString(6, cliente.getIdade());
            preparedStatement.setString(7, cliente.getTelefone1());
            preparedStatement.setString(8, cliente.getTelefone2());
            preparedStatement.setString(9, cliente.getEmail());
            preparedStatement.setString(10, cliente.getBairro());
            preparedStatement.setString(11, cliente.getCep());
            preparedStatement.setString(12, cliente.getComplemento());
            preparedStatement.setString(13, cliente.getLogradouro());
            preparedStatement.setString(14, cliente.getNumero());
            preparedStatement.setString(15, cliente.getCidade());
            preparedStatement.setString(16, cliente.getEstado());
            
           

        
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar cliente"+ex);
        }
    }
    
    public Cliente updateCliente(Cliente cliente) throws Exception{
        System.out.println("Iniciando processo de atualização de cliente...");
         String query = "UPDATE cliente SET nome=?, sobrenome=?, sexo=?, cpf=?, rg=?, idade=?, telefone1=?, telefone2=?, email=?, "
                 + "bairro=?,  cep=?, complemento=?, logradouro=?,  numero=?, cidade=?, estado=? WHERE idcliente=?";
        
        System.out.println(cliente.toString());
        try {
                PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
                preparedStatement.setString(1, cliente.getNome());
                System.out.println(cliente.getNome());
                preparedStatement.setString(2, cliente.getSobrenome());
                preparedStatement.setString(3, cliente.getSexo());
                preparedStatement.setString(4, cliente.getCpf());
                preparedStatement.setString(5, cliente.getRg());            
                preparedStatement.setString(6, cliente.getIdade());
                preparedStatement.setString(7, cliente.getTelefone1());
                preparedStatement.setString(8, cliente.getTelefone2());
                preparedStatement.setString(9, cliente.getEmail());
                preparedStatement.setString(10, cliente.getBairro());
                preparedStatement.setString(11, cliente.getCep());
                preparedStatement.setString(12, cliente.getComplemento());
                preparedStatement.setString(13, cliente.getLogradouro());
                preparedStatement.setString(14, cliente.getNumero());
                preparedStatement.setString(15, cliente.getCidade());
                preparedStatement.setString(16, cliente.getEstado());
                preparedStatement.setInt(17, cliente.getId());
                
                
                System.out.println("id: "+cliente.getId());
                
                preparedStatement.executeUpdate();
                preparedStatement.close();
        } catch (SQLException ex) {
            throw new Exception("Erro ao atualizar cliente!", ex);
        }

        
        return cliente;
    
    }
    
    public List<Cliente> listarCliente(String nome) throws Exception{
        System.out.println("Iniciando listagem de cliente...");
       
        List<Cliente> lista = new ArrayList<>();
        String query = "";
        if(nome == ""){
            query = "SELECT * FROM cliente";
        }else{
            query = "SELECT * FROM cliente WHERE nome LIKE ?";
        }
         

        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1,"%"+nome+"%");
         
            ResultSet rs = preparedStatement.executeQuery();
            
            System.out.println("Busca efetuada com sucesso");
            
            while (rs.next()){
                Cliente cliente = new Cliente();
                
                cliente.setId(rs.getInt(1));
                cliente.setNome(rs.getString(2));
                cliente.setSobrenome(rs.getString(3));
                cliente.setSexo(rs.getString(4));
                cliente.setCpf(rs.getString(5));
                cliente.setRg(rs.getString(6));            
                cliente.setIdade(rs.getString(7));                
                cliente.setTelefone1(rs.getString(8));
                cliente.setTelefone2(rs.getString(9));
                cliente.setEmail(rs.getString(10));
                cliente.setBairro(rs.getString(11));
                cliente.setCep(rs.getString(12));
                cliente.setComplemento(rs.getString(13));
                cliente.setLogradouro(rs.getString(14));
                cliente.setNumero(rs.getString(15));
                cliente.setCidade(rs.getString(16));
                cliente.setEstado(rs.getString(17));
                lista.add(cliente);
            }
            
        } catch (SQLException ex) {
            throw new Exception("Erro ao listar cliente", ex);
        }

        
        return lista;
    
    }
    
    public Cliente encontrarClientePorCpf(String cpf) throws Exception{
        System.out.println("Iniciando listagem de cliente...");
        
        Cliente cliente = new Cliente();
        String query = "SELECT * FROM cliente WHERE cpf=?";

        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1,cpf);
         
            ResultSet rs = preparedStatement.executeQuery();
            
            System.out.println("Busca efetuada com sucesso");
            
            while (rs.next()){
                cliente.setId(rs.getInt(1));
                cliente.setNome(rs.getString(2));
                cliente.setSobrenome(rs.getString(3));
                cliente.setSexo(rs.getString(4));
                cliente.setCpf(rs.getString(5));
                cliente.setRg(rs.getString(6));            
                cliente.setIdade(rs.getString(7));                
                cliente.setTelefone1(rs.getString(8));
                cliente.setTelefone2(rs.getString(9));
                cliente.setEmail(rs.getString(10));
                cliente.setBairro(rs.getString(11));
                cliente.setCep(rs.getString(12));
                cliente.setComplemento(rs.getString(13));
                cliente.setLogradouro(rs.getString(14));
                cliente.setNumero(rs.getString(15));
                cliente.setCidade(rs.getString(16));
                cliente.setEstado(rs.getString(17));
            }
            
        } catch (SQLException ex) {
            throw new Exception("Erro ao listar cliente", ex);
        }

        
        return cliente;
    }
    
    
    public void deletarCliente(String cpf) throws Exception{
        System.out.println("Deletando cliente de cpf: "+cpf);
        String query = "DELETE FROM cliente WHERE cpf=?";


    try {
        PreparedStatement preparedStatement = conn.prepareStatement(query);
        preparedStatement.setString(1, cpf);

        preparedStatement.execute();
        System.out.println("Cliente deletado");
    } catch (SQLException ex) {
        throw new Exception("Erro ao deletar o cliente", ex);
        
    }
    }
}
