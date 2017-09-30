/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.exceptions;

/**
 *
 * @author magno
 */
public class ItemVendaException extends Exception{
    //Construtor de exceções que permite informar uma mensagem
    public ItemVendaException(String message){
        super(message);
    }
}
