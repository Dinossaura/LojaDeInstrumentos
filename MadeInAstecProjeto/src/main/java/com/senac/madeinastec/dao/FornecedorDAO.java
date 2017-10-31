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
        String query = "insert into fornecedor (nome, codigoempresa) values (?, ?)";
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setString(1, fornecedor.getNome());
            preparedStatement.setInt(2, fornecedor.getCodigoempresa());
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println("Fornecedor inserido com sucesso.");
            
        } catch (SQLException ex) {
            System.out.println(ex);
            System.out.println("Erro ao salvar fornecedor");
        }
    }
    
    public Fornecedor atualizarFornecedor(Fornecedor fornecedor) throws Exception{
        System.out.println("Atualizando fornecedor...");
         String query = "UPDATE fornecedor SET nome=? WHERE codigo=?";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setString(1, fornecedor.getNome());
            preparedStatement.setInt(2, fornecedor.getCodigo());
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar produto");
            throw new Exception("Erro ao atualizar produto", ex);
        }

        return fornecedor;
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
                preparedStatement.setString(1,"%"+nome+"%");
                preparedStatement.setInt(2,codigoempresa);
            }else{
                preparedStatement.setInt(1,codigoempresa);
            }
            
            
            ResultSet rs = preparedStatement.executeQuery();

            
                while (rs.next()){
                    Fornecedor fornecedor = new Fornecedor();
                    fornecedor.setCodigo(rs.getInt(1));
                    fornecedor.setNome(rs.getString(2));
                    fornecedor.setCodigoempresa(rs.getInt(3));
                    lista.add(fornecedor);
                }

            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar produto"+ex);
        }        
        return lista;
    
    }
    
    //busca 1 fornecedor especificado por código
    public Fornecedor encontrarFornecedor(int codigo){//retorna um item
        Fornecedor fornecedor = new Fornecedor();
        System.out.println("Buscando produto na base de dados...");
        String query = "SELECT * FROM fornecedor WHERE codigo=?";//addicionar o % %
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1,codigo);
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                fornecedor.setCodigo(rs.getInt(1));
                fornecedor.setNome(rs.getString(2));
            }
            
            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar fornecedor"+ex);
        }        
        return fornecedor;
    
    }
    
        public void deletarfornecedor(int codigo) throws Exception{
            System.out.println("Deletando fornecedor codigo: "+codigo);
            String query = "DELETE FROM fornecedor WHERE codigo=?";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            
            preparedStatement.setInt(1, codigo);            
            preparedStatement.execute();
            
            System.out.println("Fornecedor deletado");
        } catch (SQLException ex) {
            throw new Exception("Erro ao deletar fornecedor", ex);
        }
    }
}
