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
        
         String query = " insert into clientes (nome, sobrenome, sexo, cpf, rg, idade, telefone, telefone2, email,"
                 + "endereco, numero, complemento, cep, cidade, estado, codigoempresa)"
        + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setString(1, cliente.getNome());
            preparedStatement.setString(2, cliente.getSobrenome());
            preparedStatement.setString(3, cliente.getSexo());
            preparedStatement.setString(4, cliente.getCpf());
            preparedStatement.setString(5, cliente.getRg());            
            preparedStatement.setInt(6, Integer.parseInt(cliente.getIdade()));
            preparedStatement.setString(7, cliente.getTelefone());
            preparedStatement.setString(8, cliente.getTelefone2());
            preparedStatement.setString(9, cliente.getEmail());
            preparedStatement.setString(10, cliente.getEndereco());
            preparedStatement.setString(11, cliente.getNumero());
            preparedStatement.setString(12, cliente.getComplemento());
            preparedStatement.setString(13, cliente.getCep());
            preparedStatement.setString(14, cliente.getCidade());
            preparedStatement.setString(15, cliente.getEstado());
            preparedStatement.setInt(16, cliente.getEmpresa());
        
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar cliente"+ex);
        }
    }
    
    public Cliente updateCliente(Cliente cliente) throws Exception{
        System.out.println("Iniciando processo de atualização de cliente...");
         String query = "UPDATE cliente SET nome=?, sobrenome=?, sexo=?, cpf=?, rg=?, idade=?, telefone=?, telefone2=?, email=?, "
                 + "endereco=?,  numero=?, complemento=?, cidade=?,  estado=?, codigoempresa=?, cep=? WHERE idcliente=?";
        
        System.out.println(cliente.toString());
        try {
                PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
                preparedStatement.setString(1, cliente.getNome());
                preparedStatement.setString(2, cliente.getSobrenome());
                preparedStatement.setString(3, cliente.getSexo());
                preparedStatement.setString(4, cliente.getCpf());
                preparedStatement.setString(5, cliente.getRg());            
                preparedStatement.setString(6, cliente.getIdade());
                preparedStatement.setString(7, cliente.getTelefone());
                preparedStatement.setString(8, cliente.getTelefone2());
                preparedStatement.setString(9, cliente.getEmail());
                preparedStatement.setString(10, cliente.getEndereco());
                preparedStatement.setString(11, cliente.getNumero());
                preparedStatement.setString(12, cliente.getComplemento());
                preparedStatement.setString(13, cliente.getCidade());
                preparedStatement.setString(14, cliente.getEstado());
                preparedStatement.setInt(15, cliente.getEmpresa());
                preparedStatement.setString(16, cliente.getCep());
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
            query = "SELECT * FROM clientes";
        }else{
            query = "SELECT * FROM clientes WHERE nome LIKE ?";
        }
         

        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
//            preparedStatement.setString(1,"%"+nome+"%");
         
            ResultSet rs = preparedStatement.executeQuery();
            
            System.out.println("Busca efetuada com sucesso");
            
            while (rs.next()){
                Cliente cliente = new Cliente();
                
                cliente.setId(rs.getInt("id"));
                cliente.setNome(rs.getString("nome"));
                cliente.setSobrenome(rs.getString("sobrenome"));
                cliente.setSexo(rs.getString("sexo"));
                cliente.setCpf(rs.getString("cpf"));
                cliente.setRg(rs.getString("rg"));            
                cliente.setIdade(rs.getString("idade"));                
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setTelefone2(rs.getString("telefone2"));
                cliente.setEmail(rs.getString("email"));
                cliente.setEndereco(rs.getString("endereco"));
                cliente.setNumero(rs.getString("numero"));
                cliente.setComplemento(rs.getString("complemento"));
                cliente.setCidade(rs.getString("cidade"));
                cliente.setEstado(rs.getString("estado"));
                cliente.setEmpresa(rs.getInt("codigoempresa"));
                cliente.setCep(rs.getString("cep"));
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
        String query = "SELECT * FROM clientes WHERE cpf=?";

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
                cliente.setTelefone(rs.getString(8));
                cliente.setTelefone2(rs.getString(9));
                cliente.setEmail(rs.getString(10));
                cliente.setEndereco(rs.getString(11));
                cliente.setNumero(rs.getString(12));
                cliente.setComplemento(rs.getString(13));
                cliente.setCidade(rs.getString(14));
                cliente.setEstado(rs.getString(15));
                cliente.setEmpresa(rs.getInt(16));
                cliente.setCep(rs.getString(17));
            }
            
        } catch (SQLException ex) {
            throw new Exception("Erro ao listar cliente", ex);
        }

        
        return cliente;
    }
    
    
    public void deletarCliente(String cpf) throws Exception{
        System.out.println("Deletando clientes de cpf: "+cpf);
        String query = "DELETE FROM clientes WHERE cpf=?";


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
