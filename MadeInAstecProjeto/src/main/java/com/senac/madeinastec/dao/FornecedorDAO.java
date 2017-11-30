package com.senac.madeinastec.dao;

import com.senac.madeinastec.model.Fornecedor;
import com.senac.madeinastec.model.Produto;
import com.senac.madeinastec.utils.ConexaoBanco;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class FornecedorDAO {
        ConexaoBanco conexaoBanco = new ConexaoBanco();    
        Connection conn = conexaoBanco.createConnection();
        
    public void inserirFornecedor(Fornecedor fornecedor){
        System.out.println("Iniciando processo de inserção de fornecedor...");
        String query = "insert into fornecedor (nome, codigoempresa, endereco, numero, complemento, " +
                                              " cidade, estado, telefone) values (?, ?, ?, ?, ?, ?, ?, ?)";
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setString(1, fornecedor.getNome());
            preparedStatement.setInt(2, fornecedor.getCodigoempresa());
            preparedStatement.setString(3, fornecedor.getEndereco());
            preparedStatement.setString(4, fornecedor.getNumero());
            preparedStatement.setString(5, fornecedor.getComplemento());
            preparedStatement.setString(6, fornecedor.getCidade());
            preparedStatement.setString(7, fornecedor.getEstado());
            preparedStatement.setString(8, fornecedor.getTelefone());
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println("Fornecedor inserido com sucesso.");
            
        } catch (SQLException ex) {
            System.out.println(ex);
            System.out.println("Erro ao salvar fornecedor");
        }
    }
    
    public void atualizarFornecedor(String nome, String endereco, String numero, String complemento,
                                    String cidade, String estado, String telefone,
                                    int codigofornecedor, int codigoempresa) throws Exception{
        System.out.println("Atualizando fornecedor...");
         String query = "UPDATE fornecedor SET nome=?, endereco=?, numero=?,"
                 + "                           complemento=?, cidade=?, estado=?,"
                 + "                           telefone=?"
                 + "     WHERE codigo=? and codigoempresa=?";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setString(1, nome);
            preparedStatement.setString(2, endereco);
            preparedStatement.setString(3, numero);
            preparedStatement.setString(4, complemento);
            preparedStatement.setString(5, cidade);
            preparedStatement.setString(6, estado);
            preparedStatement.setString(7, telefone);
            preparedStatement.setInt(8, codigofornecedor);
            preparedStatement.setInt(9, codigoempresa);
             
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar fornecedor");
            throw new Exception("Erro ao atualizar fornecedor", ex);
        }
    }
    
    public ArrayList<Fornecedor> listarFornecedor(String nome, int codigoempresa){ //retorna todos itens
        ArrayList<Fornecedor> lista = new ArrayList<>();
        System.out.println("Buscando fornecedor na base de dados...");
        String query = "";
        
        //Variável vazio serve para verificar qual select deve ser usado
        boolean vazio = true;
        
        if(nome.length() == 0){
            vazio = true;
            query = "SELECT * FROM fornecedor WHERE codigoempresa = ?";
        }else{
            vazio = false;
            query = "SELECT * FROM fornecedor WHERE nome LIKE ? and codigoempresa = ?";
        }
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            if(vazio != true){
                preparedStatement.setString(1, nome+"%");
                preparedStatement.setInt(2,codigoempresa);
            }else{
                preparedStatement.setInt(1,codigoempresa);
            }
            
            
            ResultSet rs = preparedStatement.executeQuery();

            
                while (rs.next()){
                    Fornecedor fornecedor = new Fornecedor();
                    fornecedor.setCodigo(rs.getInt(1));
                    fornecedor.setNome(rs.getString(2));
                    fornecedor.setEndereco(rs.getString(3));
                    fornecedor.setNumero(rs.getString(4));
                    fornecedor.setComplemento(rs.getString(5));
                    fornecedor.setCidade(rs.getString(6));
                    fornecedor.setEstado(rs.getString(7));
                    fornecedor.setTelefone(rs.getString(8));
                    fornecedor.setCodigoempresa(rs.getInt(9));
                    lista.add(fornecedor);
                }

            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar produto"+ex);
        }        
        return lista;
    
    }
    
    //busca 1 fornecedor especificado por código
    public Fornecedor encontrarFornecedor(int codigo, int empresa){//retorna um item
        Fornecedor fornecedor = new Fornecedor();
        System.out.println("Buscando produto na base de dados...");
        String query = "SELECT * FROM fornecedor WHERE codigo=? and codigoempresa=?";//addicionar o % %
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1,codigo);
            preparedStatement.setInt(2,empresa);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                fornecedor.setCodigo(rs.getInt(1));
                fornecedor.setNome(rs.getString(2));
                fornecedor.setEndereco(rs.getString(3));
                fornecedor.setNumero(rs.getString(4));
                fornecedor.setComplemento(rs.getString(5));
                fornecedor.setCidade(rs.getString(6));
                fornecedor.setEstado(rs.getString(7));
                fornecedor.setTelefone(rs.getString(8));
                fornecedor.setCodigoempresa(rs.getInt(9));
            }
            
            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar fornecedor"+ex);
        }        
        return fornecedor;
    
    }
    
    //busca 1 fornecedor especificado por nome
    public boolean encontrarFornecedorNome(String nome, int empresa){//retorna um item
        Fornecedor fornecedor = new Fornecedor();
        System.out.println("Buscando produto na base de dados...");
        String query = "SELECT * FROM fornecedor WHERE nome=? and codigoempresa=?";//addicionar o % %
        boolean verifica = false;
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1,nome);
            preparedStatement.setInt(2,empresa);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                fornecedor.setCodigo(rs.getInt(1));
                fornecedor.setNome(rs.getString(2));
                fornecedor.setEndereco(rs.getString(3));
                fornecedor.setNumero(rs.getString(4));
                fornecedor.setComplemento(rs.getString(5));
                fornecedor.setCidade(rs.getString(6));
                fornecedor.setEstado(rs.getString(7));
                fornecedor.setTelefone(rs.getString(8));
                fornecedor.setCodigoempresa(rs.getInt(3));
                verifica = true;
            }
            
            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar fornecedor"+ex);
        }        
        return verifica;
    
    }
    
        public void deletarfornecedor(int codigo, int codigoempresa) throws Exception{
            System.out.println("Deletando fornecedor codigo: "+codigo);
            String query = "DELETE FROM fornecedor WHERE codigo=? and codigoempresa=?";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            
            preparedStatement.setInt(1, codigo); 
            preparedStatement.setInt(2, codigoempresa);
            preparedStatement.execute();
            
            System.out.println("Fornecedor deletado");
        } catch (SQLException ex) {
            throw new Exception("Erro ao deletar fornecedor", ex);
        }
    }
}
