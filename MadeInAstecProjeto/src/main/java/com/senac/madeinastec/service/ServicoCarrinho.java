/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.service;
import com.senac.madeinastec.exceptions.CarrinhoException;
import com.senac.madeinastec.model.Carrinho;
import com.senac.madeinastec.model.validador.ValidadorCarrinho;
import com.senac.madeinastec.exceptions.DataSourceException;
import java.util.List;
/**
 *
 * @author Magno
 */
public class ServicoCarrinho {
    //Insere um Produto na fonte de dados carrinho
    public static void cadastrarProdutonoCarrinho(Carrinho carrinho)
            throws Exception, CarrinhoException, DataSourceException{

        //Chama o validador para verificar se produto pode ser inserido
        ValidadorCarrinho.validar(carrinho);

        try {
            //Realiza a chamada de inserção na fonte de dados
           
        } catch (Exception e) {
            //Imprime qualquer erro técnico no console e devolve
            //uma exceção e uma mensagem amigável a camada de visão
            e.printStackTrace();
            throw new DataSourceException("Erro na fonte de dados", e);
        }
    }
    
    
    
}
