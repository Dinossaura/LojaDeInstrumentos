/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.dao;

import com.senac.madeinastec.dto.RelatorioDTO;
import com.senac.madeinastec.utils.ConexaoBanco;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author uriel.oliveira
 */
public class RelatorioDAO {
    public List<RelatorioDTO> gerarRelatorio(Date inicio, Date fim){ //retorna todos itens
        ConexaoBanco conexaoBanco = new ConexaoBanco();    
        Connection conn = conexaoBanco.createConnection();      
        List<RelatorioDTO> lista = new ArrayList<>();
        
        System.out.println("Buscando produto na base de dados...");
        String queryVendaItem = "SELECT concat(c.nome, ' ' ,c.sobrenome) as nome, c.cpf as cpf, "
                              + "v.codigo as CodigoVenda, v.valorTotal as ValorTotal, v.data as dataVenda, "
                              + "p.titulo as nomeProduto, p.preco as precoProduto, p.codigo as CodigoProduto, iv.quantidade as quantidade "
                              + "FROM venda v "
                              + "inner join itemvenda iv on v.codigo = iv.id_venda "
                              + "inner join cliente c on c.idcliente = v.idcliente "
                              + "inner join produto p on p.idproduto=iv.id_produto "
                              + "WHERE v.data between ? and ? "
                              + "order by CodigoVenda";       
            System.out.println("inicio: "+inicio+ " fim: "+fim);
        try {
            PreparedStatement ps = conn.prepareStatement(queryVendaItem);
            ps.setObject(1, inicio);
            ps.setObject(2, fim);

            ResultSet rs = ps.executeQuery();

                while (rs.next()){
                    RelatorioDTO relatorioDTO = new RelatorioDTO();
                    relatorioDTO.setNome(rs.getString(1));
                    relatorioDTO.setCpf(rs.getString(2));
                    relatorioDTO.setCodigoVenda(rs.getInt(3));
                    relatorioDTO.setValorTotal(rs.getDouble(4));
                    relatorioDTO.setData(rs.getDate(5));
                    relatorioDTO.setTitulo(rs.getString(6));
                    relatorioDTO.setPreco(rs.getDouble(7));
                    relatorioDTO.setCodigoProduto(rs.getInt(8));
                    relatorioDTO.setQuantidade(rs.getInt(9));
                    lista.add(relatorioDTO);
                    System.out.println(relatorioDTO.toString());
                }
                

            System.out.println("Busca efetuada com sucesso");
            return lista;
        } catch (SQLException ex) {
            System.out.println("Erro ao buscar produto"+ex);
        }        
        return lista;

    
    }
}
