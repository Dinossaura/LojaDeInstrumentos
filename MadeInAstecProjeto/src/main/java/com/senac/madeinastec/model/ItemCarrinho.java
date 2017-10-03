/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.senac.madeinastec.model;

/**
 *
 * @author Magno
 */
public class ItemCarrinho {
    private int codigo;
    private int codigoCarrinho;
    private int codigoProduto;
    private int quantidade;

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public int getCodigoCarrinho() {
        return codigoCarrinho;
    }

    public void setCodigoCarrinho(int codigoCarrinho) {
        this.codigoCarrinho = codigoCarrinho;
    }

    public int getProduto() {
        return codigoProduto;
    }

    public void setProduto(int codigoProduto) {
        this.codigoProduto = codigoProduto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
}
