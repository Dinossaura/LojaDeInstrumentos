package com.senac.madeinastec.dao;

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

public class UsuarioDAO {
        ConexaoBanco conexaoBanco = new ConexaoBanco();    
        Connection conn = conexaoBanco.createConnection();
        
    public void inserirProduto(Produto produto){
        System.out.println("Iniciando processo de inserção de produto...");
        String query = "insert into produto (codigo, titulo, desenvolvedor, fornecedor, categoria,plataforma, genero, classificacao, preco, estoque) values (?,?,?,?,?,?,?,?,?,?);";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setInt(1, produto.getCodigo());
            preparedStatement.setObject(2, produto.getCodigoempresa());
            preparedStatement.setString(3, produto.getNome());
            preparedStatement.setString(4, produto.getDescricao());
            preparedStatement.setObject(5, produto.getCategoria());
            preparedStatement.setObject(6, produto.getFornecedor());
            preparedStatement.setDouble(9, produto.getPrecovenda());
            preparedStatement.setDouble(9, produto.getPrecocompra());
            preparedStatement.setInt(10, produto.getEstoque());
            

        
            preparedStatement.executeUpdate();
            preparedStatement.close();
            System.out.println("Produto inserido com sucesso.");
            
        } catch (SQLException ex) {
            System.out.println(ex);
            System.out.println("Erro ao salvar produto");
        }
    }
    
    public Produto updateProduto(Produto produto) throws Exception{
        System.out.println("Atualizando produto...");
         String query = "UPDATE produto SET titulo=?, desenvolvedor=?, fornecedor=?, categoria=?, plataforma=?, genero=?, classificacao=?, preco=?, estoque=? WHERE codigo=?";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setInt(1, produto.getCodigo());
            preparedStatement.setObject(2, produto.getCodigoempresa());
            preparedStatement.setString(3, produto.getNome());
            preparedStatement.setString(4, produto.getDescricao());
            preparedStatement.setObject(5, produto.getCategoria());
            preparedStatement.setObject(6, produto.getFornecedor());
            preparedStatement.setDouble(9, produto.getPrecovenda());
            preparedStatement.setDouble(9, produto.getPrecocompra());
            preparedStatement.setInt(10, produto.getEstoque());
            
                preparedStatement.executeUpdate();
                preparedStatement.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar produto");
            throw new Exception("Erro ao atualizar produto", ex);
        }

        return produto;
    }
    
    public void atualizarEstoque(int codigo, int estoque) throws Exception{
        System.out.println("Atualizando produto...");
         String query = "UPDATE produto SET estoque=? WHERE codigo=?";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
          
            preparedStatement.setInt(1, estoque);
            preparedStatement.setInt(2, codigo);
            System.out.println("Estoque:"+estoque);
            
            preparedStatement.executeUpdate();
            preparedStatement.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao atualizar produto");
            throw new Exception("Erro ao atualizar produto", ex);
        }
    }
    
    
    public List<Produto> listarProduto(String titulo){ //retorna todos itens
        List<Produto> lista = new ArrayList<>();
        System.out.println("Buscando produto na base de dados...");
        String query = "";
        
        if(titulo == ""){
            query = "SELECT * FROM produto";
        }else{
            query = "SELECT * FROM produto WHERE titulo LIKE ?";
        }
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setString(1,"%"+titulo+"%");
            
            ResultSet rs = preparedStatement.executeQuery();

            
                while (rs.next()){
                    Produto produto = new Produto();
                    produto.setCodigo(rs.getInt(2));
                    produto.setEstoque(rs.getInt(11));
                    lista.add(produto);
                }

            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar produto"+ex);
        }        
        return lista;
    
    }
    
    public Produto encontrarProduto(int codigo){//retorna um item
        List<Produto> lista = new ArrayList<>();
        Produto produto = new Produto();
        System.out.println("Buscando produto na base de dados...");
        String query = "SELECT * FROM produto WHERE codigo=?";//addicionar o % %
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setInt(1,codigo);
            
                        
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){

                produto.setEstoque(rs.getInt(11));
                lista.add(produto);
            }
            
            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar produto"+ex);
        }        
        return produto;
    
    }
    
        public void deletarProduto(int codigo) throws Exception{
            System.out.println("Deletando produto de codigo: "+codigo);
            String query = "DELETE FROM produto WHERE codigo=?";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            
            preparedStatement.setInt(1, codigo);            
            preparedStatement.execute();
            
            System.out.println("Produto deletado");
        } catch (SQLException ex) {
            throw new Exception("Erro ao deletar produto", ex);
        }
    }
}
