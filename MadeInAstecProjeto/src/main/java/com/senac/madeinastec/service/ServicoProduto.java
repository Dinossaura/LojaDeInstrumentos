/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.service;
import com.senac.madeinastec.dao.ProdutoDAO;
import com.senac.madeinastec.exceptions.ProdutoException;
import com.senac.madeinastec.model.Produto;
import com.senac.madeinastec.model.validador.ValidadorProduto;
import com.senac.madeinastec.exceptions.DataSourceException;
import java.util.List;
/**
 *
 * @author magno
 */
//Classe de Servico de Produto
public class ServicoProduto {
    ProdutoDAO produtoDAO = new ProdutoDAO();
    
    public void cadastrarProduto(Produto produto) throws ProdutoException, DataSourceException {
        
        ValidadorProduto.validar(produto);

        try {
            //Realiza a chamada de inserção na fonte de dados
            produtoDAO.inserirProduto(produto);
        } catch (Exception e) {
            //Imprime qualquer erro técnico no console e devolve
            //uma exceção e uma mensagem amigável a camada de visão
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }

    //Atualiza um produto na fonte de dados
    public void atualizarProduto(Produto produto) throws ProdutoException, DataSourceException {
        ValidadorProduto.validar(produto);

        try {
            produtoDAO.updateProduto(produto);
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }


    public  List<Produto> procurarProduto(String nome, int codigoempresa) throws ProdutoException, DataSourceException {
        try {
        return produtoDAO.listarProduto(nome, codigoempresa);
          
        } catch (Exception e) {
            //Imprime qualquer erro técnico no console e devolve
            //uma exceção e uma mensagem amigável a camada de visão
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }

    public Produto encontrarProdutoPorNome(String nome, int codigoempresa) throws ProdutoException, DataSourceException {
        try {
            return produtoDAO.encontrarProduto(nome, codigoempresa);
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }
    
    public Produto encontrarProdutoPorCodigo(int codigo, int codigoempresa) throws ProdutoException, DataSourceException {
        try {
            return produtoDAO.encontrarProdutoCodigo(codigo, codigoempresa);
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }
    public boolean encontrarProdutoCadastro(String nome, int codigoempresa) throws ProdutoException, DataSourceException {
        try {
            return produtoDAO.encontrarProdutoCadastro(nome, codigoempresa);
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }

    public void excluirProduto(Integer codigo, int codigoempresa) throws ProdutoException, DataSourceException {
        try {
            produtoDAO.deletarProduto(codigo, codigoempresa);
        } catch (Exception e) {
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }
    
    public void atualizaEstoque(int codigo, int estoque) throws ProdutoException, DataSourceException {
        try {
            produtoDAO.atualizarEstoque(codigo, estoque);
        } catch (Exception e) {
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }
    
    //Lista produtos de determinada empresa
    public List<Produto> listarProdutos(int codigoempresa) throws DataSourceException, Exception {
        try {
            return produtoDAO.listarProdutos(codigoempresa);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
            
        }
    }
    
    //Lista produtos Totais
    public List<Produto> listarProdutostotais() throws DataSourceException, Exception {
        try {
            return produtoDAO.listarProdutostotais();
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }
}
