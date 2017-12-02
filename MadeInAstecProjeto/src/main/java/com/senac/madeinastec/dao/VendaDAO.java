/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.dao;

import com.senac.madeinastec.model.Carrinho;
import com.senac.madeinastec.model.ItemCarrinho;
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
 * @author Uriel
 */
public class VendaDAO {
        ConexaoBanco conexaoBanco = new ConexaoBanco();    
        Connection conn = conexaoBanco.createConnection();
        
    public Integer cadastrarVenda(Venda venda){
                 String query = " insert into venda (codigocliente, datavenda, valortotal, codigoempresa)"
        + " values (?, ?, ?, ?)";
        
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, venda.getCliente());
            preparedStatement.setDate(2, (Date) venda.getData());
            preparedStatement.setDouble(3,venda.getValorTotal());
            preparedStatement.setInt(4,venda.getEmpresa());
            
            preparedStatement.executeUpdate();            
            ResultSet  rs = preparedStatement.getGeneratedKeys();
            rs.next();
            int codigo = rs.getInt(1);
            preparedStatement.close();

            return codigo;
        } catch (SQLException ex) {
            System.out.println("Erro ao salvar venda");
            return null;
        }
    }
    
     public List<Venda> listavendas(String codigoempresa, Date datainicial, Date datafinal) throws Exception{
         String query = "Select v.codigo as codigo, c.nome || ' ' || c.SOBRENOME as cliente, v.datavenda as datavenda,\n" +
                        "      v.valortotal as valortoal, e.nome as nomeempresa from venda v\n" +
                        "inner join clientes c on c.id = v.CODIGOCLIENTE \n" +
                        "inner join empresas e on e.CODIGO = v.CODIGOEMPRESA " +
                        " where datavenda between ? and ? ";
         
         List<Venda> listadevendas = new ArrayList<>();
         
         
         boolean vempresas = false;
         
         if ((codigoempresa.equals("1"))||(codigoempresa.equals("2"))||(codigoempresa.equals("3"))){
             vempresas = true;
             query = query + " and v.codigoempresa = ?";
         }
         
        try {
            PreparedStatement preparedStatement = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            
            if(!vempresas){
               preparedStatement.setDate(1, datainicial);
               preparedStatement.setDate(2, datafinal);
            }else{
               preparedStatement.setDate(1, datainicial);
               preparedStatement.setDate(2, datafinal);
               preparedStatement.setInt(3, Integer.parseInt(codigoempresa));
            }
            
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()){
                Venda venda = new Venda();
                
                venda.setCodigo(rs.getInt(1));
                venda.setNomecliente(rs.getString(2));
                venda.setData(rs.getDate(3));
                venda.setValorTotal(rs.getDouble(4));
                venda.setNomeempresa(rs.getString(5));
                listadevendas.add(venda);
            }
            
        } catch (SQLException ex) {
            throw new Exception("Erro ao listar carrinho", ex);
        }
          
        return listadevendas;
       
    }
}
