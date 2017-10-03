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
    public void cadastrarItemCarrinho(ItemCarrinho itemcarrinho, int codigo){
                 String query = " insert into itemcarrinho (codigocarrinho, codigoproduto, quantidade )"
        + " values (?, ?, ?)";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, codigo);
            preparedStatement.setInt(2, itemcarrinho.getProduto());
            preparedStatement.setInt(3, itemcarrinho.getQuantidade());

            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar carrinho");
        }
    }
    
    //Deleta item de determinado carrinho
    public void deletarItemCarrinho(int codigo) throws Exception{
            System.out.println("Deletando itemCarrinho codigo: "+codigo);
            String query = "DELETE FROM itemcarrinho WHERE codigo=?";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            
            preparedStatement.setInt(1, codigo);            
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
            
            preparedStatement.setString(1,"%"+codigocarrinho+"%");
            
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
