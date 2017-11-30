/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.dao;

import com.senac.madeinastec.model.ItemVenda;
import com.senac.madeinastec.model.Produto;
import com.senac.madeinastec.model.Venda;
import com.senac.madeinastec.utils.ConexaoBanco;
import java.sql.Connection;
import java.sql.Date;
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
public class ItemVendaDAO {
    
        ConexaoBanco conexaoBanco = new ConexaoBanco();    
        Connection conn = conexaoBanco.createConnection();
    
    //Cadastra um novo item na venda
    public void cadastrarItemVenda(int codigovenda, int codigoproduto, int quantidade){
                 String query = " insert into itemvenda (codigovenda, codigoproduto, quantidade )"
        + " values (?, ?, ?)";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, codigovenda);
            preparedStatement.setInt(2, codigoproduto);
            preparedStatement.setInt(3, quantidade);

            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar venda");
        }
    }
    
    //Lista itens de determinada venda
    public List<ItemVenda> listarItemVenda(int codigovenda){ //retorna todos itens
        List<ItemVenda> lista = new ArrayList<>();
        System.out.println("Buscando produto na base de dados...");
        String query = "SELECT * FROM itemvenda WHERE codigovenda=?";
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setString(1,"%"+codigovenda+"%");
            
            ResultSet rs = preparedStatement.executeQuery();

            
                while (rs.next()){
                    ItemVenda itemvenda = new ItemVenda();
                    itemvenda.setIditemvenda(rs.getInt(1));
                    itemvenda.setCodigoVenda(rs.getInt(2));
                    itemvenda.setCodigoProduto(rs.getInt(3));
                    itemvenda.setQuantidade(rs.getInt(4));
                    lista.add(itemvenda);
                }

            System.out.println("Busca efetuada com sucesso");
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar Itens da venda: "+ex);
        }        
        return lista;
    
    }
}
