package com.senac.madeinastec.model;

/**
 *
 * @author geoinformacao
 */
public class ItemVenda {
    private int iditemvenda;
    private int codigovenda;
    private int codigoproduto; 
    private int quantidade;

    public int getIditemvenda() {
        return iditemvenda;
    }

    public void setIditemvenda(int iditemvenda) {
        this.iditemvenda = iditemvenda;
    }

    public int getCodigoVenda() {
        return codigoproduto;
    }

    public void setCodigoVenda(int codigovenda) {
        this.codigovenda = codigovenda;
    }

    public int getCodigoProduto() {
        return codigoproduto;
    }

    public void setCodigoProduto(int codigoproduto) {
        this.codigoproduto = codigoproduto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
    
}
