/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.dao;

import com.senac.madeinastec.model.ItemVenda;
import com.senac.madeinastec.model.Venda;
import com.senac.madeinastec.utils.ConexaoBanco;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author uriel.oliveira
 */
public class ItemVendaDAO {
    
        ConexaoBanco conexaoBanco = new ConexaoBanco();    
        Connection conn = conexaoBanco.createConnection();
    
    public void cadastrarItemVenda(ItemVenda itemVenda,int codigo){
                 String query = " insert into itemvenda (id_venda, id_produto, quantidade )"
        + " values (?, ?, ?)";
        
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setObject(1, codigo);
            preparedStatement.setInt(2, itemVenda.getProduto().getId());
            preparedStatement.setInt(3, itemVenda.getQuantidade());


        
            preparedStatement.execute();
            preparedStatement.close();
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar venda");
        }
    }
}
