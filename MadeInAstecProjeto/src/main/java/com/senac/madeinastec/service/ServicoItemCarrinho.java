/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.service;
import com.senac.madeinastec.dao.CarrinhoDAO;
import com.senac.madeinastec.dao.ItemCarrinhoDAO;
import com.senac.madeinastec.exceptions.CarrinhoException;
import com.senac.madeinastec.model.Carrinho;
import com.senac.madeinastec.model.validador.ValidadorCarrinho;
import com.senac.madeinastec.exceptions.DataSourceException;
import com.senac.madeinastec.exceptions.ItemCarrinhoException;
import com.senac.madeinastec.model.ItemCarrinho;
import java.util.List;
/**
 *
 * @author Magno
 */
public class ServicoItemCarrinho {
        ItemCarrinhoDAO itemCarrinhoDAO = new ItemCarrinhoDAO();
    
       //Insere um Produto na fonte de dados Carrinho
    public void cadastraritemCarrinho(int codigocarrinho, int codigoproduto, int quantidade) throws CarrinhoException, DataSourceException, ItemCarrinhoException, Exception{

        try {
            itemCarrinhoDAO.cadastrarItemCarrinho(codigocarrinho, codigoproduto, quantidade);
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }
    
      //Exclui carrinho e dados do topo do carrinho
    public void excluirCarrinho(int codigocarrinho) throws CarrinhoException, DataSourceException, ItemCarrinhoException, Exception{


        try {
            itemCarrinhoDAO.deletarItensCarrinho(codigocarrinho);
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }
    
    //Exclui carrinho e dados do topo do carrinho
    public void excluiritemCarrinho(int codigocarrinho, int codigoitem) throws CarrinhoException, DataSourceException, ItemCarrinhoException, Exception{

        try {
            itemCarrinhoDAO.deletarItemCarrinho(codigocarrinho, codigoitem);
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }
    
    //Realiza a pesquisa e retorna todos os produtos da fonte de dados
    public List<ItemCarrinho> listarItensCarrinho(int codigocarrinho) throws DataSourceException, Exception {
        try {
            return itemCarrinhoDAO.listarItensCarrinho(codigocarrinho);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
            
        }
    }
}
