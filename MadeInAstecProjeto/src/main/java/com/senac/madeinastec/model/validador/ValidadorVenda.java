/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.model.validador;
import com.senac.madeinastec.exceptions.VendaException;
import com.senac.madeinastec.exceptions.ItemVendaException;
import com.senac.madeinastec.model.Venda;

/**
 *
 * @author Magno
 */
public class ValidadorVenda {
    
    public static void validar(Venda venda) throws VendaException{
        
         if(venda.getCliente().getCpf()== null){
            throw new VendaException("Não foi informado um cliente ou ele não está cadastrado");
        }
        if(venda.getCliente().getNome()== null){
            throw new VendaException("Não foi informado um cliente  ou ele não está cadastrado");
        }
           
         
        
    }
    
}
