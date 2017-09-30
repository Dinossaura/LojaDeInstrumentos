/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.model.validador;
import com.senac.madeinastec.exceptions.ProdutoException;
import com.senac.madeinastec.model.Produto;
/**
 *
 * @author Magno
 */
public class ValidadorProduto {
    //Realização de validação de negócio
    public static void validar(Produto produto) throws ProdutoException{
        
        if(produto == null){
            throw new ProdutoException("Não foi informado um produto");
        }
        
         if(produto.getTitulo() == null || "".equals(produto.getTitulo())){
            throw new ProdutoException("Não foi informado um título");
        }
         
          if(produto.getCategoria() == null || "".equals(produto.getCategoria())){
            throw new ProdutoException("Não foi informada uma categoria");
        }
           
           try {
            if(String.valueOf(produto.getEstoque())==null)
                  throw new ProdutoException("Não foi informado o valor de estoque");
        }  catch (NumberFormatException e) {
            throw new ProdutoException("É necessário digitar somente "
                    + "números para alimentar o estoque" + e);
        }
            
            
               try {
                if(String.valueOf(produto.getPreco())==null)
                    throw new ProdutoException("Não foi informado o preço do produto");
        }  catch (NumberFormatException e) {
            throw new ProdutoException("É necessário digitar somente "
                    + "números para preço" + e);
        }
           
           if(produto.getPlataforma()== null || "".equals(produto.getPlataforma())){
            throw new ProdutoException("Não foi informada a plataforma do produto");
        }
            
    }
}
