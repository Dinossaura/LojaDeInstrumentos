/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.model.validador;
import com.senac.madeinastec.model.Cliente;
import com.senac.madeinastec.exceptions.ClienteException;
/**
 *
 * @author Magno
 */
public class ValidadorCliente {
    public static void validar(Cliente cliente) throws ClienteException{
        //Realização de Validações de Negocio
        if(cliente == null){
            throw new ClienteException("Não foi informado um cliente");
        }
        
        if(cliente.getNome()== null || "".equals(cliente.getNome())){
            throw new ClienteException("Não foi informado o nome do Cliente");
        }
        
        if (cliente.getSobrenome() == null
                || "".equals(cliente.getSobrenome())) {
            throw new ClienteException("É necessário informar um "
                    + "sobrenome de cliente");
        }
        
        if (cliente.getSexo()== null
                || "".equals(cliente.getSexo())) {
            throw new ClienteException("É necessário informar o "
                    + "sexo do cliente");
        }
        
         if (cliente.getRg()== null
                || "".equals(cliente.getRg())) {
            throw new ClienteException("É necessário informar o "
                    + "RG do cliente");
        }
         
         if(cliente.getRg().length() < 12){
             throw new ClienteException("RG incorreto, favor verificar!");
         }
         
          if (cliente.getCpf()== null
                || "".equals(cliente.getCpf())) {
            throw new ClienteException("É necessário informar o "
                    + "Cpf do cliente");
        }
          
          if(cliente.getCpf().length() < 14){
              throw new ClienteException("CPF incorreto, favor verificar!");
          }
          
          if(cliente.getIdade()== null
                  || "".equals(cliente.getIdade())){
              throw new ClienteException("É necessário informar a idade do cliente!");
          }
          
           if (cliente.getSexo()== null
                || "".equals(cliente.getSexo())) {
            throw new ClienteException("É necessário informar o "
                    + "sexo do cliente");
        }
        
           if (cliente.getTelefone()== null
                || "".equals(cliente.getTelefone())) {
            throw new ClienteException("É necessário informar pelo menos "
                    + "1 número de telefone do cliente");
        }
           if(cliente.getTelefone().length() < 13){
               throw new ClienteException("Telefone incorreto, favor verificar!");
           }

            if (cliente.getEndereco()== null
                || "".equals(cliente.getEndereco())) {
            throw new ClienteException("É necessário informar o "
                    + "endereço do cliente");
        }
            
          /*if (cliente.getComplemento()== null
                || "".equals(cliente.getComplemento())) {
            throw new ClienteException("É necessário informar o "
                    + "complemento de endereço do cliente");
        }  */
          
          if (cliente.getBairro()== null
                || "".equals(cliente.getBairro())) {
            throw new ClienteException("É necessário informar o "
                    + "bairro do cliente");
        }
          
          if (cliente.getCep()== null
                || "".equals(cliente.getCep())) {
            throw new ClienteException("É necessário informar o "
                    + "CEP do cliente");
        }
          if(cliente.getCep().length() < 9){
              throw new ClienteException("CEP incorreto, favor verificar!");
          }
          
          if (cliente.getNumero()== null
                || "".equals(cliente.getNumero())) {
            throw new ClienteException("É necessário informar o "
                    + "número da residência do cliente");
        }
          
          if (cliente.getCidade()== null
                || "".equals(cliente.getCidade())) {
            throw new ClienteException("É necessário informar a "
                    + "cidade do cliente");
        }
        
          if (cliente.getEstado()== null
                || "".equals(cliente.getEstado())) {
            throw new ClienteException("É necessário informar o "
                    + "estado do cliente");
        }

        if (cliente.getIdade().length() > 3){
            throw  new ClienteException("Idade inválida!");
        }
    }
}
