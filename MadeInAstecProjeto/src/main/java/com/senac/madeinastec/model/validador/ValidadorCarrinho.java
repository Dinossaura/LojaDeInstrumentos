/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.model.validador;

import com.senac.madeinastec.exceptions.CarrinhoException;
import com.senac.madeinastec.exceptions.ItemCarrinhoException;
import com.senac.madeinastec.model.Carrinho;

/**
 *
 * @author Magno
 */
public class ValidadorCarrinho {
    //Realização da validação de negocio
   //Realização da validação de negocio
    public static void validar(Carrinho carrinho)throws Exception, CarrinhoException, ItemCarrinhoException{
        
        if(carrinho == null){
            throw new CarrinhoException("É preciso informar um produto para o carrinho!");
        }
        
        
    } 
}
