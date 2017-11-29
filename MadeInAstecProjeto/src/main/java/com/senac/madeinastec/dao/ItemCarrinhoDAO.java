/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.dao;

import com.senac.madeinastec.model.ItemCarrinho;
import com.senac.madeinastec.model.Produto;
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
 * @author uriel.oliveira
 */
public class ItemCarrinhoDAO {
    
        ConexaoBanco conexaoBanco = new ConexaoBanco();    
        Connection conn = conexaoBanco.createConnection();
    
    //Cadastra item em determinado carrinho
    public void cadastrarItemCarrinho(int codigocarrinho, int codigoproduto, int quantidade){
                 String query = " insert into itemcarrinho (codigocarrinho, codigoproduto, quantidade )"
        + " values (?, ?, ?)";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, codigocarrinho);
            preparedStatement.setInt(2, codigoproduto);
            preparedStatement.setInt(3, quantidade);

            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar item no carrinho");
        }
    }
    
    //Deleta item de determinado carrinho
    public void deletarItensCarrinho(int codigocarrinho) throws Exception{
            System.out.println("Deletando carrinho codigo: "+codigocarrinho);
            String query = "DELETE FROM itemcarrinho WHERE codigocarrinho=?";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            
            preparedStatement.setInt(1, codigocarrinho);            
            preparedStatement.execute();
            
            System.out.println("ItemCarrinho deletado");
        } catch (SQLException ex) {
            throw new Exception("Erro ao deletar Item do carrinho", ex);
        }
    }
    
    //Deleta item de determinado carrinho
    public void deletarItemCarrinho(int codigocarrinho, int codigoitem) throws Exception{
            System.out.println("Deletando item codigo: "+codigoitem);
            String query = "DELETE FROM itemcarrinho WHERE codigocarrinho=? and codigo=?";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            
            preparedStatement.setInt(1, codigocarrinho); 
             preparedStatement.setInt(2, codigoitem); 
            preparedStatement.execute();
            
            System.out.println("ItemCarrinho deletado");
        } catch (SQLException ex) {
            throw new Exception("Erro ao deletar Item do carrinho", ex);
        }
    }
    
    //Lista itens de determinado Carrinho
    public List<ItemCarrinho> listarItensCarrinho(int codigocarrinho){ //retorna todos itens
        List<ItemCarrinho> lista = new ArrayList<>();
        System.out.println("Buscando produto na base de dados...");
        String query = "SELECT * FROM itemcarrinho WHERE codigocarrinho=?";
        Produto p = new Produto();
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setInt(1, codigocarrinho);
            
            ResultSet rs = preparedStatement.executeQuery();

            
                while (rs.next()){
                    ItemCarrinho itemcarrinho = new ItemCarrinho();
                    itemcarrinho.setCodigo(rs.getInt(1));
                    itemcarrinho.setCodigoCarrinho(rs.getInt(2));
                    itemcarrinho.setProduto(rs.getInt(3));
                    itemcarrinho.setQuantidade(rs.getInt(4));
                    lista.add(itemcarrinho);
                }

            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar Itens do Carrinho: "+ex);
        }        
        return lista;
    
    }
    
    
}
