package com.senac.madeinastec.model;

/**
 *
 * @author geoinformacao
 */
public class ItemVenda {
    private int iditemvenda;
    private Venda venda;//crud >> insert getId();
    private Produto produto; //crud >> insert getId();
    private int quantidade;

    //RELATORIO: SELECT * FROM VENDA V INNER JOIN ITEMVENDA IV ON V.idvenda = IV.iditemvenda;
    
    @Override
    public String toString() {
        return "ItemVenda{" + "iditemvenda=" + iditemvenda + ", venda=" + venda + ", produto=" + produto + ", quantidade=" + quantidade + '}';
    }

    public int getIditemvenda() {
        return iditemvenda;
    }

    public void setIditemvenda(int iditemvenda) {
        this.iditemvenda = iditemvenda;
    }

    public Venda getVenda() {
        return venda;
    }

    public void setVenda(Venda venda) {
        this.venda = venda;
    }

    public Produto getProduto() {
        return produto;
    }

    public void setProduto(Produto produto) {
        this.produto = produto;
    }

    public int getQuantidade() {
        return quantidade;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }
    
    
}
