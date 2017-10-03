/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.dao;

import com.senac.madeinastec.model.Carrinho;
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
public class CarrinhoDAO {
    ConexaoBanco conexaoBanco = new ConexaoBanco();
    Connection conn = conexaoBanco.createConnection();
    
    public Integer inserirCarrinho(Carrinho carrinho){
         String query = " insert into carrinho(codigocliente, datacarrinho, valortotal, codigoempresa)"
        + " values (?, ?, ?, ?)";
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            preparedStatement.setInt(1, carrinho.getCliente().getId());
            preparedStatement.setTimestamp(2, carrinho.getData());
            preparedStatement.setDouble(3, carrinho.getValorTotal());
            preparedStatement.setInt(4, carrinho.getCodigoempresa());
            
            preparedStatement.executeUpdate();

            ResultSet  rs = preparedStatement.getGeneratedKeys();
            rs.next();
            int codigo = rs.getInt(1);
            preparedStatement.close();

            return codigo;
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar carrinho"+ex);
            return null;
        }
    }
    
    //DAO Para deletar carrinho completo da página, o mesmo será acionado após pressionar botão 'Cancelar'
    public void deletarCarrinho(int codigo) throws Exception{
        String query = "DELETE FROM carrinho WHERE codigo=?";

    try {
        PreparedStatement preparedStatement = conn.prepareStatement(query);
        preparedStatement.setInt(1, codigo);

        preparedStatement.execute();
        System.out.println("Carrinho deletado");
    } catch (SQLException ex) {
        throw new Exception("Erro ao deletar o carrinho", ex);
        
    }
    }
}
