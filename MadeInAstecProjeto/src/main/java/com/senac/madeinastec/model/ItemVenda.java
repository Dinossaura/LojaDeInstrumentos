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
    private String nomecategoria;
    private String nomeproduto;
    private String descricaoproduto;
    private Double prevovenda;

    public String getDescricaoproduto() {
        return descricaoproduto;
    }

    public void setDescricaoproduto(String descricaoproduto) {
        this.descricaoproduto = descricaoproduto;
    }
    
    
    public int getCodigovenda() {
        return codigovenda;
    }

    public void setCodigovenda(int codigovenda) {
        this.codigovenda = codigovenda;
    }
    
    
    
    public String getNomecategoria() {
        return nomecategoria;
    }

    public void setNomecategoria(String nomecategoria) {
        this.nomecategoria = nomecategoria;
    }

    public String getNomeproduto() {
        return nomeproduto;
    }

    public void setNomeproduto(String nomeproduto) {
        this.nomeproduto = nomeproduto;
    }

    public Double getPrevovenda() {
        return prevovenda;
    }

    public void setPrevovenda(Double prevovenda) {
        this.prevovenda = prevovenda;
    }
    
    
    public int getIditemvenda() {
        return iditemvenda;
    }

    public void setIditemvenda(int iditemvenda) {
        this.iditemvenda = iditemvenda;
    }

    public int getCodigoVenda() {
        return codigovenda;
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
