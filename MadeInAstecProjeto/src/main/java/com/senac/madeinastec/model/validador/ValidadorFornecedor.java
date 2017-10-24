/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.model.validador;
import com.senac.madeinastec.exceptions.FornecedorException;
import com.senac.madeinastec.model.Fornecedor;
/**
 *
 * @author Magno
 */
public class ValidadorFornecedor {
    public static void validar(Fornecedor fornecedor) throws FornecedorException{
        //Realização de Validações de Negocio
        if(fornecedor == null){
            throw new FornecedorException("Não foi informado um Fornecedor");
        }
        
        if(fornecedor.getNome()== null || "".equals(fornecedor.getNome())){
            throw new FornecedorException("Não foi informado o nome do Fornecedor");
        }
        
    }
}
