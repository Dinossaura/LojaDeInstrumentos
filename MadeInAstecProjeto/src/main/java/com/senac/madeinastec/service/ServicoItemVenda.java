/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.service;
import com.senac.madeinastec.dao.CarrinhoDAO;
import com.senac.madeinastec.dao.ItemCarrinhoDAO;
import com.senac.madeinastec.dao.ItemVendaDAO;
import com.senac.madeinastec.exceptions.CarrinhoException;
import com.senac.madeinastec.model.Carrinho;
import com.senac.madeinastec.model.validador.ValidadorCarrinho;
import com.senac.madeinastec.exceptions.DataSourceException;
import com.senac.madeinastec.exceptions.ItemCarrinhoException;
import com.senac.madeinastec.model.ItemCarrinho;
import com.senac.madeinastec.model.ItemVenda;
import java.util.List;
/**
 *
 * @author Magno
 */
public class ServicoItemVenda {
        ItemVendaDAO itemvendadao = new ItemVendaDAO();
    
       //Insere um Produto na fonte de dados Carrinho
    public void cadastraritemVenda(int codigovenda, int codigoproduto, int quantidade) throws CarrinhoException, DataSourceException, ItemCarrinhoException, Exception{

        try {
            itemvendadao.cadastrarItemVenda(codigovenda, codigoproduto, quantidade);
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }
    
    //Realiza a pesquisa e retorna todos os produtos da fonte de dados
    public List<ItemVenda> listarItensVenda(int codigovenda) throws DataSourceException, Exception {
        try {
            return itemvendadao.listarItemVenda(codigovenda);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
            
        }
    }
}
